@echo off
chcp 65001 >nul
title MultiTool by DeepSeek
color 0a

:menu
cls
echo ========================================================================================================================
echo.
echo.
echo                             ███╗   ███╗██╗   ██╗██╗  ████████╗██╗   ████████╗ ██████╗  ██████╗ ██╗
echo                             ████╗ ████║██║   ██║██║  ╚══██╔══╝██║   ╚══██╔══╝██╔═══██╗██╔═══██╗██║
echo                             ██╔████╔██║██║   ██║██║     ██║   ██║█████╗██║   ██║   ██║██║   ██║██║
echo                             ██║╚██╔╝██║██║   ██║██║     ██║   ██║╚════╝██║   ██║   ██║██║   ██║██║
echo                             ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║      ██║   ╚██████╔╝╚██████╔╝███████╗
echo                             ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo 1. Open Google Chrome
echo 2. Open C: Drive
echo 3. Open a Program
echo 4. Shutdown Computer
echo 5. Restart Computer
echo 6. Enter BIOS
echo 7. Open WSL (Windows Subsystem for Linux)
echo 8. Exit
echo 9. Go to GUI Mode(close this window)
echo ========================================================================================================================
set /p choice="Choose an option (1-10): "

    if "%choice%"=="1" goto chrome
    if "%choice%"=="2" goto opendrive
    if "%choice%"=="3" goto openprogram
    if "%choice%"=="4" goto shutdown
    if "%choice%"=="5" goto restart
    if "%choice%"=="6" goto bios
    if "%choice%"=="7" goto wsl
    if "%choice%"=="8" goto delself
    if "%choice%"=="9" goto guimode

:delself
del "%temp%\temp_script.bat"
exit

:chrome
echo Opening Google Chrome...
start chrome.exe
echo Returning to the menu...
timeout /t 2 >nul
goto menu

:opendrive
echo Opening C: Drive...
start explorer.exe
echo Returning to the menu...
timeout /t 2 >nul
goto menu

:openprogram
set /p program="Enter the full path to the program (e.g., C:\Program Files\App\app.exe): "
start "" "%program%"
echo Returning to the menu...
timeout /t 2 >nul
goto menu

:shutdown
shutdown /s /t 0
exit

:restart
shutdown /r /t 0
exit

:bios
echo Entering BIOS...
shutdown /r /fw /t 0
exit


:wsl
echo Opening WSL in a new window...
start wsl
echo Returning to the menu...
timeout /t 2 >nul
goto menu

:guimode
powershell -Command "& iwr https://raw.githubusercontent.com/atom3379/powershell/refs/heads/main/multitool.ps1 | iex"
