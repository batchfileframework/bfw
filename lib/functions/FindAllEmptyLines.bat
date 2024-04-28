
::Usage Call :FindAllEmptyLines Filename EmptyLinesArray
:FindAllEmptyLines

for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%~1"') do ( if "[%%b]" EQU "[]" echo line %%a is empty )

GoTo :EOF
