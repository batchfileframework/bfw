
REM _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
REM It should be possible to specify the search suffix for ArrayToModify
REM can we match only array element numbers ? Or any content ?
::Usage Call :RemoveValuesFromArray ArrayToRemoveFrom DeleteList1 DeleteList2
:: DeleteLists consist of an array with a series of values to delete from ArrayToModify
:RemoveValuesFromArray
REM Call :ClearVariablesByPrefix _RemoveValuesFromArray REM this would wipe out _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
set "_RemoveValuesFromArray_ArrayToRemoveFrom=%~1"
call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
:RemoveValuesFromArray-Next-DeleteList-loop
set "_RemoveValuesFromArray_DeleteList=%~2"
Call :IsNumeric %%%_RemoveValuesFromArray_DeleteList%.ubound%% _RemoveValuesFromArray_DeleteList.IsArray
if not "[%_RemoveValuesFromArray_DeleteList.IsArray%]"=="[true]" (
	set "_RemoveValuesFromArray_DeleteList.value=%~2"
	set /a _RemoveValuesFromArray_DeleteList.ubound=0
	set /a _RemoveValuesFromArray_ArrayToRemoveFrom.index=0
	GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
)
call set /a _RemoveValuesFromArray_DeleteList.ubound=%%%_RemoveValuesFromArray_DeleteList%.ubound%%
set /a _RemoveValuesFromArray_DeleteList.index=0
:RemoveValuesFromArray-DeleteList-loop
call set "_RemoveValuesFromArray_DeleteList.value=%%%_RemoveValuesFromArray_DeleteList%[%_RemoveValuesFromArray_DeleteList.index%]%%"
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index=0"
:RemoveValuesFromArray-ArrayToRemoveFrom-loop
call set "_RemoveValuesFromArray_ArrayToRemoveFrom.value=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%[%_RemoveValuesFromArray_ArrayToRemoveFrom.index%]%_RemoveValuesFromArray_ArrayToRemoveFrom.suffix%%%"
if "[%_RemoveValuesFromArray_ArrayToRemoveFrom.value%]"=="[%_RemoveValuesFromArray_DeleteList.value%]" (
	Call :RemoveArrayElement %_RemoveValuesFromArray_ArrayToRemoveFrom% %_RemoveValuesFromArray_ArrayToRemoveFrom.index%
	call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
)
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index+=1"
if %_RemoveValuesFromArray_ArrayToRemoveFrom.index% LEQ %_RemoveValuesFromArray_ArrayToRemoveFrom.ubound% GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
set /a _RemoveValuesFromArray_DeleteList.index+=1
if %_RemoveValuesFromArray_DeleteList.index% LEQ %_RemoveValuesFromArray_DeleteList.ubound% GoTo :RemoveValuesFromArray-DeleteList-loop
shift
set "_RemoveValuesFromArray_DeleteList.IsArray="
if not "[%~2]"=="[]" GoTo :RemoveValuesFromArray-Next-DeleteList-loop
Call :ClearVariablesByPrefix _RemoveValuesFromArray
GoTo :EOF

