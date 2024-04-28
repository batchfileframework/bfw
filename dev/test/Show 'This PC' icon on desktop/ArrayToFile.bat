
:ArrayToFile byref InputArray OutputFile
Call :GetArrayParameters %~1 _ArrayToFile_input "" 0
set _ArrayToFile_input 
:ArrayToFile-loop
call echo %%%_ArrayToFile_input%[%_ArrayToFile_input.index%]%%>>%~2
set /a _ArrayToFile_input.index+=1
if %_ArrayToFile_input.index% leq %_ArrayToFile_input.ubound% GoTo :ArrayToFile-loop
GoTo :EOF

