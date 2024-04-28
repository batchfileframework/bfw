
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
