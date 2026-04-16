@echo off
setlocal enabledelayedexpansion

set "ZIP_PATH=%~dp0Schedule1Trainer.zip"
set "TARGET_DIR=C:\Program Files (x86)\Steam\steamapps\common\Schedule I"

echo Checking paths...
echo ZIP: %ZIP_PATH%
echo TARGET: %TARGET_DIR%
echo.

if not exist "%TARGET_DIR%" (
    echo ERROR: Target directory does not exist
    pause
    exit /b 1
)

if not exist "%ZIP_PATH%" (
    echo ERROR: ZIP file not found
    pause
    exit /b 1
)

echo Extracting...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"try { Expand-Archive -Path '%ZIP_PATH%' -DestinationPath '%TARGET_DIR%' -Force -ErrorAction Stop; exit 0 } catch { Write-Host $_; exit 1 }"

if errorlevel 1 (
    echo.
    echo Extraction FAILED.
    pause
    exit /b 1
)

echo.
echo Extraction successful.
pause