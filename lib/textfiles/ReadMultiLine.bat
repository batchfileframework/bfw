
::Usage Call :ReadMultiLine Filename ArrayOfLineNumbers OutputArray 
:ReadMultiLine
set "_ReadMultiLine_prefix=_RML"
Call :SetIfNotDefined "%~1" _RML_Filename "%~2" _RML_LineNumberArray "%%%~2.lbound%%" _RML_LineNumberArray_index "%%%~2.ubound%%" _RML_LineNumberArray.ubound "%~3" _RML_OutputArray "%%%~3.ubound%%" _RML_OutputArray.ubound
Call :SetIfNotDefined 0 _RML_LineNumberArray_index -1 _RML_OutputArray.ubound
:ReadMultiLine-loop
set /a "_RML_OutputArray.ubound+=1"
Call :Readline "%_RML_Filename%" %%%_RML_LineNumberArray%[%_RML_LineNumberArray_index%]%% %_RML_OutputArray%[%_RML_OutputArray.ubound%]
set /a "_RML_LineNumberArray_index+=1"
if %_RML_LineNumberArray_index% LEQ %_RML_LineNumberArray.ubound% GoTo :ReadMultiLine-loop
set /a "%~2.ubound=%_RML_LineNumberArray.ubound%"
Call :ClearVariablesByPrefix %_ReadMultiLine_prefix% _ReadMultiLine
GoTo :EOF
