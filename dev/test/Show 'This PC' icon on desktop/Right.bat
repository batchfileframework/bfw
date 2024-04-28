
::Usage Call :Right "%InputVariable%" OutputVariable lenght
:Right
set "_Right_input=%~1"
call set "%~2=%%_Right_input:~-%~3%%"
set "_Right_input="
GoTo :EOF

