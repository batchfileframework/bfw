
::Usage Call :SortNumberArray InputArray SortOrder
:SortNumberArray
set "_SortNumberArray_prefix=_SNA"
Call :SetIfNotDefined "%~1" _SNA_InputArray "%~2" _SNA_SortOrder 0 _SNA_InputArray.index 1 _SNA_nextindex 0 _SNA_InputArray.index2
if "[%_SNA_SortOrder%]"=="[DESCENDING]" ( set "_SNA_SortOrder=lss" ) else ( set "_SNA_SortOrder=gtr" )
call set "_SNA_InputArray.ubound=%%%_SNA_InputArray%.ubound%%
:SortNumberArray-loop
call set _SNA_current=%%%_SNA_InputArray%[%_SNA_InputArray.index%]%%
call set _SNA_next=%%%_SNA_InputArray%[%_SNA_nextindex%]%%
if %_SNA_current% %_SNA_SortOrder% %_SNA_next% ( set "%_SNA_InputArray%[%_SNA_InputArray.index%]=%_SNA_next%" & set "%_SNA_InputArray%[%_SNA_nextindex%]=%_SNA_current%" )
set /a "_SNA_InputArray.index+=1" & set /a "_SNA_nextindex+=1"
if %_SNA_InputArray.index% LSS %_SNA_InputArray.ubound% GoTo :SortNumberArray-loop
set /a "_SNA_InputArray.index=0" & set /a "_SNA_nextindex=1" & set /a "_SNA_InputArray.index2+=1"
if %_SNA_InputArray.index2% LEQ %_SNA_InputArray.ubound% GoTo :SortNumberArray-loop
Call :ClearVariablesByPrefix "%_SortNumberArray_prefix%" _SNA
GoTo :EOF

