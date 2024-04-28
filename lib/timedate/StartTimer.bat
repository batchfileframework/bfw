
::Usage Call :StartTimer semi-optional TimerName optional TimeComment
:StartTimer 
Call :SetIfNotDefined "%~1" _StartTimer_TimerName "%~2" _StartTimer_TimerComment
Call :SetIfNotDefined default _StartTimer_TimerName
set "_StartTimer_TimerName=app.timer.%_StartTimer_TimerName%"
set /a "%_StartTimer_TimerName%.lbound=0" & set /a "%_StartTimer_TimerName%.ubound=0"
set "%_StartTimer_TimerName%[0].comment=%_StartTimer_TimerComment%"
set "%_StartTimer_TimerName%[0].date=%date%"
set "%_StartTimer_TimerName%[0].time=%time: =0%"
Call :ClearVariablesByPrefix _StartTimer
GoTo :EOF
