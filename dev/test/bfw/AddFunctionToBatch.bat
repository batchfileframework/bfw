
REM source function should be able to be invoked by
REM sourcebatch then function name
REM relativepath\sourcebatch.bat:FunctionName
REM bfw\lib\section\sourcebatch.bat:FunctionName .bat is optional bfw\lib\section can be omitted to just bfw\sourcebatch
REM just the FunctionName if not found in the current sourcebatch, then search all files in bfw\lib\
REM FOR NOW JUST MATCH FILE AND FUNCTION
:: NOPREAMBLE NOPOSTSCRIPT PREAMBLEONLY POSTSCRIPTONLY FUNCTIONONLY UNPACK PLUSDEPENDENCIES
::Usage Call :AddFunctionToBatch DestinationBatch SourceBatch FunctionName1 FunctionName2 ... FunctionNameN
:AddFunctionToBatch
set "_AddFunctionToBatch_prefix=_AFTB
set "_AFTB_output=%~1"
:AddFunctionToBatch-args
if "[%~2]" EQU "[UNPACK]" ( set "_AFTB_SwitchUnpack=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NOPREAMBLE]" ( set "_AFTB_SwitchNoPreamble=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NOPOSTSCRIPT]" ( set "_AFTB_SwitchNoPostscript=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[PREAMBLEONLY]" ( set "_AFTB_SwitchPreambleOnly=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[POSTSCRIPTONLY]" ( set "_AFTB_SwitchPostscriptOnly=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[FUNCTIONONLY]" ( set "_AFTB_SwitchFunctionOnly=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NOPROVISIONING]" ( set "_AFTB_SwitchNoProvisioning=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NORMAL]" ( Call :ClearVariablesByPrefix _AFTB_Switch & shift & GoTo :AddFunctionToBatch-args )
Call :ClearVariablesByPrefix _AFTB_FunctionRows _AFTB_BFWFunctionFile
Call :IsFile "%~2" && ( set "_AFTB_SourceBatch=%~2" & shift & GoTo :AddFunctionToBatch-args ) || set "_AFTB_FunctionName=%~2"
if "[%_AFTB_FunctionName%]" EQU "[CORE]" Call :GetBatchCore "%_AFTB_SourceBatch%" _AFTB_FunctionRows
REM CHECK LOCAL FOLDER FOR %_AFTB_FunctionName%.bat
if not defined _AFTB_FunctionRows.start Call :GetFunctionRows "%_AFTB_SourceBatch%" "%_AFTB_FunctionName%" _AFTB_FunctionRows
if not defined _AFTB_FunctionRows.start if not defined _AFTB_NoProvisioning if defined bfw.root Call :GetBFWLIBFunction  "%_AFTB_FunctionName%" _AFTB_BFWFunctionFile _AFTB_FunctionRows
if not defined _AFTB_FunctionRows.start ( echo Function %_AFTB_FunctionName% not found & GoTo :AddFunctionToBatch-end  )
set /a _AFTB_StartLine=%_AFTB_FunctionRows.preamble% & set /a _AFTB_EndLine=%_AFTB_FunctionRows.postscript%
if defined _AFTB_SwitchNoPreamble set /a _AFTB_StartLine=%_AFTB_FunctionRows.start% 
if defined _AFTB_SwitchNoPostscript set /a _AFTB_EndLine=%_AFTB_FunctionRows.exit%
if defined _AFTB_SwitchPreambleOnly set /a _AFTB_EndLine=%_AFTB_FunctionRows.start%
if defined _AFTB_SwitchPostscriptOnly set /a _AFTB_StartLine=%_AFTB_FunctionRows.exit% 
if defined _AFTB_SwitchFunctionOnly ( set /a _AFTB_StartLine=%_AFTB_FunctionRows.start% & set /a _AFTB_EndLine=%_AFTB_FunctionRows.exit% )
if %_AFTB_StartLine% EQU %_AFTB_EndLine% GoTo :AddFunctionToBatch-end
if defined _AFTB_SwitchUnpack ( set /a _AFTB_StartLine=%_AFTB_FunctionRows.start%+1 & set /a _AFTB_EndLine=%_AFTB_FunctionRows.exit%-1 & set "_AFTB_SwitchUnpack=" )
if exist "%_AFTB_output%" Call :GetLabelRow "%_AFTB_output%" "%_AFTB_FunctionName%" || GoTo :AddFunctionToBatch-end
if defined _AFTB_BFWFunctionFile ( set "_AFTB_SourceFile=%_AFTB_BFWFunctionFile%" ) else ( set "_AFTB_SourceFile=%_AFTB_SourceBatch%" )
Call :AppendFileLineToFile "%_AFTB_SourceFile%" "%_AFTB_output%" %_AFTB_FunctionRows.preamble%-%_AFTB_FunctionRows.postscript%
REM IF PLUSDEPENDENCIES ADD DEPENDENCIES TO FILE by calling :GetBatchFunctionCalls and then calling :AddFunctionToBatch with found functions
:AddFunctionToBatch-end
if "[%~3]" NEQ "[]" ( shift & GoTo :AddFunctionToBatch-args )
Call :ClearVariablesByPrefix %_AddFunctionToBatch_prefix% _AddFunctionToBatch_prefix  & GoTo :EOF

