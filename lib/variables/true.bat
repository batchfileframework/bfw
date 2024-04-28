
::Usage Call :True ReturnValue 'Always returns true, both return value and errorlevel
:true 
if not "[%1]"=="[]" set %1=true
exit /b 0
REM Call :True ReturnValue && echo it is always true (errorlevel 0) || echo it is never false (errorlevel not 0)
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)

