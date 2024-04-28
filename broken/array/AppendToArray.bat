
:AppendToArray

:AddLabelToList
:AddEmptyLineToList
:AddFunctionEndToList
:AddFunctionCallToList
:AddGoToToList

REM for reference only
REM ::Usage Call :ltrim OutputVariable Input
REM :ltrim
REM setlocal enabledelayedexpansion
REM set "TAB=	"
REM set "_ltrim_output=%~1"
REM set "_ltrim_input=%~2"
REM if defined %~2 ( set "_ltrim_input=!%~2!" ) 
REM set /a "_ltrim_index=0"
REM :ltrim-loop
REM set "_ltrim_char=!_ltrim_input:~%_ltrim_index%,1!
REM if "[!_ltrim_char!]" EQU "[%TAB%]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
REM if "[!_ltrim_char!]" EQU "[ ]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
REM set _ltrim_intermediate=!_ltrim_input:~%_ltrim_index%!
REM endlocal & set %_ltrim_output%=%_ltrim_intermediate%
REM GoTo :EOF


:AppendToArray

:AddLabelToList
:AddEmptyLineToList
:AddFunctionEndToList
:AddFunctionCallToList
:AddGoToToList

REM for reference only
REM ::Usage Call :ltrim OutputVariable Input
REM :ltrim
REM setlocal enabledelayedexpansion
REM set "TAB=	"
REM set "_ltrim_output=%~1"
REM set "_ltrim_input=%~2"
REM if defined %~2 ( set "_ltrim_input=!%~2!" ) 
REM set /a "_ltrim_index=0"
REM :ltrim-loop
REM set "_ltrim_char=!_ltrim_input:~%_ltrim_index%,1!
REM if "[!_ltrim_char!]" EQU "[%TAB%]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
REM if "[!_ltrim_char!]" EQU "[ ]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
REM set _ltrim_intermediate=!_ltrim_input:~%_ltrim_index%!
REM endlocal & set %_ltrim_output%=%_ltrim_intermediate%
REM GoTo :EOF

