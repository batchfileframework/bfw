
:: Usage Call :IsArrayDefinedBySet Variable OutputValue
:IsArrayDefinedBySet
set /a _IsArrayDefinedBySet.index=0
for /f "tokens=1* delims=" %%a in ('set %~1 2^>^&1') do ( call set _IsArrayDefinedBySet[%%_IsArrayDefinedBySet.index%%]=%%a & call set /a _IsArrayDefinedBySet.index+=1 )
if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:Environment variable=%]" ( 
	if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:not defined=%]" 	set "_IsArrayDefinedBySet.IsDefined=false" ) else ( set "_IsArrayDefinedBySet.IsDefined=true" )
if not "[%~2]"=="[]" set "%~2=%_IsArrayDefinedBySet.IsDefined%"
Call :ClearVariablesByPrefix _IsArrayDefinedBySet & if "[%_IsArrayDefinedBySet.IsDefined%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF
