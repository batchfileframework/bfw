
::Usage Call :AddEscapeCharacters byref InputString optional OutputString
:AddEscapeCharacters
Call :ClearVariablesByPrefix _AddEscapeCharacters
Call :SetIfNotDefined "%~1" _AddEscapeCharacters_input "%~2" _AddEscapeCharacters_output
Call :SetIfNotDefined "%_AddEscapeCharacters_input%" _AddEscapeCharacters_output
setlocal enabledelayedexpansion
set /a "_AddEscapeCharacters_input.index=0"
set "_AddEscapeCharacters_input.quoted=false"
:AddEscapeCharacters-loop
set "_AddEscapeCharacters_input_char=!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!"
if !_AddEscapeCharacters_input_char!==^" if "[%_AddEscapeCharacters_input.quoted%]"=="[false]" ( set "_AddEscapeCharacters_input.quoted=true" ) else ( set "_AddEscapeCharacters_input.quoted=false" ) 
if !_AddEscapeCharacters_input_char!==%% set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!%%" & GoTo :AddEscapeCharacters-loop-next
for %%a in (^& ^< ^> ^^ ^| ^" ) do ( if ^!_AddEscapeCharacters_input_char!==%%a ( set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^^^^" ) )
set _AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!!_AddEscapeCharacters_input_char!
:AddEscapeCharacters-loop-next
REM echo !_AddEscapeCharacters_intermediate!
set /a "_AddEscapeCharacters_input.index+=1"
if "!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
set "_AddEscapeCharacters_last_char=!_AddEscapeCharacters_intermediate:~-1!"
for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_AddEscapeCharacters_last_char!]"=="[%%a]" set _AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate:~,-1!^%%a )
endlocal & set %_AddEscapeCharacters_output%=%_AddEscapeCharacters_intermediate%
Call :ClearVariablesByPrefix _AddEscapeCharacters
GoTo :EOF


REM ::Usage Call :AddEscapeCharacters byref InputString optional OutputString
REM :AddEscapeCharacters
REM Call :ClearVariablesByPrefix _AddEscapeCharacters
REM Call :SetIfNotDefined "%~1" _AddEscapeCharacters_input "%~2" _AddEscapeCharacters_output
REM Call :SetIfNotDefined "%_AddEscapeCharacters_input%" _AddEscapeCharacters_output
REM setlocal enabledelayedexpansion
REM set /a "_AddEscapeCharacters_input.index=0"
REM set "_AddEscapeCharacters_input.quoted=false"
REM :AddEscapeCharacters-loop
REM set "_AddEscapeCharacters_input_char=!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!"
REM if !_AddEscapeCharacters_input_char!==^" if "[%_AddEscapeCharacters_input.quoted%]"=="[false]" ( set "_AddEscapeCharacters_input.quoted=true" ) else ( set "_AddEscapeCharacters_input.quoted=false" ) 
REM REM set _AddEscapeCharacters
REM if "[!_AddEscapeCharacters_input.quoted!]"=="[false]" (
	REM if !_AddEscapeCharacters_input_char!==%% set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!%%" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^& set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^&" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^< set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^<" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^> set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^>" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^^ set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^^" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^| set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^|" & GoTo :AddEscapeCharacters-loop-next
REM ) else (
	REM if !_AddEscapeCharacters_input_char!==%% set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!%%" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^& set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^&" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^< set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^<" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^> set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^>" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^^ set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^^" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^| set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^|" & GoTo :AddEscapeCharacters-loop-next
REM )
REM set _AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!!_AddEscapeCharacters_input_char!
REM :AddEscapeCharacters-loop-next
REM REM echo !_AddEscapeCharacters_intermediate!
REM set /a "_AddEscapeCharacters_input.index+=1"
REM if "!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
REM endlocal & set "%_AddEscapeCharacters_output%=%_AddEscapeCharacters_intermediate%"
REM Call :ClearVariablesByPrefix _AddEscapeCharacters
REM GoTo :EOF

