
:GetLongestLine

REM ::Usage Call :GetLineCount Filename optional LineCount
REM :GetLineCount
REM set "_GetLineCount_prefix=_GLC"
REM Call :SetIfNotDefined "%~1" _GLC_Filename "%~2" _GLC_OutputLineCount
REM set /a "_GLC_LineCount=0"
REM for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLC_Filename%"') do ( set /a "_GLC_LineCount+=1" )
REM if "[%_GLC_OutputLineCount%]" NEQ "[]" set /a "%_GLC_OutputLineCount%=%_GLC_LineCount%"
REM Call :ClearVariablesByPrefix %_GetLineCount_prefix% _GetLineCount & exit /b %_GLC_LineCount% 
