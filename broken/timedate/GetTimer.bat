
::Usage Call :GetTime 
:GetTimer TimerName OutputValue semi-optional TimerName optional TimeComment
Call :SetIfNotDefined "%~1" _GetTimer_Output "%~2" _GetTimer_TimerComment "%~3" _GetTimer_TimerComment
Call :SetIfNotDefined default _GetTimer_TimerName

