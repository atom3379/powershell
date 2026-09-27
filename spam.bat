@echo off
chcp 65001 >nul
for /l %%i in (1,0,2) do (
for %%a in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
    for %%b in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
        color %%a%%b
	if "%1" == "" (
		echo I NA HEE
	) else (
		echo %1
	)
    )
  )
)
