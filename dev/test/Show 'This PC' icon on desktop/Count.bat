
::Usage Call :Count "%InputVariable%" OutputVariable "%SearchWord%"
:Count
set "_Count_InputVariable=%~1"
set "_Count_SearchWord=%~3"
Call :len _Count_InputVariable _Count_InputVariable.len 
Call :len _Count_SearchWord _Count_SearchWord.len 
REM echo len %_Count_InputVariable.len% %_Count_SearchWord.len%
set /a _Count_match=0
set /a _Count_index=0
:Count-loop
call set "_Count_CompareWindow=%%_Count_InputVariable:~%_Count_index%,%_Count_SearchWord.len%%%"
call set "_Count_Compare=%%_Count_CompareWindow:%_Count_SearchWord%=%%"
REM echo 1%_Count_InputVariable%1 2%_Count_CompareWindow%2 3%_Count_Compare%3 4%_Count_SearchWord%4
if not "[%_Count_CompareWindow%]"=="[%_Count_Compare%]" set /a _Count_match+=1
set /a _Count_index+=1
if %_Count_index% LSS %_Count_InputVariable.len% GoTo :Count-loop
set /a "%~2=%_Count_match%"
GoTo :EOF

