
::Usage Call :GetFunctionRows BatchFile FunctionName OutputObject
:GetFunctionRows
set "_GetFunctionRows_prefix=_GFR"
set "_GFR_BatchFile=%~1"
set "_GFR_FunctionName=%~2"
set "_GFR_OutputObject=%~3"
Set "%_GFR_OutputObject%.name=%_GFR_FunctionName%"
Call :GetLabelRow "%_GFR_BatchFile%" %_GFR_FunctionName% %_GFR_OutputObject%.start && exit /b 1
Call :GetFunctionExit "%_GFR_BatchFile%" %%%_GFR_OutputObject%.start%% %_GFR_OutputObject%.exit
Call :GetFunctionPreambleRow "%_GFR_BatchFile%" %%%_GFR_OutputObject%.start%% %_GFR_OutputObject%.preamble
Call :GetFunctionPostscriptRow "%_GFR_BatchFile%" %%%_GFR_OutputObject%.start%% %_GFR_OutputObject%.postscript
Call :ClearVariablesByPrefix %_GetFunctionRows_prefix% _GetFunctionRows_prefix  & GoTo :EOF

