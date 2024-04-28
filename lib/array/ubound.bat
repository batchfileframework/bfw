
::Usage Call :FindArrayBounds InputArray OutputValue
::Usage Call :lbound InputArray OutputValue
::Usage Call :ubound InputArray OutputValue
:FindArrayBounds
:lbound
:ubound
set /a FindArrayBounds.index=0
for /f "tokens=1,2 delims=[]=" %%a in ('set %~1[ 2^>nul') do ( call set "FindArrayBounds[%%FindArrayBounds.index%%]=%%b" & call set /a FindArrayBounds.index+=1 )
Call :IsArrayDefinedBySet "%~1[0]" && set "FindArrayBounds.IsZeroDefined=true" || set "FindArrayBounds.IsZeroDefined=false"
set /a "FindArrayBounds.ubound=%FindArrayBounds.index%-1"
REM Actually going to have to split that becuase 3 is greater than -2147483644 and 2 is greater than -2147483645 and 0 is greater than -2147483647 are the limits
REM change algorith to work beyond these values, maybe ?
set /a "FindArrayBounds.lowestvalue=1147483647"
set /a "FindArrayBounds.highestvalue=-1147483647"
set /a FindArrayBounds.index=0
:FindArrayBounds-loop
REM call echo 11 call set /a "FindArrayBounds.current=%%FindArrayBounds[%FindArrayBounds.index%]%%"
call set /a "FindArrayBounds.current=%%FindArrayBounds[%FindArrayBounds.index%]%%" 2>nul
if %FindArrayBounds.current% EQU 0 if "[%FindArrayBounds.IsZeroDefined%]"=="[false]" GoTo :FindArrayBounds-loop-next-iteration
if %FindArrayBounds.current% lss %FindArrayBounds.lowestvalue% set /a "FindArrayBounds.lowestvalue=%FindArrayBounds.current%"
if %FindArrayBounds.current% gtr %FindArrayBounds.highestvalue% set /a "FindArrayBounds.highestvalue=%FindArrayBounds.current%"
REM echo lowest %FindArrayBounds.lowestvalue% highest %FindArrayBounds.highestvalue%
:FindArrayBounds-loop-next-iteration
set /a FindArrayBounds.index+=1
if %FindArrayBounds.index% leq %FindArrayBounds.ubound% GoTo :FindArrayBounds-loop
if "[%~2]"=="[]" (
	set /a "%~1.lbound=%FindArrayBounds.lowestvalue%"
	set /a "%~1.ubound=%FindArrayBounds.highestvalue%"
	set /a "%~1.count=%FindArrayBounds.highestvalue%-%FindArrayBounds.lowestvalue%+1"
) else (
	set /a "%~2.lbound=%FindArrayBounds.lowestvalue%"
	set /a "%~2.ubound=%FindArrayBounds.highestvalue%"
	set /a "%~2.count=%FindArrayBounds.highestvalue%-%FindArrayBounds.lowestvalue%+1"
)
Call :ClearVariablesByPrefix FindArrayBounds
GoTo :EOF
