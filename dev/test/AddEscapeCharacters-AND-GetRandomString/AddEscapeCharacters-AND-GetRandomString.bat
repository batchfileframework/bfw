@echo off
:setup
REM call :ClearLocalVariables
REM Call :GetTime FileTime StartDate StartTime
REM Call :GetCodePage InitialCodepage
REM Call :SetTitle "Control 'This PC' icon on the desktop" 
set debug=false
REM set verbose=75
REM set verbose=85
REM set silent=false
REM set logfile=%tmp%\%filetime%
REM if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
REM call :SetMacroPrintTime

:main

cls

REM %PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
REM if "[%silent%]"=="[true]" echo Silent mode is enabled
REM if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
REM if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more

REM Call :IsLabel-DEMO
Call :FindAllLabels-DEMO
REM Call :FindAllEmptyLines-DEMO
REM Call :ReadMultiLine-DEMO
REM Call :ReadLineRange-DEMO
REM Call :PrintLine-DEMO
REM Call :InsertTextAtLineNumber-DEMO 
REM Call :GetLineLenght-DEMO
REM Call :CoinFlip-DEMO
REM Call :PrintCharMap 
REM call :NumberStringToArray-DEMO
REM call :IsDelayedExpansionEnabled-DEMO
REM call :AddEscapeCharacters-AND-GetRandomString-DEMOv2
REM call :Performance-timer-DEMO
REM call :EchoArguments-DEMO
REM call :AddEscapeCharacters-AND-GetRandomString-DEMO
REM call :AddEscapeCharacters-DEMO
REM call :runps-DEMO
REM call :CharArray2String-DEMO
REM call :ArrayToFile-DEMO
REM call :EchoFile-DEMO
REM call :ListUnescapedSpecialCharactersInString-DEMO
REM call :PrintCharMap-DEMO
REM call :GetRandomString-DEMO
REM call :ReadyMadeLoop-DEMO
REM call :rnd-DEMO
REM call :len-DEMO
REM call :StringCompare-DEMO
REM call :GetCharMap-DEMO
REM Call :SetNonEmptyValueOnlyIfNotDefined-DEMO
REM Call :EchoArray-DEMO
GoTo :END

:end
REM set FileTime=
REM set StartDate=
REM set StartTime=
REM set InitialCodepage=
REM set debug=
REM set verbose=
REM set silent=
REM set logfile=

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions 

:InsertTextAtLineNumber-DEMO 

Call :ClearVariablesByPrefix my _ILALN
REM GoTo :InsertTextAtLineNumber-DEMO-skip

del GetLineLenght-DEMO.txt 2>nul

echo.
echo Creating 15 line file GetLineLenght-DEMO.txt, each line has 5 more random characters than the previous
set /a "_my_string_lenght=5"
Call :RunMultipleTimes 15 "call :GetRandomString %%%%_my_string_lenght%%%% myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R%%%%_RunMultipleTimes_index%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R%%%%_RunMultipleTimes_index%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>GetLineLenght-DEMO.txt" "set /a _my_string_lenght+=5"

:InsertTextAtLineNumber-DEMO-skip

del GetLineLenght-DEMO.2.txt 2>nul
del GetLineLenght-DEMO.3.txt 2>nul

echo.
REM echo Inserting "MY TEST TEST" on line 9

:Argument-type-finder
set myvariable=This is the content of a variable

set myarray[0]=This is the content of element 0
set myarray[1]=This is the content of element 1
set myarray[2]=This is the content of element 2
set myarray.ubound=2

echo.
echo argument is text without spaces      MYTESTTEST
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 MYTESTTEST
echo.
echo argument is text with spaces         "MY TEST TEST"
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 "MY TEST TEST"
REM echo.
REM echo argument is text poison char         "MY TEST ^& TEST"
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 "MY TEST ^& TEST"
REM echo.
REM echo argument is text poison char         "MY TEST & TEST"
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 "MY TEST & TEST"
REM echo.
REM echo argument is text poison char         "MY TEST ^"^& TEST"
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 "MY TEST ^"& TEST"
REM echo.
REM echo argument is text poison char         MY^^ TEST^^ TEST
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 MY^ TEST^ TEST
REM echo.
REM echo argument is text poison char         MY^^ TEST^^ ^^^&^^ TEST
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 MY^ TEST^ ^&^ TEST
REM echo.
REM echo argument is text poison char         MY^^^^ TEST^^^^ ^^^^^&^^^^ TEST
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 MY^^ TEST^^ ^^&^^ TEST
REM echo.
REM echo argument is text poison char         MY^^^^^^ TEST^^^^^^ ^^^^^^^&^^^^^^ TEST
REM Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 MY^^^ TEST^^^ ^^^&^^^ TEST
echo.
echo argument is a variable
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 myvariable
echo.
echo argument is an array with ubound set
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 myarray
echo.
echo argument is an array without ubound set
set "myarray.ubound="
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 myarray
echo.
REM echo argument is an array without ubound set
echo argument is a valid existing relative file path
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 GetLineLenght-DEMO.2.txt
echo.
echo argument is a valid existing absolute folder path
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 c:\windows\
echo.
echo argument is a valid existing absolute file
Call :InsertTextAtLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.2.txt 9 C:\Windows\System32\calc.exe

set myarray2[0]=This is the content of element 0 from myarray2
set myarray2[1]=This is the content of element 1 from myarray2
set myarray2[2]=This is the content of element 2 from myarray2

echo. 
echo repeat all previous command, using :InsertMultipleTextAtMultipleLineNumber
Call :InsertMultipleTextAtMultipleLineNumber GetLineLenght-DEMO.txt GetLineLenght-DEMO.3.txt 9 MYTESTTEST 9 "MY TEST TEST" 9 myvariable 9 myarray 9 myarray2 9 GetLineLenght-DEMO.3.txt 9 c:\windows\ 9 C:\Windows\System32\calc.exe 







