
:: Default configuration 
:: Will escape space, quotes, exclamation, percent, special characters (& < > ^ |) and delimiters ()
:: but not backets (( ) [ ] { }) or extra delimiters (' + ` ~ @)
::Usage Call :AddEscapeCharacters byref InputString optional OutputString
:AddEscapeCharacters
set "_AddEscapeCharacters_prefix=_AEC"
Call :SetIfNotDefined "%~1" _AEC_input "%~2" _AEC_output
Call :SetIfNotDefined "%_AEC_input%" _AEC_output
set "_AEC_special_esclist=^& ^< ^> ^^ ^|"
set "_AEC_delimiter_esclist1=^= ^; ^,"
set "_AEC_regular_escape_char=^^^"
set "_AEC_space_escape_char=^^^"
set "_AEC_quotes_escape_char=^^^"
set "_AEC_percent_escape_char=%%"
set "_AEC_exclamation_escape_char=^^^"
:AddEscapeCharacters-arguments
if "[%~3]" EQU "[NOLEN]" set "_AEC_nolen=true"
if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char=^"
REM if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char="
if "[%~3]" EQU "[NOTQUOTES]" set "_AEC_quotes_escape_char=^"
if "[%~3]" EQU "[NOTEXCLAMATION]" set "_AEC_exclamation_escape_char=^^"
if "[%~3]" EQU "[NOTPERCENT]" set "_AEC_percent_escape_char=%"
if "[%~3]" EQU "[NOTSPECIAL]" set "_AEC_special_esclist="
if "[%~3]" EQU "[BRACKETS]" set "_AEC_bracket_esclist=^( ^) ^[ ^] ^{ ^}"
if "[%~3]" EQU "[NOTDELIMITERS]" set "_AEC_delimiter_esclist="
if "[%~3]" EQU "[EXTDELIMITERS]" set "_AEC_extdelimiter_esclist=^' ^+ ^` ^~ ^@"
if "[%~3]" EQU "[NOTLASTDIGIT]" set "_AEC_notlastdigit=true"
if "[%~4]" NEQ "[]" ( shift & GoTo :AddEscapeCharacters-arguments )
set "_AEC_escape_list=%_AEC_special_esclist% %_AEC_bracket_esclist% %_AEC_delimiter_esclist% %_AEC_extdelimiter_esclist%"
set /a "_AEC_input.index=0" & set /a "_AEC_output.escapechars=0" & set /a "_AEC_output.totalchars=0"
setlocal enabledelayedexpansion
:AddEscapeCharacters-loop
set "_AEC_escapechar=" & set "_AEC_input_char=!%_AEC_input%:~%_AEC_input.index%,1!"
for %%a in ( %_AEC_escape_list% ) do ( if ^!_AEC_input_char!==%%a ( set "_AEC_escapechar=!_AEC_regular_escape_char!" ) )
if "!_AEC_input_char!"==" " set "_AEC_escapechar=!_AEC_space_escape_char!"
if "!_AEC_input_char!"==^"^"^" set "_AEC_escapechar=!_AEC_quotes_escape_char!"
if "!_AEC_input_char!"=="^!" set "_AEC_escapechar=!_AEC_exclamation_escape_char!"
if "!_AEC_input_char!"=="%%" set "_AEC_escapechar=!_AEC_percent_escape_char!"
set _AEC_intermediate=!_AEC_intermediate!!_AEC_escapechar!!_AEC_input_char!
set /a "_AEC_input.index+=1"
if "[!_AEC_escapechar!]" NEQ "[]" set /a "_AEC_output.escapechars+=1"
set /a "_AEC_output.totalchars=!_AEC_input.index!+!_AEC_output.escapechars!"
if !_AEC_output.totalchars! LSS 8030 if "!%_AEC_input%:~%_AEC_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
set "_AEC_last_char=!_AEC_intermediate:~-1!"
if "[%_AEC_notlastdigit%]" NEQ ["true"] for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_AEC_last_char!]"=="[%%a]" ( set /a "_AEC_input.escapechars+=1" & set /a "_AEC_output.totalchars+=1" & set _AEC_intermediate=!_AEC_intermediate:~,-1!^^^%%a) )
REM set _AEC_intermediate
endlocal & set /a "%_AEC_output%.len=%_AEC_input.index%" & set /a "%_AEC_output%.totallen=%_AEC_output.totalchars%" & set /a "%_AEC_output%.lenesc=%_AEC_output.escapechars%" & set %_AEC_output%=%_AEC_intermediate%
if "[%_AEC_nolen%]" EQU "[true]" set "%_AEC_output%.len=" & set "%_AEC_output%.totallen=" & set "%_AEC_output%.lenesc="
Call :ClearVariablesByPrefix %_AddEscapeCharacters_prefix% _AddEscapeCharacters
GoTo :EOF



























