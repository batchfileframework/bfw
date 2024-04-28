
REM NON WORKING
::Usage Call :InsertEscapeCharacters byref InputVariable
:InsertEscapeCharacters
setlocal enabledelayedexpansion
set "_InsertEscapeCharacters_char="
set /a "_InsertEscapeCharacters_index=0"
:InsertEscapeCharacters-loop
set "_InsertEscapeCharacters_char=!%~1:~%_InsertEscapeCharacters_index%,1!"

	if !_InsertEscapeCharacters_char!==a ( 
		echo it was a index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^" ( 
		echo it was " index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^& ( 
		echo it was ^& index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^< ( 
		echo it was ^< index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^> ( 
		echo it was ^> index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^^ ( 
		echo it was ^^ index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^| ( 
		echo it was ^| index !_InsertEscapeCharacters_index!
		) else ( 
		echo it was else !_InsertEscapeCharacters_char! index !_InsertEscapeCharacters_index!
		)

set /a "_InsertEscapeCharacters_index+=1"
if "!%~1:~%_InsertEscapeCharacters_index%,1!" NEQ "" GoTo :InsertEscapeCharacters-loop
endlocal
GoTo :EOF

