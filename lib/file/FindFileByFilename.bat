
::Usage Call :FindFile SearchFolder Filename ReturnVariable
:FindFileByFilename
for /r "%~1" %%a in (*.*) do if /I "[%%~na]" EQU "[%~2]" ( set "%~3=%%a" & exit /b 0 )
exit /b 1 

