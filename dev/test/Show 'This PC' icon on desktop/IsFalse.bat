
::Usage Call :IsFalse InputBool OutputBool
:IsFalse
if not "[%~1]"=="[true]" ( exit /b 1 ) else ( exit /b 0 )
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)

