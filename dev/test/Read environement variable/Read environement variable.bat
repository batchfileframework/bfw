@echo off
set output=
Call :GetEnvironmentVariable "myvar" output
echo variable myvar is %output%
GoTo :EOF

::Usage Call :GetEnvironmentVariable VariableName VariableContent
:GetEnvironmentVariable
setlocal enabledelayedexpansion
set _GetEnvironmentVariable1=%~1
echo _GetEnvironmentVariable1 %_GetEnvironmentVariable1%
echo _GetEnvironmentVariable1 !%_GetEnvironmentVariable1%!
set _GetEnvironmentVariable2=!%_GetEnvironmentVariable1%!
echo _GetEnvironmentVariable2 !_GetEnvironmentVariable2!
endlocal & set _GetEnvironmentVariable3=%_GetEnvironmentVariable2%
echo _GetEnvironmentVariable3 %_GetEnvironmentVariable3%
set %2=%_GetEnvironmentVariable3%
GoTo :EOF 



REM @echo off
REM setlocal enabledelayedexpansion
REM set output=
REM Call :GetEnvironmentVariable "myvar" output
REM echo variable myvar is !output!
REM GoTo :EOF

REM ::Usage Call :GetEnvironmentVariable VariableName VariableContent
REM :GetEnvironmentVariable
REM set avar=%~1
REM set var_value=!%avar%!
REM set "%2=!var_value!"
REM GoTo :EOF 
