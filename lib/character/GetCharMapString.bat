
::Usage Call :GetCharMapString optional OutputString
:GetCharMapString
if "[%~1]"=="[]" ( set "_GetCharMapString_Output=CharMap" ) else ( set "_GetCharMapString_Output=%~1" )
Call :SetArrayParameters _GetCharMapString_Output "" 0 255 0
:GetCharMapString-loop
cmd /c exit %_GetCharMapString_Output.index%
set _GetCharMapString_Output.value=%_GetCharMapString_Output.value%%=exitcodeascii%
set /a _GetCharMapString_Output.index+=1
if %_GetCharMapString_Output.index% leq %_GetCharMapString_Output.ubound% GoTo :GetCharMapString-loop
set %_GetCharMapString_Output%=%_GetCharMapString_Output.value%
Call :ClearVariablesByPrefix _GetCharMapString
GoTo :EOF

