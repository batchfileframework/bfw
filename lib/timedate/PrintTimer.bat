
::Usage Call :PrintTimer optional TimerName
:PrintTimer
Call :SetIfNotDefined "%~1" _PrintTimer_TimerName
Call :SetIfNotDefined default _PrintTimer_TimerName
set "_PrintTimer_TimerName=app.timer.%_PrintTimer_TimerName%"
set /a "_PrintTimer_previous=-1"
set /a "_PrintTimer_index=0"
call set /a "_PrintTimer_ubound=%%%_PrintTimer_TimerName%.ubound%%"
:PrintTimer-loop
if %_PrintTimer_index% GTR 0 Call :GetTimeDifference %%%_PrintTimer_TimerName%[%_PrintTimer_previous%].time%% %%%_PrintTimer_TimerName%[%_PrintTimer_index%].time%% _PrintTimer_TimeDifference
call echo %_PrintTimer_TimerName% [%_PrintTimer_index%] %%%_PrintTimer_TimerName%[%_PrintTimer_index%].date%% %%%_PrintTimer_TimerName%[%_PrintTimer_index%].time%% : diff [%_PrintTimer_TimeDifference%] : %%%_PrintTimer_TimerName%[%_PrintTimer_index%].comment%% 
set /a "_PrintTimer_previous+=1"
set /a "_PrintTimer_index+=1"
if %_PrintTimer_index% LEQ %_PrintTimer_ubound% GoTo :PrintTimer-loop
Call :ClearVariablesByPrefix _PrintTimer
GoTo :EOF
