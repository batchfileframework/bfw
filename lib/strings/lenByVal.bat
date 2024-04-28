
::Usage Call :lenByRef OutputResult %VariableName%
rem doesn't work ?
:lenByVal
setlocal enabledelayedexpansion
set _len=%~2
GoTo :len
::Usage Call :len OutputResult VariableName
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
:len
(   
    setlocal EnableDelayedExpansion
    (set^ _ln=!%~2!)
    if defined _ln (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!_ln:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "_ln=!_ln:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b %len%
)
rem find stackoverflow link for this
rem return value should equal len
rem lenbyval should work
