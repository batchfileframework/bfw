
::Usage Call :NumberStringToArray StringOfNumbers OutputArray SortOrder
:NumberStringToArray
set "_NumberStringToArray_prefix=_NSTA"
Call :SetIfNotDefined "%~1" _NSTA_StringOfNumbers "%~2" _NSTA_ArrayOfNumber "%~3" _NSTA_SortOrder 0 _NSTA_Index
setlocal enabledelayedexpansion
set _NSTA_localscope=true & set _NSTA_Index=%_NSTA_Index%
for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )
set /a "%_NSTA_ArrayOfNumber%.lbound=0" & set /a "%_NSTA_ArrayOfNumber%.ubound=!_NSTA_Index!-1"
for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( endlocal & set "%%a" )
if defined _NSTA_localscope endlocal
Call :ClearVariablesByPrefix "%_NumberStringToArray_prefix%" _NumberStringToArray
GoTo :EOF

