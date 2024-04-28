
::Usage Call :IsTrue InputBool OutputBool
:IsTrue
if not "[%~2]"=="[]" if "[%~1]"=="[true]" set "%~2=true"
if "[%~1]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)

