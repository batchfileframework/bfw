
::Usage Call :GetNextExitRow BatchFile StartRow optional OutputRow
:GetNextExitRow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N /I /C:"goto :EOF" /C:"exit /B" "%~1"') do ( if %%a GTR %~2 ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a ) )
exit /b 0

