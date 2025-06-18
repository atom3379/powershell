@echo off
chcp 65001 >nul
title MultiTool - By Me

net session >nul 2>&1
if %errorlevel% == 0 (
    goto menu
) else (
    set takeown=0 
)

:menu
cls
echo [38;5;51m╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗[0m
echo.
echo.
ping localhost -n 1 -w 2000 >nul
echo                    [38;5;20m███╗   ███╗██╗   ██╗██╗  ████████╗██╗   ████████╗ ██████╗  ██████╗ ██╗         ^|  [38;5;51mV.1.0[0m 
ping localhost -n 1 -w 2000 >nul
echo                    [38;5;27m████╗ ████║██║   ██║██║  ╚══██╔══╝██║   ╚══██╔══╝██╔═══██╗██╔═══██╗██║         ^|  [38;5;51mHas 10 Features[0m 
ping localhost -n 1 -w 2000 >nul
echo                    [38;5;33m██╔████╔██║██║   ██║██║     ██║   ██║█████╗██║   ██║   ██║██║   ██║██║         ^|  [38;5;51mMade by Atom[0m 
ping localhost -n 1 -w 2000 >nul
echo                    [38;5;39m██║╚██╔╝██║██║   ██║██║     ██║   ██║╚════╝██║   ██║   ██║██║   ██║██║         ^|
ping localhost -n 1 -w 2000 >nul
echo                    [38;5;45m██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║      ██║   ╚██████╔╝╚██████╔╝███████╗    ^|
ping localhost -n 1 -w 2000 >nul
echo                    [38;5;51m╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝    ^|
ping localhost -n 1 -w 2000 >nul
echo.
echo.
echo  My MultiTool is a simple batch script that allows you to perform various tasks on your computer.
echo  It includes options to open Google Chrome, access the C: drive, run programs, shutdown or restart the computer,
echo  Enter BIOS, open VirtualBox, and use WSL (Windows Subsystem for Linux).
echo.
echo [38;5;51m ╔═ 1.Open Google Chrome[0m
echo [38;5;51m ╚╦═ 2.Open C: Drive[0m
echo [38;5;51m  ╚╦══ 3.Open a Program[0m
echo [38;5;51m   ╚═╦═ 4.Shutdown Computer[0m
echo [38;5;51m     ╚═╦═ 5.Restart Computer[0m
echo [38;5;51m       ╚╦═ 6.Enter BIOS[0m
echo [38;5;51m        ╚╦══ 7.Open VirtualBox[0m
echo [38;5;51m         ╚╦══ 8.Open WSL (Windows Subsystem for Linux)[0m
echo [38;5;51m          ╚╦══ 9.Take Ownership Any file(s)[0m
echo [38;5;51m           ╚═══ 10.Text to Speech[0m
echo [38;5;51m╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
set /p choice="[38;5;51mChoose an option (1-10): "

    if "%choice%"=="1" goto chrome
    if "%choice%"=="2" goto opendrive
    if "%choice%"=="3" goto openprogram
    if "%choice%"=="4" goto shutdown
    if "%choice%"=="5" goto restart
    if "%choice%"=="6" goto bios
    if "%choice%"=="7" goto vm
    if "%choice%"=="8" goto wsl
    if "%choice%"=="9" goto takeown
    if "%choice%"=="10" goto tts

:chrome
echo [38;5;51mOpening Google Chrome...
start chrome.exe
echo [38;5;51mReturning to the menu...
timeout /t 2 >nul
goto menu

:opendrive
echo [38;5;51mOpening C: Drive...
start explorer.exe
echo [38;5;51mReturning to the menu...
echo [38;5;51mTip : You can also open other drives by typing the drive letter (e.g., D: or E:) in the address bar.
timeout /t 4 >nul
goto menu

:openprogram
set /p program="[38;5;39mEnter the full path to the program (e.g., C:\Program Files\App\app.exe): "
start "" "%program%"
echo [38;5;51mReturning to the menu...
echo [38;5;51mTip : You can also open programs by typing their name in the Run dialog (Win + R).
timeout /t 4 >nul
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

:vm
echo [38;5;51mOpening VirtualBox...
start "" "C:\Program Files\Oracle\VirtualBox\VirtualBox.exe"
echo [38;5;51mReturning to the menu...
timeout /t 2 >nul
goto menu

:wsl
echo [38;5;51mWhat distro do you waht to open?
echo [38;5;51m1.Ubuntu
echo [38;5;51m2.Kali Linux
set /p distro="[38;5;51mEnter your choice (1-2): "
if "%distro%"=="1" (
    start wsl
) else if "%distro%"=="2" (
    start wsl -d kali-linux
) else (
    echo [38;5;51mInvalid choice. Please try again.
    goto wsl
)
timeout /t 2 >nul
goto menu

:takeown
if %takeown%==1 (
    goto takeown-admin
) else (
    echo [38;5;51mYou need administrative privileges to take ownership of files. Please run this script as an administrator.
    pause
    goto menu
)
:takeown-admin
echo [38;5;51mTaking ownership of files...
set /p file="Enter the path to the file or folder you want to take ownership of: "
takeown /f "%file%" /r /d y
echo [38;5;51mOwnership taken successfully! Returning to the menu...
timeout /t 2 >nul
goto menu

:tts
set /p text="What do you want to say? : "
echo Dim sapi > speak.vbs
echo Set sapi=CreateObject("sapi.spvoice") >> speak.vbs
echo sapi.Speak "%text%" >> speak.vbs
cscript //nologo speak.vbs
del speak.vbs
goto menu
