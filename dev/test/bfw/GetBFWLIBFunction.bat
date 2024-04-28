
::Usage Call :GetBFWLIBFunction FunctionName1 FunctionRowsObject1 ... FunctionNameN FunctionRowsObjectN
:GetBFWLIBFunction
if not defined bfw.root exit /b 1
Call :FindFileByFilename "%bfw.root%\lib" "%FunctionName1%" _GetBFWLIBFunction_FilePath || exit /b 1
GoTo :EOF

