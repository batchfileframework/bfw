
:: Usage Call :Sleep 5 ' Sleep time in seconds
:Sleep
timeout /t %~1
GoTo :EOF

REM -- string manipulation --

REM ::Usage Call :Replace Input Search Output
REM :Replace
REM set ReplaceInput=%~1
REM set ReplaceSearch=%~2
REM call set %3=%%ReplaceInput:%ReplaceSearch%=%%
REM GoTo :EOF

