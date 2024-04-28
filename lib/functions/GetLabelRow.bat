
::Usage Call :GetLabelRow BatchFile FunctionName optional OutputRow
:GetLabelRow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /I /N "^:%~2" "%~1" ^| findstr /I /V "::%~2[a-zA-Z0-9\-\/\?\!\@\%%\$\#\^\*\)\{\}\[\]\:\_]"') do ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a )
exit /b 0

