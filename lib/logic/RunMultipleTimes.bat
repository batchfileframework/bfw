
::Usage Call :RunMultipleTimes RunCount "Your Command here"
:RunMultipleTimes
set /a "_RunMultipleTimes_index=0"
set /a "_RunMultipleTimes_ubound=%~1"
shift
:RunMultipleTimes-loop
%~1
%~2
%~3
%~4
%~5
%~6
%~7
%~8
%~9
set /a "_RunMultipleTimes_index+=1"
if %_RunMultipleTimes_index% LSS %_RunMultipleTimes_ubound% GoTo :RunMultipleTimes-loop
Call :ClearVariablesByPrefix myPrefix _RunMultipleTimes
GoTo :EOF
