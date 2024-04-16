
::Usage Call :IsConsole && echo Is Console || echo Is NOT console
:IsConsole
if /I "%CMDCMDLINE:"=%" EQU "%COMSPEC% " exit /b 0
if /I "%CMDCMDLINE:"=%" EQU "%COMSPEC%" ( exit /b 0 ) else ( exit /b 1 ) 
