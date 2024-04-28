
::Usage Call :IsLabel Output Input
:IsLabel
setlocal enabledelayedexpansion
set "TAB=	"
set "_IsLabel_Output=%~1"
set _IsLabel_Input=%~2
set /a "_IsLabel_index=0"
REM set _islabel
:IsLabel-loop
set "_IsLabel_char=!_IsLabel_Input:~%_IsLabel_index%,1!
REM echo current char is i!_IsLabel_char!i name %_IsLabel_labelname%
if "[!_IsLabel_char!]" EQU "[]" GoTo :IsLabel-end
if "[!_IsLabel_char!]" EQU "[%TAB%]" ( if "[%_IsLabel_result%]" NEQ "[true]" ( set /a "_IsLabel_index+=1" & GoTo :IsLabel-loop ) else ( GoTo :IsLabel-end ) )
if "[!_IsLabel_char!]" EQU "[ ]" ( if "[%_IsLabel_result%]" NEQ "[true]" ( set /a "_IsLabel_index+=1" & GoTo :IsLabel-loop ) else ( GoTo :IsLabel-end ) )
if "[!_IsLabel_char!]" EQU "[:]" ( if "[%_IsLabel_result%]" NEQ "[true]" ( set /a "_IsLabel_index+=1" & set "_IsLabel_result=true" & GoTo :IsLabel-loop ) else ( GoTo :IsLabel-end ) )
if "[%_IsLabel_result%]" EQU "[true]" ( set /a "_IsLabel_index+=1" & set "_IsLabel_labelname=%_IsLabel_labelname%!_IsLabel_char!" & GoTo :IsLabel-loop )
REM echo ending loop  current char is !_IsLabel_char! name %_IsLabel_labelname% islabel %_IsLabel_result%
:IsLabel-end
if "[%_IsLabel_labelname%]" NEQ "[]" ( set "_IsLabel_result=0" ) else ( set "_IsLabel_result=1" )
echo result %_IsLabel_result% name %_IsLabel_labelname%
endlocal & set "%_IsLabel_Output%=%_IsLabel_labelname%" & exit /b %_IsLabel_result%

