
::Usage Call :AppendFileLineToFile inputfile outputfile 3 4 50-75 5 6 7 ... N
:AppendFileLineToFile
set "_AppendFileLineToFile_prefix=_AFLTF"
set "_AFLTF_InputFile=%~1"
set "_AFLTF_OutputFile=%~2"
:AppendFileLineToFile-args
for /f "delims=- tokens=1,2" %%a in ("%~3") do ( set "_AFLTF_Start=%%a" & set "_AFLTF_Stop=%%b"  )
if not defined _AFLTF_Stop set /a _AFLTF_Stop=%_AFLTF_Start%
if %_AFLTF_Start% GTR 1 set /a "_AFLTF_skip=%_AFLTF_Start%-1"
if %_AFLTF_Start% GTR 1 ( set "_AFLTF_skip=skip^=%_AFLTF_skip%^" ) else ( set "_AFLTF_skip=" )
for /f %_AFLTF_skip% delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^" "%_AFLTF_InputFile%"') do ( 
	for /f "delims=:" %%f in ("%%a") do if %%f GTR %_AFLTF_Stop% GoTo :AppendFileLineToFile-end
	set _AFLTF_buffer=%%a
	Setlocal enabledelayedexpansion
	set _AFLTF_buffer=!_AFLTF_buffer:*:=!
	>> "%_AFLTF_OutputFile%" echo(!_AFLTF_buffer!
	endlocal
	) 
:AppendFileLineToFile-end
if "[%~4]" NEQ "[]" ( shift & GoTo :AppendFileLineToFile-arg )
Call :ClearVariablesByPrefix %_AppendFileLineToFile_prefix% _AppendFileLineToFile_prefix & GoTo :EOF

