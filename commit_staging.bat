@echo off

setlocal enabledelayedexpansion

REM Set the branch name
set "branch_name=staging"

REM Check if the branch exists
git show-ref --quiet "refs/heads/%branch_name%"
if %errorlevel% neq 0 (
  REM Branch doesn't exist, create it
  git branch %branch_name%
)

REM Switch to the staging branch
git checkout %branch_name%

REM Get the timestamp and author
for /F "delims=" %%G in ('git log --pretty=format:"%%ad" -n 1') do set "timestamp=%%G"
for /F "delims=" %%G in ('git log --pretty=format:"%%an" -n 1') do set "author=%%G"

REM Format the timestamp to include both date and time
for /F "tokens=1-2 delims= " %%A in ("%timestamp%") do (
  set "date=%%A"
  set "time=%%B"
)

REM Add all files and commit with timestamp and author in the message
git add --all
git commit -m "staging commit by %author% on %date% at %time%"

REM Push the staging branch to the remote repository
git push origin %branch_name%