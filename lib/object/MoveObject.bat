
:MoveObject
REM echo for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do if "[%%a]" EQU "[%~1]" set %~2=%%b
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do if "[%%a]" EQU "[%~1]" set %~2=%%b
REM echo for /f "tokens=1 delims==" %%a in ('set %~1. 2^>nul') do for /f "tokens=2 eol== delims=.=" %%b in ('set %%a 2^>nul') do for /f "tokens=2* delims==" %%c in ('set %%a 2^>nul') do set %~2.%%b=%%c
for /f "tokens=1 delims==" %%a in ('set %~1. 2^>nul') do for /f "tokens=2 eol== delims=.=" %%b in ('set %%a 2^>nul') do for /f "tokens=2* delims==" %%c in ('set %%a 2^>nul') do set %~2.%%b=%%c
REM echo if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF


REM :MoveObject
REM set "_MoveObject_prefix=_MO"
REM set _MO_Input=%~1
REM set _MO_Output=%~2

REM REM this should copy all variable suffix to the new destination
REM for /f "tokens=1,2* delims==" %%a in ('set %_MO_Input% 2^>nul') do  (
	REM setlocal enabledelayedexpansion
	REM set "_MO_localscope=true"
	REM set _MO_Suffix_buffer_input=%%a
	REM set _MO_Suffix_buffer_output=%_MO_Output%!_MO_Suffix_buffer_input:%_MO_Input%=!
	REM for /f "tokens=*" %%Z in ('echo.!_MO_Suffix_buffer_output!') do (
																REM endlocal
																REM set %%Z=%%b
																REM )
	REM )
REM if defined _MO_localscope endlocal

REM REM this clears the old base variable
REM if "[%_MO_Input%]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %_MO_Input% 2^>nul') do set %%a=
REM Call :ClearVariablesByPrefix %_MoveObject_prefix% _MoveObject 
REM if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :MoveObject
REM GoTo :EOF


