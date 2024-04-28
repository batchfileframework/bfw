
REM option to not return input string in case of nomatch (useful?)
::Usage Call :Split InputString OutputArray optional Delimiter=(default is a space)
:Split

Call :ClearVariablesByPrefix _Split
set "_Split_Input=%~1"
call set "_Split_OutputArray.oldubound=%%%~2.ubound%%"
Call :GetArrayParameters %~2 _Split_OutputArray "" Initialize

if "[%~3]"=="[]" set "_Split_Delimiter= "
call :len _Split_Input _Split_Input.len
call :len _Split_Delimiter _Split_Delimiter.len
Call :SetArrayParameters _Split_Input "" 0 %_Split_Input.len% 0 
set /a _Split_Input.start=0
set /a _Split_Input.end=0
set _Split
Call :DecomposeText "%_Split_Input%"
:Split-main-loop
REM echo index %_Split_Input.index%
REM echo call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
REM call echo echo call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
REM echo window %_Split_Input.CompareWindow% FFGG if "[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]" (
if "[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]" (
	echo match found I"[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]"I %_Split_Input.start% %_Split_Input.end%
	set /a _Split_OutputArray.ubound+=1 
	call set "%_Split_OutputArray%[%_Split_OutputArray.ubound%]=%%_Split_Input:~%_Split_Input.start%,%_Split_Input.end%%%"
	REM echo set /a _Split_Input.index+=%_Split_Delimiter.len%
	set /a _Split_Input.index+=%_Split_Delimiter.len%
	REM call echo call set /a _Split_Input.start=%%_Split_Input.index%%
	call set /a _Split_Input.start=%%_Split_Input.index%%
)

echo set /a _Split_Input.end=%_Split_Input.index%
set /a _Split_Input.end=%_Split_Input.index%
set /a _Split_Input.index+=1
if %_Split_Input.index% leq %_Split_Input.ubound% GoTo :Split-main-loop

REM if %_Split_OutputArray.ubound% equ -1 set "_Split_nomatch=true" & set /a "_Split_OutputArray.ubound=0" & set "%_Split_OutputArray%[0]=_Split_Input" echo NO MATCH FOUND, set output.ubound=0 COPY Input to [0]
Call :SetArrayParameters "%_Split_OutputArray%" _Split_OutputArray


REM this should exit 0 only if there's at least one match
GoTo :EOF

