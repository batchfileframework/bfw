
::Usage Call :ListSpecialCharactersInString byref InputVariable byref optional OutputArray optional SILENT
:ListSpecialCharactersInString
set "_ListSpecialCharactersInString_char="
if "[%~2]" NEQ "[]" Call :GetArrayParameters %~2 _ListSpecialCharactersInString_OutputArray Initialize -1
REM if "[%~2]" NEQ "[]" echo _ListSpecialCharactersInString_OutputArray %~2 %_ListSpecialCharactersInString_OutputArray%
REM if "[%~2]" NEQ "[]" set _ListSpecialCharactersInString_OutputArray
if "[%~3]" EQU "[SILENT]" ( set "_ListSpecialCharactersInString_silent=true" ) else ( set "_ListSpecialCharactersInString_silent=false" )
set /a "_ListSpecialCharactersInString_index=0"
setlocal enabledelayedexpansion
:ListSpecialCharactersInString-loop
set "_ListSpecialCharactersInString_char=!%~1:~%_ListSpecialCharactersInString_index%,1!"

	if !_ListSpecialCharactersInString_char!==%% ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character %% at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=percentsign"
	) else if !_ListSpecialCharactersInString_char!==^" ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character " at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=doublequotes"
	) else if !_ListSpecialCharactersInString_char!==^& ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^& at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=ampersand"
	) else if !_ListSpecialCharactersInString_char!==^< ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^< at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=lessthan"
	) else if !_ListSpecialCharactersInString_char!==^> ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^> at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=greaterthan"
	) else if !_ListSpecialCharactersInString_char!==^^ ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^^ at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=carret"
	) else if !_ListSpecialCharactersInString_char!==^| ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^| at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=pipe"
	) else ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Normal character else !_ListSpecialCharactersInString_char! at index !_ListSpecialCharactersInString_index!
	)

endlocal & set "_ListSpecialCharactersInString_current_type=%_ListSpecialCharactersInString_current_type%"
if "[%_ListSpecialCharactersInString_current_type%]" NEQ "[]" set /a "_ListSpecialCharactersInString_OutputArray.ubound+=1" 
if "[%_ListSpecialCharactersInString_current_type%]" NEQ "[]" set "%_ListSpecialCharactersInString_OutputArray%[%_ListSpecialCharactersInString_OutputArray.ubound%]=%_ListSpecialCharactersInString_index%" & set "%_ListSpecialCharactersInString_OutputArray%[%_ListSpecialCharactersInString_OutputArray.ubound%].type=%_ListSpecialCharactersInString_current_type%"
set "_ListSpecialCharactersInString_current_type="
set /a "_ListSpecialCharactersInString_index+=1"
setlocal enabledelayedexpansion
if "!%~1:~%_ListSpecialCharactersInString_index%,1!" NEQ "" GoTo :ListSpecialCharactersInString-loop
endlocal 

Call :SetArrayParameters "%_ListSpecialCharactersInString_OutputArray%" _ListSpecialCharactersInString_OutputArray
Call :ClearVariablesByPrefix _ListSpecialCharactersInString
GoTo :EOF

