
::Usage Call :DoesStringContainSpecialCharacters
:DoesStringContainSpecialCharacters
setlocal enabledelayedexpansion
echo !%~1! | findstr /C:"%%"
endlocal
GoTo :EOF

