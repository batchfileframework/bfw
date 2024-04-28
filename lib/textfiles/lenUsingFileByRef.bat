
::Usage Call :lenUsingFile VariableName OutputResult
:lenUsingFileByRef
call set "_lenUsingFile=%%%1%%" 
echo lenUsingFileByRef %_lenUsingFile%
GoTo :lenUsingFile-skip-preamble
::Usage Call :lenUsingFile "%InputString%" OutputResult
:lenUsingFile

set "_lenUsingFile=%~1"
set "_lenUsingFile=%_lenUsingFile:^^=^%"
set "_lenUsingFile=%_lenUsingFile:""="%"
echo lenUsingFile %_lenUsingFile%
:lenUsingFile-skip-preamble 
echo at :lenUsingFile-skip-preamble 
echo lenUsingFile-skip-preamble %_lenUsingFile%
Call :GetTempFile _lenUsingFile.tempfile

set "_lenUsingFile=%_lenUsingFile:^=^^%"
set "_lenUsingFile=%_lenUsingFile:<=^<%"
set "_lenUsingFile=%_lenUsingFile:>=^>%"
set "_lenUsingFile=%_lenUsingFile:&=^&%"
set "_lenUsingFile=%_lenUsingFile:|=^|%"
REM set "_lenUsingFile=%_lenUsingFile:"=""%"
@echo on
ECHO."%_lenUsingFile%">"%_lenUsingFile.tempfile%"
FOR %%? IN ("%_lenUsingFile.tempfile%") DO SET /A _lenUsingFile.len=%%~z?-4 & DEL "%_lenUsingFile.tempfle%"
set /a "%~2=%_lenUsingFile.len%"
set "_lenUsingFile=" & set "_lenUsingFile.tempfile=" & set "_lenUsingFile.len=" & exit /b %_lenUsingFile.len%
REM https://stackoverflow.com/a/8566001


::Usage Call :lenByRef OutputResult %VariableName%
rem doesn't work ?
REM :lenByVal
REM setlocal enabledelayedexpansion
REM set _len=%~2
REM GoTo :len
::Usage Call :len OutputResult VariableName
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
REM :len
REM (   
    REM setlocal EnableDelayedExpansion
    REM (set^ _ln=!%~2!)
    REM if defined _ln (
        REM set "len=1"
        REM for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            REM if "!_ln:~%%P,1!" NEQ "" ( 
                REM set /a "len+=%%P"
                REM set "_ln=!_ln:~%%P!"
            REM )
        REM )
    REM ) ELSE (
        REM set len=0
    REM )
REM )
REM ( 
    REM endlocal
    REM set "%~1=%len%"
    REM exit /b %len%
REM )
rem find stackoverflow link for this
rem return value should equal len
rem lenbyval should work

