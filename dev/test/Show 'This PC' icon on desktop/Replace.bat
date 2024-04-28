
::Usage Call :Replace "%InputVariable%" OutputVariable "%SearchWord%" "%ReplaceWord%"
:Replace
set "_Replace_InputVariable=%~1"
set "_Replace_SearchWord=%~3"
set "_Replace_ReplaceWord=%~4"
call set "%~2=%%_Replace_InputVariable:%_Replace_SearchWord%=%_Replace_ReplaceWord%%%"
GoTo :EOF

