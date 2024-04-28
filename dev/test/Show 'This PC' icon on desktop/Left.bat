
::Usage Call :Left "%InputVariable%" OutputVariable lenght
:Left
set "_Left_input=%~1"
call set "%~2=%%_Left_input:~0,%~3%%"
set "_Left_input="
GoTo :EOF

