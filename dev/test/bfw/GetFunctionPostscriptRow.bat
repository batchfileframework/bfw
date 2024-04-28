
::Usage Call :GetFunctionPostscriptRow BatchFile FunctionNameOrRow optional OutputRow
:GetFunctionPostscriptRow
Call :GetFunctionExit "%~1" "%~2" _GFPR_ExitRow
Call :GetNextEmptyRow "%~1" "%_GFPR_ExitRow%" "%~3"
set "_GFPR_ExitRow=" & exit /b %errorlevel%