REM ::Usage Call :lenByRef OutputResult %VariableName%
REM :: 8172 max lenght, breaks batch file if len=8173 WRONG
REM :lenByVal
REM setlocal enabledelayedexpansion
REM set _len=%~2
REM GoTo :len-skip-preamble
REM ::Usage Call :len OutputResult VariableName
REM :: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
REM :len
REM setlocal enabledelayedexpansion
REM echo beforesetlen
REM set _len=!%~2!
REM echo aftersetlen
REM :len-skip-preamble
REM if not defined _len set /a "_len.count=0" GoTo :len-end
REM set /a "_len.count=1"
REM if "!_len:~4096,1!" NEQ "" set /a "_len.count+=4096" & set _len=!_len:~4096!
REM if "!_len:~2048,1!" NEQ "" set /a "_len.count+=2048" & set _len=!_len:~2048!
REM if "!_len:~1024,1!" NEQ "" set /a "_len.count+=1024" & set _len=!_len:~1024!
REM if "!_len:~512,1!" NEQ "" set /a "_len.count+=512" & set _len=!_len:~512!
REM if "!_len:~256,1!" NEQ "" set /a "_len.count+=256" & set _len=!_len:~256!
REM if "!_len:~128,1!" NEQ "" set /a "_len.count+=128" & set _len=!_len:~128!
REM if "!_len:~64,1!" NEQ "" set /a "_len.count+=64" & set _len=!_len:~64!
REM if "!_len:~32,1!" NEQ "" set /a "_len.count+=32" & set _len=!_len:~32!
REM if "!_len:~16,1!" NEQ "" set /a "_len.count+=16" & set _len=!_len:~16!
REM if "!_len:~8,1!" NEQ ""  set /a "_len.count+=8" & set _len=!_len:~8!
REM if "!_len:~4,1!" NEQ ""  set /a "_len.count+=4" & set _len=!_len:~4!
REM if "!_len:~2,1!" NEQ ""  set /a "_len.count+=2" & set _len=!_len:~2!
REM if "!_len:~1,1!" NEQ ""  set /a "_len.count+=1" & set _len=!_len:~1!
REM :len-end
REM endlocal & set "_len=" & set /a "%~1=%_len.count%" & exit /b %_len.count%


