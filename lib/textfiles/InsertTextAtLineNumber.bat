
::Usage Call :InsertTextAtLineNumber InputFilename OutputFilename LineNumber LineText
:InsertTextAtLineNumber
set "_InsertTextAtLineNumber_prefix=_ITALN"
Call :SetIfNotDefined "%~1" _ITALN_InputFilename "%~2" _ITALN_OutputFilename "%~3" _ITALN_LineNumber  
set _ITALN_LineText=%~4
REM this might work better as a macro
if defined %4 ( set "_ITALN_LineText_type=variable" & GoTo :InsertTextAtLineNumber-array-check-end )
if defined %4.ubound ( set "_ITALN_LineText_type=array" & GoTo :InsertTextAtLineNumber-array-check-end )
for /f "tokens=1* delims=l=" %%a in ('set %4[ 2^>^&1') do ( if "[%%a]" NEQ "[Environment variab]" ( set "_ITALN_LineText_type=array" ) & GoTo :InsertTextAtLineNumber-array-check-end )
set _ITALN_LineText_attr=%~a4f
if /I "[%_ITALN_LineText_attr:~0,1%]"=="[d]" ( set "_ITALN_LineText_type=folder" & GoTo :InsertTextAtLineNumber-array-check-end )
if exist %4 ( set "_ITALN_LineText_type=file" & GoTo :InsertTextAtLineNumber-array-check-end )
if "[%~4]" EQU "[]" ( set "_ITALN_LineText_type=empty" ) else ( set "_ITALN_LineText_type=text" )
:InsertTextAtLineNumber-array-check-end
IF %_ITALN_LineText_type% EQU array (
	call set "_ITALN_LineText_lbound=%%%~4.lbound%%"
	if "[%_ITALN_LineText_lbound%]" EQU "[]" set "_ITALN_LineText_lbound=0"
	call set "_ITALN_LineText_ubound=%%%~4.ubound%%"
	if "[%_ITALN_LineText_ubound%]" EQU "[]" Call :ubound %~4
	if "[%_ITALN_LineText_ubound%]" EQU "[]" call set "_ITALN_LineText_ubound=%%%~4.ubound%%"
	)
set /a "_ITALN_LineCount=0"
set /a "_ITALN_LineNumber-=1"
setlocal enabledelayedexpansion
for /f "delims=" %%a in (%_ITALN_InputFilename%) do (
		if %_ITALN_LineNumber% EQU !_ITALN_LineCount! GoTo :InsertTextAtLineNumber-for-skip
		set /a "_ITALN_LineCount+=1"
		setlocal DisableDelayedExpansion
		set _ITALN_buffer=%%a
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !_ITALN_buffer!
		endlocal & endlocal
)
:InsertTextAtLineNumber-for-skip
endlocal
if %_ITALN_LineText_type% EQU text (
	REM echo is text, append text to file
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !_ITALN_LineText!
		endlocal
	) ELSE IF %_ITALN_LineText_type% EQU variable (
	REM echo is variable, append variable content to 
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !%~4!
		endlocal
	) ELSE IF %_ITALN_LineText_type% EQU array (
	REM echo is array, append each array element to file from lbound or 0 to ubound
		setlocal enabledelayedexpansion
		FOR /L %%a IN (!_ITALN_LineText_lbound!,1,!_ITALN_LineText_ubound!) DO >>%_ITALN_OutputFilename% echo !%~4[%%a]!
		endlocal
	) ELSE IF %_ITALN_LineText_type% EQU file (
	REM echo if file, append content of file 
		for /f "delims=" %%a in (%~4) do (
			set _ITALN_buffer=%%a
			setlocal enabledelayedexpansion
			>>%_ITALN_OutputFilename% echo !_ITALN_buffer!
			endlocal
		)
	) ELSE IF %_ITALN_LineText_type% EQU folder (
		REM echo is folder, do nothing
	) ELSE IF %_ITALN_LineText_type% EQU empty (
		REM echo is empty, do nothing
	)
if %_ITALN_LineNumber% GTR 0 set "_ITALN_skip=skip=%_ITALN_LineNumber%" 
for /f "%_ITALN_skip% delims=" %%a in (%_ITALN_InputFilename%) do (
		set _ITALN_buffer=%%a
		setlocal enabledelayedexpansion
		>>%_ITALN_OutputFilename% echo !_ITALN_buffer!
		endlocal
)
Call :ClearVariablesByPrefix %_InsertTextAtLineNumber_prefix% _InsertTextAtLineNumber
GoTo :EOF
