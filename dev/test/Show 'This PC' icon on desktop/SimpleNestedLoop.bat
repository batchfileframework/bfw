
::Usage Call :SimpleNestedLoop lbound ubound lbound2 ubound2
:SimpleNestedLoop
set "_SimpleNestedLoop.lbound=%~1"
set "_SimpleNestedLoop.ubound=%~2"
set "_SimpleNestedLoop2.lbound=%~3"
set "_SimpleNestedLoop2.ubound=%~4"

if "[%_SimpleNestedLoop.lbound%]"=="[]" set /a "_SimpleNestedLoop.lbound=0"
if "[%_SimpleNestedLoop.ubound%]"=="[]" set /a "_SimpleNestedLoop.ubound=15"
if "[%_SimpleNestedLoop2.lbound%]"=="[]" set /a "_SimpleNestedLoop2.lbound=-5"
if "[%_SimpleNestedLoop2.ubound%]"=="[]" set /a "_SimpleNestedLoop2.ubound=5"

set /a "_SimpleNestedLoop.index=%_SimpleNestedLoop.lbound%"
:SimpleNestedLoop-loop-1
set /a "_SimpleNestedLoop2.index=%_SimpleNestedLoop2.lbound%"
:SimpleNestedLoop-loop-2
echo loop 1 index %_SimpleNestedLoop.index% loop 2 index %_SimpleNestedLoop2.index%

set /a "_SimpleNestedLoop2.index+=1"
if %_SimpleNestedLoop2.index% leq %_SimpleNestedLoop2.ubound% GoTo :SimpleNestedLoop-loop-2
set /a "_SimpleNestedLoop.index+=1"
if %_SimpleNestedLoop.index% leq %_SimpleNestedLoop.ubound% GoTo :SimpleNestedLoop-loop-1

GoTo :EOF