REM if not true==true (

REM echo.
REM echo ECHO ARGUMENTS
REM set _ITALN_temp=%4

REM set "_ITALN_temp2=%4"

REM set _ITALN_temp

REM echo %4
REM setlocal enabledelayedexpansion
REM echo %4
REM endlocal

REM echo %~4
REM echo %~a4
REM setlocal enabledelayedexpansion
REM echo %~4
REM endlocal

REM echo "%~4"
REM echo "%~a4"
REM setlocal enabledelayedexpansion
REM echo "%~4"
REM endlocal
REM echo ECHO ARGUMENTS  
REM )
REM check if it' s a variable, if yes, it's byref
REM check if %~3[ is defined, if yes it's an arround, find the ubound
REM still no ? check if it' s a file that exists
REM then it's just text

REM if defined "MYTESTTEST" ( echo #4 is defined as single var ) else ( echo #4 is not defined as single var )
REM if defined "%~4" ( echo #4 is defined as single var ) else ( echo #4 is not defined as single var )
REM if defined "%~4[" ( echo #4 is defined as array ) else ( echo #4 is not defined as array )

REM if defined %~4[ ( echo #4 is defined as array ) else ( echo #4 is not defined as array )

REM this might work better as a macro
REM if defined %4 ( set "_ITALN_LineText_type=variable" & GoTo :InsertTextAtLineNumber-array-check-end )
REM if defined %4.ubound ( set "_ITALN_LineText_type=array" & GoTo :InsertTextAtLineNumber-array-check-end )
REM for /f "tokens=1* delims=l=" %%a in ('set %4[ 2^>^&1') do ( if "[%%a]" NEQ "[Environment variab]" ( set "_ITALN_LineText_type=array" ) & GoTo :InsertTextAtLineNumber-array-check-end )
REM set _ITALN_LineText_attr=%~a4f
REM if /I "[%_ITALN_LineText_attr:~0,1%]"=="[d]" ( set "_ITALN_LineText_type=folder" & GoTo :InsertTextAtLineNumber-array-check-end )
REM if exist %4 ( set "_ITALN_LineText_type=file" & GoTo :InsertTextAtLineNumber-array-check-end )
REM if "[%~4]" EQU "[]" ( set "_ITALN_LineText_type=empty" ) else ( set "_ITALN_LineText_type=text" )
REM :InsertTextAtLineNumber-array-check-end


goto :eof

echo.
echo Print out text file GetLineLenght-DEMO.2.txt 
echo one line at a time using RunMultipleTimes, GetLineCount and ReadLineRange

Call :GetLineCount GetLineLenght-DEMO.2.txt
Call :ReadLineRange GetLineLenght-DEMO.2.txt 1 %errorlevel% myLineArray
Call :RunMultipleTimes %myLineArray.ubound% "call call echo L%%%%_RunMultipleTimes_index%%%% %%%%%%%%myLineArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"


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

:ReadLineRange-DEMO
Call :ClearVariablesByPrefix _RLR my

REM del ReadLineRange-DEMO.txt 2>nul
if not exist ReadLineRange-DEMO.txt Call :RunMultipleTimes 15 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>ReadLineRange-DEMO.txt"

Call :ReadLineRange "ReadLineRange-DEMO.txt" 7 11 myLineArray

echo.
set myLineArray

GoTo :EOF

:IsDelayedExpansionEnabled-DEMO

set testvalue=testtesttest

echo Is delayed expansion enabled ? It should not be
call :IsDelayedExpansionEnabled && echo It is enabled || echo It is not enabled

setlocal enabledelayedexpansion
echo.
echo Is delayed expansion enabled ? It should be
call :IsDelayedExpansionEnabled && echo It is enabled || echo It is not enabled
endlocal

GoTo :EOF

:NumberStringToArray-DEMO
Call :ClearVariablesByPrefix _SNA _ATS _RLZ _CopyArray
Call :ClearVariablesByPrefix MyNumber

REM goto :NumberStringToArray-DEMO-skip

Call :NumberStringToArray "64 12 44 883 100 2 48 377" MyNumberArray
set MyNumberArray

echo.
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "" MyNumberArray
echo this should cause an error
set MyNumberArray

echo.
echo single number array
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "24" MyNumberArray
set MyNumberArray

echo.
echo creating array, and sorting it
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "64 12 44 883 100 2 48 377" MyNumberArray
set MyNumberArray
Call :SortNumberArray MyNumberArray
echo.
echo after sorting
set MyNumberArray 

echo.
echo creating array, and sorting it, in reverse order
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "64 12 44 883 100 2 48 377" MyNumberArray
set MyNumberArray
Call :SortNumberArray MyNumberArray DESCENDING
echo.
echo after sorting
set MyNumberArray

echo.
echo Generating 10 random 3 digit number and sorting them
Call :ClearVariablesByPrefix MyNumberArray
set /a "NumberStringToArray_DEMO_loop=0"
:NumberStringToArray-DEMO-loop
call :GetRandomString 3 MyNumberArray[%NumberStringToArray_DEMO_loop%] NUMERICONLY ESCNOTLASTDIGIT NOLEN
Call :RemoveLeadingZeros MyNumberArray[%NumberStringToArray_DEMO_loop%]
set /a "NumberStringToArray_DEMO_loop+=1"
if %NumberStringToArray_DEMO_loop% LSS 10 GoTo :NumberStringToArray-DEMO-loop
set /a "MyNumberArray.ubound=%NumberStringToArray_DEMO_loop%-1"
echo.
echo original
set MyNumberArray
Call :SortNumberArray MyNumberArray 
echo sorted ascending order
set MyNumberArray
Call :SortNumberArray MyNumberArray DESCENDING
echo sorted descending order
set MyNumberArray

:NumberStringToArray-DEMO-skip

echo.
echo Generating 10 random 3 digit number and sorting them
echo but this time as a string
echo then this string gets sorted both direction
Call :ClearVariablesByPrefix MyNumberArray
set /a "NumberStringToArray_DEMO_loop=0"
:NumberStringToArray-DEMO-loop2
call :GetRandomString 3 MyNumberArray[%NumberStringToArray_DEMO_loop%] NUMERICONLY ESCNOTLASTDIGIT NOLEN
Call :RemoveLeadingZeros MyNumberArray[%NumberStringToArray_DEMO_loop%]
call set "MyNumberNew=%%MyNumberArray[%NumberStringToArray_DEMO_loop%]%% "
set "MyNumberString=%MyNumberString%%MyNumberNew%"
set /a "NumberStringToArray_DEMO_loop+=1"
if %NumberStringToArray_DEMO_loop% LSS 10 GoTo :NumberStringToArray-DEMO-loop2
set /a "MyNumberArray.ubound=%NumberStringToArray_DEMO_loop%-1"

echo.
echo Number string from GetRandom
echo %MyNumberString%
Call :NumberStringToArray "%MyNumberString%" MyNumberArrayAscending
Call :SortNumberArray MyNumberArrayAscending
Call :ArrayToString MyNumberArrayAscending MyNumberStringAscending " "
echo Number string sorted ascending
echo %MyNumberStringAscending%

Call :NumberStringToArray "%MyNumberString%" MyNumberArrayDescending
Call :SortNumberArray MyNumberArrayDescending DESCENDING
Call :ArrayToString MyNumberArrayDescending MyNumberStringDescending " "
echo Number string sorted descending
echo %MyNumberStringDescending%

GoTo :EOF



:AddEscapeCharacters-AND-GetRandomString-DEMOv2



REM set debug=true

REM Call :PrintCharMap 
REM goto :eof

Call :ClearVariablesByPrefix _AEC _GRD _RML my

REM goto :AddEscapeCharacters-AND-GetRandomString-DEMOv2-skip1

echo new attempt>>randomstring.txt

echo.
echo calling GetRandomString five times
echo without arguments the strings will have, no space, no quotes, no exclamation, no percent, no delimiters
echo if the last character is a number, it will be escaped with a carret (this reduce the output string length by 1 (TODO FIX))
echo.

call :GetRandomString 30 myoutput[0]
call :len myoutput[0].len2 myoutput[0]
echo R %myoutput[0].len% %myoutput[0].len2% %myoutput[0]%
call :GetRandomString 30 myoutput[1]
call :len myoutput[1].len2 myoutput[1]
echo R %myoutput[1].len% %myoutput[1].len2% %myoutput[1]%
call :GetRandomString 30 myoutput[2]
call :len myoutput[2].len2 myoutput[2]
echo R %myoutput[2].len% %myoutput[2].len2% %myoutput[2]%
call :GetRandomString 30 myoutput[3]
call :len myoutput[3].len2 myoutput[3]
echo R %myoutput[3].len% %myoutput[3].len2% %myoutput[3]%
call :GetRandomString 30 myoutput[4]
call :len myoutput[4].len2 myoutput[4]
echo R %myoutput[4].len% %myoutput[4].len2% %myoutput[4]%
call :GetRandomString 30 myoutput[5]
call :len myoutput[5].len2 myoutput[5]
echo R %myoutput[5].len% %myoutput[5].len2% %myoutput[5]%

Call :ClearVariablesByPrefix myout


echo.
echo calling GetRandomString five times, using :RunMultipleTimes
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%]" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USESPECIALCHARS, random string will now include these characters ^& ^< ^> ^^ ^|
echo these characters are all properly escaped by default so they will appear with a simple echo and no delayed expansion
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USESPECIALCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USESPACE instead, random string will now include spaces
echo the space are all escaped by default 
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USESPACE" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEEXCLAMATION instead, random string will now include exclamations
echo the exclamation are all escaped by default 
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEEXCLAMATION" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEPERCENT instead, random string will now include percent signs
echo these percent signs are all properly escaped by default
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEPERCENT" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEQUOTES instead, random string will now include doublequotes
echo these double quotes are all properly escaped by default
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEQUOTES" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using USEDELIMITERS instead, random string will now include delimiter characters ^= ^; ^,
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but using all the previous option together
echo USESPECIALCHARS USESPACE USEEXCLAMATION USEPERCENT USEQUOTES USEDELIMITERS
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USESPECIALCHARS USESPACE USEEXCLAMATION USEPERCENT USEQUOTES USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"

echo.
echo save as previous, but with option USEALLCHARS, which should be same as all options enabled
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"


echo.
echo with options USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS
echo but also DONTESCAPE (everything but special characters)
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] DONTESCAPE USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"



del AddEscapeCharacters-AND-GetRandomString-DEMO.txt

echo.
echo with options USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS
echo but also DONTESCAPE (everything but special characters)
echo and output to file AddEscapeCharacters-AND-GetRandomString-DEMO.txt
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] DONTESCAPE USESPACE USEEXCLAMATION USEQUOTES USEPERCENT USEDELIMITERS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>AddEscapeCharacters-AND-GetRandomString-DEMO.txt"

echo. 
echo Reading back from previous file, one line at a file 
echo Using readline
echo.
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 1 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 2 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 3 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 4 myreadline
echo %myreadline%
Call :Readline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 5 myreadline
echo %myreadline%

echo. 
echo Reading back from previous file, one line at a file 
echo Using printline
echo.
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 1 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 2 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 3 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 4 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 5 

:AddEscapeCharacters-AND-GetRandomString-DEMOv2-skip1

del AddEscapeCharacters-AND-GetRandomString-DEMO.txt

echo.
echo generate with USEALLCHARS
echo and output to file AddEscapeCharacters-AND-GetRandomString-DEMO.txt
echo.
Call :RunMultipleTimes 5 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>AddEscapeCharacters-AND-GetRandomString-DEMO.txt"



echo. 
echo Reading back from previous file, one line at a file 
echo Using printline
echo.
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 1 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 2 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 3 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 4 
Call :Printline AddEscapeCharacters-AND-GetRandomString-DEMO.txt 5 

echo.
echo read line 1 3 and 5 from AddEscapeCharacters-AND-GetRandomString-DEMO.txt

set myLineNumbers[0]=1
set myLineNumbers[1]=3
set myLineNumbers[2]=5
set myLineNumbers.ubound=2

Call :ReadMultiLine "AddEscapeCharacters-AND-GetRandomString-DEMO.txt" myLineNumbers myOutputArray

echo.
echo direct echo of the array
setlocal enabledelayedexpansion
echo !myOutputArray[0]!
echo !myOutputArray[1]!
echo !myOutputArray[2]!
endlocal 

echo.
echo echo using :RunMultipleTimes
echo test0
setlocal enabledelayedexpansion
Call :RunMultipleTimes 3 "call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"
endlocal
echo test1
Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
echo test2
Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"

echo.
echo actual values from set myOutputArray
set myOutputArray


echo.
echo more tests
setlocal enabledelayedexpansion
Call :ReadMultiLine "AddEscapeCharacters-AND-GetRandomString-DEMO.txt" myLineNumbers myOutputArray
echo -1
Call :RunMultipleTimes 3 "echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!"
echo 0
Call :RunMultipleTimes 3 "call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!"
echo 1
Call :RunMultipleTimes 3 "call echo !!myOutputArray[!_RunMultipleTimes_index!]!!"
echo 2
Call :RunMultipleTimes 3 "echo !!myOutputArray[!_RunMultipleTimes_index!]!!"
echo -1
Call :RunMultipleTimes 3 "call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!"
echo 0
Call :RunMultipleTimes 3 "call call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!"
echo 1
Call :RunMultipleTimes 3 "call call echo !!myOutputArray[!_RunMultipleTimes_index!]!!"
echo 2
Call :RunMultipleTimes 3 "call echo !!myOutputArray[!_RunMultipleTimes_index!]!!"
echo -1
Call :RunMultipleTimes 3 "call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!"
echo 0
Call :RunMultipleTimes 3 "call call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!"
echo 1
Call :RunMultipleTimes 3 "call call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!"
echo 2
Call :RunMultipleTimes 3 "call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!"
endlocal

:ReadMultiLine-DEMO

Call :ClearVariablesByPrefix my

REM del ReadMultiLine-DEMO.txt 2>nul
if not exist ReadMultiLine-DEMO.txt echo creating file ReadMultiLine-DEMO.txt with 15 lines of 30 random characters
if not exist ReadMultiLine-DEMO.txt Call :RunMultipleTimes 15 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>ReadMultiLine-DEMO.txt"

set myArrayOfLineNumbers[0]=2
set myArrayOfLineNumbers[1]=5
set myArrayOfLineNumbers[2]=6
set myArrayOfLineNumbers[3]=12
set myArrayOfLineNumbers.ubound=3
echo.
echo testing ReadMultiline
Call :ReadMultiLine "ReadMultiLine-DEMO.txt" myArrayOfLineNumbers myOutputArray 
REM echo echo array
REM Call :EchoArray myOutputArray
set myOutputArray

GoTo :EOF







REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo now exclam
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo inner variable with percent
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo.

REM Call :ReadMultiLine "AddEscapeCharacters-AND-GetRandomString-DEMO.txt" myLineNumbers myOutputArray
REM echo -1
REM Call :RunMultipleTimes 3 "echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 0
REM Call :RunMultipleTimes 3 "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 1
REM Call :RunMultipleTimes 3 "call echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo 2
REM Call :RunMultipleTimes 3 "echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo -1
REM Call :RunMultipleTimes 3 "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 0
REM Call :RunMultipleTimes 3 "call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 1
REM Call :RunMultipleTimes 3 "call call echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo 2
REM Call :RunMultipleTimes 3 "call echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo -1
REM Call :RunMultipleTimes 3 "call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"
REM echo 0
REM Call :RunMultipleTimes 3 "call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"
REM echo 1
REM Call :RunMultipleTimes 3 "call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 2
REM Call :RunMultipleTimes 3 "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
GoTo :EOF





REM call :GetRandomString 29 myteststring USESPECIALCHARS DONTESCAPE
REM call :GetRandomString 29 myteststring DONTESCAPE USEALLCHARS
REM call :GetRandomString 29 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 1000 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 30 myteststring DONTESCAPE 
Call :GetRandomString 3000 myteststring DONTESCAPE 
Call :len myteststring.len2 myteststring
Call :AddEscapeCharacters myteststring  myescapedstring
Call :len myescapedstring.len2 myescapedstring

:AddEscapeCharacters-AND-GetRandomString-DEMOv2-output
echo I %myteststring.len% %myteststring.len2% "%myteststring%"
echo O %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%
echo I %myteststring.len% %myteststring.len2% "%myteststring%">>randomstring.txt
echo O %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%>>randomstring.txt
setlocal enabledelayedexpansion
echo II !myteststring.len! !myteststring.len2!  !myteststring!
echo OO !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!
echo II !myteststring.len! !myteststring.len2!  !myteststring!>>randomstring.txt
echo OO !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!>>randomstring.txt
endlocal
REM set my
GoTo :EOF




:AddEscapeCharacters-AND-GetRandomString-DEMOv1

REM set debug=true

REM Call :PrintCharMap 
REM goto :eof
Call :ClearVariablesByPrefix _GetRandomString
Call :ClearVariablesByPrefix _AddEscapeCharacters
echo new attempt>>randomstring.txt

set "myteststring=" & set "myescapedstring=" & set "myteststring.len=" & set "myescapedstring.len="
REM call :GetRandomString 29 myteststring USESPECIALCHARS DONTESCAPE
REM call :GetRandomString 29 myteststring DONTESCAPE USEALLCHARS
REM call :GetRandomString 29 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 1000 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 30 myteststring DONTESCAPE 
call :GetRandomString 3000 myteststring DONTESCAPE 
Call :len myteststring.len2 myteststring

Call :AddEscapeCharacters myteststring  myescapedstring
Call :len myescapedstring.len2 myescapedstring



echo I1 %myteststring.len% %myteststring.len2% "%myteststring%"
echo I1 %myteststring.len% %myteststring.len2% "%myteststring%">>randomstring.txt
setlocal enabledelayedexpansion
Call :len myteststring.len myteststring
echo I2 !myteststring.len! !myteststring.len2!  !myteststring!
echo I2 !myteststring.len! !myteststring.len2!  !myteststring!>>randomstring.txt
endlocal
echo O1 %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%
echo O1 %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%>>randomstring.txt
setlocal enabledelayedexpansion
echo O2 !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!
echo O2 !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!>>randomstring.txt
endlocal
REM set my
goto :AddEscapeCharacters-AND-GetRandomString-DEMO

GoTo :EOF



:Performance-timer-DEMO


Call :ClearVariablesByPrefix "app.timer" _StartTimer _UpdateTimer _PrintTimer _ClearTimer _UpdateTimerAndPrint _GetTimeDifference _UTAP _GTD 

echo.
echo First test, running StartTimer, then UpdateTimer a bunch of time, then PrintTimer
echo then showing the whole app.timer.default structure 
echo then calling ClearTimer, now app.timer.default should not be defined
echo.
Call :StartTimer 
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :PrintTimer
echo.
echo.
set app.timer.default
Call :ClearTimer
set app.timer.default
echo.

echo.
echo Same test as previous, but a comment is included on each step 
echo empty variable required to fullfill "semi-optional" argument
echo.
Call :StartTimer "" "This is start timer" 
Call :UpdateTimer "" "This is update 1"
Call :UpdateTimer "" "This is update 2"
Call :UpdateTimer "" "This is update 3"
Call :UpdateTimer "" "This is update 4"
Call :UpdateTimer "" "This is update 5"
Call :UpdateTimer "" "This is update 6"
Call :UpdateTimer "" "This is update 7"
Call :PrintTimer
echo.
echo.
set app.timer.default
Call :ClearTimer
set app.timer.default
echo.


echo.
echo Same test as previous, but with a named timer
echo.
Call :StartTimer NamedTimer1 "This is start timer" 
Call :UpdateTimer NamedTimer1 "This is update 1"
Call :UpdateTimer NamedTimer1 "This is update 2"
Call :UpdateTimer NamedTimer1 "This is update 3"
Call :UpdateTimer NamedTimer1 "This is update 4"
Call :UpdateTimer NamedTimer1 "This is update 5"
Call :UpdateTimer NamedTimer1 "This is update 6"
Call :UpdateTimer "NamedTimer1" "This is update 7"
Call :PrintTimer NamedTimer1
echo.
echo.
set app.timer
Call :ClearTimer NamedTimer1
set app.timer
echo.

echo.
echo Same test as previous, but with two named timers and interlaced updates
echo no longer showing app.timer structure
echo.
Call :StartTimer NamedTimer2 "Th2s is start timer" 
Call :StartTimer NamedTimer3 "Th3s is start timer" 
Call :UpdateTimer NamedTimer2 "Th2s is update 1"
Call :UpdateTimer NamedTimer3 "Th3s is update 1"
Call :UpdateTimer NamedTimer2 "Th2s is update 2"
Call :UpdateTimer NamedTimer3 "Th3s is update 2"
Call :UpdateTimer NamedTimer2 "Th2s is update 3"
Call :UpdateTimer NamedTimer3 "Th3s is update 3"
Call :UpdateTimer NamedTimer2 "Th2s is update 4"
Call :UpdateTimer NamedTimer3 "Th3s is update 4"
Call :UpdateTimer NamedTimer2 "Th2s is update 5"
Call :UpdateTimer NamedTimer3 "Th3s is update 5"
Call :UpdateTimer NamedTimer2 "Th2s is update 6"
Call :UpdateTimer NamedTimer3 "Th3s is update 6"
Call :UpdateTimer "NamedTimer2" "Th2s is update 7"
Call :UpdateTimer "NamedTimer3" "Th3s is update 7"
Call :PrintTimer NamedTimer2
Call :PrintTimer NamedTimer3
Call :ClearTimer NamedTimer2
Call :ClearTimer NamedTimer3
echo.


echo.
echo Single named timer, testing sleep function in between
echo.
Call :StartTimer NamedTimer1 "This is start timer" 
Call :UpdateTimer NamedTimer1 "This is update 1"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 2"
Call :Sleep
Call :Sleep
Call :Sleep
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 3"
Call :Sleep
Call :Sleep
Call :Sleep
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 4"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 5"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 6"
Call :UpdateTimer "NamedTimer1" "This is update 7"
Call :PrintTimer NamedTimer1
Call :ClearTimer NamedTimer1
echo.

GoTo :EOF

::Usage Call :Sleep optional millis=1000
:Sleep
Call :SetIfNotDefined "%~1" _Sleep_millis
Call :SetIfNotDefined 1000 _Sleep_millis
set /a "_Sleep_loop_count=%_Sleep_millis%/10"
for /l %%a in (1,1,%_Sleep_loop_count%) do ( ping -n 1 -w 127.0.0.1 > nul )
GoTo :EOF


::Usage Call :StartTimer semi-optional TimerName optional TimeComment
:StartTimer 
Call :SetIfNotDefined "%~1" _StartTimer_TimerName "%~2" _StartTimer_TimerComment
Call :SetIfNotDefined default _StartTimer_TimerName
set "_StartTimer_TimerName=app.timer.%_StartTimer_TimerName%"
set /a "%_StartTimer_TimerName%.lbound=0" & set /a "%_StartTimer_TimerName%.ubound=0"
set "%_StartTimer_TimerName%[0].comment=%_StartTimer_TimerComment%"
set "%_StartTimer_TimerName%[0].date=%date%"
set "%_StartTimer_TimerName%[0].time=%time: =0%"
Call :ClearVariablesByPrefix _StartTimer
GoTo :EOF

::Usage Call :UpdateTimer semi-optional TimerName optional TimeComment
:UpdateTimer 
Call :SetIfNotDefined "%~1" _UpdateTimer_TimerName "%~2" _UpdateTimer_TimerComment
Call :SetIfNotDefined default _UpdateTimer_TimerName
set "_UpdateTimer_TimerName=app.timer.%_UpdateTimer_TimerName%"
set /a "%_UpdateTimer_TimerName%.ubound+=1"
Call set /a "_UpdateTimer_ubound=%%%_UpdateTimer_TimerName%.ubound%%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].comment=%_UpdateTimer_TimerComment%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].date=%date%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].time=%time: =0%"
Call :ClearVariablesByPrefix _UpdateTimer
GoTo :EOF

::Usage Call :UpdateTimerAndPrint semi-optional TimerName optional TimeComment
:UpdateTimerAndPrint
set "_UpdateTimerAndPrint_prefix=_UTAP"
Call :SetIfNotDefined "%~1" _UTAP_TimerName "%~2" _UTAP_TimerComment
Call :SetIfNotDefined default _UTAP_TimerName
set "_UTAP_TimerName=app.timer.%_UTAP_TimerName%"
set /a "%_UTAP_TimerName%.ubound+=1"
Call set /a "_UTAP_ubound=%%%_UTAP_TimerName%.ubound%%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].comment=%_UTAP_TimerComment%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].date=%date%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].time=%time: =0%"
set /a "_UTAP_pbound=%_UTAP_ubound%-1"
Call :GetTimeDifference %%%_UTAP_TimerName%[%_UTAP_pbound%].time%% %%%_UTAP_TimerName%[%_UTAP_ubound%].time%% _UTAP_TimeDifference
echo Time elapsed [%_UTAP_TimeDifference%]
Call :ClearVariablesByPrefix %_UpdateTimerAndPrint_prefix% _UpdateTimerAndPrint
GoTo :EOF


::Usage Call :PrintTimer optional TimerName
:PrintTimer
Call :SetIfNotDefined "%~1" _PrintTimer_TimerName
Call :SetIfNotDefined default _PrintTimer_TimerName
set "_PrintTimer_TimerName=app.timer.%_PrintTimer_TimerName%"
set /a "_PrintTimer_previous=-1"
set /a "_PrintTimer_index=0"
call set /a "_PrintTimer_ubound=%%%_PrintTimer_TimerName%.ubound%%"
:PrintTimer-loop
if %_PrintTimer_index% GTR 0 Call :GetTimeDifference %%%_PrintTimer_TimerName%[%_PrintTimer_previous%].time%% %%%_PrintTimer_TimerName%[%_PrintTimer_index%].time%% _PrintTimer_TimeDifference
call echo %_PrintTimer_TimerName% [%_PrintTimer_index%] %%%_PrintTimer_TimerName%[%_PrintTimer_index%].date%% %%%_PrintTimer_TimerName%[%_PrintTimer_index%].time%% : diff [%_PrintTimer_TimeDifference%] : %%%_PrintTimer_TimerName%[%_PrintTimer_index%].comment%% 
set /a "_PrintTimer_previous+=1"
set /a "_PrintTimer_index+=1"
if %_PrintTimer_index% LEQ %_PrintTimer_ubound% GoTo :PrintTimer-loop
Call :ClearVariablesByPrefix _PrintTimer
GoTo :EOF

::Usage Call :ClearTimer optional TimerName
:ClearTimer
Call :SetIfNotDefined "%~1" _ClearTimer_TimerName
Call :SetIfNotDefined default _ClearTimer_TimerName
set "_ClearTimer_TimerName=app.timer.%_ClearTimer_TimerName%"
Call :ClearVariablesByPrefix %_ClearTimer_TimerName%
Call :ClearVariablesByPrefix _ClearTimer
GoTo :EOF


::Usage Call :GetTimeDifference Time1 Time2 DifferenceOutput
:GetTimeDifference 
set "_GetTimeDifference_prefix=_GTD"
Call :SetIfNotDefined "%~1" _GTD_Time1 "%~2" _GTD_Time2
setlocal EnableDelayedExpansion
set "_GTD_Time2_cent=!_GTD_Time2:%time:~8,1%=%%100)*100+1!"  &  set "_GTD_Time1_cent=!_GTD_Time1:%time:~8,1%=%%100)*100+1!"
set /A "_GTD_elapsed=((((10!_GTD_Time2_cent:%time:~2,1%=%%100)*60+1!%%100)-((((10!_GTD_Time1_cent:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
endlocal & set "%~3=%_GTD_elapsed%"
Call :ClearVariablesByPrefix "%_GetTimeDifference_prefix%" _GetTimeDifference
GoTo :EOF
::With help from https://stackoverflow.com/questions/9922498/



rem Convert elapsed time to HH:MM:SS:CC format:
set /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"

echo Start:    %startTime%
echo End:      %endTime%
echo Elapsed:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%



::Usage Call :GetTime 
:GetTimer TimerName OutputValue semi-optional TimerName optional TimeComment
Call :SetIfNotDefined "%~1" _GetTimer_Output "%~2" _GetTimer_TimerComment "%~3" _GetTimer_TimerComment
Call :SetIfNotDefined default _GetTimer_TimerName



REM Function Library

::Usage Call :IsEqual StringA StringB optional OutputBool && echo it is true (errorlevel 0) || echo it is false (errorlevel not 0)
:IsEqual
setlocal enabledelayedexpansion
endlocal & if "[%~3]" NEQ "[]"


::Usage Call :RunMultipleTimes RunCount "Your Command here"
:RunMultipleTimes
set /a "_RunMultipleTimes_index=0"
set /a "_RunMultipleTimes_ubound=%~1"
shift
:RunMultipleTimes-loop
%~1
%~2
%~3
%~4
%~5
%~6
%~7
%~8
%~9
set /a "_RunMultipleTimes_index+=1"
if %_RunMultipleTimes_index% LSS %_RunMultipleTimes_ubound% GoTo :RunMultipleTimes-loop
Call :ClearVariablesByPrefix myPrefix _RunMultipleTimes
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

:: Usage Call :IsArrayDefinedBySet Variable OutputValue
:IsArrayDefinedBySet
set /a _IsArrayDefinedBySet.index=0
for /f "tokens=1* delims=" %%a in ('set %~1 2^>^&1') do ( call set _IsArrayDefinedBySet[%%_IsArrayDefinedBySet.index%%]=%%a & call set /a _IsArrayDefinedBySet.index+=1 )
if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:Environment variable=%]" ( 
	if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:not defined=%]" 	set "_IsArrayDefinedBySet.IsDefined=false" ) else ( set "_IsArrayDefinedBySet.IsDefined=true" )
if not "[%~2]"=="[]" set "%~2=%_IsArrayDefinedBySet.IsDefined%"
Call :ClearVariablesByPrefix _IsArrayDefinedBySet & if "[%_IsArrayDefinedBySet.IsDefined%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF

::Usage Call :SetIfNotDefined "%ValueIfUnset%" OutputVariable optional VariableName2 "%ValueIfUnset2%" optional optional VariableNameN "%ValueIfUnsetN%"
:SetIfNotDefined
set "_SetIfNotDefined_Output=%~2"
if not defined %_SetIfNotDefined_Output% set "%_SetIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetIfNotDefined
set "_SetIfNotDefined_Output="
GoTo :EOF

::Usage Call :FindArrayBounds InputArray OutputValue
::Usage Call :lbound InputArray OutputValue
::Usage Call :ubound InputArray OutputValue
:FindArrayBounds
:lbound
:ubound
set /a FindArrayBounds.index=0
for /f "tokens=1,2 delims=[]=" %%a in ('set %~1[ 2^>nul') do ( call set "FindArrayBounds[%%FindArrayBounds.index%%]=%%b" & call set /a FindArrayBounds.index+=1 )
Call :IsArrayDefinedBySet "%~1[0]" && set "FindArrayBounds.IsZeroDefined=true" || set "FindArrayBounds.IsZeroDefined=false"
set /a "FindArrayBounds.ubound=%FindArrayBounds.index%-1"
REM Actually going to have to split that becuase 3 is greater than -2147483644 and 2 is greater than -2147483645 and 0 is greater than -2147483647 are the limits
REM change algorith to work beyond these values, maybe ?
set /a "FindArrayBounds.lowestvalue=1147483647"
set /a "FindArrayBounds.highestvalue=-1147483647"
set /a FindArrayBounds.index=0
:FindArrayBounds-loop
REM call echo 11 call set /a "FindArrayBounds.current=%%FindArrayBounds[%FindArrayBounds.index%]%%"
call set /a "FindArrayBounds.current=%%FindArrayBounds[%FindArrayBounds.index%]%%" 2>nul
if %FindArrayBounds.current% EQU 0 if "[%FindArrayBounds.IsZeroDefined%]"=="[false]" GoTo :FindArrayBounds-loop-next-iteration
if %FindArrayBounds.current% lss %FindArrayBounds.lowestvalue% set /a "FindArrayBounds.lowestvalue=%FindArrayBounds.current%"
if %FindArrayBounds.current% gtr %FindArrayBounds.highestvalue% set /a "FindArrayBounds.highestvalue=%FindArrayBounds.current%"
REM echo lowest %FindArrayBounds.lowestvalue% highest %FindArrayBounds.highestvalue%
:FindArrayBounds-loop-next-iteration
set /a FindArrayBounds.index+=1
if %FindArrayBounds.index% leq %FindArrayBounds.ubound% GoTo :FindArrayBounds-loop
if "[%~2]"=="[]" (
	set /a "%~1.lbound=%FindArrayBounds.lowestvalue%"
	set /a "%~1.ubound=%FindArrayBounds.highestvalue%"
	set /a "%~1.count=%FindArrayBounds.highestvalue%-%FindArrayBounds.lowestvalue%+1"
) else (
	set /a "%~2.lbound=%FindArrayBounds.lowestvalue%"
	set /a "%~2.ubound=%FindArrayBounds.highestvalue%"
	set /a "%~2.count=%FindArrayBounds.highestvalue%-%FindArrayBounds.lowestvalue%+1"
)
Call :ClearVariablesByPrefix FindArrayBounds
GoTo :EOF



::Usage Call :SortNumberString InputNumberString optional OutputBool
:IsNumberStringSequential
set "_IsNumberStringSequential_prefix=_INSS"

Call :ClearVariablesByPrefix %_IsNumberStringSequential_prefix% _INSS
GoTo :EOF NO it' s exit /b the result

::Usage Call :SortNumberString InputNumberString optional OutputNumberString
:SortNumberString


for %%n in (%_NSTA_StringOfNumbers%) do ( set 

REM for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )

REM ::Usage Call :NumberStringToArray StringOfNumbers OutputArray SortOrder
REM :NumberStringToArray
REM set "_NumberStringToArray_prefix=_NSTA"
REM Call :SetIfNotDefined "%~1" _NSTA_StringOfNumbers "%~2" _NSTA_ArrayOfNumber "%~3" _NSTA_SortOrder 0 _NSTA_Index
REM setlocal enabledelayedexpansion
REM set _NSTA_localscope=true & set _NSTA_Index=%_NSTA_Index%
REM for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )
REM set /a "%_NSTA_ArrayOfNumber%.lbound=0" & set /a "%_NSTA_ArrayOfNumber%.ubound=!_NSTA_Index!-1"
REM for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( endlocal & set "%%a" )
REM if defined _NSTA_localscope endlocal
REM Call :ClearVariablesByPrefix "%_NumberStringToArray_prefix%" _NumberStringToArray
REM GoTo :EOF

