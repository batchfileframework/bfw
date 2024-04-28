
::Usage Call :CharArray2String CharArray OutputString
:CharArray2String
Call :ClearVariablesByPrefix _CharArray2String
Call :GetArrayParameters %~1 _CharArray2String_InputArray "" 0
set _CharArray2String_InputArray
setlocal enableDelayedExpansion
:CharArray2String-loop
call set "_CharArray2String_OutputString=!_CharArray2String_OutputString!%%!_CharArray2String_InputArray![!_CharArray2String_InputArray.index!]%%"
echo !_CharArray2String_OutputString!
set /a "_CharArray2String_InputArray.index+=1"
if !_CharArray2String_InputArray.index! leq %_CharArray2String_InputArray.ubound% GoTo :CharArray2String-loop
endlocal & set "%2=%_CharArray2String_OutputString%"
Call :ClearVariablesByPrefix _CharArray2String
GoTo :EOF

