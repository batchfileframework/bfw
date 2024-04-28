
:CoinFlip-DEMO

Call :ClearVariablesByPrefix my

echo.
echo 9 coin flips using :rnd

call :rnd "" 0 1 && echo flip 1 was heads || echo flip 1 was tails
call :rnd "" 0 1 && echo flip 2 was heads || echo flip 2 was tails
call :rnd "" 0 1 && echo flip 3 was heads || echo flip 3 was tails
call :rnd "" 0 1 && echo flip 4 was heads || echo flip 4 was tails
call :rnd "" 0 1 && echo flip 5 was heads || echo flip 5 was tails
call :rnd "" 0 1 && echo flip 6 was heads || echo flip 6 was tails
call :rnd "" 0 1 && echo flip 7 was heads || echo flip 7 was tails
call :rnd "" 0 1 && echo flip 8 was heads || echo flip 8 was tails
call :rnd "" 0 1 && echo flip 9 was heads || echo flip 9 was tails

echo.
echo 9 coin flips using :CoinFlip

call :CoinFlip && echo flip 1 was heads || echo flip 1 was tails
call :CoinFlip && echo flip 2 was heads || echo flip 2 was tails
call :CoinFlip && echo flip 3 was heads || echo flip 3 was tails
call :CoinFlip && echo flip 4 was heads || echo flip 4 was tails
call :CoinFlip && echo flip 5 was heads || echo flip 5 was tails
call :CoinFlip && echo flip 6 was heads || echo flip 6 was tails
call :CoinFlip && echo flip 7 was heads || echo flip 7 was tails
call :CoinFlip && echo flip 8 was heads || echo flip 8 was tails
call :CoinFlip && echo flip 9 was heads || echo flip 9 was tails

echo.
echo 9 coin flips using :rnd with :RunMultipleTimes 
Call :RunMultipleTimes 9 "call :CoinFlip && call echo flip %%%%_RunMultipleTimes_index%%%% was heads || call echo flip %%%%_RunMultipleTimes_index%%%% was tails"

echo.
echo 500 coin flips using :rnd, with only totals at the end
set "_myheads=0"
set "_mytails=0"
set _mycounter=0
:CoinFlip-DEMO-loop
call :rnd "" 0 1 && set /a "_myheads+=1" || set /a "_mytails+=1"
set /a "_mycounter+=1"
if %_mycounter% LEQ 500 GoTo :CoinFlip-DEMO-loop
echo 500 coin flips, final count : %_myheads% heads %_mytails% tails

echo.
echo 500 coin flips using :CoinFlip, with only totals at the end
set "_myheads=0"
set "_mytails=0"
set _mycounter=0
:CoinFlip-DEMO-loop2
call :CoinFlip && set /a "_myheads+=1" || set /a "_mytails+=1"
set /a "_mycounter+=1"
if %_mycounter% LEQ 500 GoTo :CoinFlip-DEMO-loop2
echo 500 coin flips, final count : %_myheads% heads %_mytails% tails

GoTo :EOF


:CoinFlip-DEMO

Call :ClearVariablesByPrefix my

echo.
echo 9 coin flips using :rnd

call :rnd "" 0 1 && echo flip 1 was heads || echo flip 1 was tails
call :rnd "" 0 1 && echo flip 2 was heads || echo flip 2 was tails
call :rnd "" 0 1 && echo flip 3 was heads || echo flip 3 was tails
call :rnd "" 0 1 && echo flip 4 was heads || echo flip 4 was tails
call :rnd "" 0 1 && echo flip 5 was heads || echo flip 5 was tails
call :rnd "" 0 1 && echo flip 6 was heads || echo flip 6 was tails
call :rnd "" 0 1 && echo flip 7 was heads || echo flip 7 was tails
call :rnd "" 0 1 && echo flip 8 was heads || echo flip 8 was tails
call :rnd "" 0 1 && echo flip 9 was heads || echo flip 9 was tails

echo.
echo 9 coin flips using :CoinFlip

call :CoinFlip && echo flip 1 was heads || echo flip 1 was tails
call :CoinFlip && echo flip 2 was heads || echo flip 2 was tails
call :CoinFlip && echo flip 3 was heads || echo flip 3 was tails
call :CoinFlip && echo flip 4 was heads || echo flip 4 was tails
call :CoinFlip && echo flip 5 was heads || echo flip 5 was tails
call :CoinFlip && echo flip 6 was heads || echo flip 6 was tails
call :CoinFlip && echo flip 7 was heads || echo flip 7 was tails
call :CoinFlip && echo flip 8 was heads || echo flip 8 was tails
call :CoinFlip && echo flip 9 was heads || echo flip 9 was tails

echo.
echo 9 coin flips using :rnd with :RunMultipleTimes 
Call :RunMultipleTimes 9 "call :CoinFlip && call echo flip %%%%_RunMultipleTimes_index%%%% was heads || call echo flip %%%%_RunMultipleTimes_index%%%% was tails"

echo.
echo 500 coin flips using :rnd, with only totals at the end
set "_myheads=0"
set "_mytails=0"
set _mycounter=0
:CoinFlip-DEMO-loop
call :rnd "" 0 1 && set /a "_myheads+=1" || set /a "_mytails+=1"
set /a "_mycounter+=1"
if %_mycounter% LEQ 500 GoTo :CoinFlip-DEMO-loop
echo 500 coin flips, final count : %_myheads% heads %_mytails% tails

echo.
echo 500 coin flips using :CoinFlip, with only totals at the end
set "_myheads=0"
set "_mytails=0"
set _mycounter=0
:CoinFlip-DEMO-loop2
call :CoinFlip && set /a "_myheads+=1" || set /a "_mytails+=1"
set /a "_mycounter+=1"
if %_mycounter% LEQ 500 GoTo :CoinFlip-DEMO-loop2
echo 500 coin flips, final count : %_myheads% heads %_mytails% tails

GoTo :EOF

