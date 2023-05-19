@echo off

REM Navigate to the previous commit with a hard checkout

setlocal enabledelayedexpansion

set "num_commits=1"  REM Replace with the desired number of commits to go back

REM Get the current branch name
for /F "delims=" %%G in ('git symbolic-ref --short HEAD') do set "branch_name=%%G"

REM Check if the branch exists
git show-ref --quiet "refs/heads/%branch_name%"
if %errorlevel% neq 0 (
  echo Branch '%branch_name%' does not exist. Aborting script.
  exit /b
)

REM Get the commit reference based on the number of commits to go back
for /F "skip=%num_commits% tokens=2" %%G in ('git log --pretty=format:"%%h"') do (
  set "commit_ref=%%G"
  exit /b
)

REM If commit reference is empty, abort the script
if not defined commit_ref (
  echo No previous commit found. Aborting script.
  exit /b
)

REM Perform a hard checkout to the specified commit on the current branch
git checkout --hard "%commit_ref%"
