
::Usage Call :GetPreviousEmptyRow BatchFile StartRow optional OutputRow
:GetPreviousEmptyRow
set "_GPEW_previous="
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^$" "%~1"') do ( ( if %%a LSS %~2 set /a _GPEW_previous=%%a ) & if %%a GEQ %~2 ( GoTo :GetPreviousEmptyRow-exit-loop ) )
exit /b 0
:GetPreviousEmptyRow-exit-loop
if "[%~3]" NEQ "[]" call set "%~3=%_GPEW_previous%"
set "_GPEW_previous=" & exit /b %_GPEW_previous%

