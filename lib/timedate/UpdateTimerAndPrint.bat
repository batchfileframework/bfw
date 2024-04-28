
::Usage Call :UpdateTimerAndPrint semi-optional TimerName optional TimeComment
:UpdateTimerAndPrint
set "_UpdateTimerAndPrint_prefix=_UTAP"
Call :SetIfNotDefined "%~1" _UTAP_TimerName "%~2" _UTAP_TimerComment
Call :SetIfNotDefined default _UTAP_TimerName
set "_UTAP_TimerName=app.timer.%_UTAP_TimerName%"
set /a "%_UTAP_TimerName%.ubound+=1"
Call set /a "_UTAP_ubound=%%%_UTAP_TimerName%.ubound%%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].comment=%_UTAP_TimerComment%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].date=%date%"
set "%_UTAP_TimerName%[%_UTAP_ubound%].time=%time: =0%"
set /a "_UTAP_pbound=%_UTAP_ubound%-1"
Call :GetTimeDifference %%%_UTAP_TimerName%[%_UTAP_pbound%].time%% %%%_UTAP_TimerName%[%_UTAP_ubound%].time%% _UTAP_TimeDifference
echo Time elapsed [%_UTAP_TimeDifference%]
Call :ClearVariablesByPrefix %_UpdateTimerAndPrint_prefix% _UpdateTimerAndPrint
GoTo :EOF
