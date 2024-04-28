
::Usage Call :GetCharMapStringFast Optional OutputString
:GetCharMapStringFast
if "[%~1]"=="[]" ( set "_GetCharMapString_Output=CharMap" ) else ( set "_GetCharMapString_Output=%~1" )
set "%_GetCharMapString_Output%=                                 !^"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~                                                                                                                                "
set "%_GetCharMapString_Output%.len=256"
GoTo :EOF

