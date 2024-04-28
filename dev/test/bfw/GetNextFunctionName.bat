
::Usage Call :GetNextFunctionName BatchFile StartRow optional OutputRow
::Usage Call :GetNextFunctionRow BatchFile StartRow optional OutputRow
:GetNextFunctionName
set "_GNFR_ReturnName=true"
:GetNextFunctionRow
set "_GetNextFunctionRow_prefix=_GNFR"
set "_GNFR_BatchFile=%~1"
set "_GNFR_StartRow=%~2"
set "_GNFR_Output=%~3"
:GetNextFunctionRow-args
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%_GNFR_BatchFile%"') do ( if %%a GTR %_GNFR_StartRow% ( set /a _GNFR_current=%%a & GoTo :GetNextFunctionRow-exit-loop ) )
Call :countLines _GNFR_current "%_GNFR_BatchFile%" 2>nul
set /a _GNFR_current-=1 & GoTo :GetNextFunctionRow-skip
:GetNextFunctionRow-exit-loop
Call :GetFunctionName "%~1" %_GNFR_current% _GNFR_current_FunctionName
Call :IsFunctionLabelExcluded _GNFR_current_FunctionName && ( set /a _GNFR_StartRow=%_GNFR_current% & GoTo :GetNextFunctionRow-args )
:GetNextFunctionRow-skip
if "[%~3]" NEQ "[]" set "%~3=%_GNFR_current%" 
if "[%_GNFR_ReturnName%]" EQU "[true]" set "%~3=%_GNFR_current_FunctionName%" 
Call :ClearVariablesByPrefix %_GetNextFunctionRow_prefix% _GetNextFunctionRow_prefix  & exit /b %_GNFR_current%

