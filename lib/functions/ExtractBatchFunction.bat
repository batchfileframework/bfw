
::Usage Call :ExtractBatchFunction SourceBatchFile FunctionName1 FunctionName2 ... FunctionNameN SourceBatchFile FunctionName1a ...FunctionNameNa
:ExtractBatchFunction
set "_ExtractBatchFunction_prefix=_EBF"
if "[%~1]" EQU "[DESTINATIONFOLDER]" ( set "_EBF_DestinationFolder=%~2" & shift & shift & GoTo :ExtractBatchFunction )
if "[%~1]" EQU "[DESTINATIONFILE]" ( set "_EBF_DestinationFile=%~2" & shift & shift & GoTo :ExtractBatchFunction )
Call :IsFile "%~1" && ( set "_EBF_SourceBatch=%~1" & shift & GoTo :ExtractBatchFunction ) || set "_EBF_FunctionName=%~1"
if not defined _EBF_DestinationFolder set "_EBF_DestinationFolder=%cd%\"
if defined _EBF_DestinationFile ( set "_EBF_DestinationFilepath=%_EBF_DestinationFolder%%_EBF_DestinationFile%" ) else ( set "_EBF_DestinationFilepath=%_EBF_DestinationFolder%%_EBF_FunctionName%.bat" )
if not defined bfw.silent echo Writing function %_EBF_FunctionName%
Call :AddFunctionToBatch "%_EBF_DestinationFilepath%" "%_EBF_SourceBatch%" "%_EBF_FunctionName%"
if "[%~2]" NEQ "[]" ( shift & GoTo :ExtractBatchFunction )
Call :ClearVariablesByPrefix %_ExtractBatchFunction_prefix% _ExtractBatchFunction_prefix & GoTo :EOF

