
::Usage Call :GetEOFrow BatchFile FunctionName optional OutputRow
:GetEOFrow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N /I /C:"EndOf_%~2" "%~1"') do ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a )
exit /b 0