::Usage Call :WordWrap InputString MaxLenght OutputLinesArray
:WordWrap

Goto :EOF

::Usage Call :WriteArray InputLineArray OutputFile
:WriteArray

::Usage Call :WriteLine Filename InputVariable
:WriteLine


GoTo :EOF

::Usage Call :GetArgumentType OutputType Argument
:GetArgumentType 

GoTo :EOF

::Usage Call :AppendTextToFile OutputFilename LineText
:AppendTextToFile
set "_AppendTextToFile_prefix=_ATTF"
Call :SetIfNotDefined "%~1" _ATTF_OutputFilename "%~2" _ATTF_LineNumber  
set _ATTF_LineText=%~3
REM this might work better as a macro
if defined %3 ( set "_ATTF_LineText_type=variable" & GoTo :AppendTextToFile-array-check-end )
if defined %3.ubound ( set "_ATTF_LineText_type=array" & GoTo :AppendTextToFile-array-check-end )
for /f "tokens=1* delims=l=" %%a in ('set %3[ 2^>^&1') do ( if "[%%a]" NEQ "[Environment variab]" ( set "_ATTF_LineText_type=array" ) & GoTo :AppendTextToFile-array-check-end )
set _ATTF_LineText_attr=%~a3f
if /I "[%_ATTF_LineText_attr:~0,1%]"=="[d]" ( set "_ATTF_LineText_type=folder" & GoTo :AppendTextToFile-array-check-end )
if exist %3 ( set "_ATTF_LineText_type=file" & GoTo :AppendTextToFile-array-check-end )
if "[%~3]" EQU "[]" ( set "_ATTF_LineText_type=empty" ) else ( set "_ATTF_LineText_type=text" )
:AppendTextToFile-array-check-end
IF %_ATTF_LineText_type% EQU array (
	call set "_ATTF_LineText_lbound=%%%~3.lbound%%"
	if "[%_ATTF_LineText_lbound%]" EQU "[]" set "_ATTF_LineText_lbound=0"
	call set "_ATTF_LineText_ubound=%%%~3.ubound%%"
	if "[%_ATTF_LineText_ubound%]" EQU "[]" Call :ubound %~3
	if "[%_ATTF_LineText_ubound%]" EQU "[]" call set "_ATTF_LineText_ubound=%%%~3.ubound%%"
	)
