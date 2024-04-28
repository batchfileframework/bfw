
::Usage Call :ReadLineRange Filename StartLine StopLine LineArray
:ReadLineRange
set "_ReadLineRange_prefix=_RLR"
Call :SetIfNotDefined "%~1" _RLR_Filename "%~2" _RLR_StartLine "%~3" _RLR_StopLine "%~4" _RLR_OutputLineArray "%%%~4.ubound%%" _RLR_OutputLineArray.ubound
if "[%_RLR_OutputLineArray.ubound%]" EQU "[]" set "_RLR_OutputArrayWasEmpty=true"
Call :SetIfNotDefined -1 _RLR_OutputLineArray.ubound
set /a "_RLR_endbound=%_RLR_OutputLineArray.ubound%+%_RLR_StopLine%-%_RLR_StartLine%"
set /a "_RLR_StartLine-=1"
:ReadLineRange-loop
set /a "_RLR_OutputLineArray.ubound+=1"
if %_RLR_StartLine% GTR 0 set "_RLR_skip=skip=%_RLR_StartLine%" 
for /f "%_RLR_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_RLR_Filename%"') do (
		set %_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]=%%b
		GoTo :ReadLineRange-end
)
set /a "_RLR_OutputLineArray.ubound-=1"
:ReadLineRange-end
set /a "_RLR_StartLine+=1"
if %_RLR_OutputLineArray.ubound% LEQ %_RLR_endbound% GoTo :ReadLineRange-loop
set /a "%_RLR_OutputLineArray%.ubound=%_RLR_OutputLineArray.ubound%"
if "[%_RLR_OutputArrayWasEmpty%]" EQU "[true]" if "[%_RLR_OutputLineArray.ubound%]" EQU "[-1]" set "%_RLR_OutputLineArray%.ubound="
Call :ClearVariablesByPrefix %_ReadLineRange_prefix% _ReadLineRange
GoTo :EOF

REM ::Usage Call :ReadLineRange Filename StartLine StopLine LineArray
REM :ReadLineRange
REM set "_ReadLineRange_prefix=_RLR"
REM Call :SetIfNotDefined "%~1" _RLR_Filename "%~2" _RLR_StartLine "%~3" _RLR_StopLine "%~4" _RLR_OutputLineArray "%%%~4.ubound%%" _RLR_OutputLineArray.ubound
REM Call :SetIfNotDefined -1 _RLR_OutputLineArray.ubound
REM set /a "_RLR_count=%_RLR_StopLine%-%_RLR_StartLine%"
REM set /a "_RLR_endbound=%_RLR_OutputLineArray.ubound%+%_RLR_count%"
REM set _RLR
REM set _RLR_NextOutputValue=%_RLR_OutputLineArray%[-999]
REM if %_RLR_StartLine% GTR 0 set "_RLR_skip=skip=%_RLR_StartLine%" 
REM for /f "%_RLR_skip% delims=" %%a in (%_RLR_Filename%) do (
REM		echo found row test %%a
REM		REM set /a "_RLR_OutputLineArray.ubound+=1"
REM		call set /a "_RLR_OutputLineArray.ubound+=1"
REM		echo set _RLR_NextOutputValue=%_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]
REM		REM set _RLR_NextOutputValue=%_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]
REM		call set _RLR_NextOutputValue=%_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]
REM		echo _RLR_NextOutputValue %_RLR_NextOutputValue%
REM		call echo _RLR_NextOutputValue %_RLR_NextOutputValue%
REM		REM set %_RLR_OutputLineArray%[%_RLR_OutputLineArray.ubound%]=%%a
REM		set %_RLR_NextOutputValue%=%%a
REM )
REM		if %_RLR_OutputLineArray.ubound% GEQ %_RLR_endbound% GoTo :ReadLineRange-end
REM :ReadLineRange-end
REM REM set /a "%_RLR_OutputLineArray%.ubound=%_RLR_OutputLineArray.ubound%"
REM GoTo :EOF
