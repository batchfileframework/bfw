
:CoinFlip
set /a _CoinFlip=%RANDOM% * (1 - 0 + 1) / 32768 + 0
if "[%~1]" NEQ "[]" if "[%_CoinFlip%]" EQU 0 ( set "%~1=heads" ) else ( set "%~1=tails" )
exit /b %_CoinFlip% & set "_CoinFlip="
