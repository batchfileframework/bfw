
::Usage Call :GetFunctionName File LineNumber OutputValue
:GetFunctionName
for /F "usebackq eol= tokens=1,2 delims=(&:=+ " %%i in (`^(type "%~1" ^| findstr /n /r /c:".*" ^| findstr /B /C:"%~2:" ^) 2^>nul`) do ( set "%~3=%%j" & exit /b 0 )
REM proposed alternative for /F "tokens=2 delims=(&:=+ " %%i in ('%SystemRoot%\System32\findstr.exe /n "" "%~1" ^| %SystemRoot%\System32\findstr.exe /B /C:"%~2:"') do set "%~3=%%i" & exit /b 0
exit /b 1

