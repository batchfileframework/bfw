
::Usage Call :MidCut  "%InputVariable%" OutputVariable lenght optional start=0
:MidCut
if "[%~4]"=="[]" ( set /a _MidCut_start=0 ) else ( set "_MidCut_start=%~4" )
set "_MidCut_input=%~1"
set /a _MidCut_end=%_MidCut_start%+%~3
call set "%~2=%%_MidCut_input:~0,%_MidCut_start%%%%%_MidCut_input:~%_MidCut_end%%%"
set "_MidCut_input=" & set "_MidCut_end="
GoTo :EOF

