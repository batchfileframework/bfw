@echo off

::Usage Call :SimpleFileToArray OutputArray Filename
:SimpleFileToArray
set /a "%~1.lbound=%%f"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr.exe /N "^" "%~2"') do ( 
	for /f "tokens=1,2* delims=:" %%f in ("%%a") do set /a "%~1.ubound=%%f" & set %~1[%%f]=%%a
	)
set /a "_SFTA_index=1"
call set /a "_SFTA_ubound=%%%~1.ubound%%"
:SimpleFileToArray-loop
setlocal enabledelayedexpansion
set _SFTA_localscope=true
set %~1[%_SFTA_index%]=!%~1[%_SFTA_index%]:*:=!
for /f "delims=" %%a in ('set %~1[%_SFTA_index%] 2^>nul') do (
		endlocal
		set %%a
	)
if defined _SFTA_localscope endlocal & set %~1[%_SFTA_index%]=
set /a "_SFTA_index+=1"
if %_SFTA_index% LEQ %_SFTA_ubound% GoTo :SimpleFileToArray-loop
GoTo :EOF