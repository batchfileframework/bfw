@echo off
setlocal
REM *** Some tests, to check the functionality ***
REM *** An emptyStr has the length 0
set "emptyString="
call :strlen emptyString result
echo %result%

REM *** This string has the length 14
set "myString=abcdef!%%^^()^!"
call :strlen myString result
echo %result%

REM *** This string has the maximum length of 8191
setlocal EnableDelayedExpansion
set "long=."
FOR /L %%n in (1 1 13) DO set "long=!long:~-4000!!long:~-4000!"
(set^ longString=!long!!long:~-191!)

call :strlen longString result
echo %result%

goto :eof

REM ********* function *****************************
:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~1!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~2=%len%"
    exit /b
)