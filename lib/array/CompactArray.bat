
REM ToDo add range limits, at least lbound, if ubound, then ubound adjuster at the end will need work
REM maybe arr[] arr[].suffix or arr[].* ?
REM maybe add ability to output to a new compacted array, instead of moving elements of current array ?
REM tentative ::Usage Call :CompactArray InputArray optional OutputArray
REM tentative ::Usage Call :CompactArray InputArray optional OutputArray optional lbound=X optional ubound=Y
REM tentative ::Usage Call :CompactArray InputArray[].mysuffix optional OutputArray optional lbound=X optional ubound=Y
::Usage Call :CompactArray InputArray 
:CompactArray
set "_CompactArray_prefix=_CA
set "_CA_Input=%~1"
call set "_CA_Input_lbound=%%%_CA_Input%.lbound%%"
call set "_CA_Input_ubound=%%%_CA_Input%.ubound%%"
if "[%_CA_Input_lbound%]" EQU "[]" set "_CA_Input_lbound=0"
set /a "_CA_Index=%_CA_Input_lbound%"
set /a "_CA_Previous=%_CA_Index%-1"
if defined %_CA_Input%[%_CA_Index%] ( set /a "_CA_LastEmptyElement=%_CA_Index%+1" ) else ( set /a "_CA_LastEmptyElement=%_CA_Index%" )
:CompactArray-loop
if defined %_CA_Input%[%_CA_Index%] if %_CA_LastEmptyElement% LEQ %_CA_Previous% ( Call :MoveObject %_CA_Input%[%_CA_Index%] %_CA_Input%[%_CA_LastEmptyElement%] & set /a "_CA_LastEmptyElement+=1" )
if defined %_CA_Input%[%_CA_Index%] set /a "_CA_LastEmptyElement=%_CA_Index%+1"
set /a "_CA_Previous+=1" & set /a "_CA_Index+=1"
if %_CA_Index% LEQ %_CA_Input_ubound% GoTo :CompactArray-loop
set /a "%_CA_Input%.ubound=%_CA_LastEmptyElement%-1"
Call :ClearVariablesByPrefix %_CompactArray_prefix% _CompactArray
GoTo :EOF

