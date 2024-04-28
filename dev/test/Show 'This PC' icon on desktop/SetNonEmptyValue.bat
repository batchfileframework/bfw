
::Usage Call :SetNonEmptyValue "%InputValue%" OutputVariable optional "%InputValue2%" OutputVariable2 optional "%InputValueN%" OutputVariableN
:SetNonEmptyValue
set "_SetNonEmptyValue_Output=%~2"
if not "[%~1]"=="[]" set "%_SetNonEmptyValue_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetNonEmptyValue
set "_SetNonEmptyValue_Output="
GoTo :EOF

