
::Usage Call :Concatenate OutputValue optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN 
:Concatenate
if not defined _Concatenate_localscope ( setlocal enabledelayedexpansion & set "_Concatenate_localscope=true" )
if not defined _Concatenate_output ( set "_Concatenate_output=%~1" & shift & GoTo :Concatenate )
if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate )
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
:Concatenate-loop
set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
set /a "_Concatenate_index+=1"
if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-loop
if "[%~2]" NEQ "[]" ( shift & GoTo :Concatenate ) 
for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																set %_Concatenate_output%=%%a
																)
Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
GoTo :EOF

