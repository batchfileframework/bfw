
::Usage Call :FindBatchFunctions Filename FunctionArray
:FindBatchFunctions

::Usage Call :FindBatchFunctionDependency Filename DependencyString
:FindBatchFunctionDependency

:GetLongestLine

::Usage Call :GetLineCount Filename optional LineCount
:GetLineCount
set "_GetLineCount_prefix=_GLC"
Call :SetIfNotDefined "%~1" _GLC_Filename "%~2" _GLC_OutputLineCount
set /a "_GLC_LineCount=0"
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLC_Filename%"') do ( set /a "_GLC_LineCount+=1" )
if "[%_GLC_OutputLineCount%]" NEQ "[]" set /a "%_GLC_OutputLineCount%=%_GLC_LineCount%"
Call :ClearVariablesByPrefix %_GetLineCount_prefix% _GetLineCount & exit /b %_GLC_LineCount% 

REM returns erroneous values ?!?!
::Usage Call :GetLineLenght Filename RowNumber Lenght
REM :GetLineLenghtalt
REM set "_GetLineLenght_prefix=_GLL"
REM Call :SetIfNotDefined "%~1" _GLL_Filename "%~2" _GLL_LineNumber  "%~3" _GLL_OutputLineLenght
REM set /a "_GLL_LineNumber-=1"
REM if %_GLL_LineNumber% GTR 0 set "_GLL_skip=skip=%_GLL_LineNumber%" 
REM for /f "%_GLL_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLL_Filename%"') do (
REM for /f "%_GLL_skip% delims=" %%a in (%_GLL_Filename%) do (
		REM set _GLL_buffer=%%a
		REM GoTo :GetLineLenght-endalt
REM )
REM :GetLineLenght-endalt
REM Call :len _GLL_buffer_len _GLL_buffer
REM set %_GLL_OutputLineLenght%=%_GLL_buffer_len%
REM Call :ClearVariablesByPrefix %_GetLineLenght_prefix% _GetLineLenght & exit /b %_GLL_buffer_len% 


::Usage Call :FindBatchFunctions Filename FunctionArray
:FindBatchFunctions

::Usage Call :FindBatchFunctionDependency Filename DependencyString
:FindBatchFunctionDependency

:GetLongestLine

::Usage Call :GetLineCount Filename optional LineCount
:GetLineCount
set "_GetLineCount_prefix=_GLC"
Call :SetIfNotDefined "%~1" _GLC_Filename "%~2" _GLC_OutputLineCount
set /a "_GLC_LineCount=0"
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLC_Filename%"') do ( set /a "_GLC_LineCount+=1" )
if "[%_GLC_OutputLineCount%]" NEQ "[]" set /a "%_GLC_OutputLineCount%=%_GLC_LineCount%"
Call :ClearVariablesByPrefix %_GetLineCount_prefix% _GetLineCount & exit /b %_GLC_LineCount% 

REM returns erroneous values ?!?!
::Usage Call :GetLineLenght Filename RowNumber Lenght
REM :GetLineLenghtalt
REM set "_GetLineLenght_prefix=_GLL"
REM Call :SetIfNotDefined "%~1" _GLL_Filename "%~2" _GLL_LineNumber  "%~3" _GLL_OutputLineLenght
REM set /a "_GLL_LineNumber-=1"
REM if %_GLL_LineNumber% GTR 0 set "_GLL_skip=skip=%_GLL_LineNumber%" 
REM for /f "%_GLL_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLL_Filename%"') do (
REM for /f "%_GLL_skip% delims=" %%a in (%_GLL_Filename%) do (
		REM set _GLL_buffer=%%a
		REM GoTo :GetLineLenght-endalt
REM )
REM :GetLineLenght-endalt
REM Call :len _GLL_buffer_len _GLL_buffer
REM set %_GLL_OutputLineLenght%=%_GLL_buffer_len%
REM Call :ClearVariablesByPrefix %_GetLineLenght_prefix% _GetLineLenght & exit /b %_GLL_buffer_len% 

