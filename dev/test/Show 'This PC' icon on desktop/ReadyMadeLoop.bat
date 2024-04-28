
::Usage Call :ReadyMadeLoop start end increment
:: set _ReadyMadeLop[0 to 10] with your commands to be executed inside the loop
:: set _ReadyMadeLop[0 to 10].pre and .post for commands outside the loop 
:ReadyMadeLoop
call :SetNonEmptyValue "%~1" _ReadyMadeLoop_start "%~2" _ReadyMadeLoop_end "%~3" _ReadyMadeLoop_increment
if %_ReadyMadeLoop_end% lss %_ReadyMadeLoop_start% ( set "_ReadyMadeLoop_direction=geq" ) else ( set "_ReadyMadeLoop_direction=leq" )
%_ReadyMadeLoop[0].pre%
%_ReadyMadeLoop[1].pre%
%_ReadyMadeLoop[2].pre%
%_ReadyMadeLoop[3].pre%
%_ReadyMadeLoop[4].pre%
%_ReadyMadeLoop[5].pre%
%_ReadyMadeLoop[6].pre%
%_ReadyMadeLoop[7].pre%
%_ReadyMadeLoop[8].pre%
%_ReadyMadeLoop[9].pre%
%_ReadyMadeLoop[10].pre%

:ReadyMadeLoop-loop

%_ReadyMadeLoop[0]%
%_ReadyMadeLoop[1]%
%_ReadyMadeLoop[2]%
%_ReadyMadeLoop[3]%
%_ReadyMadeLoop[4]%
%_ReadyMadeLoop[5]%
%_ReadyMadeLoop[6]%
%_ReadyMadeLoop[7]%
%_ReadyMadeLoop[8]%
%_ReadyMadeLoop[9]%
%_ReadyMadeLoop[10]%

set /a "_ReadyMadeLoop_start+=%_ReadyMadeLoop_increment%"

if %_ReadyMadeLoop_start% %_ReadyMadeLoop_direction% %_ReadyMadeLoop_end% GoTo :ReadyMadeLoop-loop

%_ReadyMadeLoop[0].post%
%_ReadyMadeLoop[1].post%
%_ReadyMadeLoop[2].post%
%_ReadyMadeLoop[3].post%
%_ReadyMadeLoop[4].post%
%_ReadyMadeLoop[5].post%
%_ReadyMadeLoop[6].post%
%_ReadyMadeLoop[7].post%
%_ReadyMadeLoop[8].post%
%_ReadyMadeLoop[9].post%
%_ReadyMadeLoop[10].post%

GoTo :EOF

