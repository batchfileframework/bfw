
REM maybe another version, or parameter, where each subsequent operation is performed on the result of the previous calculation ? (maybe only if it starts with a operator ?)
::Usage Call :Calculate operations result operations2 result2 operationsN resultN
:Arithmetic
:Calculate
set "_Arithmetic_operation=%~1"
set "_Arithmetic_output=%~2"
if defined %~1.ubound GoTo :Arithmetic-loop-setup
if defined %_Arithmetic_operation% call set "_Arithmetic_operation=%%%_Arithmetic_operation%%%"
set /a "_Arithmetic_result=%_Arithmetic_operation%" 
set /a "%_Arithmetic_output%=%_Arithmetic_result%" & GoTo :Arithmetic-end
:Arithmetic-loop-setup
if defined %_Arithmetic_output%.ubound ( call set /a "_Arithmetic_output_ubound=%%%_Arithmetic_output%.ubound%%" ) else ( set /a "_Arithmetic_output_ubound=-1" )
if defined %_Arithmetic_operation%.lbound ( call set /a "_Arithmetic_operation_lbound=%%%_Arithmetic_operation%.lbound%%" ) else ( set /a "_Arithmetic_operation_lbound=0" )
call set /a "_Arithmetic_operation_ubound=%%%_Arithmetic_operation%.ubound%%"
set /a "_Arithmetic_operation_index=%_Arithmetic_operation_lbound%"
:Arithmetic-loop
set /a "_Arithmetic_output_ubound+=1"
call set /a "_Arithmetic_result=%%%_Arithmetic_operation%[%_Arithmetic_operation_index%]%%"
set /a "%_Arithmetic_output%[%_Arithmetic_output_ubound%]=%_Arithmetic_result%"
set /a "_Arithmetic_operation_index+=1"
if %_Arithmetic_operation_index% LEQ %_Arithmetic_operation_ubound% GoTo :Arithmetic-loop
set /a "%_Arithmetic_output%.ubound=%_Arithmetic_output_ubound%"
:Arithmetic-end
REM if %~3 %~4 clear and goto start
exit /b %_Arithmetic_result%
