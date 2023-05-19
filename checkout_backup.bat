@echo off

setlocal enabledelayedexpansion

REM Set the branch name
set "branch_name=backup"

REM Switch to the backup branch
git checkout %branch_name%

REM Perform a hard reset to the HEAD of the backup branch
git reset --hard %branch_name%/HEAD

REM Remove unversioned files
git clean -dfx