if %_ATTF_LineText_type% EQU text (
		setlocal enabledelayedexpansion
		>>%_ATTF_OutputFilename% echo !_ATTF_LineText!
		endlocal
	) ELSE IF %_ATTF_LineText_type% EQU variable (
		setlocal enabledelayedexpansion
		>>%_ATTF_OutputFilename% echo !%~3!
		endlocal
	) ELSE IF %_ATTF_LineText_type% EQU array (
		setlocal enabledelayedexpansion
		FOR /L %%a IN (!_ATTF_LineText_lbound!,1,!_ATTF_LineText_ubound!) DO >>%_ATTF_OutputFilename% echo !%~3[%%a]!
		endlocal
	) ELSE IF %_ATTF_LineText_type% EQU file (
		for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%~3"') do (
			set _ATTF_buffer=%%b
			setlocal enabledelayedexpansion
			>>%_ATTF_OutputFilename% echo !_ATTF_buffer!
			endlocal
		)
	) ELSE IF %_ATTF_LineText_type% EQU folder (
	) ELSE IF %_ATTF_LineText_type% EQU empty (
	)
Call :ClearVariablesByPrefix %_AppendTextToFile_prefix% _AppendTextToFile
GoTo :EOF

::Usage Call :AppendTextToFileBeginning InputFilename OutputFilename LineNumber LineText
:AppendTextToFileBeginning
Call :InsertTextAtLineNumber %1 %2 0 %4
GoTo :EOF


:InsertMultipleTextAtMultipleLineNumber
set "_InsertMultipleTextAtMultipleLineNumber_prefix=_IMTAMLN"
set "_IMTAMLN_InputFilename=%~1" & set "_IMTAMLN_OutputFilename=%~2"
:InsertMultipleTextAtMultipleLineNumber-endsetup
Call :InsertTextAtLineNumber "%_IMTAMLN_InputFilename%" "%_IMTAMLN_OutputFilename%" %3 %4
if not "[%~6]"=="[]" shift & shift & GoTo :InsertMultipleTextAtMultipleLineNumber-endsetup 
Call :ClearVariablesByPrefix %_InsertMultipleTextAtMultipleLineNumber_prefix% _InsertMultipleTextAtMultipleLineNumber 
GoTo :EOF

::Usage Call :InsertTextAtLineNumber InputFilename OutputFilename LineNumber LineText
:InsertTextAtLineNumber
set "_InsertTextAtLineNumber_prefix=_ITALN"
Call :SetIfNotDefined "%~1" _ITALN_InputFilename "%~2" _ITALN_OutputFilename "%~3" _ITALN_LineNumber  
set _ITALN_LineText=%~4
REM this might work better as a macro
if defined %4 ( set "_ITALN_LineText_type=variable" & GoTo :InsertTextAtLineNumber-array-check-end )
if defined %4.ubound ( set "_ITALN_LineText_type=array" & GoTo :InsertTextAtLineNumber-array-check-end )
for /f "tokens=1* delims=l=" %%a in ('set %4[ 2^>^&1') do ( if "[%%a]" NEQ "[Environment variab]" ( set "_ITALN_LineText_type=array" ) & GoTo :InsertTextAtLineNumber-array-check-end )
set _ITALN_LineText_attr=%~a4f
if /I "[%_ITALN_LineText_attr:~0,1%]"=="[d]" ( set "_ITALN_LineText_type=folder" & GoTo :InsertTextAtLineNumber-array-check-end )
if exist %4 ( set "_ITALN_LineText_type=file" & GoTo :InsertTextAtLineNumber-array-check-end )
if "[%~4]" EQU "[]" ( set "_ITALN_LineText_type=empty" ) else ( set "_ITALN_LineText_type=text" )
:InsertTextAtLineNumber-array-check-end
IF %_ITALN_LineText_type% EQU array (
	call set "_ITALN_LineText_lbound=%%%~4.lbound%%"
	if "[%_ITALN_LineText_lbound%]" EQU "[]" set "_ITALN_LineText_lbound=0"
	call set "_ITALN_LineText_ubound=%%%~4.ubound%%"
	if "[%_ITALN_LineText_ubound%]" EQU "[]" Call :ubound %~4
	if "[%_ITALN_LineText_ubound%]" EQU "[]" call set "_ITALN_LineText_ubound=%%%~4.ubound%%"
	)
set /a "_ITALN_LineCount=0"
set /a "_ITALN_LineNumber-=1"
setlocal enabledelayedexpansion
for /f "delims=" %%a in (%_ITALN_InputFilename%) do (
		if %_ITALN_LineNumber% EQU !_ITALN_LineCount! GoTo :InsertTextAtLineNumber-for-skip
		set /a "_ITALN_LineCount+=1"
		setlocal DisableDelayedExpansion
		set _ITALN_buffer=%%a
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !_ITALN_buffer!
		endlocal & endlocal
)
:InsertTextAtLineNumber-for-skip
endlocal
if %_ITALN_LineText_type% EQU text (
	REM echo is text, append text to file
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !_ITALN_LineText!
		endlocal
	) ELSE IF %_ITALN_LineText_type% EQU variable (
	REM echo is variable, append variable content to 
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !%~4!
		endlocal
	) ELSE IF %_ITALN_LineText_type% EQU array (
	REM echo is array, append each array element to file from lbound or 0 to ubound
		setlocal enabledelayedexpansion
		FOR /L %%a IN (!_ITALN_LineText_lbound!,1,!_ITALN_LineText_ubound!) DO >>%_ITALN_OutputFilename% echo !%~4[%%a]!
		endlocal
	) ELSE IF %_ITALN_LineText_type% EQU file (
	REM echo if file, append content of file 
		for /f "delims=" %%a in (%~4) do (
			set _ITALN_buffer=%%a
			setlocal enabledelayedexpansion
			>>%_ITALN_OutputFilename% echo !_ITALN_buffer!
			endlocal
		)
	) ELSE IF %_ITALN_LineText_type% EQU folder (
		REM echo is folder, do nothing
	) ELSE IF %_ITALN_LineText_type% EQU empty (
		REM echo is empty, do nothing
	)
if %_ITALN_LineNumber% GTR 0 set "_ITALN_skip=skip=%_ITALN_LineNumber%" 
for /f "%_ITALN_skip% delims=" %%a in (%_ITALN_InputFilename%) do (
		set _ITALN_buffer=%%a
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !_ITALN_buffer!
		endlocal
)
Call :ClearVariablesByPrefix %_InsertTextAtLineNumber_prefix% _InsertTextAtLineNumber
GoTo :EOF

:FindAllEmptyLines-DEMO


REM del FindAllEmptyLines-DEMO.txt 2>nul
if not exist FindAllEmptyLines.txt Call :RunMultipleTimes 15 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>FindAllEmptyLines.txt"

