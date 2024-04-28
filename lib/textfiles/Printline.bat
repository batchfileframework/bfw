
REM ::Usage Call :Printline Filename LineNumber 
:Printline
Call :SetIfNotDefined "%~1" _Printline_Filename "%~2" _Printline_LineNumber 0 _Printline_Index
set /a "_Printline_LineNumber-=1"
if %_Printline_LineNumber% GTR 0 set "_Printline_skip=skip=%_Printline_LineNumber%" 
for /f "%_Printline_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_Printline_Filename%"') do (
	echo %%b
	GoTo :Printline-end
)
:Printline-end
Call :ClearVariablesByPrefix _Printline
GoTo :EOF

REM ::This old version can't print empty lines
REM ::Usage Call :Printline Filename LineNumber 
REM :Printline
REM Call :SetIfNotDefined "%~1" _Printline_Filename "%~2" _Printline_LineNumber 0 _Printline_Index
REM set /a "_Printline_LineNumber-=1"
REM if %_Printline_LineNumber% GTR 0 set "_Printline_skip=skip=%_Printline_LineNumber%" 
REM for /f "%_Printline_skip% delims=" %%a in (%_Printline_Filename%) do (
    REM echo %%a
	REM GoTo :Printline-end
REM )
REM :Printline-end
REM Call :ClearVariablesByPrefix _Printline
REM GoTo :EOF
