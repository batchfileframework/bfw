
::Usage Call :AppendTextToFile OutputFilename LineText
:AppendTextToFile
set "_AppendTextToFile_prefix=_ATTF"
Call :SetIfNotDefined "%~1" _ATTF_OutputFilename "%~2" _ATTF_LineNumber  
set _ATTF_LineText=%~3
REM this might work better as a macro
if defined %3 ( set "_ATTF_LineText_type=variable" & GoTo :AppendTextToFile-array-check-end )
if defined %3.ubound ( set "_ATTF_LineText_type=array" & GoTo :AppendTextToFile-array-check-end )
for /f "tokens=1* delims=l=" %%a in ('set %3[ 2^>^&1') do ( if "[%%a]" NEQ "[Environment variab]" ( set "_ATTF_LineText_type=array" ) & GoTo :AppendTextToFile-array-check-end )
set _ATTF_LineText_attr=%~a3f
if /I "[%_ATTF_LineText_attr:~0,1%]"=="[d]" ( set "_ATTF_LineText_type=folder" & GoTo :AppendTextToFile-array-check-end )
if exist %3 ( set "_ATTF_LineText_type=file" & GoTo :AppendTextToFile-array-check-end )
if "[%~3]" EQU "[]" ( set "_ATTF_LineText_type=empty" ) else ( set "_ATTF_LineText_type=text" )
:AppendTextToFile-array-check-end
IF %_ATTF_LineText_type% EQU array (
	call set "_ATTF_LineText_lbound=%%%~3.lbound%%"
	if "[%_ATTF_LineText_lbound%]" EQU "[]" set "_ATTF_LineText_lbound=0"
	call set "_ATTF_LineText_ubound=%%%~3.ubound%%"
	if "[%_ATTF_LineText_ubound%]" EQU "[]" Call :ubound %~3
	if "[%_ATTF_LineText_ubound%]" EQU "[]" call set "_ATTF_LineText_ubound=%%%~3.ubound%%"
	)
if %_ATTF_LineText_type% EQU text (
		setlocal enabledelayedexpansion
		>>%_ATTF_OutputFilename% echo !_ATTF_LineText!
		endlocal
	) ELSE IF %_ATTF_LineText_type% EQU variable (
		setlocal enabledelayedexpansion
		>>%_ATTF_OutputFilename% echo !%~3!
		endlocal
	) ELSE IF %_ATTF_LineText_type% EQU array (
		setlocal enabledelayedexpansion
		FOR /L %%a IN (!_ATTF_LineText_lbound!,1,!_ATTF_LineText_ubound!) DO >>%_ATTF_OutputFilename% echo !%~3[%%a]!
		endlocal
	) ELSE IF %_ATTF_LineText_type% EQU file (
		for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%~3"') do (
			set _ATTF_buffer=%%b
			setlocal enabledelayedexpansion
			>>%_ATTF_OutputFilename% echo !_ATTF_buffer!
			endlocal
		)
	) ELSE IF %_ATTF_LineText_type% EQU folder (
	) ELSE IF %_ATTF_LineText_type% EQU empty (
	)
Call :ClearVariablesByPrefix %_AppendTextToFile_prefix% _AppendTextToFile
GoTo :EOF
