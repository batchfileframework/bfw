
::Usage Call :SortNumberString InputNumberString optional OutputNumberString
:SortNumberString


for %%n in (%_NSTA_StringOfNumbers%) do ( set 

REM for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )

REM ::Usage Call :NumberStringToArray StringOfNumbers OutputArray SortOrder
REM :NumberStringToArray
REM set "_NumberStringToArray_prefix=_NSTA"
REM Call :SetIfNotDefined "%~1" _NSTA_StringOfNumbers "%~2" _NSTA_ArrayOfNumber "%~3" _NSTA_SortOrder 0 _NSTA_Index
REM setlocal enabledelayedexpansion
REM set _NSTA_localscope=true & set _NSTA_Index=%_NSTA_Index%
REM for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )
REM set /a "%_NSTA_ArrayOfNumber%.lbound=0" & set /a "%_NSTA_ArrayOfNumber%.ubound=!_NSTA_Index!-1"
REM for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( endlocal & set "%%a" )
REM if defined _NSTA_localscope endlocal
REM Call :ClearVariablesByPrefix "%_NumberStringToArray_prefix%" _NumberStringToArray
REM GoTo :EOF


::Usage Call :SortNumberString InputNumberString optional OutputNumberString
:SortNumberString


for %%n in (%_NSTA_StringOfNumbers%) do ( set 

REM for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )

REM ::Usage Call :NumberStringToArray StringOfNumbers OutputArray SortOrder
REM :NumberStringToArray
REM set "_NumberStringToArray_prefix=_NSTA"
REM Call :SetIfNotDefined "%~1" _NSTA_StringOfNumbers "%~2" _NSTA_ArrayOfNumber "%~3" _NSTA_SortOrder 0 _NSTA_Index
REM setlocal enabledelayedexpansion
REM set _NSTA_localscope=true & set _NSTA_Index=%_NSTA_Index%
REM for %%n in (%_NSTA_StringOfNumbers%) do ( set "%_NSTA_ArrayOfNumber%[!_NSTA_Index!]=%%n" & set /a _NSTA_Index+=1 )
REM set /a "%_NSTA_ArrayOfNumber%.lbound=0" & set /a "%_NSTA_ArrayOfNumber%.ubound=!_NSTA_Index!-1"
REM for /F "delims=" %%a in ('set %_NSTA_ArrayOfNumber% 2^>nul') do ( endlocal & set "%%a" )
REM if defined _NSTA_localscope endlocal
REM Call :ClearVariablesByPrefix "%_NumberStringToArray_prefix%" _NumberStringToArray
REM GoTo :EOF

