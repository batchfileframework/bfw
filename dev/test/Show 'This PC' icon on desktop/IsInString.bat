
::Usage Call :IsInString "%InputString%" SearchString optional OutputBool
:IsInString 
set "_IsInString_input=%~1"
set "_IsInString_search=%~2"
if not "[%_IsInString_search%]"=="[]" call set "_IsInString_compare=%%_IsInString_input:%_IsInString_search%=%%"
REM echo input %_IsInString_input% search %_IsInString_search% compare %_IsInString_compare%
if not "[%_IsInString_input%]"=="[%_IsInString_compare%]" set _IsInString_search=true
if not "[%~3]"=="[]" if "[%_IsInString_search%]"=="[true]" ( set "%~3=true" ) else ( set "%~3=false" )
Call :ClearVariablesByPrefix _IsInString & if "[%_IsInString_search%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )

