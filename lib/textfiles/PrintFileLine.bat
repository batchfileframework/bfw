
::Usage Call :PrintFileLine inputfile 3 4 50-75 5 6 7 ... N
:PrintFileLine
set "_PrintFileLine_prefix=_PFL"
set "_PFL_InputFile=%~1"
:PrintFileLine-args
for /f "delims=- tokens=1,2" %%a in ("%~3") do ( set "_PFL_Start=%%a" & set "_PFL_Stop=%%b"  )
if not defined _PFL_Stop set /a _PFL_Stop=%_PFL_Start%
if %_PFL_Start% GTR 1 set /a "_PFL_skip=%_PFL_Start%-1"
if %_PFL_Start% GTR 1 ( set "_PFL_skip=skip^=%_PFL_skip%^" ) else ( set "_PFL_skip=" )
for /f %_PFL_skip% delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^" "%_PFL_InputFile%"') do ( 
	for /f "delims=:" %%f in ("%%a") do if %%f GTR %_PFL_Stop% GoTo :PrintFileLine-end
	set _PFL_buffer=%%a
	Setlocal enabledelayedexpansion
	set _PFL_buffer=!_PFL_buffer:*:=!
	echo(!_PFL_buffer!
	endlocal
	) 
:PrintFileLine-end
if "[%~4]" NEQ "[]" ( shift & GoTo :PrintFileLine-arg )
Call :ClearVariablesByPrefix %_PrintFileLine_prefix% _PrintFileLine_prefix & GoTo :EOF

