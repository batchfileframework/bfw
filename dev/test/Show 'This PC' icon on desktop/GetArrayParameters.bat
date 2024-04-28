
::Usage Call :GetArrayParameters InputArray ParameterVariable optional Initialize optional StartIndex=0
:GetArrayParameters
call set _GetArrayParameters.lbound=%%%~1.lbound%%
call set _GetArrayParameters.ubound=%%%~1.ubound%%
call set _GetArrayParameters.count=%%%~1.count%%
call set _GetArrayParameters.index=%%%~1.index%%
if "[%~3]"=="[Initialize]" (
	if "[%_GetArrayParameters.lbound%]"=="[]" set /a _GetArrayParameters.lbound=0
	if "[%_GetArrayParameters.ubound%]"=="[]" set /a _GetArrayParameters.ubound=-1
	if "[%_GetArrayParameters.count%]"=="[]" set /a _GetArrayParameters.count=%_GetArrayParameters.ubound%-%_GetArrayParameters.lbound%+1  2>nul
	if "[%_GetArrayParameters.index%]"=="[]" if "[%~4]"=="[]" set /a "_GetArrayParameters.index=0"
) else (
	if "[%_GetArrayParameters.lbound%]"=="[]" set "_GetArrayParameters_bounds_incomplete=true" & set "_GetArrayParameters_lbound_empty=true"
	if "[%_GetArrayParameters.ubound%]"=="[]" set "_GetArrayParameters_bounds_incomplete=true" & set "_GetArrayParameters_ubound_empty=true"
	if "[%_GetArrayParameters_bounds_incomplete%]"=="[true]" Call :FindArrayBounds %%%~1%% _GetArrayParameters_bounds_incomplete
	if "[%_GetArrayParameters_lbound_empty%]"=="[true]" set "_GetArrayParameters.lbound=%_GetArrayParameters_bounds_incomplete.lbound%"
	if "[%_GetArrayParameters_ubound_empty%]"=="[true]" set "_GetArrayParameters.ubound=%_GetArrayParameters_bounds_incomplete.ubound%"
	if "[%_GetArrayParameters.count%]"=="[]" set /a _GetArrayParameters.count=%_GetArrayParameters.ubound%-%_GetArrayParameters.lbound%+1  2>nul
)
if "[%~4]" NEQ "[]" ( set /a "_GetArrayParameters.index=%~4" 2>nul )
set _GetArrayParameters.name=%~1
set "%~2.lbound=%_GetArrayParameters.lbound%"
set "%~2.ubound=%_GetArrayParameters.ubound%"
set "%~2.count=%_GetArrayParameters.count%"
set "%~2.index=%_GetArrayParameters.index%"
if "[%_GetArrayParameters.name%]" NEQ "" set "%~2=%_GetArrayParameters.name%"
Call :ClearVariablesByPrefix _GetArrayParameters & if "[%_GetArrayParameters.ubound%]"=="[]" ( exit /b 1 ) else ( exit /b 0 )
GoTo :EOF
::GetArrayParameters-END

