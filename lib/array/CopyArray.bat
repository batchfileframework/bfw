
::Usage Call :CopyArray InputArray OutputArray
:CopyArray
Call :SetIfNotDefined "%~1" _CopyArray_InputArray "%~2" _CopyArray_OutputArray
Call :SetIfNotDefined "%%%~1.lbound%%" _CopyArray_InputArray.lbound "%%%~1.ubound%%" _CopyArray_InputArray.ubound "%%%~2.lbound%%" _CopyArray_OutputArray
Call :SetIfNotDefined 0 _CopyArray_InputArray.lbound 0 _CopyArray_OutputArray.lbound
set /a "_CopyArray_InputArray_index=%_CopyArray_InputArray.lbound%"
set /a "_CopyArray_OutputArray_index=%_CopyArray_OutputArray.lbound%"
setlocal enabledelayedexpansion
set _CopyArray_localscope=true
:CopyArray-loop
set "%_CopyArray_OutputString%[%_CopyArray_OutputArray_index%]=!%_CopyArray_InputArray%[%_CopyArray_InputArray_index%]!
set /a "_CopyArray_InputArray_index+=1" & set /a "_CopyArray_OutputArray_index+=1"
if %_CopyArray_InputArray_index% LEQ %_CopyArray_InputArray.ubound% GoTo :CopyArray-loop
for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( 
	endlocal & set %%a 
	)
if defined _CopyArray_localscope endlocal
GoTo :EOF