:: Default configuration 
:: Will escape space, quotes, exclamation, percent, special characters (& < > ^ |) and delimiters ()
:: but not backets (( ) [ ] { }) or extra delimiters (' + ` ~ @)
::Usage Call :AddEscapeCharacters byref InputString optional OutputString
:AddEscapeCharacters
set "_AddEscapeCharacters_prefix=_AEC"
Call :SetIfNotDefined "%~1" _AEC_input "%~2" _AEC_output
Call :SetIfNotDefined "%_AEC_input%" _AEC_output
set "_AEC_special_esclist=^& ^< ^> ^^ ^|"
set "_AEC_delimiter_esclist1=^= ^; ^,"
set "_AEC_regular_escape_char=^^^"
set "_AEC_space_escape_char=^^^"
set "_AEC_quotes_escape_char=^^^"
set "_AEC_percent_escape_char=%%"
set "_AEC_exclamation_escape_char=^^^"
:AddEscapeCharacters-arguments
if "[%~3]" EQU "[NOLEN]" set "_AEC_nolen=true"
if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char=^"
REM if "[%~3]" EQU "[NOTSPACE]" set "_AEC_space_escape_char="
if "[%~3]" EQU "[NOTQUOTES]" set "_AEC_quotes_escape_char=^"
if "[%~3]" EQU "[NOTEXCLAMATION]" set "_AEC_exclamation_escape_char=^^"
if "[%~3]" EQU "[NOTPERCENT]" set "_AEC_percent_escape_char=%"
if "[%~3]" EQU "[NOTSPECIAL]" set "_AEC_special_esclist="
if "[%~3]" EQU "[BRACKETS]" set "_AEC_bracket_esclist=^( ^) ^[ ^] ^{ ^}"
if "[%~3]" EQU "[NOTDELIMITERS]" set "_AEC_delimiter_esclist="
if "[%~3]" EQU "[EXTDELIMITERS]" set "_AEC_extdelimiter_esclist=^' ^+ ^` ^~ ^@"
if "[%~3]" EQU "[NOTLASTDIGIT]" set "_AEC_notlastdigit=true"
if "[%~4]" NEQ "[]" ( shift & GoTo :AddEscapeCharacters-arguments )
set "_AEC_escape_list=%_AEC_special_esclist% %_AEC_bracket_esclist% %_AEC_delimiter_esclist% %_AEC_extdelimiter_esclist%"
set /a "_AEC_input.index=0" & set /a "_AEC_output.escapechars=0" & set /a "_AEC_output.totalchars=0"
setlocal enabledelayedexpansion
:AddEscapeCharacters-loop
set "_AEC_escapechar=" & set "_AEC_input_char=!%_AEC_input%:~%_AEC_input.index%,1!"
for %%a in ( %_AEC_escape_list% ) do ( if ^!_AEC_input_char!==%%a ( set "_AEC_escapechar=!_AEC_regular_escape_char!" ) )
if "!_AEC_input_char!"==" " set "_AEC_escapechar=!_AEC_space_escape_char!"
if "!_AEC_input_char!"==^"^"^" set "_AEC_escapechar=!_AEC_quotes_escape_char!"
if "!_AEC_input_char!"=="^!" set "_AEC_escapechar=!_AEC_exclamation_escape_char!"
if "!_AEC_input_char!"=="%%" set "_AEC_escapechar=!_AEC_percent_escape_char!"
set _AEC_intermediate=!_AEC_intermediate!!_AEC_escapechar!!_AEC_input_char!
set /a "_AEC_input.index+=1"
if "[!_AEC_escapechar!]" NEQ "[]" set /a "_AEC_output.escapechars+=1"
set /a "_AEC_output.totalchars=!_AEC_input.index!+!_AEC_output.escapechars!"
if !_AEC_output.totalchars! LSS 8030 if "!%_AEC_input%:~%_AEC_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
set "_AEC_last_char=!_AEC_intermediate:~-1!"
if "[%_AEC_notlastdigit%]" NEQ ["true"] for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_AEC_last_char!]"=="[%%a]" ( set /a "_AEC_input.escapechars+=1" & set /a "_AEC_output.totalchars+=1" & set _AEC_intermediate=!_AEC_intermediate:~,-1!^^^%%a) )
REM set _AEC_intermediate
endlocal & set /a "%_AEC_output%.len=%_AEC_input.index%" & set /a "%_AEC_output%.totallen=%_AEC_output.totalchars%" & set /a "%_AEC_output%.lenesc=%_AEC_output.escapechars%" & set %_AEC_output%=%_AEC_intermediate%
if "[%_AEC_nolen%]" EQU "[true]" set "%_AEC_output%.len=" & set "%_AEC_output%.totallen=" & set "%_AEC_output%.lenesc="
Call :ClearVariablesByPrefix %_AddEscapeCharacters_prefix% _AddEscapeCharacters
GoTo :EOF



























REM ::Usage Call :lenByRef OutputResult %VariableName%
REM :: 8172 max lenght, breaks batch file if len=8173 WRONG
REM :lenByVal
REM setlocal enabledelayedexpansion
REM set _len=%~2
REM GoTo :len-skip-preamble
REM ::Usage Call :len OutputResult VariableName
REM :: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
REM :len
REM setlocal enabledelayedexpansion
REM echo beforesetlen
REM set _len=!%~2!
REM echo aftersetlen
REM :len-skip-preamble
REM if not defined _len set /a "_len.count=0" GoTo :len-end
REM set /a "_len.count=1"
REM if "!_len:~4096,1!" NEQ "" set /a "_len.count+=4096" & set _len=!_len:~4096!
REM if "!_len:~2048,1!" NEQ "" set /a "_len.count+=2048" & set _len=!_len:~2048!
REM if "!_len:~1024,1!" NEQ "" set /a "_len.count+=1024" & set _len=!_len:~1024!
REM if "!_len:~512,1!" NEQ "" set /a "_len.count+=512" & set _len=!_len:~512!
REM if "!_len:~256,1!" NEQ "" set /a "_len.count+=256" & set _len=!_len:~256!
REM if "!_len:~128,1!" NEQ "" set /a "_len.count+=128" & set _len=!_len:~128!
REM if "!_len:~64,1!" NEQ "" set /a "_len.count+=64" & set _len=!_len:~64!
REM if "!_len:~32,1!" NEQ "" set /a "_len.count+=32" & set _len=!_len:~32!
REM if "!_len:~16,1!" NEQ "" set /a "_len.count+=16" & set _len=!_len:~16!
REM if "!_len:~8,1!" NEQ ""  set /a "_len.count+=8" & set _len=!_len:~8!
REM if "!_len:~4,1!" NEQ ""  set /a "_len.count+=4" & set _len=!_len:~4!
REM if "!_len:~2,1!" NEQ ""  set /a "_len.count+=2" & set _len=!_len:~2!
REM if "!_len:~1,1!" NEQ ""  set /a "_len.count+=1" & set _len=!_len:~1!
REM :len-end
REM endlocal & set "_len=" & set /a "%~1=%_len.count%" & exit /b %_len.count%

