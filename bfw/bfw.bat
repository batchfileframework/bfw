@echo off

:setup

set "_IFLE_ExclusionList=main setup macro end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"

:main

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )

if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end

GoTo :EOF

REM TODO
listfunction batchfile functionname functionname2 func* *
AppendFunctionToFile  batchfile functionname functionname2 func* *



:ShiftedArgumentCaller
set _ShiftedArgumentCaller_function=%~1
shift
set "_ShiftedArgumentCaller_function=" & GoTo :%_ShiftedArgumentCaller_function%


:Install

echo Installation of bfw
echo checking if bfw already installed, if yes, do you wish to update y/n - call :Update if yes, exit if no

GoTo :EOF

:Update

echo this is the bfw update function
echo should be updating right now
echo but it is not
echo because I have not written it

GoTo :EOF


REM ---- Custom functions

::Usage Call :CreateBFWlink FunctionName OutputFolder
:CreateBFWlink
set "_CreateBFWlink_fileorigin=%~dpnx0"
if /i "[%~1]" EQU "[CreateBFWlink]" shift
set "_CreateBFWlink_Output=%~2"
if not defined _CreateBFWlink_Output set "_CreateBFWlink_Output=%~dp0"
echo echo Call :CreateLink "%_CreateBFWlink_fileorigin%" "%~1.bat"
Call :CreateLink "%_CreateBFWlink_fileorigin%" "%~1.bat"
GoTo :EOF


::Usage Call :GetLabels BatchFile optional LabelName
:PritnFunctionLabels
REM set "_GetLabels_output=%~2"
REM if "[%~3]" EQU "[]" ( set "_GetLabels_output_rows=%_GetLabels_output%.rows" ) else ( set "_GetLabels_output_rows=%~3" )
REM for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabels_output%.ubound=%%f" & REM set %_GetLabels_output%[%%f]=%%g
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set %_GetLabels_output_rows%[%%g].type=label
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%[%%f].name=%%~z
	
	<nul set /p =%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%! 
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%.name[%%~z]=%%g
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output_rows%[%%g]=%%~z
	)
set /a "%_GetLabels_output%.lbound=1" & set "_GetLabels_output=" & set "_GetLabels_output_rows="
GoTo :EOF