Call :FindAllEmptyLines "FindAllEmptyLines.txt" EmptyLinesArray

GoTo :EOF

::Usage Call :FindAllEmptyLines Filename EmptyLinesArray
:FindAllEmptyLines

for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%~1"') do ( if "[%%b]" EQU "[]" echo line %%a is empty )

GoTo :EOF

:FindAllLabels-DEMO

Call :FindAllLabels "FindAllEmptyLines.txt" LabelsArray


GoTo :EOF

::Usage Call :FindAllLabels Filename LabelsArray
:FindAllLabels
setlocal enabledelayedexpansion
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%~1"') do ( 
	Call :IsLabel _FindAllLabels_IsLabel "%%b"
	if "[!_FindAllLabels_IsLabel!]" NEQ "[]"  echo line number :%%a was a label , labelname !_FindAllLabels_IsLabel! , EL %errorlevel% , text was %%b
	)
endlocal
REM for each line of text
REM loop through each char 
REM if it's not space tab or semicolon, this is not a label
REM maybe use delim=: ?
REM once semicolon, continue until space or tab or end of line is found, this is the label
GoTo :EOF


:IsLabel-DEMO

echo. 
set _IsLabel-DEMO=My test line
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=:YesALabel
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=   :LabelWithSpaceInFront
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=  	  :LabelWithSpaceAndTabs
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=::This is a comment
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=if blabla EQU notthat do nothing
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="


GoTo :EOF

::Usage Call :IsLabel Output Input
:IsLabel
setlocal enabledelayedexpansion
set "TAB=	"
set "_IsLabel_Output=%~1"
set _IsLabel_Input=%~2
set /a "_IsLabel_index=0"
REM set _islabel
:IsLabel-loop
set "_IsLabel_char=!_IsLabel_Input:~%_IsLabel_index%,1!
REM echo current char is i!_IsLabel_char!i name %_IsLabel_labelname%
if "[!_IsLabel_char!]" EQU "[]" GoTo :IsLabel-end
if "[!_IsLabel_char!]" EQU "[%TAB%]" ( if "[%_IsLabel_result%]" NEQ "[true]" ( set /a "_IsLabel_index+=1" & GoTo :IsLabel-loop ) else ( GoTo :IsLabel-end ) )
if "[!_IsLabel_char!]" EQU "[ ]" ( if "[%_IsLabel_result%]" NEQ "[true]" ( set /a "_IsLabel_index+=1" & GoTo :IsLabel-loop ) else ( GoTo :IsLabel-end ) )
if "[!_IsLabel_char!]" EQU "[:]" ( if "[%_IsLabel_result%]" NEQ "[true]" ( set /a "_IsLabel_index+=1" & set "_IsLabel_result=true" & GoTo :IsLabel-loop ) else ( GoTo :IsLabel-end ) )
if "[%_IsLabel_result%]" EQU "[true]" ( set /a "_IsLabel_index+=1" & set "_IsLabel_labelname=%_IsLabel_labelname%!_IsLabel_char!" & GoTo :IsLabel-loop )
REM echo ending loop  current char is !_IsLabel_char! name %_IsLabel_labelname% islabel %_IsLabel_result%
:IsLabel-end
if "[%_IsLabel_labelname%]" NEQ "[]" ( set "_IsLabel_result=0" ) else ( set "_IsLabel_result=1" )
echo result %_IsLabel_result% name %_IsLabel_labelname%
endlocal & set "%_IsLabel_Output%=%_IsLabel_labelname%" & exit /b %_IsLabel_result%

:AppendToArray

:AddLabelToList
:AddEmptyLineToList
:AddFunctionEndToList
:AddFunctionCallToList
:AddGoToToList

REM for reference only
REM ::Usage Call :ltrim OutputVariable Input
REM :ltrim
REM setlocal enabledelayedexpansion
REM set "TAB=	"
REM set "_ltrim_output=%~1"
REM set "_ltrim_input=%~2"
REM if defined %~2 ( set "_ltrim_input=!%~2!" ) 
REM set /a "_ltrim_index=0"
REM :ltrim-loop
REM set "_ltrim_char=!_ltrim_input:~%_ltrim_index%,1!
REM if "[!_ltrim_char!]" EQU "[%TAB%]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
REM if "[!_ltrim_char!]" EQU "[ ]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
REM set _ltrim_intermediate=!_ltrim_input:~%_ltrim_index%!
REM endlocal & set %_ltrim_output%=%_ltrim_intermediate%
REM GoTo :EOF


::Usage Call :FindBatchFunctions Filename FunctionArray
:FindBatchFunctions

::Usage Call :FindBatchFunctionDependency Filename DependencyString
:FindBatchFunctionDependency

:GetLongestLine

::Usage Call :GetLineCount Filename optional LineCount
:GetLineCount
set "_GetLineCount_prefix=_GLC"
Call :SetIfNotDefined "%~1" _GLC_Filename "%~2" _GLC_OutputLineCount
set /a "_GLC_LineCount=0"
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLC_Filename%"') do ( set /a "_GLC_LineCount+=1" )
if "[%_GLC_OutputLineCount%]" NEQ "[]" set /a "%_GLC_OutputLineCount%=%_GLC_LineCount%"
Call :ClearVariablesByPrefix %_GetLineCount_prefix% _GetLineCount & exit /b %_GLC_LineCount% 

REM returns erroneous values ?!?!
::Usage Call :GetLineLenght Filename RowNumber Lenght
REM :GetLineLenghtalt
REM set "_GetLineLenght_prefix=_GLL"
REM Call :SetIfNotDefined "%~1" _GLL_Filename "%~2" _GLL_LineNumber  "%~3" _GLL_OutputLineLenght
REM set /a "_GLL_LineNumber-=1"
REM if %_GLL_LineNumber% GTR 0 set "_GLL_skip=skip=%_GLL_LineNumber%" 
REM for /f "%_GLL_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLL_Filename%"') do (
REM for /f "%_GLL_skip% delims=" %%a in (%_GLL_Filename%) do (
		REM set _GLL_buffer=%%a
		REM GoTo :GetLineLenght-endalt
REM )
REM :GetLineLenght-endalt
REM Call :len _GLL_buffer_len _GLL_buffer
REM set %_GLL_OutputLineLenght%=%_GLL_buffer_len%
REM Call :ClearVariablesByPrefix %_GetLineLenght_prefix% _GetLineLenght & exit /b %_GLL_buffer_len% 

REM this version can't handle empty lines
REM returns erroneous values ?!?!
::Usage Call :GetLineLenght Filename RowNumber Lenght
:GetLineLenght
set "_GetLineLenght_prefix=_GLL"
Call :SetIfNotDefined "%~1" _GLL_Filename "%~2" _GLL_LineNumber  "%~3" _GLL_OutputLineLenght
set /a "_GLL_LineNumber-=1"
if %_GLL_LineNumber% GTR 0 set "_GLL_skip=skip=%_GLL_LineNumber%" 
for /f "%_GLL_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLL_Filename%"') do (
		set _GLL_buffer=%%b
		GoTo :GetLineLenght-end
)
:GetLineLenght-end
Call :len _GLL_buffer_len _GLL_buffer
set %_GLL_OutputLineLenght%=%_GLL_buffer_len%
Call :ClearVariablesByPrefix %_GetLineLenght_prefix% _GetLineLenght & exit /b %_GLL_buffer_len% 

::Usage Call :ReadLineRange Filename StartLine StopLine LineArray
:ReadLineRange
set "_ReadLineRange_prefix=_RLR"
Call :SetIfNotDefined "%~1" _RLR_Filename "%~2" _RLR_StartLine "%~3" _RLR_StopLine "%~4" _RLR_OutputLineArray "%%%~4.ubound%%" _RLR_OutputLineArray.ubound
if "[%_RLR_OutputLineArray.ubound%]" EQU "[]" set "_RLR_OutputArrayWasEmpty=true"
Call :SetIfNotDefined -1 _RLR_OutputLineArray.ubound
set /a "_RLR_endbound=%_RLR_OutputLineArray.ubound%+%_RLR_StopLine%-%_RLR_StartLine%"
set /a "_RLR_StartLine-=1"
:ReadLineRange-loop
set /a "_RLR_OutputLineArray.ubound+=1"
if %_RLR_StartLine% GTR 0 set "_RLR_skip=skip=%_RLR_StartLine%" 
for /f "%_RLR_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_RLR_Filename%"') do (
		set %_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]=%%b
		GoTo :ReadLineRange-end
)
set /a "_RLR_OutputLineArray.ubound-=1"
:ReadLineRange-end
set /a "_RLR_StartLine+=1"
if %_RLR_OutputLineArray.ubound% LEQ %_RLR_endbound% GoTo :ReadLineRange-loop
set /a "%_RLR_OutputLineArray%.ubound=%_RLR_OutputLineArray.ubound%"
if "[%_RLR_OutputArrayWasEmpty%]" EQU "[true]" if "[%_RLR_OutputLineArray.ubound%]" EQU "[-1]" set "%_RLR_OutputLineArray%.ubound="
Call :ClearVariablesByPrefix %_ReadLineRange_prefix% _ReadLineRange
GoTo :EOF

REM ::Usage Call :ReadLineRange Filename StartLine StopLine LineArray
REM :ReadLineRange
REM set "_ReadLineRange_prefix=_RLR"
REM Call :SetIfNotDefined "%~1" _RLR_Filename "%~2" _RLR_StartLine "%~3" _RLR_StopLine "%~4" _RLR_OutputLineArray "%%%~4.ubound%%" _RLR_OutputLineArray.ubound
REM Call :SetIfNotDefined -1 _RLR_OutputLineArray.ubound
REM set /a "_RLR_count=%_RLR_StopLine%-%_RLR_StartLine%"
REM set /a "_RLR_endbound=%_RLR_OutputLineArray.ubound%+%_RLR_count%"
REM set _RLR
REM set _RLR_NextOutputValue=%_RLR_OutputLineArray%[-999]
REM if %_RLR_StartLine% GTR 0 set "_RLR_skip=skip=%_RLR_StartLine%" 
REM for /f "%_RLR_skip% delims=" %%a in (%_RLR_Filename%) do (
REM		echo found row test %%a
REM		REM set /a "_RLR_OutputLineArray.ubound+=1"
REM		call set /a "_RLR_OutputLineArray.ubound+=1"
REM		echo set _RLR_NextOutputValue=%_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]
REM		REM set _RLR_NextOutputValue=%_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]
REM		call set _RLR_NextOutputValue=%_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]
REM		echo _RLR_NextOutputValue %_RLR_NextOutputValue%
REM		call echo _RLR_NextOutputValue %_RLR_NextOutputValue%
REM		REM set %_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]=%%a
REM		set %_RLR_NextOutputValue%=%%a
REM )
REM		if %_RLR_OutputLineArray.ubound% GEQ %_RLR_endbound% GoTo :ReadLineRange-end
REM :ReadLineRange-end
REM REM set /a "%_RLR_OutputLineArray%.ubound=%_RLR_OutputLineArray.ubound%"
REM GoTo :EOF

::Usage Call :ReadMultiLine Filename ArrayOfLineNumbers OutputArray 
:ReadMultiLine
set "_ReadMultiLine_prefix=_RML"
Call :SetIfNotDefined "%~1" _RML_Filename "%~2" _RML_LineNumberArray "%%%~2.lbound%%" _RML_LineNumberArray_index "%%%~2.ubound%%" _RML_LineNumberArray.ubound "%~3" _RML_OutputArray "%%%~3.ubound%%" _RML_OutputArray.ubound
Call :SetIfNotDefined 0 _RML_LineNumberArray_index -1 _RML_OutputArray.ubound
:ReadMultiLine-loop
set /a "_RML_OutputArray.ubound+=1"
Call :Readline "%_RML_Filename%" %%%_RML_LineNumberArray%[%_RML_LineNumberArray_index%]%% %_RML_OutputArray%[%_RML_OutputArray.ubound%]
set /a "_RML_LineNumberArray_index+=1"
if %_RML_LineNumberArray_index% LEQ %_RML_LineNumberArray.ubound% GoTo :ReadMultiLine-loop
set /a "%~2.ubound=%_RML_LineNumberArray.ubound%"
Call :ClearVariablesByPrefix %_ReadMultiLine_prefix% _ReadMultiLine
GoTo :EOF


