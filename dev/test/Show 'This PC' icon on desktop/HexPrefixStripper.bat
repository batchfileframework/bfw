
::Usage Call :HexPrefixStripper InputHex OutputDecimal ' This just strips leading "0x" if present
:HexPrefixStripper
if "[%~1]"=="[]" GoTo :EOF
set "_HexPrefixStripper_buffer=%~1"
set "%~2=%~1"
if "[%_HexPrefixStripper_buffer:~0,2%]"=="[0x]" call set "%~2=%_HexPrefixStripper_buffer:~2%"
set "_HexPrefixStripper_buffer="
GoTo :EOF

REM incomplete
:: Call :InStB input search result
REM :InStB
REM set "InputSTR=%1"
REM set "SearchSTR=%2"
REM set %3=false
REM echo input string %InputSTR%
REM echo search string %SearchSTR%
REM echo third param %3
REM call set TestSTR=%%InputSTR:%SearchSTR:~1,-1%=%%
REM echo test string %InputSTR%
REM echo test string %TestSTR%
REM if %TestSTR%==%InputSTR% ( echo if ran payload )
REM if not %TestSTR%==%InputSTR% ( echo if ran payload )
REM if not %TestSTR%==%InputSTR% ( set %3=true )
REM GoTo :EOF
REM Add example if test || && etc..

REM same as the other, but input output instead of output input
REM :len <stringVar> <resultVar>
REM (   
    REM setlocal EnableDelayedExpansion
    REM (set^ tmp=!%~2!)
    REM if defined tmp (
        REM set "len=1"
        REM for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            REM if "!tmp:~%%P,1!" NEQ "" ( 
                REM set /a "len+=%%P"
                REM set "tmp=!tmp:~%%P!"
            REM )
        REM )
    REM ) ELSE (
        REM set len=0
    REM )
REM )
REM ( 
    REM endlocal
    REM set "%~1=%len%"
    REM exit /b
REM )
REM https://stackoverflow.com/a/5841587

