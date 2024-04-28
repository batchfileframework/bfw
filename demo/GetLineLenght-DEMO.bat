
:GetLineLenght-DEMO

Call :ClearVariablesByPrefix my _GLL

REM del GetLineLenght-DEMO.txt 2>nul
echo.
if not exist GetLineLenght-DEMO.txt echo Creating 15 line file GetLineLenght-DEMO.txt, each line has 5 more random characters than the previous
set /a "_my_string_lenght=5"
if not exist GetLineLenght-DEMO.txt Call :RunMultipleTimes 15 "call :GetRandomString %%%%_my_string_lenght%%%% myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R%%%%_RunMultipleTimes_index%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R%%%%_RunMultipleTimes_index%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>GetLineLenght-DEMO.txt" "set /a _my_string_lenght+=5"

set myLineNumber=3
Call :GetLineLenght GetLineLenght-DEMO.txt %myLineNumber% myLength
echo line number %myLineNumber%, length %myLength% (EL) %errorlevel%

set myLineNumber=5
Call :GetLineLenght GetLineLenght-DEMO.txt %myLineNumber% myLength
echo line number %myLineNumber%, length %myLength% (EL) %errorlevel%

set myLineNumber=11
Call :GetLineLenght GetLineLenght-DEMO.txt %myLineNumber% myLength
echo line number %myLineNumber%, length %myLength% (EL) %errorlevel%

set myLineNumber=15
Call :GetLineLenght GetLineLenght-DEMO.txt %myLineNumber% myLength
echo line number %myLineNumber%, length %myLength% (EL) %errorlevel%

set myLineNumber=16
Call :GetLineLenght GetLineLenght-DEMO.txt %myLineNumber% myLength
echo line number %myLineNumber%, length %myLength% (EL) %errorlevel%

echo.
echo How many line does GetLineLenght-DEMO.txt have ?
Call :GetLineCount GetLineLenght-DEMO.txt
echo answer from errorlevel : %errorlevel%
Call :GetLineCount GetLineLenght-DEMO.txt myoutput
echo answer from myoutput : %myoutput%

GoTo :EOF