::Usage Call :Readline Filename LineNumber OutputVariable
:Readline
Call :SetIfNotDefined "%~1" _Readline_Filename "%~2" _Readline_LineNumber "%~3" _Readline_Output 0 _Readline_Index
set /a "_Readline_LineNumber-=1"
set "%_Readline_Output%="
if %_Readline_LineNumber% GTR 0 set "_ReadLine_skip=skip=%_Readline_LineNumber%" 
for /f "%_ReadLine_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_Readline_Filename%"') do (
		set %_Readline_Output%=%%b
		REM set %_Readline_Output%=%%b
		GoTo :Readline-end
)
:Readline-end
Call :ClearVariablesByPrefix _Readline
GoTo :EOF

REM ::This old version can't return empty lines
REM ::Usage Call :Readline Filename LineNumber OutputVariable
REM :Readline
REM Call :SetIfNotDefined "%~1" _Readline_Filename "%~2" _Readline_LineNumber "%~3" _Readline_Output 0 _Readline_Index
REM set /a "_Readline_LineNumber-=1"
REM if %_Readline_LineNumber% GTR 0 set "_ReadLine_skip=skip=%_Readline_LineNumber%" 
REM for /f "%_ReadLine_skip% delims=" %%a in (%_Readline_Filename%) do (
		REM set "%_Readline_Output%=%%a"
		REM REM set %_Readline_Output%=%%a
		REM GoTo :Readline-end
REM )
REM :Readline-end
REM Call :ClearVariablesByPrefix _Readline
REM GoTo :EOF


REM https://www.google.com/search?channel=fs&client=ubuntu-sn&q=batch+file+loop+every+line+including+empty+line+of+file
REM https://www.google.com/search?q=batch+file+loop+every+line+including+empty+line+of+file+site:stackoverflow.com&client=ubuntu-sn&hs=50g&channel=fs&sa=X&ved=2ahUKEwiIiJev-s6AAxU9q4kEHZWjAO8QrQIoBHoECBcQBQ
REM https://stackoverflow.com/questions/55524695/batch-replace-line-in-text-file-using-for-loop-including-blank-lines
REM https://stackoverflow.com/questions/56262152/cmd-script-reading-from-file-and-writing-to-file-loses-empty-line
REM https://stackoverflow.com/questions/66719775/how-do-i-read-a-text-file-including-empty-lines-in-batch
REM https://stackoverflow.com/questions/47067655/not-skipping-empty-lines-in-batch-file
REM https://stackoverflow.com/questions/31315629/why-does-for-f-not-ignore-blank-lines
REM https://stackoverflow.com/questions/75811626/read-txt-file-line-by-line-using-batch-including-lines-that-start-with-a-semico
REM https://stackoverflow.com/questions/21933942/keeping-blank-lines-intact-when-reading-from-one-file-to-another
REM https://stackoverflow.com/questions/38723595/preserve-empty-lines-in-a-text-file-while-using-batch-for-f
REM https://stackoverflow.com/questions/23075953/batch-script-to-find-and-replace-a-string-in-text-file-without-creating-an-extra/23076141#23076141
REM https://stackoverflow.com/questions/155932/how-do-you-loop-through-each-line-in-a-text-file-using-a-windows-batch-file
REM https://stackoverflow.com/questions/31314203/windows-batch-how-to-keep-empty-lines-with-loop-for-f


REM ::Usage Call :Printline Filename LineNumber 
:Printline
Call :SetIfNotDefined "%~1" _Printline_Filename "%~2" _Printline_LineNumber 0 _Printline_Index
set /a "_Printline_LineNumber-=1"
if %_Printline_LineNumber% GTR 0 set "_Printline_skip=skip=%_Printline_LineNumber%" 
for /f "%_Printline_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_Printline_Filename%"') do (
	echo %%b
	GoTo :Printline-end
)
:Printline-end
Call :ClearVariablesByPrefix _Printline
GoTo :EOF

REM ::This old version can't print empty lines
REM ::Usage Call :Printline Filename LineNumber 
REM :Printline
REM Call :SetIfNotDefined "%~1" _Printline_Filename "%~2" _Printline_LineNumber 0 _Printline_Index
REM set /a "_Printline_LineNumber-=1"
REM if %_Printline_LineNumber% GTR 0 set "_Printline_skip=skip=%_Printline_LineNumber%" 
REM for /f "%_Printline_skip% delims=" %%a in (%_Printline_Filename%) do (
    REM echo %%a
	REM GoTo :Printline-end
REM )
REM :Printline-end
REM Call :ClearVariablesByPrefix _Printline
REM GoTo :EOF


::Usage Call :CopyArray InputArray OutputArray
:CopyArray
Call :SetIfNotDefined "%~1" _CopyArray_InputArray "%~2" _CopyArray_OutputArray
Call :SetIfNotDefined "%%%~1.lbound%%" _CopyArray_InputArray.lbound "%%%~1.ubound%%" _CopyArray_InputArray.ubound "%%%~2.lbound%%" _CopyArray_OutputArray
Call :SetIfNotDefined 0 _CopyArray_InputArray.lbound 0 _CopyArray_OutputArray.lbound
set /a "_CopyArray_InputArray_index=%_CopyArray_InputArray.lbound%"
set /a "_CopyArray_OutputArray_index=%_CopyArray_OutputArray.lbound%"
setlocal enabledelayedexpansion
set _CopyArray_localscope=true
:CopyArray-loop
set "%_CopyArray_OutputString%[%_CopyArray_OutputArray_index%]=!%_CopyArray_InputArray%[%_CopyArray_InputArray_index%]!
set /a "_CopyArray_InputArray_index+=1" & set /a "_CopyArray_OutputArray_index+=1"
if %_CopyArray_InputArray_index% LEQ %_CopyArray_InputArray.ubound% GoTo :CopyArray-loop
for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( 
	endlocal & set %%a 
	)
if defined _CopyArray_localscope endlocal

GoTo :EOF


::Usage Call :ArrayToString InputArray OutputString optional DelimiterChar
:ArrayToString
set "_ArrayToString_prefix=_ATS"
Call :SetIfNotDefined "%~1" _ATS_InputArray "%~2" _ATS_OutputString 0 _ATS_index "%%%~1.ubound%%" _ATS_ubound "%~3" _ATS_delimiter
REM Call :SetIfNotDefined " " _ATS_delimiter
setlocal enabledelayedexpansion
:ArrayToString-loop
set _ATS_intermediate=!_ATS_intermediate!!%_ATS_InputArray%[%_ATS_index%]!!_ATS_delimiter!
set /a "_ATS_index+=1"
if %_ATS_index% LEQ %_ATS_ubound% GoTo :ArrayToString-loop
REM Call :AddEscapeCharacters _ATS_intermediate
endlocal & set %_ATS_OutputString%=%_ATS_intermediate%
Call :ClearVariablesByPrefix %_ArrayToString_prefix% _ArrayToString
GoTo :EOF

::Usage Call :RemoveLeadingZeros InputVariable optional OutputVariable
:RemoveLeadingZeros
set "_RemoveLeadingZeros_prefix=_RLZ"
Call :SetIfNotDefined "%~1" _RLZ_InputVariable "%~2" _RLZ_OutputVariable
Call :SetIfNotDefined "%_RLZ_InputVariable%" _RLZ_OutputVariable
setlocal enabledelayedexpansion
set "_RLZ_string=%_RLZ_InputVariable%"
set /a "_RLZ_number=!_RLZ_string!"
endlocal & set "%_RLZ_OutputVariable%=%_RLZ_number%"
Call :ClearVariablesByPrefix %_RemoveLeadingZeros_prefix% _RemoveLeadingZeros
GoTo :EOF

::Usage Call :NumberStringToArray StringOfNumbers OutputArray SortOrder
:NumberStringToArray
set "_NumberStringToArray_prefix=_NSTA"
Call :SetIfNotDefined "%~1" _NSTA_StringOfNumbers "%~2" _NSTA_ArrayOfNumber "%~3" _NSTA_SortOrder 0 _NSTA_Index
setlocal enabledelayedexpansion
set _NSTA_localscope=true & set _NSTA_Index=%_NSTA_Index%
for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )
set /a "%_NSTA_ArrayOfNumber%.lbound=0" & set /a "%_NSTA_ArrayOfNumber%.ubound=!_NSTA_Index!-1"
for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( endlocal & set "%%a" )
if defined _NSTA_localscope endlocal
Call :ClearVariablesByPrefix "%_NumberStringToArray_prefix%" _NumberStringToArray
GoTo :EOF

::Usage Call :SortNumberArray InputArray SortOrder
:SortNumberArray
set "_SortNumberArray_prefix=_SNA"
Call :SetIfNotDefined "%~1" _SNA_InputArray "%~2" _SNA_SortOrder 0 _SNA_InputArray.index 1 _SNA_nextindex 0 _SNA_InputArray.index2
if "[%_SNA_SortOrder%]"=="[DESCENDING]" ( set "_SNA_SortOrder=lss" ) else ( set "_SNA_SortOrder=gtr" )
call set "_SNA_InputArray.ubound=%%%_SNA_InputArray%.ubound%%
:SortNumberArray-loop
call set _SNA_current=%%%_SNA_InputArray%[%_SNA_InputArray.index%]%%
call set _SNA_next=%%%_SNA_InputArray%[%_SNA_nextindex%]%%
if %_SNA_current% %_SNA_SortOrder% %_SNA_next% ( set "%_SNA_InputArray%[%_SNA_InputArray.index%]=%_SNA_next%" & set "%_SNA_InputArray%[%_SNA_nextindex%]=%_SNA_current%" )
set /a "_SNA_InputArray.index+=1" & set /a "_SNA_nextindex+=1"
if %_SNA_InputArray.index% LSS %_SNA_InputArray.ubound% GoTo :SortNumberArray-loop
set /a "_SNA_InputArray.index=0" & set /a "_SNA_nextindex=1" & set /a "_SNA_InputArray.index2+=1"
if %_SNA_InputArray.index2% LEQ %_SNA_InputArray.ubound% GoTo :SortNumberArray-loop
Call :ClearVariablesByPrefix "%_SortNumberArray_prefix%" _SNA
GoTo :EOF

:IsDelayedExpansionEnabled
if "[!DelayedExpansion!]"=="[]" ( exit /b 0 ) else ( exit /b 1 )


::Usage Call :PrintCharMap FULLRANGE
:PrintCharMap
set /a "_PrintCharMap_index=32" & set /a "_PrintCharMap_count=126"
if "[%~1]"=="[FULLRANGE]" set /a "_PrintCharMap_index=0" & set /a "_PrintCharMap_count=255"
:PrintCharMap-loop
cmd /c exit %_PrintCharMap_index%
setlocal enabledelayedexpansion
echo %_PrintCharMap_index% !=exitcodeascii!
endlocal
set /a "_PrintCharMap_index+=1"
if %_PrintCharMap_index% LEQ %_PrintCharMap_count% GoTo :PrintCharMap-loop
GoTo :EOF

::Usage Call :rnd Output optional Min optional Max
:: returns 0-100, based on tenth of a second of %time%
:: Unless optional min / max are specified
:rnd
if "[%~2]"=="[]" ( set /a "_rnd_min=0" ) else ( set /a "_rnd_min=%~2" )
if "[%~3]"=="[]" ( set /a "_rnd_max=100" ) else ( set /a "_rnd_max=%~3" )
set /a _rnd=%RANDOM% * (%_rnd_max% - %_rnd_min% + 1) / 32768 + %_rnd_min%
if "[%~1]" NEQ "[]" set %~1=%_rnd%
exit /b %_rnd% & Call :ClearVariablesByPrefix _rnd

:CoinFlip
set /a _CoinFlip=%RANDOM% * (1 - 0 + 1) / 32768 + 0
if "[%~1]" NEQ "[]" if "[%_CoinFlip%]" EQU 0 ( set "%~1=heads" ) else ( set "%~1=tails" )
exit /b %_CoinFlip% & set "_CoinFlip="

::Usage Call :GetArrayPrefix InputArray OutputPrefixList
:GetArrayPrefix

:: This function is very very old and sucks now, TODO REWRITE
:: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
:: Example set EchoArrayPrefix=InputArray[%%index%%]=
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "len=%%%~1.len%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
if not ["%len%"]==[""] call echo %~1.len %%%~1.len%%
if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop


