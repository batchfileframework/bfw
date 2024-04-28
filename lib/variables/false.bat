
::Usage Call :false ReturnValue 'Always returns false, both return value and errorlevel
:false 
if not "[%1]"=="[]" set %1=false
exit /b 1
::Call :false ReturnValue && echo it is never true (errorlevel 0) || echo it is always false (errorlevel not 0)
REM thanks https://www.tutorialspoint.com/batch_script/
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)
