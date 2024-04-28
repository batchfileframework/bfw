
::Usage Call :ListFunctions BatchFile optional OutputVariable BatchFile2 ... BatchFileN
:ListFunctions
set "_ListFunctions_prefix=_LF"
Call :IsFile "%~1" && set "_LF_InputFile=%~1" || ( set "_LF_Output=%~1" & if "[%~2]" NEQ "[]" ( shift & GoTo :ListFunctions ) else ( GoTo :ListFunctions-end ) )
set "_LF_InputFile=%~1"
:ListFunctions-args
for /F "usebackq eol= tokens=2 delims=(&:=+ " %%a in (`^(type %_LF_InputFile% ^| findstr /n /r /c:"^:[^:]" ^) 2^>nul`) do ( Call :IsFunctionLabelExcluded %%a || call set "_LF_FunctionList=%%_LF_FunctionList%% %%a" )
:ListFunctions-end
if "[%~2]" NEQ "[]" ( shift & GoTo :ListFunctions )
if defined _LF_Output set "%_LF_Output%=%_LF_FunctionList:~1%"
if not defined _LF_Output echo.%_LF_FunctionList:~1%
Call :ClearVariablesByPrefix %_ListFunctions_prefix% _ListFunctions_prefix & GoTo :EOF

