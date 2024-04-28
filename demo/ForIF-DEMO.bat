@echo off

:setup
:main

echo.&echo Calling :ForIF-broken-mini-DEMO
call :ForIF-mini-DEMO

echo.&echo Calling :ForIF-DEMO , this one works
Call :ForIF-DEMO

REM echo.&echo Calling :ForIF-broken-DEMO, this one is broken
REM call :ForIF-broken-DEMO

REM echo.&echo Calling :ForIF-broken-mini-DEMO debug version
REM call :ForIF-debug-mini-DEMO

GoTo :EOF

:ForIF-DEMO

echo. :ForIF function demonstrator
echo.&echo call :forif 1 GTR 5 ^&^& echo 1 is greater than 5 ^|^| echo 1 is not greater than 5 
call :forif 1 GTR 5 && echo 1 is greater than 5 || echo 1 is not greater than 5 
echo.&echo call :forif "" GTR 5 ^&^& echo "" is greater than 5 ^|^| echo "" is not greater than 5 
call :forif "" GTR 5 && echo "" is greater than 5 || echo "" is not greater than 5 
echo.&echo call :forif 4 EQU 5 ^&^& echo 4 is equal to 5 ^|^| echo 4 is not equal to 5
call :forif 4 EQU 5 && echo 4 is equal to 5 || echo 4 is not equal to 5
echo.&echo call :forif letter EQU number ^&^& echo letter is equal to number ^|^| echo letter is not equal to number
call :forif letter EQU number && echo letter is equal to number || echo letter is not equal to number

set _myfirstterm=6748
set _mysecondterm=2983
set _mythirdterm=6748
set _myfourthterm=1234
echo.&echo variables created 
echo _myfirstterm = %_myfirstterm% _mysecondterm = %_mysecondterm%
echo _mythirdterm = %_mythirdterm% _myfourthterm = %_myfourthterm%

echo.&echo call :forif _myfirstterm EQU _mysecondterm ^&^& echo %_myfirstterm% is equal to %_mysecondterm% ^|^| echo %_myfirstterm% is not equal to %_mysecondterm%
call :forif _myfirstterm EQU _mysecondterm && echo %_myfirstterm% is equal to %_mysecondterm% || echo %_myfirstterm% is not equal to %_mysecondterm%
echo.&echo call :forif _mythirdterm EQU _myfourthterm ^&^& echo %_mythirdterm% is equal to %_myfourthterm% ^|^| echo %_mythirdterm% is not equal to %_myfourthterm%
call :forif _mythirdterm EQU _myfourthterm && echo %_mythirdterm% is equal to %_myfourthterm% || echo %_mythirdterm% is not equal to %_myfourthterm%
echo.&echo call :forif _myfirstterm EQU _mythirdterm ^&^& echo %_myfirstterm% is equal to %_mythirdterm% ^|^| echo %_myfirstterm% is not equal to %_mythirdterm%
call :forif _myfirstterm EQU _mythirdterm && echo %_myfirstterm% is equal to %_mythirdterm% || echo %_myfirstterm% is not equal to %_mythirdterm%

echo.&echo call :forif 1 LSS 5 ^&^& echo 1 is less than 5 ^|^| echo 1 is not less than 5 
call :forif 1 LSS 5 && echo 1 is less than 5 || echo 1 is not less than 5 
echo.&echo call :forif "" LSS 5 ^&^& echo "" is less than 5 ^|^| echo "" is not less than 5 
call :forif "" LSS 5 && echo "" is less than 5 || echo "" is not less than 5 
echo.&echo call :forif 4 NEQ 5 ^&^& echo 4 is not equal to 5 ^|^| echo 4 is not not equal to 5
call :forif 4 NEQ 5 && echo 4 is not equal to 5 || echo 4 is not not equal to 5
echo.&echo call :forif letter NEQ number ^&^& echo letter is not equal to number ^|^| echo letter is not not equal to number
call :forif letter NEQ number && echo letter is not equal to number || echo letter is not not equal to number

echo.&echo call :forif _myfirstterm NEQ _mysecondterm ^&^& echo %_myfirstterm% is not equal to %_mysecondterm% ^|^| echo %_myfirstterm% is not not equal to %_mysecondterm%
call :forif _myfirstterm NEQ _mysecondterm && echo %_myfirstterm% is not equal to %_mysecondterm% || echo %_myfirstterm% is not not equal to %_mysecondterm%
echo.&echo call :forif _mythirdterm NEQ _myfourthterm ^&^& echo %_mythirdterm% is not equal to %_myfourthterm% ^|^| echo %_mythirdterm% is not not equal to %_myfourthterm%
call :forif _mythirdterm NEQ _myfourthterm && echo %_mythirdterm% is not equal to %_myfourthterm% || echo %_mythirdterm% is not not equal to %_myfourthterm%
echo.&echo call :forif _myfirstterm NEQ _mythirdterm ^&^& echo %_myfirstterm% is not equal to %_mythirdterm% ^|^| echo %_myfirstterm% is not not equal to %_mythirdterm%
call :forif _myfirstterm NEQ _mythirdterm && echo %_myfirstterm% is not equal to %_mythirdterm% || echo %_myfirstterm% is not not equal to %_mythirdterm%

