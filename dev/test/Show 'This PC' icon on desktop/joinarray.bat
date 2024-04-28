
::Usage Call :joinarray OutputArray InputArray1 InputArray2 InputArrayN
:joinarray

:startwith
:endwith


::Usage Call :ltrim OutputVariable Input
:ltrim
setlocal enabledelayedexpansion
set "TAB=	"
set "_ltrim_output=%~1"
set "_ltrim_input=%~2"
if defined %~2 ( set "_ltrim_input=!%~2!" ) 
set /a "_ltrim_index=0"
:ltrim-loop
set "_ltrim_char=!_ltrim_input:~%_ltrim_index%,1!
if "[!_ltrim_char!]" EQU "[%TAB%]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
if "[!_ltrim_char!]" EQU "[ ]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
set _ltrim_intermediate=!_ltrim_input:~%_ltrim_index%!
endlocal & set %_ltrim_output%=%_ltrim_intermediate%
GoTo :EOF

