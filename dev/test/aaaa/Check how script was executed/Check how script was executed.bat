@echo off

REM You just need the two lines below
Set "CleanedCMD=%cmdcmdline:"=_%"
Set IsRunningInConsole=false & if "%CleanedCMD:cmd.exe=%" == "%CleanedCMD%" ( Set IsRunningInConsole=true)

REM rest of your code, then pause only if running in GUI

if not %IsRunningInConsole% == true ( pause )
REM Line below only needed if you have functions
goto :eof











REM here is the function to check
call :is_running_in_console

REM Testing examples
if not %IsRunningInConsole% == true ( echo Running in GUI )
if %IsRunningInConsole% == true ( echo Running in console )
REM Testing examples
if "%IsRunningInConsole%"=="true" (
    echo Running in console
) else (
    echo Running in GUI
)

REM The function
:is_running_in_console
Set "CleanedCMD=%cmdcmdline:"=_%"
Set IsRunningInConsole=false & if "%CleanedCMD:cmd.exe=%" == "%CleanedCMD%" ( Set IsRunningInConsole=true)
goto :eof





Set "CleanedCMD=%cmdcmdline:"=_%"
Set IsRunningInConsole=false & if "%CleanedCMD:cmd.exe=%" == "%CleanedCMD%" ( Set IsRunningInConsole=true)

echo %IsRunningInConsole%

if not %IsRunningInConsole% == true ( echo it was not true )
if not %IsRunningInConsole% == true ( pause )


REM All you need is these two lines to set IsRunningInConsole

Set "CleanedCMD=%cmdcmdline:"=_%"
Set IsRunningInConsole=false & if "%CleanedCMD:cmd.exe=%" == "%CleanedCMD%" ( Set IsRunningInConsole=true)