::Usage Call :EchoFileLine filename 3 4 5 6 7 ... N
:EchoFileLine
set "_EchoFileLine_prefix=_EFL"
set "_EFL_File=%~1"
:EchoFileLine-arg
set "_EFL_LineList=%_EFL_LineList% /C:"%~2:""
if "[%~3]" NEQ "[]" ( shift & GoTo :EchoFileLine-arg )
Setlocal enabledelayedexpansion
for /f delims^=^ eol^= %%a in (' ^( type "%_EFL_File%" ^| %SystemRoot%\System32\findstr /N /R /C:".*" ^| %SystemRoot%\System32\findstr /B %_EFL_LineList% ^) 2^>nul ') do ( 
	set _EFL_buffer=%%a
	if defined _EFL_buffer echo(!_EFL_buffer:*:=!
	) 
endlocal
Call :ClearVariablesByPrefix %_EchoFileLine_prefix% _EchoFileLine_prefix & GoTo :EOF

::Usage Call :AppendFileLineToFile inputfile outputfile 3 4 5 6 7 ... N
:AppendFileLineToFile
set "_AppendFileLineToFile_prefix=_AFLTF"
set "_AFLTF_InputFile=%~1"
set "_AFLTF_OutputFile=%~2"
:AppendFileLineToFile-arg
set "_AFLTF_LineList=%_AFLTF_LineList% /C:"%~3:""
if "[%~3]" NEQ "[]" ( shift & GoTo :AppendFileLineToFile-arg )
Setlocal enabledelayedexpansion
for /f delims^=^ eol^= %%a in (' ^( type "%_AFLTF_InputFile%" ^| %SystemRoot%\System32\findstr /N /R /C:".*" ^| %SystemRoot%\System32\findstr /B %_AFLTF_LineList% ^) 2^>nul ') do ( 
	set _AFLTF_buffer=%%a
	if defined _AFLTF_buffer >>"%_AFLTF_OutputFile%" echo(!_AFLTF_buffer:*:=!
	) 
endlocal
Call :ClearVariablesByPrefix %_EchoFileLine_prefix% _EchoFileLine_prefix & GoTo :EOF

::Usage Call :DeleteLine filename StartRow EndRow
::This function will delete specified lines of text in a file
::row arguments should be single numbers or tuplets in the format  ##-## example  2555-2565 
:DeleteLine
set "_DL_prefix=_DL"
set "_DL_Filename=%~1"
set /a _DL_StartRow=%~2
set /a _DL_EndRow=%~3 2>nul
if not defined _DL_EndRow set /a _DL_EndRow=%_DL_StartRow%
if not exist "%temp%\bfw\backup" md "%temp%\bfw\backup"
if not exist "%temp%\bfw\working" md "%temp%\bfw\working"
for /d %%i in ("%_DL_Filename%") do set "_DL_name=%%~ni"
for /d %%i in ("%_DL_Filename%") do set "_DL_ext=%%~xi"
set "_DL_TempFile=%date%-%time::=.%"
set "_DL_TempFile=%_DL_TempFile: =%"
copy "%_DL_Filename%" "%temp%\bfw\backup\%_DL_name%.%_DL_TempFile%%_DL_ext%.bak"
set "_DL_TempFile=%temp%\bfw\working\%_DL_name%.%_DL_TempFile%%_DL_ext%.bak"
Setlocal enabledelayedexpansion
for /f delims^=^ eol^= %%a in (' ^( type "%_DL_Filename%" ^| %SystemRoot%\System32\findstr /N /R /C:".*" ^) 2^>nul ') do ( 
	REM for /f "tokens=1,* delims=:" %%f in ("%%a") do echo 1 a%%a f%%f
	for /f "tokens=1 delims=:" %%f in ("%%a") do if %%f GEQ %_DL_StartRow% GoTo :DeleteLine-start-skip
	set _DL_buffer=%%a
	REM for /f "tokens=1,* delims=:" %%f in ("%%a") do echo 2 a%%a f%%f
	if defined _DL_buffer >>"%_DL_TempFile%" echo(!_DL_buffer:*:=!
	) 
:DeleteLine-start-skip
endlocal
set /a _DL_skip=%_DL_EndRow%
Setlocal enabledelayedexpansion
for /f skip^=%_DL_skip%^ delims^=^ eol^= %%a in (' ^( type "%_DL_Filename%" ^| %SystemRoot%\System32\findstr /N /R /C:".*" ^) 2^>nul ') do (
	REM for /f "tokens=1,* delims=:" %%f in ("%%a") do echo 3 a%%a f%%f
	set _DL_buffer=%%a
	if defined _DL_buffer >>"%_DL_TempFile%" echo(!_DL_buffer:*:=!
	) 
endlocal
echo move -y "%_DL_TempFile%" "%_DL_Filename%"
Call :ClearVariablesByPrefix %_DL_prefix% _DL_prefix & GoTo :EOF










REM ---- Batch file function manipulation

::Usage Call :CreateShortcut FileOrigin ShortcutFile
:CreateShortcut
powershell -command New-Item -ItemType SymbolicLink -Path "%~d2" -Name "%~n1.lnk" -Value "%~1"
GoTo :EOF

:CreateHardlink
GoTo :EOF

::Usage Call :CreateLink FileOrigin LinkFile
:CreateLink
mklink "%~2" "%~1"
GoTo :EOF

::Usage Call :CreateHardLink FileOrigin LinkFile
:CreateHardLink
mklink /h "%~2" "%~1"
GoTo :EOF

::Usage Call :ListFunctions BatchFile 
::Prints out a list of all non-excluded functions
:ListFunctions
set "_ListFunctions_prefix=_LF"
set "_LF_BatchFile=%~1"
Call :GetLabelsOnly "%_LF_BatchFile%" _LF.labels
Call :RemoveNonFunctionLabels _LF.labels
REM Call :CompactArray _LF.labels
Call :EchoArray _LF.labels VERTICALMODE .name
REM Call :ClearVariablesByPrefix %_ListFunctions_prefix% _ListFunctions_prefix
GoTo :EOF


::Usage Call :GetLabels BatchFile LabelObjectArray optional RowsArray
:GetLabelsOnly
set "_GetLabels_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetLabels_output_rows=%_GetLabels_output%.rows" ) else ( set "_GetLabels_output_rows=%~3" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabels_output%.ubound=%%f" & REM set %_GetLabels_output%[%%f]=%%g
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set %_GetLabels_output_rows%[%%g].type=label
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%[%%f].name=%%~z
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%.name[%%~z]=%%g
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output_rows%[%%g]=%%~z
	)
set /a "%_GetLabels_output%.lbound=1" & set "_GetLabels_output=" & set "_GetLabels_output_rows="
GoTo :EOF

::Usage Call :RemoveNonFunctionLabels ListOfLabels .rowsArray
:RemoveNonFunctionLabels
set "_RemoveNonFunctionLabels_prefix=_RNFL"
set "_RNFL_Labels=%~1"
call set "_RNFL_Labels_lbound=%%%~1.lbound%%"
call set "_RNFL_Labels_ubound=%%%~1.ubound%%"
if "[%_RNFL_Labels_lbound%]" EQU "[]" set /a "_RNFL_Labels_lbound=0"
set "_RNFL_Rows=%~2"
set /a "_RNFL_Index=%_RNFL_Labels_lbound%"
:RemoveNonFunctionLabels-loop
Call set "_RNFL_CurrentLabel=%%%_RNFL_Labels%[%_RNFL_Index%].name%%" & call set "_RNFL_CurrentRow=%%%_RNFL_Labels%[%_RNFL_Index%]%%" 
Call :IsFunctionLabelExcluded %_RNFL_CurrentLabel% && ( set "%_RNFL_Rows%[%_RNFL_CurrentRow%]=" & set "%_RNFL_Rows%[%_RNFL_CurrentRow%].type=" &  set "%_RNFL_Labels%[%_RNFL_Index%]=" & set "%_RNFL_Labels%[%_RNFL_Index%].name=" & set "%_RNFL_Labels%.name[%_RNFL_CurrentLabel%]=" )
set /a "_RNFL_Index+=1"
if %_RNFL_Index% LEQ %_RNFL_Labels_ubound% GoTo :RemoveNonFunctionLabels-loop
Call :ClearVariablesByPrefix %_RemoveNonFunctionLabels_prefix% _RemoveNonFunctionLabels
GoTo :EOF

::Usage Call :IsFunctionLabelExcluded FunctionLabel ExclusionList
:IsFunctionLabelExcluded
set "_IFLE_input=%~1"
set "_IFLE_input=%_IFLE_input:-= %"
set "_IFLE_input=%_IFLE_input::= %"
set "_IFLE_ExclusionList=%~2"
if "[%_IFLE_ExclusionList%]" EQU "[]" set "_IFLE_ExclusionList=main setup end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"
for %%a in (%_IFLE_input%) do set _IFLE_last_token=%%a
for %%a in (%_IFLE_ExclusionList%) do if %%a EQU %_IFLE_last_token% exit /b 0
if "[%_IFLE_input:~,6%]" EQU "[EndOf_]" exit /b 0
exit /b 1


REM ----- general purpose functions -----

REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
REM if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _EchoArray_IndexList "%~1" & shift & GoTo :EchoArray-arguments )
:EchoArray-arguments-end
if defined _EchoArray_IndexList.ubound set /a "_EchoArray_ubound=%_EchoArray_IndexList.ubound%"
setlocal enabledelayedexpansion
:EchoArray-loop
if not defined _EchoArray_IndexList.ubound ( set "_EchoArray_index_actual=%_EchoArray_index%" ) else ( set "_EchoArray_index_actual=!_EchoArray_IndexList[%_EchoArray_index%]!" )
if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:
if defined _EchoArray_showvariablename set _EchoArray_prefix=%_EchoArray_input%[%_EchoArray_index_actual%]:
if defined _EchoArray_showvariablename if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:%_EchoArray_input%[%_EchoArray_index_actual%]:
if not defined _EchoArray_verticalmode GoTo :EchoArray-normalmode-loop-next
<nul set /p =%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%! 
GoTo :EchoArray-loop-next
:EchoArray-normalmode-loop-next
REM echo(%_EchoArray_prefix%%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%
echo(%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%!
:EchoArray-loop-next
set /a "_EchoArray_index+=1"
if %_EchoArray_index% LEQ %_EchoArray_ubound% GoTo :EchoArray-loop
:EchoArray-loop-end
endlocal
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF

REM ToDo add range limits, at least lbound, if ubound, then ubound adjuster at the end will need work
REM maybe arr[] arr[].suffix or arr[].* ?
REM maybe add ability to output to a new compacted array, instead of moving elements of current array ?
REM tentative ::Usage Call :CompactArray InputArray optional OutputArray
REM tentative ::Usage Call :CompactArray InputArray optional OutputArray optional lbound=X optional ubound=Y
REM tentative ::Usage Call :CompactArray InputArray[].mysuffix optional OutputArray optional lbound=X optional ubound=Y
::Usage Call :CompactArray InputArray
:CompactArray
set "_CompactArray_prefix=_CA
set "_CA_Input=%~1"
call set "_CA_Input_lbound=%%%_CA_Input%.lbound%%"
call set "_CA_Input_ubound=%%%_CA_Input%.ubound%%"
if "[%_CA_Input_lbound%]" EQU "[]" set "_CA_Input_lbound=0"
set /a "_CA_Index=%_CA_Input_lbound%"
set /a "_CA_Previous=%_CA_Index%-1"
if defined %_CA_Input%[%_CA_Index%] ( set /a "_CA_LastEmptyElement=%_CA_Index%+1" ) else ( set /a "_CA_LastEmptyElement=%_CA_Index%" )
:CompactArray-loop
REM if defined %_CA_Input%[%_CA_Index%] if %_CA_LastEmptyElement% LEQ %_CA_Previous% ( echo :MoveObject %_CA_Input%[%_CA_Index%] %_CA_Input%[%_CA_LastEmptyElement%] "_CA_LastEmptyElement+=1 %_CA_LastEmptyElement%" )
if defined %_CA_Input%[%_CA_Index%] if %_CA_LastEmptyElement% LEQ %_CA_Previous% ( Call :MoveObject %_CA_Input%[%_CA_Index%] %_CA_Input%[%_CA_LastEmptyElement%] & set /a "_CA_LastEmptyElement+=1" )
if defined %_CA_Input%[%_CA_Index%] set /a "_CA_LastEmptyElement=%_CA_Index%+1"
set /a "_CA_Previous+=1" & set /a "_CA_Index+=1"
if %_CA_Index% LEQ %_CA_Input_ubound% GoTo :CompactArray-loop
set /a "%_CA_Input%.ubound=%_CA_LastEmptyElement%-1"
Call :ClearVariablesByPrefix %_CompactArray_prefix% _CompactArray
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

::Usage Call :ShowCodepage 
:ShowCodepage
chcp
GoTo :EOF

::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF

::Usage Call :SetCodePage NewCodePage
:SetCodePage
chcp %~1
GoTo :EOF