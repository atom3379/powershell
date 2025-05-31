@echo off
setlocal EnableDelayedExpansion
chcp 65001>nul
title Test Download

for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

echo Installing Program..

set "total=50"

for /L %%i in (1,1,%total%) do (
    set /a percent=%%i*100/%total%
    set /a filled=%%i
    set /a empty=%total%-%%i

    set "bar="
    for /L %%j in (1,1,!filled!) do set "bar=!bar![92m▬[0m"
    for /L %%j in (1,1,!empty!) do set "bar=!bar! "

    <nul set /p="!ESC![2K!ESC![G[!bar!] !percent!%% Installing..."
    timeout /nobreak /t 0 >nul
)

echo.
echo Done!
pause
title %cd%
