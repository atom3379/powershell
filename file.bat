if %errorlevel% neq 0 (
    echo @echo off > spam.bat
    echo chcp 65001 ^>nul >> spam.bat
    echo for /l %%%%i in (1,0,2^) do ^( >> spam.bat
    echo for %%%%a in (0 1 2 3 4 5 6 7 8 9 A B C D E F^) do ^( >> spam.bat
    echo     for %%%%b in (0 1 2 3 4 5 6 7 8 9 A B C D E F^) do ^( >> spam.bat
    echo         color %%%%a%%%%b >> spam.bat
    echo         if "%%1" == "" ^( >> spam.bat
    echo             echo I NA HEE >> spam.bat
    echo         ^) else ^( >> spam.bat
    echo             echo %%1 >> spam.bat
    echo         ^) >> spam.bat
    echo     ^) >> spam.bat
    echo ^) >> spam.bat
)
