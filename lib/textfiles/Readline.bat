
::Usage Call :Readline Filename LineNumber OutputVariable
:Readline
Call :SetIfNotDefined "%~1" _Readline_Filename "%~2" _Readline_LineNumber "%~3" _Readline_Output 0 _Readline_Index
set /a "_Readline_LineNumber-=1"
set "%_Readline_Output%="
if %_Readline_LineNumber% GTR 0 set "_ReadLine_skip=skip=%_Readline_LineNumber%" 
for /f "%_ReadLine_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_Readline_Filename%"') do (
		set %_Readline_Output%=%%b
		REM set %_Readline_Output%=%%b
		GoTo :Readline-end
)
:Readline-end
Call :ClearVariablesByPrefix _Readline
GoTo :EOF

REM ::This old version can't return empty lines
REM ::Usage Call :Readline Filename LineNumber OutputVariable
REM :Readline
REM Call :SetIfNotDefined "%~1" _Readline_Filename "%~2" _Readline_LineNumber "%~3" _Readline_Output 0 _Readline_Index
REM set /a "_Readline_LineNumber-=1"
REM if %_Readline_LineNumber% GTR 0 set "_ReadLine_skip=skip=%_Readline_LineNumber%" 
REM for /f "%_ReadLine_skip% delims=" %%a in (%_Readline_Filename%) do (
		REM set "%_Readline_Output%=%%a"
		REM REM set %_Readline_Output%=%%a
		REM GoTo :Readline-end
REM )
REM :Readline-end
REM Call :ClearVariablesByPrefix _Readline
REM GoTo :EOF
