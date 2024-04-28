
::Usage Call :GetPreviousExitRow BatchFile StartRow optional OutputRow
:GetPreviousExitRow
set "_GPER_previous="
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N /I /C:"goto :EOF" /C:"exit /B" "%~1"') do ( ( if %%a LSS %~2 set /a _GPER_previous=%%a ) & if %%a GEQ %~2 ( GoTo :GetPreviousExitRow-exit-loop ) )
:GetPreviousExitRow-exit-loop
if "[%~3]" NEQ "[]" call set "%~3=%_GPER_previous%"
set "_GPER_previous=" & exit /b %_GPER_previous%

