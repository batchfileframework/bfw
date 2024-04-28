
::Usage Call :RemoveLeadingZeros InputVariable optional OutputVariable
:RemoveLeadingZeros
set "_RemoveLeadingZeros_prefix=_RLZ"
Call :SetIfNotDefined "%~1" _RLZ_InputVariable "%~2" _RLZ_OutputVariable
Call :SetIfNotDefined "%_RLZ_InputVariable%" _RLZ_OutputVariable
setlocal enabledelayedexpansion
set "_RLZ_string=%_RLZ_InputVariable%"
set /a "_RLZ_number=!_RLZ_string!"
endlocal & set "%_RLZ_OutputVariable%=%_RLZ_number%"
Call :ClearVariablesByPrefix %_RemoveLeadingZeros_prefix% _RemoveLeadingZeros
GoTo :EOF