echo.&echo This should print numbers from 1 to 9 and then the word no multiple times
set "_myloop="
for /l %%a in (1,1,20) do (
							set /a _myloop+=1
							call :ForIF _myloop LSS 10 && echo %%a || echo no
							)

echo.&echo This should print your first 10, and only 10, environement variables
set "_myloop="
for /f "delims=" %%a in ('set ') do (
									  set /a _myloop+=1
									  call :ForIF _myloop LSS 10 && echo %%a
									 )


GoTo :EOF


REM :ForIF-DEMO


REM echo.&echo This should print numbers from 1 to 9 and then the word no multiple times
REM set "_myloop="
REM for /l %%a in (1,1,20) do (
							REM set /a _myloop+=1
							REM call :ForIF _myloop LSS 10 && echo %%a || echo no
							REM )

REM echo.&echo This should print your first 10, and only 10, environement variables
REM set "_myloop="
REM for /f "delims=" %%a in ('set ') do (
									  REM set /a _myloop+=1
									  REM call :ForIF _myloop LSS 10 && echo %%a
									 REM )
									 
REM echo.&echo trying again but this time with the debug version of :ForIF

REM echo.&echo This should print numbers from 1 to 9 and then the word no multiple times
REM set "_myloop="
REM for /l %%a in (1,1,20) do (
							REM set /a _myloop+=1
							REM call :ForIFdebug _myloop LSS 10 && echo %%a || echo no
							REM )
REM set "_myloop="
REM echo.&echo This should print your first 10, and only 10, environement variables
REM for /f "delims=" %%a in ('set ') do (
									  REM set /a _myloop+=1
									  REM call :ForIFdebug _myloop LSS 10 && echo %%a
									 REM )

REM GoTo :EOF

:ForIF-mini-DEMO

echo.&echo This should print numbers from 1 to 9
set "_myloop="
for /l %%a in (1,1,20) do (
							set /a _myloop+=1
							call :ForIF _myloop LSS 10 && echo %%a
							)

GoTo :EOF


REM :ForIF-debug-mini-DEMO

REM echo.&echo This should print numbers from 1 to 9, this calls the ForIF debug version
REM set "_myloop="
REM for /l %%a in (1,1,20) do (
							REM set /a _myloop+=1
							REM call :ForIFdebug _myloop LSS 10 && echo debug%%a
							REM )

REM GoTo :EOF


::Usage Call :ForIF FirstTerm Operator SecondTerm
:ForIF
set "_ForIF_first_term=%1"
set "_ForIF_operator=%2"
set "_ForIF_second_term=%3"
if defined %_ForIF_first_term% call set "_ForIF_first_term=%%%_ForIF_first_term%%%"
if defined %_ForIF_second_term% call set "_ForIF_second_term=%%%_ForIF_second_term%%%"
if %_ForIF_first_term% %_ForIF_operator% %_ForIF_second_term% ( set "_ForIF_first_term=" & set "_ForIF_operator=" & set "_ForIF_second_term=" & exit /b 0 ) else ( 
							set "_ForIF_first_term=" & set "_ForIF_operator=" & set "_ForIF_second_term=" & exit /b 1 )



REM ::Usage Call :ForIFdebug FirstTerm Operator SecondTerm
REM :ForIFdebug
REM set "_ForIF_first_term=%1"
REM set "_ForIF_operator=%2"
REM set "_ForIF_second_term=%3"
REM echo 00%_ForIF_first_term% %_ForIF_operator% %_ForIF_second_term%
REM if defined %_ForIF_first_term% call set "_ForIF_first_term=%%%_ForIF_first_term%%%"
REM if defined %_ForIF_second_term% call set "_ForIF_second_term=%%%_ForIF_second_term%%%"
REM if %_ForIF_first_term% %_ForIF_operator% %_ForIF_second_term% ( echo 11yes %_ForIF_first_term% %_ForIF_operator% %_ForIF_second_term% ) else ( echo 11no "%_ForIF_first_term%" %_ForIF_operator% "%_ForIF_second_term%" )
REM if %_ForIF_first_term% %_ForIF_operator% %_ForIF_second_term% ( set "_ForIF_first_term=" & set "_ForIF_operator=" & set "_ForIF_second_term=" & exit /b 0 ) else ( 
							REM set "_ForIF_first_term=" & set "_ForIF_operator=" & set "_ForIF_second_term=" & exit /b 1 )