rem for each argument, check if variable, check if array
::Usage Call :EchoArguments Argument1 Argument2 ArgumentN
:EchoArguments
if "[%_EchoArguments.index%]"=="[]" set /a "_EchoArguments.index=1"
echo Argument                        #%_EchoArguments.index% ^|"%1"^| unquoted ^|"%~1"^|
echo Argument                        #%_EchoArguments.index% ^|%1^| unquoted ^|%~1^|
setlocal enabledelayedexpansion
echo Argument with delayed expansion #!_EchoArguments.index! ^|"%1"^| unquoted ^|"%~1"^|
echo Argument with delayed expansion #!_EchoArguments.index! ^|%1^| unquoted ^|%~1^|
endlocal
set /a "_EchoArguments.index+=1"
shift
setlocal enabledelayedexpansion
if "[%~1]" NEQ "[]" ( set "_EchoArguments_argument_remaining=true" ) else ( set "_EchoArguments_argument_remaining=false" ) 
echo.
endlocal & if "[%_EchoArguments_argument_remaining%]"=="[true]" GoTo :EchoArguments
Call :ClearVariablesByPrefix _EchoArguments
GoTo :EOF

::Usage Call :lenByRef OutputResult %VariableName%
rem doesn't work ?
:lenByVal
setlocal enabledelayedexpansion
set _len=%~2
GoTo :len
::Usage Call :len OutputResult VariableName
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
:len
(   
    setlocal EnableDelayedExpansion
    (set^ _ln=!%~2!)
    if defined _ln (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!_ln:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "_ln=!_ln:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b %len%
)
rem find stackoverflow link for this
rem return value should equal len
rem lenbyval should work

REM escape delimiters , reject delimiters
REM separate count for escaped and included characters
::Usage Call :GetRandomString CharacterCount OutputString USESPECIALCHARS DONTESCAPE FULLRANGE
:GetRandomString
set "_GetRandomString_prefix=_GSR"
Call :SetIfNotDefined "%~1" _GSR_count "%~2" _GSR_output
set "_GSR_space_genlist=32 "
set "_GSR_exclamation_genlist=33 "
set "_GSR_quotes_genlist=34 "
set "_GSR_percent_genlist=37 "
set "_GSR_special_genlist=38 60 62 94 124 "
set "_GSR_delimiter_genlist=44 59 61 "
set "_GSR_special_esclist=38 60 62 94 124 "
set "_GSR_delimiter_esclist=44 59 61 "
set "_GSR_special_escape_char=^^^"
set "_GSR_quotes_escape_char=^^^"
set "_GSR_percent_escape_char=%%%%"
set "_GSR_exclamation_escape_char=^^^"
set "_GSR_bracket_escape_char=^^^"
set "_GSR_delimiter_escape_char=^^^"
set "_GSR_extdelimiter_escape_char=^^^"
set "_GSR_special_esccharcount=3"
set "_GSR_space_esccharcount=3"
set "_GSR_quote_esccharcount=3"
set "_GSR_exclamation_esccharcount=3"
set "_GSR_percent_esccharcount=3"
set "_GSR_bracket_esccharcount=0"
set "_GSR_delimiter_esccharcount=3"
set "_GSR_extdelimiter_esccharcount=0"
:GetRandomString-arguments
if "[%~3]" EQU "[NOLEN]" set "_GSR_nolen=true"
if "[%~3]" EQU "[USEALLCHARS]" set "_GSR_useallchar=true"
if "[%~3]" EQU "[NUMERICONLY]" set "_GSR_numeric=true"
if "[%~3]" EQU "[DONTESCAPE]" set "_GSR_dontescape=true"
if "[%~3]" EQU "[FULLRANGE]" set "_GSR_fullrange=true"
if "[%~3]" EQU "[USESPECIALCHARS]" set "_GSR_special_genlist="
if "[%~3]" EQU "[USESPACE]" set "_GSR_space_genlist="
if "[%~3]" EQU "[USEEXCLAMATION]" set "_GSR_exclamation_genlist="
if "[%~3]" EQU "[USEQUOTES]" set "_GSR_quotes_genlist="
if "[%~3]" EQU "[USEPERCENT]" set "_GSR_percent_genlist="
if "[%~3]" EQU "[NOBRACKETS]" set "_GSR_bracket_genlist=40 41 91 93 123 125 "
if "[%~3]" EQU "[USEDELIMITERS]" set "_GSR_delimiter_genlist="
if "[%~3]" EQU "[NOEXTDELIMITERS]" set "_GSR_extdelimiter_genlist=39 43 64 96 126 "
if "[%~3]" EQU "[ESCNOTSPECIAL]" ( set "_GSR_special_escape_char=^" & set "_GSR_special_esccharcount=1" )
if "[%~3]" EQU "[ESCNOTSPACE]" ( set "_GSR_space_escape_char=" & set "_GSR_space_esccharcount=0" )
if "[%~3]" EQU "[ESCNOTPERCENT]" ( set "_GSR_percent_escape_char=%%" & set "_GSR_percent_esccharcount=1" )
if "[%~3]" EQU "[ESCNOTEXCLAMATION]" ( set "_GSR_exclamation_escape_char=" & set "_GSR_exclamation_esccharcount=0" )
if "[%~3]" EQU "[ESCNOTQUOTES]" ( set "_GSR_quotes_escape_char=^" & set "_GSR_quote_esccharcount=1" )
if "[%~3]" EQU "[ESCBRACKETS]" ( set "_GSR_bracket_esclist=40 41 91 93 123 125 " & set "_GSR_bracket_esccharcount=3" )
if "[%~3]" EQU "[ESCNOTDELIMITERS]" ( set "_GSR_delimiter_esclist=" & set "_GSR_delimiter_esccharcount=0" )
if "[%~3]" EQU "[ESCEXTDELIMITERS]" ( set "_GSR_extdelimiter_esclist=39 43 64 96 126 " & set "_GSR_extdelimiter_esccharcount=3" )
if "[%~3]" EQU "[ESCNOTLASTDIGIT]" ( set "_GSR_escnot_lastdigit=true" )
if "[%~4]" NEQ "[]" ( shift & GoTo :GetRandomString-arguments )
if "[%_GSR_useallchar%]" NEQ "[true]" set "_GSR_genlist=%_GSR_special_genlist%%_GSR_exclamation_genlist%%_GSR_space_genlist%%_GSR_quotes_genlist%%_GSR_percent_genlist%%_GSR_delimiter_genlist%%_GSR_bracket_genlist%%_GSR_extdelimiter_esclist%"
if "[%_GSR_numeric%]" EQU "[true]" set "_GSR_genlist=32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126" 
if "[%_GSR_dontescape%]"=="[true]" ( set "_GSR_special_esccharcount=0" & set "_GSR_quote_esccharcount=0" & set "_GSR_exclamation_esccharcount=0" & set "_GSR_percent_esccharcount=0" & set "_GSR_delimiter_esccharcount=0" & set "_GSR_special_escape_char=^" & set "_GSR_quotes_escape_char=^" & set "_GSR_percent_escape_char=%%" & set "_GSR_exclamation_escape_char=" & set "_GSR_delimiter_esclist=" & set "_GSR_delimiter_escape_char=^" )
if "[%_GSR_fullrange%]"=="[true]" ( set "_GSR_random_min=0" & set "_GSR_random_max=255" ) else ( set "_GSR_random_min=32" & set "_GSR_random_max=126" )
set /a "_GSR_index=0" & set /a "_GSR_regular_charcount=0" & set /a "_GSR_escapecount=0"
setlocal enabledelayedexpansion
:GetRandomString-loop
set "_GSR_escape_char=" & set "_GSR_escape_charcount=0" & set "_GSR_fillerchar="
set /a "_GSR_next_ascii=%RANDOM% * (%_GSR_random_max% - %_GSR_random_min% + 1) / 32768 + %_GSR_random_min%"
for %%a in (!_GSR_genlist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" GoTo :GetRandomString-loop )
for %%a in (!_GSR_special_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_special_escape_char%" & set "_GSR_escape_charcount=!_GSR_special_esccharcount!" ) )
for %%a in (!_GSR_bracket_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_bracket_escape_char%" & set "_GSR_escape_charcount=!_GSR_bracket_esccharcount!" ) )
for %%a in (!_GSR_delimiter_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_delimiter_escape_char%" & set "_GSR_escape_charcount=!_GSR_delimiter_esccharcount!" ) )
for %%a in (!_GSR_extdelimiter_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_extdelimiter_escape_char%" & set "_GSR_escape_charcount=!_GSR_extdelimiter_esccharcount!" ) )
if "[!_GSR_next_ascii!]"=="[32]" ( set "_GSR_escape_char=%_GSR_space_escape_char%" & set "_GSR_escape_charcount=!_GSR_space_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[33]" ( set "_GSR_escape_char=%_GSR_exclamation_escape_char%" & set "_GSR_escape_charcount=!_GSR_exclamation_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[34]" ( set "_GSR_escape_char=%_GSR_quotes_escape_char%" & set "_GSR_escape_charcount=!_GSR_quote_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[37]" ( set "_GSR_escape_char=%_GSR_percent_escape%" & set "_GSR_escape_charcount=!_GSR_percent_esccharcount!" )
cmd /c exit !_GSR_next_ascii!
if "[!=exitcodeascii!]" EQU "[]" set "_GSR_fillerchar= "
set _GSR_intermediate=!_GSR_intermediate!!_GSR_escape_char!!=exitcodeascii!!_GSR_fillerchar!
set /a "_GSR_index+=1"
if "!_GSR_escape_char!" NEQ "" set /a "_GSR_escapecount+=!_GSR_escape_charcount!"
set /a "_GSR_total_char=!_GSR_index!+!_GSR_escapecount!"
if !_GSR_total_char! LSS 8030 if !_GSR_index! LSS !_GSR_count! GoTo :GetRandomString-loop
if "[%_GSR_dontescape%]" NEQ "[true]" if "[%_GSR_escnot_lastdigit%]" NEQ "[true]" for %%a in (0 1 2 3 4 5 6 7 8 9) do (if "[!_GSR_intermediate:~-1!]"=="[%%a]" ( set /a "_GSR_escapecount+=1" & set /a "_GSR_total_char+=1" & set _GSR_intermediate=!_GSR_intermediate:~,-1!^^%%a) )
if "[%debug%]"=="[true]" echo R  !_GSR_index!     !_GSR_intermediate!
if "[%debug%]"=="[true]" echo R  !_GSR_index!     !_GSR_intermediate!>>randomstring.txt
endlocal & set /a "%_GSR_output%.len=%_GSR_index%" & set /a "%_GSR_output%.lentotal=%_GSR_total_char%" & set /a "%_GSR_output%.lenesc=%_GSR_escapecount%/3" & set %_GSR_output%=%_GSR_intermediate%
REM endlocal & if "[%_GSR_nolen%]" NEQ "[true]" ( set /a "%_GSR_output%.len=%_GSR_index%" & set /a "%_GSR_output%.lentotal=%_GSR_total_char%" & set /a "%_GSR_output%.lenesc=%_GSR_escapecount%" ) & set %_GSR_output%=%_GSR_intermediate%
if "[%_GSR_nolen%]" EQU "[true]" set "%_GSR_output%.len=" & set "%_GSR_output%.lentotal=" & set "%_GSR_output%.lenesc="
Call :ClearVariablesByPrefix %_GetRandomString_prefix% _GetRandomString
goto :eof


:: Default configuration 
:: Will escape space, quotes, exclamation, percent, special characters (& < > ^ |) and delimiters ()
:: but not backets (( ) [ ] { }) or extra delimiters (' + ` ~ @)
::Usage Call :AddEscapeCharacters byref InputString optional OutputString
:AddEscapeCharacters
set "_AddEscapeCharacters_prefix=_AEC"
Call :SetIfNotDefined "%~1" _AEC_input "%~2" _AEC_output
Call :SetIfNotDefined "%_AEC_input%" _AEC_output
set "_AEC_special_esclist=^& ^< ^> ^^ ^|"
set "_AEC_delimiter_esclist1=^= ^; ^,"
set "_AEC_regular_escape_char=^^^"
set "_AEC_space_escape_char=^^^"
set "_AEC_quotes_escape_char=^^^"
set "_AEC_percent_escape_char=%%"
set "_AEC_exclamation_escape_char=^^^"
:AddEscapeCharacters-arguments
if "[%~3]" EQU "[NOLEN]" set "_AEC_nolen=true"
if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char=^"
REM if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char="
if "[%~3]" EQU "[NOTQUOTES]" set "_AEC_quotes_escape_char=^"
if "[%~3]" EQU "[NOTEXCLAMATION]" set "_AEC_exclamation_escape_char=^^"
if "[%~3]" EQU "[NOTPERCENT]" set "_AEC_percent_escape_char=%"
if "[%~3]" EQU "[NOTSPECIAL]" set "_AEC_special_esclist="
if "[%~3]" EQU "[BRACKETS]" set "_AEC_bracket_esclist=^( ^) ^[ ^] ^{ ^}"
if "[%~3]" EQU "[NOTDELIMITERS]" set "_AEC_delimiter_esclist="
if "[%~3]" EQU "[EXTDELIMITERS]" set "_AEC_extdelimiter_esclist=^' ^+ ^` ^~ ^@"
if "[%~3]" EQU "[NOTLASTDIGIT]" set "_AEC_notlastdigit=true"
if "[%~4]" NEQ "[]" ( shift & GoTo :AddEscapeCharacters-arguments )
set "_AEC_escape_list=%_AEC_special_esclist% %_AEC_bracket_esclist% %_AEC_delimiter_esclist% %_AEC_extdelimiter_esclist%"
set /a "_AEC_input.index=0" & set /a "_AEC_output.escapechars=0" & set /a "_AEC_output.totalchars=0"
setlocal enabledelayedexpansion
:AddEscapeCharacters-loop
set "_AEC_escapechar=" & set "_AEC_input_char=!%_AEC_input%:~%_AEC_input.index%,1!"
for %%a in ( %_AEC_escape_list% ) do ( if ^!_AEC_input_char!==%%a ( set "_AEC_escapechar=!_AEC_regular_escape_char!" ) )
if "!_AEC_input_char!"==" " set "_AEC_escapechar=!_AEC_space_escape_char!"
if "!_AEC_input_char!"==^"^"^" set "_AEC_escapechar=!_AEC_quotes_escape_char!"
if "!_AEC_input_char!"=="^!" set "_AEC_escapechar=!_AEC_exclamation_escape_char!"
if "!_AEC_input_char!"=="%%" set "_AEC_escapechar=!_AEC_percent_escape_char!"
set _AEC_intermediate=!_AEC_intermediate!!_AEC_escapechar!!_AEC_input_char!
set /a "_AEC_input.index+=1"
if "[!_AEC_escapechar!]" NEQ "[]" set /a "_AEC_output.escapechars+=1"
set /a "_AEC_output.totalchars=!_AEC_input.index!+!_AEC_output.escapechars!"
if !_AEC_output.totalchars! LSS 8030 if "!%_AEC_input%:~%_AEC_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
set "_AEC_last_char=!_AEC_intermediate:~-1!"
if "[%_AEC_notlastdigit%]" NEQ ["true"] for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_AEC_last_char!]"=="[%%a]" ( set /a "_AEC_input.escapechars+=1" & set /a "_AEC_output.totalchars+=1" & set _AEC_intermediate=!_AEC_intermediate:~,-1!^^^%%a) )
REM set _AEC_intermediate
endlocal & set /a "%_AEC_output%.len=%_AEC_input.index%" & set /a "%_AEC_output%.totallen=%_AEC_output.totalchars%" & set /a "%_AEC_output%.lenesc=%_AEC_output.escapechars%" & set %_AEC_output%=%_AEC_intermediate%
if "[%_AEC_nolen%]" EQU "[true]" set "%_AEC_output%.len=" & set "%_AEC_output%.totallen=" & set "%_AEC_output%.lenesc="
Call :ClearVariablesByPrefix %_AddEscapeCharacters_prefix% _AddEscapeCharacters
GoTo :EOF



























REM ::Usage Call :lenByRef OutputResult %VariableName%
REM :: 8172 max lenght, breaks batch file if len=8173 WRONG
REM :lenByVal
REM setlocal enabledelayedexpansion
REM set _len=%~2
REM GoTo :len-skip-preamble
REM ::Usage Call :len OutputResult VariableName
REM :: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
REM :len
REM setlocal enabledelayedexpansion
REM echo beforesetlen
REM set _len=!%~2!
REM echo aftersetlen
REM :len-skip-preamble
REM if not defined _len set /a "_len.count=0" GoTo :len-end
REM set /a "_len.count=1"
REM if "!_len:~4096,1!" NEQ "" set /a "_len.count+=4096" & set _len=!_len:~4096!
REM if "!_len:~2048,1!" NEQ "" set /a "_len.count+=2048" & set _len=!_len:~2048!
REM if "!_len:~1024,1!" NEQ "" set /a "_len.count+=1024" & set _len=!_len:~1024!
REM if "!_len:~512,1!" NEQ "" set /a "_len.count+=512" & set _len=!_len:~512!
REM if "!_len:~256,1!" NEQ "" set /a "_len.count+=256" & set _len=!_len:~256!
REM if "!_len:~128,1!" NEQ "" set /a "_len.count+=128" & set _len=!_len:~128!
REM if "!_len:~64,1!" NEQ "" set /a "_len.count+=64" & set _len=!_len:~64!
REM if "!_len:~32,1!" NEQ "" set /a "_len.count+=32" & set _len=!_len:~32!
REM if "!_len:~16,1!" NEQ "" set /a "_len.count+=16" & set _len=!_len:~16!
REM if "!_len:~8,1!" NEQ ""  set /a "_len.count+=8" & set _len=!_len:~8!
REM if "!_len:~4,1!" NEQ ""  set /a "_len.count+=4" & set _len=!_len:~4!
REM if "!_len:~2,1!" NEQ ""  set /a "_len.count+=2" & set _len=!_len:~2!
REM if "!_len:~1,1!" NEQ ""  set /a "_len.count+=1" & set _len=!_len:~1!
REM :len-end
REM endlocal & set "_len=" & set /a "%~1=%_len.count%" & exit /b %_len.count%





:EchoSingleArgumentTest-DEMO

echo How argument with ampersand in them work
echo result : no argument with ampersand allowed byval

echo argument with ^& ( )
Call :EchoSingleArgumentTest A1rgum&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest A2rgum^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest A3rgum^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest A4rgum^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A5rgum^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A6rgum^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A7rgum^^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A8rgum^^^^^^^&ent1 Argument2 ArgumentN
echo.

echo argument with ^& ( )
Call :EchoSingleArgumentTest "A1rgum&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest "A2rgum^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest "A3rgum^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest "A4rgum^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A5rgum^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A6rgum^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A7rgum^^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A8rgum^^^^^^^&ent1 Argument2 ArgumentN
echo.

echo argument with ^& ( )
Call :EchoSingleArgumentTest "A1rgum&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest "A2rgum^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest "A3rgum^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest "A4rgum^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A5rgum^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A6rgum^^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A7rgum^^^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A8rgum^^^^^^^&ent1 Argument2 ArgumentN"
echo.

GoTo :EOF


:EchoSingleArgumentTest
echo testtext1 %1
echo testtext2 %~1
echo testtext3 "%1"
echo testtext4 "%~1"
setlocal enabledelayedexpansion
echo testtext5 %1
echo testtext6 %~1
echo testtext7 "%1"
echo testtext8 "%~1"
endlocal
echo testtex21 %2
echo testtex22 %~2
echo testtex23 "%2"
echo testtex24 "%~2"
setlocal enabledelayedexpansion
echo testtex25 %2
echo testtex26 %~2
echo testtex27 "%2"
echo testtex28 "%~2"

endlocal
GoTo :EOF


:EchoArguments-DEMO

Call :ClearVariablesByPrefix _EchoArguments

REM 32 space
REM 33 !
REM 34 "
REM 37 %
REM 38 &
REM 39 '
REM 40 (
REM 41 )
REM 43 +
REM 44 ,
REM 59 ;
REM 60 <
REM 61 =
REM 62 >
REM 64 @
REM 91 [
REM 93 ]
REM 94 ^
REM 96 `
REM 123 {
REM 124 |
REM 125 }
REM 126 ~

echo single argument1
Call :EchoArguments Argument1 
echo three arguments
Call :EchoArguments Argument1 Argument2 ArgumentN
echo argument with space
Call :EchoArguments Argum ent1 Argument2 ArgumentN
echo argument with ! (strange behaviour with delayed expansion as expected)
Call :EchoArguments Argum!ent1 Argument2 ArgumentN
echo argument with " (quote turns all arguments into one argument, in :EchoArguments, it also turns the rest of the line into a quote !)
Call :EchoArguments Argum"ent1 Argument2 ArgumentN
echo argument with %
Call :EchoArguments Argum%ent1 Argument2 ArgumentN
echo argument with %%
Call :EchoArguments Argum%%ent1 Argument2 ArgumentN
echo argument with %%%% (only this one still has a single %% in the final output)
Call :EchoArguments Argum%%%%ent1 Argument2 ArgumentN

echo argument with ^& (this runs Call :EchoArguments with Argum, then tried to run "ent1" 
Call :EchoArguments Argum&ent1 Argument2 ArgumentN
echo argument with ^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^&ent1 Argument2 ArgumentN
echo argument with ^^^^^& (DISABLED) ( this runs Call :EchoArguments with Argum^^^^ , trailing carret will break code, argument get trunkated )
REM Call :EchoArguments Argum^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^& (DISABLED) ( this runs Call :EchoArguments with Argum^^^^^^ , trailing carret will break code, argument get trunkated )
REM Call :EchoArguments Argum^^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^^^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^^^^^& (DISABLED) ( this runs Call :EchoArguments with Argum^^^^^^^^ , trailing carret will break code, argument get trunkated )
REM Call :EchoArguments Argum^^^^^^&ent1 Argument2 ArgumentN
echo argument with ^^^^^^^^^^^^^^^& (this does not even execute the first line of code in :EchoArguments, without errors)
Call :EchoArguments Argum^^^^^^^&ent1 Argument2 ArgumentN

echo argument with '
Call :EchoArguments Argum'ent1 Argument2 ArgumentN
echo argument with (
Call :EchoArguments Argum(ent1 Argument2 ArgumentN
echo argument with )
Call :EchoArguments Argum)ent1 Argument2 ArgumentN
echo argument with +
Call :EchoArguments Argum+ent1 Argument2 ArgumentN
echo argument with , (this does split the argument)
Call :EchoArguments Argum,ent1 Argument2 ArgumentN
echo argument with ; (this does split the argument)
Call :EchoArguments Argum;ent1 Argument2 ArgumentN
echo argument with ^< (trunkates first argument at Argum ,no error when ent1 doesn't exist, rest of the argument intacts)
Call :EchoArguments Argum<ent1 Argument2 ArgumentN
echo argument with ^^&< ( not checked but probably same pattern as ampersand)
Call :EchoArguments Argum^<ent1 Argument2 ArgumentN
echo argument with = (this does split the argument)
Call :EchoArguments Argum=ent1 Argument2 ArgumentN
echo argument with ^> (like ^^^&, this does not even execute the first line of code in :EchoArguments, without errors))
Call :EchoArguments Argum>ent1 Argument2 ArgumentN
echo argument with ^^^> ( creates a file called ent1 )
Call :EchoArguments Argum^>ent1 Argument2 ArgumentN
echo argument with @
Call :EchoArguments Argum@ent1 Argument2 ArgumentN
echo argument with [
Call :EchoArguments Argum[ent1 Argument2 ArgumentN
echo argument with ]
Call :EchoArguments Argum]ent1 Argument2 ArgumentN
echo argument with ^^ (the single ^^ disappears)
Call :EchoArguments Argum^ent1 Argument2 ArgumentN
echo argument with ^^^^ (the single ^^ disappears)
Call :EchoArguments Argum^^ent1 Argument2 ArgumentN
echo argument with `
Call :EchoArguments Argum`ent1 Argument2 ArgumentN
echo argument with {
Call :EchoArguments Argum{ent1 Argument2 ArgumentN
REM echo argument with ^| (this actually breaks :EchoArguments)
REM Call :EchoArguments Argum|ent1 Argument2 ArgumentN
echo argument with ^| (like ^^^& and ^^^>, this does not even execute the first line of code in :EchoArguments, without errors))
Call :EchoArguments Argum^|ent1 Argument2 ArgumentN
echo argument with }
Call :EchoArguments Argum}ent1 Argument2 ArgumentN
echo argument with ~
Call :EchoArguments Argum~ent1 Argument2 ArgumentN




REM Call :EchoArguments Argum(ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum)ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum[ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum]ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum{ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum}ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum+ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum,ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum`ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum~ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum@ent1 Argument2 ArgumentN
REM Call :EchoArguments Argum'ent1 Argument2 ArgumentN


GoTo :EOF
