
::Usage Call :GetFunctionExit BatchFile FunctionName or Row optional OutputRow
:GetFunctionExit
set "_GetFunctionExit_prefix=_GFE"
set "_GFE_BatchFile=%~1"
set "_GFE_Function=%~2"
set "_GFE_Output=%~3"
echo.%_GFE_Function%| findstr /r "[^0123456789]" >nul && ( set "_GFE_FunctionName=%_GFE_Function%" & Call :GetLabelRow %_GFE_BatchFile% %_GFE_Function% _GFE_Function ) || Call :GetFunctionName %_GFE_BatchFile% %_GFE_Function% _GFE_FunctionName
Call :GetNextExitRow %_GFE_BatchFile% %_GFE_Function% _GFE_FunctionNextExit
Call :GetNextFunctionRow %_GFE_BatchFile% %_GFE_FunctionNextExit% _GFE_FunctionNextFunction
Call :GetPreviousExitRow %_GFE_BatchFile% %_GFE_FunctionNextFunction% _GFE_FunctionExit
set /a _GFE_FunctionEOFExit=0 & Call :GetEOFrow %_GFE_BatchFile% %_GFE_FunctionName% _GFE_FunctionEOFExit
if %_GFE_FunctionEOFExit% GTR 0 set /a _GFE_FunctionExit=%_GFE_FunctionEOFExit%
if defined _GFE_Output set /a %_GFE_Output%=%_GFE_FunctionExit%
Call :ClearVariablesByPrefix %_GetFunctionExit_prefix% _GetFunctionExit_prefix & exit /b %_GFE_FunctionExit%

