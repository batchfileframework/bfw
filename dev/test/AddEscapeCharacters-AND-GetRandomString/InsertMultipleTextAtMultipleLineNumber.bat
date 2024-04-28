
:InsertMultipleTextAtMultipleLineNumber
set "_InsertMultipleTextAtMultipleLineNumber_prefix=_IMTAMLN"
set "_IMTAMLN_InputFilename=%~1" & set "_IMTAMLN_OutputFilename=%~2"
:InsertMultipleTextAtMultipleLineNumber-endsetup
Call :InsertTextAtLineNumber "%_IMTAMLN_InputFilename%" "%_IMTAMLN_OutputFilename%" %3 %4
if not "[%~6]"=="[]" shift & shift & GoTo :InsertMultipleTextAtMultipleLineNumber-endsetup 
Call :ClearVariablesByPrefix %_InsertMultipleTextAtMultipleLineNumber_prefix% _InsertMultipleTextAtMultipleLineNumber 
GoTo :EOF


:InsertMultipleTextAtMultipleLineNumber
set "_InsertMultipleTextAtMultipleLineNumber_prefix=_IMTAMLN"
set "_IMTAMLN_InputFilename=%~1" & set "_IMTAMLN_OutputFilename=%~2"
:InsertMultipleTextAtMultipleLineNumber-endsetup
Call :InsertTextAtLineNumber "%_IMTAMLN_InputFilename%" "%_IMTAMLN_OutputFilename%" %3 %4
if not "[%~6]"=="[]" shift & shift & GoTo :InsertMultipleTextAtMultipleLineNumber-endsetup 
Call :ClearVariablesByPrefix %_InsertMultipleTextAtMultipleLineNumber_prefix% _InsertMultipleTextAtMultipleLineNumber 
GoTo :EOF

