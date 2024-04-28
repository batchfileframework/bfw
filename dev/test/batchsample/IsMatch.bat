
::Usage Call :IsMatch FirstVariable SecondVariable
:IsMatch
echo if "[%~1]"=="[%~2]" ( exit /b 0 ) else ( exit /b 1 )
if "[%~1]"=="[%~2]" ( exit /b 0 ) else ( exit /b 1 )

