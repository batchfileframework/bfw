
::Usage Call :SortNumberString InputNumberString optional OutputBool
:IsNumberStringSequential
set "_IsNumberStringSequential_prefix=_INSS"

Call :ClearVariablesByPrefix %_IsNumberStringSequential_prefix% _INSS
GoTo :EOF NO it' s exit /b the result
