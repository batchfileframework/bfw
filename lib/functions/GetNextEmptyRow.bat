
::Usage Call :GetNextEmptyRow BatchFile StartRow optional OutputRow
:GetNextEmptyRow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^$" "%~1"' ) do ( if %%a GTR %~2 ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a ) )
Call :countLines _GetNextEmptyRow_lastrow "%~1"
set /a _GetNextEmptyRow_lastrow+=1
if "[%~3]" NEQ "[]" set "%~3=%_GetNextEmptyRow_lastrow%"
exit /b %_GetNextEmptyRow_lastrow%

