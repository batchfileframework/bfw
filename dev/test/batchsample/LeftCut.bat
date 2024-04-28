
::Usage Call :LeftCut "%InputVariable%" OutputVariable lenght
:LeftCut
set "LeftCut_input=%~1"
call set "%~2=%%LeftCut_input:~%~3%%"
set "LeftCut_input="
GoTo :EOF

