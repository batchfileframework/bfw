@echo off
:setup
call :ClearLocalVariables
Call :GetTime FileTime StartDate StartTime
Call :GetCodePage InitialCodepage
Call :SetTitle "Control 'This PC' icon on the desktop" 
set debug=false
set verbose=100
set silent=false
set logfile=%tmp%\%filetime%
if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
call :SetMacroPrintTime

:main

cls

%PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
if "[%silent%]"=="[true]" echo Silent mode is enabled
if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more
call :GetAppxPackages
REM call :Text-File-Manipulation-DEMO
REM call :trim-DEMO
REM Call :LTrim-RTrim-DEMO
REM call :Join-DEMO
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
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=

GoTo :EOF
REM Exit /b %returnvalue%


:testfunc
echo %*
echo %1
echo %~1
goto :eof


::Usage Call :Left "%InputVariable%" OutputVariable lenght
:Left
set "_Left_input=%~1"
call set "%~2=%%_Left_input:~0,%~3%%"
set "_Left_input="
GoTo :EOF


::Usage Call :Right "%InputVariable%" OutputVariable lenght
:Right
set "_Right_input=%~1"
call set "%~2=%%_Right_input:~-%~3%%"
set "_Right_input="
GoTo :EOF


::Usage Call :Mid  "%InputVariable%" OutputVariable lenght optional start=0
:Mid
if "[%~4]"=="[]" ( set /a _Mid_start=0 ) else ( set "_Mid_start=%~4" )
set "_Mid_input=%~1"
call set "%~2=%%_Mid_input:~%_Mid_start%,%~3%%"
set "_Mid_input="
GoTo :EOF

