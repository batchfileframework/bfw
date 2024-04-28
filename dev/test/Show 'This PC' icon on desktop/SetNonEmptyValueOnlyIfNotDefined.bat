
::Usage Call :SetNonEmptyValueOnlyIfNotDefined "%InputValue%" OutputVariable optional "%InputValue2%" OutputVariable2 optional "%InputValueN%" OutputVariableN
:SetNonEmptyValueOnlyIfNotDefined
set "_SetNonEmptyValueOnlyIfNotDefined_Output=%~2"
if not "[%~1]"=="[]" if not defined %_SetNonEmptyValueOnlyIfNotDefined_Output% set "%_SetNonEmptyValueOnlyIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetNonEmptyValueOnlyIfNotDefined
set "_SetNonEmptyValueOnlyIfNotDefined_Output="
GoTo :EOF

