@echo off

setlocal enabledelayedexpansion

REM Set the branch names
set "current_branch="
set "staging_branch=staging"
set "production_branch=production"

REM Check the current branch
for /f "delims=" %%A in ('git branch --show-current') do set "current_branch=%%A"

REM Check if the current branch is "staging"
if "%current_branch%"=="%staging_branch%" (
  REM Check if there are any working tree changes
  git diff --quiet --exit-code
  if %errorlevel% equ 0 (
    REM Switch to the production branch
    git checkout %production_branch%

    REM Get the timestamp and author
    for /F "delims=" %%G in ('git log --pretty=format:"%%ad" -n 1') do set "timestamp=%%G"
    for /F "delims=" %%G in ('git log --pretty=format:"%%an" -n 1') do set "author=%%G"

    REM Format the timestamp to include both date and time
    for /F "tokens=1-2 delims= " %%A in ("%timestamp%") do (
        set "date=%%A"
        set "time=%%B"
    )

    REM Merge the current commit from staging to production and resolve conflicts by favoring changes from the staging branch
    git merge -X theirs --no-edit %staging_branch% --message "production commit by %author% on %date% at %time%"

    REM Push the changes to the remote repository
    git push origin %production_branch%
    echo Successfully promoted the commit to the "%production_branch%" branch, resolved conflicts by favoring changes from the "%staging_branch%" branch, and pushed the changes to the remote repository.
  ) else (
    echo Warning: There are working tree changes in the "%staging_branch%" branch. Please commit or discard the changes before promoting to production.
  )
) else (
  echo Warning: The current branch is not "%staging_branch%". Please switch to the "%staging_branch%" branch to promote the commit to production.
)
