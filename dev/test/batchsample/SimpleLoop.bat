
::Usage Call :SimpleLoop lbound ubound
:SimpleLoop
set "_SimpleLoop.lbound=%~1"
set "_SimpleLoop.ubound=%~2"
if "[%_SimpleLoop.lbound%]"=="[]" set /a "_SimpleLoop.lbound=0"
if "[%_SimpleLoop.ubound%]"=="[]" set /a "_SimpleLoop.ubound=15"
set /a "_SimpleLoop.index=%_SimpleLoop.lbound%"
:SimpleLoop-loop-1
echo loop 1 index %_SimpleLoop.index%
set /a "_SimpleLoop.index+=1"
if %_SimpleLoop.index% leq %_SimpleLoop.ubound% GoTo :SimpleLoop-loop-1
GoTo :EOF

