@echo off
setlocal

set "GIT_DIR=%~dp0..\git"

if exist "%GIT_DIR%\cmd\git.exe" (
    echo Git installed already.
    exit /b 0
)

mkdir "%GIT_DIR%"

curl.exe -fL https://github.com/git-for-windows/git/releases/download/v2.56.0.windows.1/MinGit-2.56.0-64-bit.zip -o "%GIT_DIR%\git.zip"
if errorlevel 1 exit /b 1

tar.exe -xf "%GIT_DIR%\git.zip" -C "%GIT_DIR%"
if errorlevel 1 exit /b 1

del "%GIT_DIR%\git.zip"

"%GIT_DIR%\cmd\git.exe" --version
