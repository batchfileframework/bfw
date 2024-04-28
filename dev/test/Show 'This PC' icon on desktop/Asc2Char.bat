
::Usage Call :Asc2Char InputAsciiCode OutputChar Optional SubstitutionChar
:Asc2Char
REM set "_Asc2Char_input=%~1"
REM cmd /c exit %_Asc2Char_input%
cmd /c exit %~1
set "%2=%=exitcodeascii%"
exit /b 0 & set "_Asc2Char_needescape=" & set "_Asc2Char_input="
exit /b %_Asc2Char_success% & set "_Asc2Char_needescape=" & set "_Asc2Char_input="

