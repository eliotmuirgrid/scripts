@echo off
setlocal

set "PATH=%~dp0..\git\cmd;%PATH%"

git -C "%~dp0." fetch origin main
if errorlevel 1 exit /b 1

git -C "%~dp0." checkout --detach FETCH_HEAD
if errorlevel 1 exit /b 1

git -C "%~dp0." restore .
