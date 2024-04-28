
:: specify suffix 
:: Usage Call :AppendArrayToArray InputArray OutputArray .suffixIfAny
:: Will copy every element of InputArray to the end of Output array, using the specified suffix
:AppendArrayToArray
Call :GetArrayParameters %~1 _AppendArrayToArray_InputArray 
Call :GetArrayParameters %~2 _AppendArrayToArray_OutputArray
set /a _AppendArrayToArray_InputArray.index=%_AppendArrayToArray_InputArray.lbound%
:AppendArrayToArray-loop
set /a _AppendArrayToArray_OutputArray.ubound+=1
call set %_AppendArrayToArray_OutputArray%[%_AppendArrayToArray_OutputArray.ubound%]=%%%_AppendArrayToArray_InputArray%[%_AppendArrayToArray_InputArray.index%]%%
set /a _AppendArrayToArray_InputArray.index+=1
if %_AppendArrayToArray_InputArray.index% leq %_AppendArrayToArray_InputArray.ubound% GoTo :AppendArrayToArray-loop
set /a %_AppendArrayToArray_OutputArray%.ubound=%_AppendArrayToArray_OutputArray.ubound%
set /a %_AppendArrayToArray_OutputArray%.count=%_AppendArrayToArray_OutputArray.ubound%-%_AppendArrayToArray_OutputArray.lbound%+1
GoTo :EOF

