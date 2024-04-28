
:Split-DEMO

REM set myteststring=abcdef12345

REM echo myteststring tt%myteststring:~0,0%tt

Call :ClearVariablesByPrefix _Split

call :split "This is a test string" SplitOutput
set SplitOutput
REM TO test, empty input variable and delimiter bigger than input
REM call :split "" SplitOutput

echo.

REM Call :ClearVariablesByPrefix SplitOutput


GoTo :EOF

