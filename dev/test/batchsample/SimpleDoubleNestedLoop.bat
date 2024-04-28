
::Usage Call :SimpleDoubleNestedLoop lbound ubound lbound2 ubound2 lbound3 ubound3
:SimpleDoubleNestedLoop
set "_SimpleDoubleNestedLoop.lbound=%~1"
set "_SimpleDoubleNestedLoop.ubound=%~2"
set "_SimpleDoubleNestedLoop2.lbound=%~3"
set "_SimpleDoubleNestedLoop2.ubound=%~4"
set "_SimpleDoubleNestedLoop3.lbound=%~5"
set "_SimpleDoubleNestedLoop3.ubound=%~6"

if "[%_SimpleDoubleNestedLoop.lbound%]"=="[]" set /a "_SimpleDoubleNestedLoop.lbound=0"
if "[%_SimpleDoubleNestedLoop.ubound%]"=="[]" set /a "_SimpleDoubleNestedLoop.ubound=15"
if "[%_SimpleDoubleNestedLoop2.lbound%]"=="[]" set /a "_SimpleDoubleNestedLoop2.lbound=-5"
if "[%_SimpleDoubleNestedLoop2.ubound%]"=="[]" set /a "_SimpleDoubleNestedLoop2.ubound=5"
if "[%_SimpleDoubleNestedLoop3.lbound%]"=="[]" set /a "_SimpleDoubleNestedLoop3.lbound=-10"
if "[%_SimpleDoubleNestedLoop3.ubound%]"=="[]" set /a "_SimpleDoubleNestedLoop3.ubound=-8"

set /a "_SimpleDoubleNestedLoop.index=%_SimpleDoubleNestedLoop.lbound%"
:SimpleDoubleNestedLoop-loop-1
set /a "_SimpleDoubleNestedLoop2.index=%_SimpleDoubleNestedLoop2.lbound%"
:SimpleDoubleNestedLoop-loop-2
set /a "_SimpleDoubleNestedLoop3.index=%_SimpleDoubleNestedLoop3.lbound%"
:SimpleDoubleNestedLoop-loop-3
echo loop 1 index %_SimpleDoubleNestedLoop.index% loop 2 index %_SimpleDoubleNestedLoop2.index% loop 3 index %_SimpleDoubleNestedLoop3.index%

set /a "_SimpleDoubleNestedLoop3.index+=1"
if %_SimpleDoubleNestedLoop3.index% leq %_SimpleDoubleNestedLoop3.ubound% GoTo :SimpleDoubleNestedLoop-loop-3
set /a "_SimpleDoubleNestedLoop2.index+=1"
if %_SimpleDoubleNestedLoop2.index% leq %_SimpleDoubleNestedLoop2.ubound% GoTo :SimpleDoubleNestedLoop-loop-2
set /a "_SimpleDoubleNestedLoop.index+=1"
if %_SimpleDoubleNestedLoop.index% leq %_SimpleDoubleNestedLoop.ubound% GoTo :SimpleDoubleNestedLoop-loop-1

GoTo :EOF

