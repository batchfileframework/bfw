
::Usage Call :GetBatchCore File optional OutputValue
::Returns core function final line number
:GetBatchCore
Call :GetLabelRow "%~1" End _GetBatchCore_EndRow
Call :GetNextFunctionRow "%~1" %_GetBatchCore_EndRow% _GetBatchCore_FirstFunction
Call :GetPreviousExitRow "%~1" %_GetBatchCore_FirstFunction% _GetBatchCore_FirstFunctionExit
Call :GetNextEmptyRow "%~1" %_GetBatchCore_FirstFunctionExit% _GetBatchCore_CorePostscript
if "[%~2]" NEQ "[]" ( set /a %~2.preamble=1 & set /a %~2.start=1 & set /a %~2.exit=%_GetBatchCore_FirstFunctionExit% & set /a %~2.postscript=%_GetBatchCore_CorePostscript% )
set "_GetBatchCore_EndRow=" & set "_GetBatchCore_FirstFunction=" & set "_GetBatchCore_FirstFunctionExit=" & set "_GetBatchCore_CorePostscript=" & exit /b %_GetBatchCore_CorePostscript%

