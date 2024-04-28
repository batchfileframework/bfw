
::Usage Call :Sleep optional millis=1000
:Sleep
Call :SetIfNotDefined "%~1" _Sleep_millis
Call :SetIfNotDefined 1000 _Sleep_millis
set /a "_Sleep_loop_count=%_Sleep_millis%/10"
for /l %%a in (1,1,%_Sleep_loop_count%) do ( ping -n 1 -w 127.0.0.1 > nul )
GoTo :EOF
