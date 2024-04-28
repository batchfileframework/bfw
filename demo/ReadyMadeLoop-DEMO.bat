
:ReadyMadeLoop-DEMO

Call :ClearVariablesByPrefix _ReadyMadeLoop

set _ReadyMadeLoop[0].pre=echo hello, this is pre
set _ReadyMadeLoop[0]=call echo hello, this is main %%_ReadyMadeLoop_start%%
set _ReadyMadeLoop[0].post=echo hello, this is post
Call :ReadyMadeLoop 0 10 1

pause

Call :ClearVariablesByPrefix _ReadyMadeLoop
set "_ReadyMadeLoop[0].pre=call echo _ReadyMadeLoop_start %%_ReadyMadeLoop_start%% _ReadyMadeLoop_end %%_ReadyMadeLoop_end%% _ReadyMadeLoop_increment %%_ReadyMadeLoop_increment%%"
set "_ReadyMadeLoop[1].pre=set /a "_ReadyMadeLoop_value=0" "
set "_ReadyMadeLoop[2].pre=set /a "_ReadyMadeLoop_value+=1" "
set "_ReadyMadeLoop[3].pre=set /a "_ReadyMadeLoop_value+=1""
set "_ReadyMadeLoop[10].pre=echo last function in the pre section"

set "_ReadyMadeLoop[0]=call echo in the loop _ReadyMadeLoop_start %%_ReadyMadeLoop_start%%"
set "_ReadyMadeLoop[1]=call echo in the loop _ReadyMadeLoop_value %%_ReadyMadeLoop_value%%"
set _ReadyMadeLoop[10]=if "[%_ReadyMadeLoop_start%]"=="[5]" echo We even have an if statement at index=5, but it doesn't work, 

set "_ReadyMadeLoop[0].post=echo this is a test"
set "_ReadyMadeLoop[10].post=echo the last function in post section"
Call :ReadyMadeLoop 0 10 1

GoTo :EOF

