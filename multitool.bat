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
echo 7. Access Password File
echo 8. Open WSL (Windows Subsystem for Linux)
echo 9. Exit
echo 10. Go to GUI Mode(close this window)
echo ========================================================================================================================
set /p choice="Choose an option (1-10): "

    if "%choice%"=="1" goto chrome
    if "%choice%"=="2" goto opendrive
    if "%choice%"=="3" goto openprogram
    if "%choice%"=="4" goto shutdown
    if "%choice%"=="5" goto restart
    if "%choice%"=="6" goto bios
    if "%choice%"=="7" goto passwords
    if "%choice%"=="8" goto wsl
    if "%choice%"=="9" exit
    if "%choice%"=="10" goto guimode

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


:: Initialize attempt counter
set attempts=0

:passwordloop
cls
echo ==============================
echo       ACCESS PASSWORD FILE
echo ==============================
echo Attempts remaining: %attempts% / 10
set /p pass="Enter the password: "


:: Check password
color 0a
if "%pass%"=="NeverGonnaGiveYouUp" goto openfile

:: Incorrect password
color 0a
set /a attempts+=1
if %attempts% geq 10 (
    echo Too many incorrect attempts. Returning to the menu...
    timeout /t 3 >nul
    goto menu
)

echo Incorrect password! Access denied.
timeout /t 2 >nul
goto passwordloop

:openfile
echo Access granted! Opening password file...
notepad "C:\Users\UsEr\OneDrive\Documents\New folder\New folder\New folder\epicgamespassword.txt"
echo Returning to the menu...
timeout /t 2 >nul
goto menu

:wsl
echo Opening WSL in a new window...
start wsl
echo Returning to the menu...
timeout /t 2 >nul
goto menu

:guimode
start powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Users\UsEr\OneDrive\เดสก์ท็อป\multi-tool.ps1"
exit