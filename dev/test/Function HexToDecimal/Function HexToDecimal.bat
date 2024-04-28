@echo off

set "hex=%%n"
set "dec="
call HexToDecimal hex dec
echo %%n: %%hex%% in decimal is %%dec%%

GoTo :EOF

for /l %%n in (0,1,65535) do (
    set "hex=%%n"
    set "dec="
    call HexToDecimal hex dec
    echo %%n: %%hex%% in decimal is %%dec%%
)


rem call :test_hex_to_dec
goto :eof

:test_hex_to_dec

exit /b



:HexToDecimal
set /A DEC=0x%HEX%
GoTo :EOF