
::Usage Call :GetFunctionPreambleRow BatchFile FunctionNameOrRow optional OutputRow
:GetFunctionPreambleRow
Call :GetPreviousEmptyRow "%~1" "%~2" "%~3"
exit /b %errorlevel%

