
REM this version can't handle empty lines
REM returns erroneous values ?!?!
::Usage Call :GetLineLenght Filename RowNumber Lenght
:GetLineLenght
set "_GetLineLenght_prefix=_GLL"
Call :SetIfNotDefined "%~1" _GLL_Filename "%~2" _GLL_LineNumber  "%~3" _GLL_OutputLineLenght
set /a "_GLL_LineNumber-=1"
if %_GLL_LineNumber% GTR 0 set "_GLL_skip=skip=%_GLL_LineNumber%" 
for /f "%_GLL_skip% tokens=1,* delims=:" %%a in ('findstr /n "^" "%_GLL_Filename%"') do (
		set _GLL_buffer=%%b
		GoTo :GetLineLenght-end
)
:GetLineLenght-end
Call :len _GLL_buffer_len _GLL_buffer
set %_GLL_OutputLineLenght%=%_GLL_buffer_len%
Call :ClearVariablesByPrefix %_GetLineLenght_prefix% _GetLineLenght & exit /b %_GLL_buffer_len% 
