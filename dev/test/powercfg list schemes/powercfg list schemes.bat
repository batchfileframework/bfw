@echo off

for /f "tokens=1,* delims=:" %%a in ('powercfg -query a1841308-3541-4fab-bc81-f71556f20b4a') do (
    if "%%a"=="Power Scheme GUID" (
        call :echo_rest "%%b" "Power Scheme GUID:"
    ) else if "%%a"=="GUID Alias" (
        call :echo_rest "%%b" "GUID Alias:"
    ) else if "%%a"=="Subgroup GUID" (
        call :echo_rest "%%b" "Subgroup GUID:"
    ) else if "%%a"=="Power Setting GUID" (
        call :echo_rest "%%b" "Power Setting GUID:"
    ) else if "%%a"=="Minimum Possible Setting" (
        call :echo_rest "%%b" "Minimum Possible Setting:"
    ) else if "%%a"=="Maximum Possible Setting" (
        call :echo_rest "%%b" "Maximum Possible Setting:"
    ) else if "%%a"=="Possible Settings increment" (
        call :echo_rest "%%b" "Possible Settings increment:"
    ) else if "%%a"=="Possible Settings units" (
        call :echo_rest "%%b" "Possible Settings units:"
    ) else if "%%a"=="Current AC Power Setting Index" (
        call :echo_rest "%%b" "Current AC Power Setting Index:"
    ) else if "%%a"=="Current DC Power Setting Index" (
        call :echo_rest "%%b" "Current DC Power Setting Index:"
    ) else if "%%a"=="Possible Setting Index" (
        call :echo_rest "%%b" "Possible Setting Index:"
    ) else if "%%a"=="Possible Setting Friendly Name" (
        call :echo_rest "%%b" "Possible Setting Friendly Name:"
    )
)

goto :eof

:echo_rest
set "str=%~1"
set "keyword=%~2"
setlocal enabledelayedexpansion
set "str=!str:%keyword%=!"
echo !str!
endlocal
goto :eof
