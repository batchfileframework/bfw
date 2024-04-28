
:: Usage Call :String2CharArray InputString OutputArray optional Step=1
:String2CharArray
set "_String2CharArray_Input=%~1"
set "_String2CharArray_Output=%~2"
set "_String2CharArray_Step=%~3"
if "[%_String2CharArray_Step%]"=="[]" set /a "_String2CharArray_Step=1"
call :len "%_String2CharArray_Input%" _String2CharArray_Input.len
Call :SetArrayParameters _String2CharArray_Output "" 0 %_String2CharArray_Input.len% 0
:String2CharArray-loop
call set %_String2CharArray_Output%[%_String2CharArray_Output%.index]=%%_String2CharArray_Input:~%_String2CharArray_Output.index%,%_String2CharArray_Step%%%
set /a "_String2CharArray_Output.index+=%_String2CharArray_Step%"
if %_String2CharArray_Output.index% leq %_String2CharArray_Output.ubound% GoTo :String2CharArray-loop
Call :ClearVariablesByPrefix _String2CharArray
GoTo :EOF

