
REM source function should be able to be invoked by
REM sourcebatch then function name
REM relativepath\sourcebatch.bat:FunctionName
REM bfw\lib\section\sourcebatch.bat:FunctionName .bat is optional bfw\lib\section can be omitted to just bfw\sourcebatch
REM just the FunctionName if not found in the current sourcebatch, then search all files in bfw\lib\
REM FOR NOW JUST MATCH FILE AND FUNCTION
:: NOPREAMBLE NOPOSTSCRIPT PREAMBLEONLY POSTSCRIPTONLY FUNCTIONONLY UNPACK PLUSDEPENDENCIES
::Usage Call :PrintBatchFunction DestinationBatch SourceBatch FunctionName1 FunctionName2 ... FunctionNameN
:PrintBatchFunction
set "_PrintBatchFunction_prefix=_PBF"
:PrintBatchFunction-args
if "[%~1]" EQU "[UNPACK]" ( set "_PBF_SwitchUnpack=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NOPREAMBLE]" ( set "_PBF_SwitchNoPreamble=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NOPOSTSCRIPT]" ( set "_PBF_SwitchNoPostscript=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[PREAMBLEONLY]" ( set "_PBF_SwitchPreambleOnly=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[POSTSCRIPTONLY]" ( set "_PBF_SwitchPostscriptOnly=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[FUNCTIONONLY]" ( set "_PBF_SwitchFunctionOnly=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NOPROVISIONING]" ( set "_PBF_SwitchNoProvisioning=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NORMAL]" ( Call :ClearVariablesByPrefix _PBF_Switch & shift & GoTo :PrintBatchFunction-args )
Call :ClearVariablesByPrefix _PBF_FunctionRows _PBF_BFWFunctionFile
Call :IsFile "%~1" && ( set "_PBF_SourceBatch=%~1" & shift & GoTo :PrintBatchFunction-args ) || set "_PBF_FunctionName=%~1"
if "[%_PBF_FunctionName%]" EQU "[CORE]" Call :GetBatchCore "%_PBF_SourceBatch%" _PBF_FunctionRows
REM CHECK LOCAL FOLDER FOR %_PBF_FunctionName%.bat
if not defined _PBF_FunctionRows.start Call :GetFunctionRows "%_PBF_SourceBatch%" "%_PBF_FunctionName%" _PBF_FunctionRows
if not defined _PBF_FunctionRows.start if not defined _PBF_NoProvisioning if defined bfw.root Call :GetBFWLIBFunction  "%_PBF_FunctionName%" _PBF_BFWFunctionFile _PBF_FunctionRows
if not defined _PBF_FunctionRows.start ( echo Function %_PBF_FunctionName% not found & GoTo :PrintBatchFunction-end  )
set /a _PBF_StartLine=%_PBF_FunctionRows.preamble% & set /a _PBF_EndLine=%_PBF_FunctionRows.postscript%
if defined _PBF_SwitchNoPreamble set /a _PBF_StartLine=%_PBF_FunctionRows.start% 
if defined _PBF_SwitchNoPostscript set /a _PBF_EndLine=%_PBF_FunctionRows.exit%
if defined _PBF_SwitchPreambleOnly set /a _PBF_EndLine=%_PBF_FunctionRows.start%
if defined _PBF_SwitchPostscriptOnly set /a _PBF_StartLine=%_PBF_FunctionRows.exit% 
if defined _PBF_SwitchFunctionOnly ( set /a _PBF_StartLine=%_PBF_FunctionRows.start% & set /a _PBF_EndLine=%_PBF_FunctionRows.exit% )
if %_PBF_StartLine% EQU %_PBF_EndLine% GoTo :PrintBatchFunction-end
if defined _PBF_SwitchUnpack ( set /a _PBF_StartLine=%_PBF_FunctionRows.start%+1 & set /a _PBF_EndLine=%_PBF_FunctionRows.exit%-1 & set "_PBF_SwitchUnpack=" )
if defined _AFTB_BFWFunctionFile ( set "_AFTB_SourceFile=%_AFTB_BFWFunctionFile%" ) else ( set "_AFTB_SourceFile=%_AFTB_SourceBatch%" )
Call :PrintFileLine "%_AFTB_SourceFile%" %_PBF_FunctionRows.preamble%-%_PBF_FunctionRows.postscript%
REM IF PLUSDEPENDENCIES ADD DEPENDENCIES TO FILE by calling :GetBatchFunctionCalls and then calling :PrintBatchFunction with found functions
:PrintBatchFunction-end
if "[%~2]" NEQ "[]" ( shift & GoTo :PrintBatchFunction-args )
Call :ClearVariablesByPrefix %_PrintBatchFunction_prefix% _PrintBatchFunction_prefix  & GoTo :EOF

