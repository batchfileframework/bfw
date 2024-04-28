
::Usage Call :Mid  "%InputVariable%" OutputVariable lenght optional start=0
:Mid
if "[%~4]"=="[]" ( set /a _Mid_start=0 ) else ( set "_Mid_start=%~4" )
set "_Mid_input=%~1"
call set "%~2=%%_Mid_input:~%_Mid_start%,%~3%%"
set "_Mid_input="
GoTo :EOF

