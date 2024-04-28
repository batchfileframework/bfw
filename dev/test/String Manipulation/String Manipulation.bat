@echo off
:setup
:main

GoTo :ReplaceDEMO

:end

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions

:lenDEMO

set myvar1=0123456789
Call :length Output %myvar1%
echo len (10) of %myvar1% is %Output%

set myvar1="0123456789"
Call :len myvar1 Output
echo len (10, 12 with quotes) of %myvar1% is %Output%

set myvar1=01234567890
Call :len myvar1 Output
echo len (11) of %myvar1% is %Output%

set myvar1=012345678901
Call :len myvar1 Output
echo len (12) of %myvar1% is %Output%

set myvar1=0123456789012
Call :len myvar1 Output
echo len (13) of %myvar1% is %Output%

set myvar1=01234567890123456789 ABCDEFGHIJK LMNOPQRSTUVWXYZ
Call :len myvar1 Output
echo len (48) of %myvar1% is %Output%

GoTo :EOF
REM Function library

::Usage Call :len Input Output
:len 
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
REM https://stackoverflow.com/questions/5837418/how-do-you-get-the-string-length-in-a-batch-file

::Usage Call :Mid Input Output Start Optional lenght
:mid

GoTo :EOF

:ReplaceDEMO

set myvar=Dou dou dou pouet pouet
echo %myvar%
call :Replace "%myvar%" ou myvar
echo %myvar%

GoTo :EOF

::Usage Call :Replace Input Search Output
:Replace
set ReplaceInput=%~1
set ReplaceSearch=%~2
call set %3=%%ReplaceInput:%ReplaceSearch%=%%
GoTo :EOF

:Usage Call :Lookup %searchterm% output
:Lookup 
set l1=1|Disable
set l2=2|Enable
set l3=3|Auto
set l4=
set l5=
if "[%~1]"="[0]" set %2=Disable
if "[%~1]"="[1]" set %2=Enable
if "[%~1]"="[2]" set %2=Auto

FOR /L %%var_name IN (Lowerlimit, Increment, Upperlimit) Do some_code

GoTo:EOF