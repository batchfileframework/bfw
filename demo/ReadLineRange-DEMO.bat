
:ReadLineRange-DEMO
Call :ClearVariablesByPrefix _RLR my

REM del ReadLineRange-DEMO.txt 2>nul
if not exist ReadLineRange-DEMO.txt Call :RunMultipleTimes 15 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>ReadLineRange-DEMO.txt"

Call :ReadLineRange "ReadLineRange-DEMO.txt" 7 11 myLineArray

echo.
set myLineArray

GoTo :EOF
