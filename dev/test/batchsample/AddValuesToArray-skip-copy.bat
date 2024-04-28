
::Usage Call :AddValuesToArray OutputArray Value/Values[x] Value2/Values2[x] ValueN/ValuesN[x]
:AddValuesToArray 
Call :GetArrayParameters %~1 _AddValuesToArray_OutputArray Initialize -1
Call :SetArrayParameters _FindValuesInArray_AddArray nil 0 -1 0 
:AddValuesToArray-next-values
Call :GetArrayParameters %~2 _AddValuesToArray_InputArray && set _FindValuesInArray_AddArray.ubound+=1 & set "_FindValuesInArray_AddArray[%_FindValuesInArray_AddArray.ubound%]=%~2" & GoTo :AddValuesToArray-skip-copy
Call :AppendArrayToArray %_AddValuesToArray_InputArray% _FindValuesInArray_AddArray
:AddValuesToArray-skip-copy
shift 
if not "[%~2]"=="[]" GoTo :AddValuesToArray-next-values
Call :AppendArrayToArray _FindValuesInArray_AddArray %_AddValuesToArray_OutputArray%
GoTo :EOF

