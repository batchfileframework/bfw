
::Usage Call :UpdateTimer semi-optional TimerName optional TimeComment
:UpdateTimer 
Call :SetIfNotDefined "%~1" _UpdateTimer_TimerName "%~2" _UpdateTimer_TimerComment
Call :SetIfNotDefined default _UpdateTimer_TimerName
set "_UpdateTimer_TimerName=app.timer.%_UpdateTimer_TimerName%"
set /a "%_UpdateTimer_TimerName%.ubound+=1"
Call set /a "_UpdateTimer_ubound=%%%_UpdateTimer_TimerName%.ubound%%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].comment=%_UpdateTimer_TimerComment%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].date=%date%"
set "%_UpdateTimer_TimerName%[%_UpdateTimer_ubound%].time=%time: =0%"
Call :ClearVariablesByPrefix _UpdateTimer
GoTo :EOF
