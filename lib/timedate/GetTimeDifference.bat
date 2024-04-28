
::Usage Call :GetTimeDifference Time1 Time2 DifferenceOutput
:GetTimeDifference 
set "_GetTimeDifference_prefix=_GTD"
Call :SetIfNotDefined "%~1" _GTD_Time1 "%~2" _GTD_Time2
setlocal EnableDelayedExpansion
set "_GTD_Time2_cent=!_GTD_Time2:%time:~8,1%=%%100)*100+1!"  &  set "_GTD_Time1_cent=!_GTD_Time1:%time:~8,1%=%%100)*100+1!"
set /A "_GTD_elapsed=((((10!_GTD_Time2_cent:%time:~2,1%=%%100)*60+1!%%100)-((((10!_GTD_Time1_cent:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"
endlocal & set "%~3=%_GTD_elapsed%"
Call :ClearVariablesByPrefix "%_GetTimeDifference_prefix%" _GetTimeDifference
GoTo :EOF
::With help from https://stackoverflow.com/questions/9922498/
