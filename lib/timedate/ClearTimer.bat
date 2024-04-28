
::Usage Call :ClearTimer optional TimerName
:ClearTimer
Call :SetIfNotDefined "%~1" _ClearTimer_TimerName
Call :SetIfNotDefined default _ClearTimer_TimerName
set "_ClearTimer_TimerName=app.timer.%_ClearTimer_TimerName%"
Call :ClearVariablesByPrefix %_ClearTimer_TimerName%
Call :ClearVariablesByPrefix _ClearTimer
GoTo :EOF
