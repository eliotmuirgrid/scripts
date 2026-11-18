@echo off
setlocal

if not exist "%~dp0..\git\cmd\git.exe" call "%~dp0git_install.bat"
if errorlevel 1 exit /b 1
set "PATH=%~dp0..\git\cmd;%PATH%"

set "REPO=%~dp0..\IguanaMainRepo"
set "REMOTE=%~1"


if "%REMOTE%"=="" (
    echo Usage: %~nx0 REMOTE_URL
    echo i.e. git@github.com:acmeorg/example.git 
    exit /b 1
)

REM Verify remote repository is accessible.
git ls-remote "%REMOTE%" >nul
if errorlevel 1 (
    echo ERROR: Remote repository does not exist or is inaccessible.
    exit /b 1
)

REM Add or update origin.
git --git-dir="%REPO%" remote get-url origin >nul 2>&1
if errorlevel 1 (
    git --git-dir="%REPO%" remote add origin "%REMOTE%"
) else (
    "git --git-dir="%REPO%" remote set-url origin "%REMOTE%"
)

if errorlevel 1 exit /b 1

REM Mirror repository.
git --git-dir="%REPO%" push --mirror origin
exit /b %errorlevel%

