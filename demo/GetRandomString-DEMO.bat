
:GetRandomString-DEMO

call :GetRandomString 25 output NOSPECIALCHARS
REM echo %output%
set "output="
goto :eof
pause
call :GetRandomString 20 output NOSPECIALCHARS
echo %output%
set "output="
pause
call :GetRandomString 30 output NOSPECIALCHARS
echo %output%
set "output="
pause
GoTo :EOF
:EndOf_GetRandomString-DEMO
REM blabla
