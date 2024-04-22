@echo off

:setup
:main

Call :countLines _LineCount "%~0"
set /a _TestRows=6
set /a _IndexRow=%_LineCount%-%_TestRows%

:loop
Call :EchoWithoutNewline "Text on line #%_IndexRow% |"
Call :EchoLineSimple "%~0" %_IndexRow% & Call :GetFunctionName "%~0" %_IndexRow% _CurrentValue
echo Label name on row #%_IndexRow% is ''%_CurrentValue%''
set /a _IndexRow+=1
if %_IndexRow% LEQ %_LineCount% GoTo :loop

:end
set "_LineCount=" & set "_TestRows=" & set "_IndexRow="
GoTo :EOF

::Usage Call :GetFunctionName File LineNumber OutputValue
:GetFunctionName
for /F "usebackq eol= tokens=1,2 delims=(&:=+ " %%i in (`^(type %~1 ^| findstr /n /r /c:".*" ^| findstr /B /C:"%~2:" ^) 2^>nul`) do ( set "%~3=%%j" & exit /b 0 )
REM proposed alternative for /F "tokens=2 delims=(&:=+ " %%i in ('%SystemRoot%\System32\findstr.exe /n "" "%~1" ^| %SystemRoot%\System32\findstr.exe /B /C:"%~2:"') do set "%~3=%%i" & exit /b 0
exit /b 1

::Usage Call :EchoLineSimple textfilename 3 4 5 6 ... N
:EchoLineSimple
set "_EchoLineSimple_filename=%~1"
:EchoLineSimple-loop
Setlocal enabledelayedexpansion
for /f delims^=^ eol^= %%a in (' ^( type "%_EchoLineSimple_filename%" ^| %SystemRoot%\System32\findstr /N /R /C:".*" ^| %SystemRoot%\System32\findstr /B /C:"%~2:" ^) 2^>nul ') do ( 
	set _ELS_buffer=%%a
	if defined _ELS_buffer echo(!_ELS_buffer:*:=!
	) 
endlocal
if "[%~3]" NEQ "[]" ( shift & GoTo :EchoLineSimple-loop ) else ( set "_EchoLineSimple_filename=" & set "_ELS_buffer=" & GoTo :EOF )

::Usage Call :EchoWithoutNewline Any text here
:EchoWithoutNewline
Setlocal enabledelayedexpansion
echo|set /p=%*
endlocal & GoTo :EOF

::Usage Call :countLines returnvariable filename
::counts the number of lines in a file
:countLines result= "%file%" FROM https://stackoverflow.com/a/49089494/6104460
setLocal disableDelayedExpansion
(set "lc=0" & call)
for /f "delims=:" %%N in ('
    cmd /d /a /c type "%~2" ^^^& ^<nul set /p "=#" ^| (^
    2^>nul findStr /n "^" ^&^& echo(^) ^| ^
    findStr /blv 1: ^| 2^>nul findStr /lnxc:" "
') do (set "lc=%%N" & call;) %= for /f =%
endlocal & set "%1=%lc%"
exit /b %errorLevel% %= countLines =%

:MyLabel&and
:MyLabel(Open
:MyLabel+Plus
:MyLabel=Equal
:MyLabel test
:MyLabel:MoreLabels
:MyLabel :MoreLabels