
::Usage Call :IsCharDoubleQuote byref InputVariable
:IsCharDoubleQuote 
setlocal enabledelayedexpansion
if !%~1!==^" ( set errorlevel=0 ) else ( set errorlevel=1 )
endlocal & exit /b %errorlevel%

