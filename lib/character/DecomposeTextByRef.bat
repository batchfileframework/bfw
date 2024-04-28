
::Usage Call :DecomposeText InputString optional Step
:DecomposeTextByRef
::Usage Call :DecomposeText InputString optional Step
:DecomposeText
set "_DecomposeText_Input=%~1"
set _DecomposeText
set "_DecomposeText_Input=%_DecomposeText_Input:^^=^%"
set _DecomposeText
echo [begin]"%_DecomposeText_Input%"[end]
if "[%~2]"=="[]" ( set /a "_DecomposeText_Step=1" ) else ( set /a "_DecomposeText_Step=%~2" )
Call :len "%_DecomposeText_Input%" _DecomposeText.len
Call :SetArrayParameters _DecomposeText_Input "" 0 %_DecomposeText.len%-1 0
echo [begin]"%_DecomposeText_Input%"[end] %_DecomposeText.len%
set _DecomposeText
:DecomposeText-loop
REM echo echo %%_DecomposeText.index%% %%_DecomposeText_Input:~%_DecomposeText_Input.index%,%_DecomposeText_Step%%%
call set "_DecomposeText_Input.char=%%_DecomposeText_Input:~%_DecomposeText_Input.index%,%_DecomposeText_Step%%%"
echo %_DecomposeText_Input.index% "%_DecomposeText_Input.char%"
set /a "_DecomposeText_Input.index+=%_DecomposeText_Step%"
if %_DecomposeText_Input.index% leq %_DecomposeText_Input.ubound% GoTo :DecomposeText-loop
Call :ClearVariablesByPrefix _DecomposeText
GoTo :EOF

