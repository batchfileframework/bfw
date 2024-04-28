
::Usage Call :RightCut "%InputVariable%" OutputVariable lenght
:RightCut
set "_RightCut_input=%~1"
call set "%~2=%%_RightCut_input:~,-%~3%%"
set "_RightCut_input="
GoTo :EOF

