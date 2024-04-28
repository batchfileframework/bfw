
::Usage Call :ExtractAllBatchFunction SourceBatchFile optional DestionationFolder
:ExtractAllBatchFunction
Call :ListFunctions "%~1" _ExtractAllBatchFunction_FunctionList
if "[%~2]" NEQ "[]" ( set "_ExtractAllBatchFunction_OutputFolder=%~2" ) else ( set "_ExtractAllBatchFunction_OutputFolder=%cd%\" )
Call :ExtractBatchFunction DESTINATIONFOLDER "%_ExtractAllBatchFunction_OutputFolder%" "%~1" %_ExtractAllBatchFunction_FunctionList%
set "_ExtractAllBatchFunction_FunctionList=" & set "_ExtractAllBatchFunction_OutputFolder="
GoTo :EOF

