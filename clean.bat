@echo off
setlocal

set "GIT_DIR=%~dp0..\git"

if exist "%GIT_DIR%\" rmdir /s /q "%GIT_DIR%"
if errorlevel 1 exit /b 1

echo Git directory removed.
