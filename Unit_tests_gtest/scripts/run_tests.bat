@echo off
setlocal

echo ==============================
echo  GTest Clean Build + Test Run
echo ==============================

set ROOT_DIR=%~dp0\..
set OUTPUT_DIR=%ROOT_DIR%\output
set BUILD_DIR=%OUTPUT_DIR%\build
set REPORT_DIR=%OUTPUT_DIR%\reports

echo Cleaning old output...
if exist "%OUTPUT_DIR%" rmdir /s /q "%OUTPUT_DIR%"

echo Creating directories...
mkdir "%BUILD_DIR%"
mkdir "%REPORT_DIR%"

echo Configuring CMake...
cd /d "%BUILD_DIR%"
cmake "%ROOT_DIR%"
if errorlevel 1 exit /b 1

echo Building project...
cmake --build .
if errorlevel 1 exit /b 1

echo Running tests...
ctest --output-on-failure ^
      --test-output-junit "%REPORT_DIR%\gtest-report.xml"

echo ==============================
echo Done
echo Report: %REPORT_DIR%\gtest-report.xml
echo ==============================

pause
endlocal
