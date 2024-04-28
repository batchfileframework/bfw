
::Usage Call :ListUnescapedSpecialCharactersInString byref InputVariable byref optional OutputArray optional SILENT
:ListUnescapedSpecialCharactersInString
Call :ClearVariablesByPrefix _ListUnescapedSpecialCharactersInString
if "[%~2]" NEQ "[]" Call :GetArrayParameters %~2 _ListUnescapedSpecialCharactersInString_OutputArray Initialize -1
if "[%~3]" EQU "[SILENT]" ( set "_ListUnescapedSpecialCharactersInString_silent=true" ) else ( set "_ListUnescapedSpecialCharactersInString_silent=false" )
set /a "_ListUnescapedSpecialCharactersInString_previous_index=-1"
set /a "_ListUnescapedSpecialCharactersInString_index=0"
set /a "_ListUnescapedSpecialCharactersInString_next_index=1"
set "_ListUnescapedSpecialCharactersInString_quote_state=unquoted"
set /a "_ListUnescapedSpecialCharactersInString_quote_count=0"
setlocal enabledelayedexpansion
:ListUnescapedSpecialCharactersInString-loop
set "_ListUnescapedSpecialCharactersInString_previous_char=" & set "_ListUnescapedSpecialCharactersInString_next_char=" & set "_ListUnescapedSpecialCharactersInString_char="
if %_ListUnescapedSpecialCharactersInString_previous_index% GEQ 0 set "_ListUnescapedSpecialCharactersInString_previous_char=!%~1:~%_ListUnescapedSpecialCharactersInString_previous_index%,1!"
set "_ListUnescapedSpecialCharactersInString_char=!%~1:~%_ListUnescapedSpecialCharactersInString_index%,1!"
set "_ListUnescapedSpecialCharactersInString_next_char=!%~1:~%_ListUnescapedSpecialCharactersInString_next_index%,1!"
set "_ListUnescapedSpecialCharactersInString_escaped=false"
set "_ListUnescapedSpecialCharactersInString_prev_type="
set "_ListUnescapedSpecialCharactersInString_next_type="
set "_ListUnescapedSpecialCharactersInString_current_type="

if !_ListUnescapedSpecialCharactersInString_previous_char!==%% ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=percentsign"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^" ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=doublequotes"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^& ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=ampersand"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^< ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=lessthan"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^> ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=greaterthan"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^^ ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=carret"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^| ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=pipe"
) else ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=else"
)


if !_ListUnescapedSpecialCharactersInString_next_char!==%% ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=percentsign"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^" ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=doublequotes"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^& ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=ampersand"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^< ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=lessthan"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^> ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=greaterthan"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^^ ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=carret"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^| ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=pipe"
) else ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=else"
)


if !_ListUnescapedSpecialCharactersInString_char!==%% ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=percentsign"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[percentsign]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[percentsign]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM Clusters of uneven numbers of percentsigns will look escaped to this logic
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character %% at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^" ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=doublequotes"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^" at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^& (
	set "_ListUnescapedSpecialCharactersInString_current_type=ampersand"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^& at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^< ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=lessthan"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^< at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^> ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=greaterthan"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^> at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^^ ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=carret"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[!_ListUnescapedSpecialCharactersInString_next_type!]" NEQ "[else]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^^ at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^| ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=pipe"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^| at index !_ListUnescapedSpecialCharactersInString_index! )
) else ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=else"
	set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" echo Character does not need escaping !_ListUnescapedSpecialCharactersInString_char! index !_ListUnescapedSpecialCharactersInString_index!
)

if "[!_ListUnescapedSpecialCharactersInString_quote_state!]"=="[quoted]" if "[!_ListUnescapedSpecialCharactersInString_current_type!]" NEQ "[doublequotes]" set "_ListUnescapedSpecialCharactersInString_escaped=true"

REM this logic does not handle uneven numbers of double quotes or percentsigns	
REM in either case, WHERE to add extra percentsign and doublequotes ? Maybe just prefix with carrets ?
endlocal & set "_ListUnescapedSpecialCharactersInString_current_type=%_ListUnescapedSpecialCharactersInString_current_type%" & set "_ListUnescapedSpecialCharactersInString_escaped=%_ListUnescapedSpecialCharactersInString_escaped%" & set "_ListUnescapedSpecialCharactersInString_quote_state=%_ListUnescapedSpecialCharactersInString_quote_state%"
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" NEQ "[else]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set /a "_ListUnescapedSpecialCharactersInString_OutputArray.ubound+=1" 
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" NEQ "[else]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%]=%_ListUnescapedSpecialCharactersInString_index%" & set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%].type=%_ListUnescapedSpecialCharactersInString_current_type%"

if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set /a "_ListUnescapedSpecialCharactersInString_quote_count+=1
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set /a "%_ListUnescapedSpecialCharactersInString_OutputArray%.quotecount=%_ListUnescapedSpecialCharactersInString_quote_count%"
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" if "[%_ListUnescapedSpecialCharactersInString_quote_state%]"=="[unquoted]" ( set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%].quoting=startquote" ) else ( set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%].quoting=endquote" )
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" if "[%_ListUnescapedSpecialCharactersInString_quote_state%]"=="[unquoted]" ( set "_ListUnescapedSpecialCharactersInString_quote_state=quoted" ) else ( set "_ListUnescapedSpecialCharactersInString_quote_state=unquoted" )


set /a "_ListUnescapedSpecialCharactersInString_previous_index+=1"
set /a "_ListUnescapedSpecialCharactersInString_index+=1"
set /a "_ListUnescapedSpecialCharactersInString_next_index+=1"
setlocal enabledelayedexpansion
if "!%~1:~%_ListUnescapedSpecialCharactersInString_index%,1!" NEQ "" GoTo :ListUnescapedSpecialCharactersInString-loop
endlocal 

Call :SetArrayParameters "%_ListUnescapedSpecialCharactersInString_OutputArray%" _ListUnescapedSpecialCharactersInString_OutputArray
Call :ClearVariablesByPrefix _ListUnescapedSpecialCharactersInString
GoTo :EOF

