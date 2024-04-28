
::Usage Call :Concatenate OutputValue optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN 
:Concatenate-debug
if not defined _Concatenate_localscope ( setlocal enabledelayedexpansion & set "_Concatenate_localscope=true" )
if not defined _Concatenate_output ( set "_Concatenate_output=%~1" & shift & GoTo :Concatenate-debug )
if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate-debug )
set "_Concatenate_prefix=_CA"
if defined %1.ubound ( set "_Concatenate_input=%~1" ) else ( set "_Concatenate_input=_Concatenate_placeholder" & set "_Concatenate_placeholder[0]=" )
if defined %1.lbound call set /a _Concatenate_lbound=%%%~1.lbound%%
if defined %1.ubound call set /a _Concatenate_ubound=%%%~1.ubound%%
if not defined %1.lbound set /a "_Concatenate_lbound=0"
if not defined %1.ubound set /a "_Concatenate_ubound=0"
set /a "_Concatenate_index=%_Concatenate_lbound%"
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] if defined %1 set %_Concatenate_input%[%_Concatenate_index%]=!%1!
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] set "%_Concatenate_input%[%_Concatenate_index%]=%~1"
if defined !_Concatenate_separator! ( set _Concatenate_separator=!%_Concatenate_separator%! )
if not defined _Concatenate_separator set "_Concatenate_separator= "
:Concatenate-debug-loop
set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
set /a "_Concatenate_index+=1"
if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-debug-loop
if "[%~2]" NEQ "[]" ( shift & GoTo :Concatenate-debug ) 

echo --------------output so far--------------------
echo !_Concatenate_buffer!
echo --------------output so far--------------------

for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																echo set %_Concatenate_output%=%%a
																set %_Concatenate_output%=%%a
																)
Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
GoTo :EOF

REM ::Usage Call :Concatenate optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN OutputValue
REM :Concatenate-debug
REM if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate-debug )
REM set "_Concatenate_prefix=_CA"
REM if defined %1.ubound ( set "_Concatenate_input=%~1" ) else ( set "_Concatenate_input=Concatenate_placeholder" )
REM if defined %1.lbound call set /a _Concatenate_lbound=%%%~1.lbound%%
REM if defined %1.ubound call set /a _Concatenate_ubound=%%%~1.ubound%%
REM if not defined %1.lbound set /a "_Concatenate_lbound=0"
REM if not defined %1.ubound set /a "_Concatenate_ubound=0"
REM set /a "_Concatenate_index=%_Concatenate_lbound%"
REM setlocal enabledelayedexpansion
REM if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] if defined %1 set %_Concatenate_input%[%_Concatenate_index%]=!%1!
REM if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] set "%_Concatenate_input%[%_Concatenate_index%]=%~1"
REM if defined !_Concatenate_separator! ( set _Concatenate_separator=!%_Concatenate_separator%! )
REM if not defined _Concatenate_separator set "_Concatenate_separator= "
REM :Concatenate-debug-loop
REM set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
REM set /a "_Concatenate_index+=1"
REM if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-debug-loop
REM REM ----------DEBUG----------
REM if "[%debug%]" NEQ "[true]" for /f "tokens=* delims=" %%a in ('echo.!_Concatenate_buffer!') do (
																REM endlocal
																REM REM ----------DEBUG----------
																REM if "[%debug%]" EQU "[true]" echo This never runs 1 a%%aa
																REM REM ----------DEBUG----------
																REM set _Concatenate_buffer=%%a
																REM )
REM REM ----------DEBUG----------
REM if "[%~3]" NEQ "[]" ( shift & GoTo :Concatenate-debug ) 

REM REM ----------DEBUG----------
REM if "[%debug%]" EQU "[true]" ( echo so close to working&echo. )
REM if "[%debug%]" EQU "[true]" echo !_Concatenate_buffer!
REM if "[%debug%]" EQU "[true]" ( echo.&echo but I can't get the text out of setlocal :^( )
REM REM ----------DEBUG----------

REM setlocal enabledelayedexpansion
REM REM ----------DEBUG----------
REM if "[%debug%]" NEQ "[true]" for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																REM endlocal
																REM REM ----------DEBUG----------
																REM if "[%debug%]" EQU "[true]"  echo This never runs 2 a%%aa
																REM REM ----------DEBUG----------
																REM set %~2=%%a
																REM )
REM REM ----------DEBUG----------
REM if "[%debug%]" EQU "[true]" echo set %~2=_Concatenate_buffer %_Concatenate_buffer%
REM REM if "[%debug%]" EQU "[true]" set %~2=!_Concatenate_buffer!
REM set %~2=!_Concatenate_buffer!
REM REM ----------DEBUG----------
REM if "[%debug%]" NEQ "[true]" Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
REM REM ----------DEBUG----------
REM GoTo :EOF

