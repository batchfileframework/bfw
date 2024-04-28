
::Usage Call :RemoveArrayElement ArrayToRemoveElementFrom ElementNumber
::This function will remove the Nth element from an array, including all suffixes, 
::and then pull back all values to fill in the empty index
:RemoveArrayElement
Call :ClearVariablesByPrefix _RemoveArrayElement
set "_RemoveArrayElement_array=%~1"
set "_RemoveArrayElement_index=%~2"
REM call echo Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
REM echo _RemoveArrayElement_ElementIsNumeric %_RemoveArrayElement_ElementIsNumeric%
set "_RemoveArrayElement_ElementDeleted=false"
REM This for loop deleted the specified array element
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
    set "_RemoveArrayElement_ElementDeleted=true"
	set "%%a="
)
if not "[%_RemoveArrayElement_ElementIsNumeric%]"=="[true]" GoTo :RemoveArrayElement-end
set /a "_RemoveArrayElement_next_index=%_RemoveArrayElement_index%"
REM If the specified element was numeric, move over the next value to empty index
:RemoveArrayElement-internal-loop
set /a _RemoveArrayElement_next_index+=1
set "_token=" & set "_RemoveArrayElement_ElementCopied=false"
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%] 2^>NUL') do (
	set "_RemoveArrayElement_ElementCopied=true"
	call set "_token=%%a"
	call set "%%_token:%_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%]=%_RemoveArrayElement_array%[%_RemoveArrayElement_index%]%%=%%b"
)
REM Repeat for every array element until we find an empty index
if "[%_RemoveArrayElement_ElementCopied%]"=="[true]" set /a "_RemoveArrayElement_index=%_RemoveArrayElement_next_index%" & GoTo :RemoveArrayElement-internal-loop
REM Erase last index which is a duplicate of the second to last one
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
	set "%%a="
)
set /a _RemoveArrayElement_index-=1
set /a "%_RemoveArrayElement_array%.ubound-=1" 2>NUL
set /a "%_RemoveArrayElement_array%.count-=1" 2>NUL
:RemoveArrayElement-end
Call :ClearVariablesByPrefix _RemoveArrayElement
GoTo :EOF

