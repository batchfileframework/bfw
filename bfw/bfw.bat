@echo off

:setup
:main

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )

if "[%~n0]" EQU "[bfw]" ( Call :%~1 %* ) else ( Call :%~n0 %* )

GoTo :EOF

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
if "[%~1]" EQU "[CreateBFWlink]" shift
set "_CreateBFWlink_Output=%~2"
if not defined _CreateBFWlink_Output set "_CreateBFWlink_Output=%~dp0"
echo echo Call :CreateLink "%_CreateBFWlink_fileorigin%" "%~1.bat"
Call :CreateLink "%_CreateBFWlink_fileorigin%" "%~1.bat"
GoTo :EOF


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