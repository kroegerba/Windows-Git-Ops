@echo off

setlocal enabledelayedexpansion

REM Set the branch name
set "branch_name=staging"

REM Switch to the staging branch
git checkout %branch_name%

REM Perform a hard reset to the HEAD of the staging branch
git reset --hard origin/%branch_name%

REM Remove unversioned files
git clean -dfx