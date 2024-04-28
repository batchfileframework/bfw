
::Usage Call :GetCharMapArray optional OutputArray
:GetCharMapArray
if "[%~1]"=="[]" ( set "_GetCharMapArray_Output=CharMap" ) else ( set "_GetCharMapArray_Output=%~1" )
Call :SetArrayParameters _GetCharMapArray_Output "" 0 255 0
:GetCharMapArray-loop
cmd /c exit %_GetCharMapArray_Output.index%
set "%_GetCharMapArray_Output%[%_GetCharMapArray_Output.index%]=%=exitcodeascii%"
set "%_GetCharMapArray_Output%.reverse[%=exitcodeascii%]=%_GetCharMapArray_Output.index%"
set /a _GetCharMapArray_Output.index+=1
if %_GetCharMapArray_Output.index% leq %_GetCharMapArray_Output.ubound% GoTo :GetCharMapArray-loop
Call :ClearVariablesByPrefix _GetCharMapArray
GoTo :EOF
REM https://stackoverflow.com/questions/38282267/return-character-from-ascii-code-in-windows-batch
REM https://blog.itproxy.uk/exitcodeascii/

