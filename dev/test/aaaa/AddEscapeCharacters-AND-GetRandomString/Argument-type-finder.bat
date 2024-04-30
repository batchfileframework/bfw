
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

