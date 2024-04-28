
::Usage Call :CreateTestArray ArrayName Count Suffixes
:: Will create array ArrayName from element 0 to Count, with all listed suffixes
:: Each array value will contain the element number followed by the suffix name
:CreateTestArray
set "_CreateTestArray_ArrayName=%~1"
set /a _CreateTestArray_ArrayCount=%~2
if "[%~3]"=="[]" (
set /a _CreateTestArray_suffix.index=0
set /a _CreateTestArray_suffix.ubound=0
set "_CreateTestArray_suffix[0]=NOSUFFIX"
GoTo :CreateTestArray-arguments-to-suffix-loop-skip
)
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-arguments-to-suffix-loop
set "_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]=%~3"
set _CreateTestArray_suffix.ubound=%_CreateTestArray_suffix.index%
set /a _CreateTestArray_suffix.index+=1
shift
if not "[%~3]"=="[]" GoTo :CreateTestArray-arguments-to-suffix-loop
:CreateTestArray-arguments-to-suffix-loop-skip
set /a _CreateTestArray_ArrayIndex=0
:CreateTestArray-loop-start
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-suffix-loop
set "_CreateTestArray_suffix.current="
call set "_CreateTestArray_suffix.current=%%_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]%%"
if "[%_CreateTestArray_suffix.current%]"=="[NOSUFFIX]" set "_CreateTestArray_suffix.current="
set "_CreateTestArray_suffix.current.content="
if not "[%_CreateTestArray_suffix.current%]"=="[]" set "_CreateTestArray_suffix.current.content=-%_CreateTestArray_suffix.current%"
set %_CreateTestArray_ArrayName%[%_CreateTestArray_ArrayIndex%]%_CreateTestArray_suffix.current%=%_CreateTestArray_ArrayIndex%%_CreateTestArray_suffix.current.content%
set /a _CreateTestArray_suffix.index+=1
if %_CreateTestArray_suffix.index% LEQ %_CreateTestArray_suffix.ubound% Goto :CreateTestArray-suffix-loop
set /a _CreateTestArray_ArrayIndex+=1
if %_CreateTestArray_ArrayIndex% LEQ %_CreateTestArray_ArrayCount% Goto :CreateTestArray-loop-start
set /a %_CreateTestArray_ArrayName%.count=%_CreateTestArray_ArrayIndex%
set /a _CreateTestArray_ArrayIndex-=1
set /a %_CreateTestArray_ArrayName%.lbound=0
set /a %_CreateTestArray_ArrayName%.ubound=%_CreateTestArray_ArrayIndex%
Call :ClearVariablesByPrefix _CreateTestArray
GoTo :EOF

