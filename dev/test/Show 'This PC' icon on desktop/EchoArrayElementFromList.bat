
REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
:: Set _EchoArrayElementFromListPrefix to insert text 
:: Usage Call :EchoArrayElementFromList ElementList ArrayForOutput optional Suffix1 Suffix2 ... SuffixN'both array must have .ubound set
:EchoArrayElementFromList
set "_EchoArrayElementFromList_ElementList=%~1"
set "_EchoArrayElementFromList_ArrayForOutput=%~2"
set /a _EchoArrayElementFromList_SuffixList.index=-1
if "[%~3]"=="[]" GoTo :EchoArrayElementFromList-fill-suffix-list-skip
:EchoArrayElementFromList-fill-suffix-list
set /a _EchoArrayElementFromList_SuffixList.index+=1
if not "[%~3]"=="[]" set "_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]=%~3"
shift
if not "[%~3]"=="[]" GoTo :EchoArrayElementFromList-fill-suffix-list
set /a _EchoArrayElementFromList_SuffixList.ubound=%_EchoArrayElementFromList_SuffixList.index%
:EchoArrayElementFromList-fill-suffix-list-skip
call set /a _EchoArrayElementFromList.ElementList.ubound=%%%_EchoArrayElementFromList_ElementList%.ubound%%
set /a _EchoArrayElementFromList.index=0
:EchoArrayElementFromList-ElementList-loop
set /a _EchoArrayElementFromList_SuffixList.index=0
:EchoArrayElementFromList-SuffixList-loop
REM call call echo %%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%
REM echo %_EchoArrayElementFromListPrefix%%%%%%_EchoArrayElementFromList_ArrayForOutput%[%%%_EchoArrayElementFromList_ElementList%[%_EchoArrayElementFromList.index%]%%]%%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%%%%%
call call echo %_EchoArrayElementFromListPrefix%%%%%%_EchoArrayElementFromList_ArrayForOutput%[%%%_EchoArrayElementFromList_ElementList%[%_EchoArrayElementFromList.index%]%%]%%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%%%%%
set /a _EchoArrayElementFromList_SuffixList.index+=1
if "[%_EchoArrayElementFromList_SuffixList.ubound%]"=="[]" GoTo :EchoArrayElementFromList-SuffixList-loop-skip
if %_EchoArrayElementFromList_SuffixList.index% LEQ %_EchoArrayElementFromList_SuffixList.ubound% GoTo :EchoArrayElementFromList-SuffixList-loop
:EchoArrayElementFromList-SuffixList-loop-skip
set /a _EchoArrayElementFromList.index+=1
if %_EchoArrayElementFromList.index% LEQ %_EchoArrayElementFromList.ElementList.ubound% GoTo :EchoArrayElementFromList-ElementList-loop
Call :ClearVariablesByPrefix _EchoArrayElementFromList
GoTo :EOF

