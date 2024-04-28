
:PrintLine-DEMO

del GetLineLenght-DEMO.txt 2>nul
echo.
echo Creating 15 line file PrintLine-DEMO, each line has 5 more random characters than the previous
set /a "_my_string_lenght=5"
Call :RunMultipleTimes 15 "call :GetRandomString %%%%_my_string_lenght%%%% myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R%%%%_RunMultipleTimes_index%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R%%%%_RunMultipleTimes_index%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>PrintLine-DEMO.txt" "set /a _my_string_lenght+=5"



echo print original file
echo. 
type ReadLineRange-DEMO.txt

echo.
echo printline test
echo.
REM there is no line 0
REM Call :Printline PrintLine-DEMO.txt0
Call :Printline PrintLine-DEMO.txt 1 
Call :Printline PrintLine-DEMO.txt 2 
Call :Printline PrintLine-DEMO.txt 3 
Call :Printline PrintLine-DEMO.txt 4 
Call :Printline PrintLine-DEMO.txt 5 
Call :Printline PrintLine-DEMO.txt 6
Call :Printline PrintLine-DEMO.txt 7
Call :Printline PrintLine-DEMO.txt 8
Call :Printline PrintLine-DEMO.txt 9
Call :Printline PrintLine-DEMO.txt 10
Call :Printline PrintLine-DEMO.txt 11
Call :Printline PrintLine-DEMO.txt 12
Call :Printline PrintLine-DEMO.txt 13
Call :Printline PrintLine-DEMO.txt 14
Call :Printline PrintLine-DEMO.txt 15


 
echo. 
echo readline test
echo.
Call :Readline PrintLine-DEMO.txt 1 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 2 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 3 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 4 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 5 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 6 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 7 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 8 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 9 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 10 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 11 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 12 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 13 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 14 _myreadline
echo "%_myreadline%"
Call :Readline PrintLine-DEMO.txt 15 _myreadline
echo "%_myreadline%"


REM echo. 
REM echo readlinealt test
REM echo.
REM Call :Readlinealt PrintLine-DEMO.txt 1 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 2 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 3 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 4 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 5 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 6 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 7 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 8 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 9 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 10 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 11 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 12 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 13 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 14 _myReadline
REM echo "%_myreadline%"
REM Call :Readlinealt PrintLine-DEMO.txt 15 _myReadline
REM echo "%_myreadline%"

echo. 
echo readline test but using set to check variable assignation
echo.
Call :Readline PrintLine-DEMO.txt 1 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 2 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 3 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 4 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 5 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 6 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 7 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 8 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 9 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 10 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 11 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 12 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 13 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 14 _myreadline
set _myreadline
Call :Readline PrintLine-DEMO.txt 15 _myreadline
set _myreadline


REM echo. 
REM echo readlinealt test but using set to check variable assignation
REM echo.
REM Call :Readlinealt PrintLine-DEMO.txt 1 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 2 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 3 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 4 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 5 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 6 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 7 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 8 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 9 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 10 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 11 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 12 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 13 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 14 _myReadline
REM set _myreadline
REM Call :Readlinealt PrintLine-DEMO.txt 15 _myReadline
REM set _myreadline

GoTo :EOF
