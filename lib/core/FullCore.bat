@echo off
:setup
REM call :ClearLocalVariables
REM Call :GetTime FileTime StartDate StartTime
REM Call :GetCodePage InitialCodepage
REM Call :SetTitle "Control 'This PC' icon on the desktop" 
REM set debug=false
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

REM cls
REM %PrintTime%
REM if "[%debug%]"=="[true]" echo Debug mode is enabled
REM if "[%silent%]"=="[true]" echo Silent mode is enabled
REM if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
REM if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more

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
