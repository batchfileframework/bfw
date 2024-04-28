
::Usage Call :FindAllLabels Filename LabelsArray
:FindAllLabels
setlocal enabledelayedexpansion
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%~1"') do ( 
	Call :IsLabel _FindAllLabels_IsLabel "%%b"
	if "[!_FindAllLabels_IsLabel!]" NEQ "[]"  echo line number :%%a was a label , labelname !_FindAllLabels_IsLabel! , EL %errorlevel% , text was %%b
	)
endlocal
REM for each line of text
REM loop through each char 
REM if it's not space tab or semicolon, this is not a label
REM maybe use delim=: ?
REM once semicolon, continue until space or tab or end of line is found, this is the label
GoTo :EOF
