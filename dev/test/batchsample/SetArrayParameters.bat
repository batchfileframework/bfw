
::Usage Call :SetArrayParameters OutputArray ParameterVariable optional lbound optional ubound optional index optional count
:SetArrayParameters
call set /a "_SetArrayParameters.lbound=%%%~2.lbound%%"  2>nul
call set /a "_SetArrayParameters.ubound=%%%~2.ubound%%" 2>nul
REM call set /a "_SetArrayParameters.count=%%%~2.count%%" 2>nul
call set /a "_SetArrayParameters.index=%%%~2.index%%" 2>nul
if not "[%~3]"=="[]" call :IsNumeric "%~3" || set /a "_SetArrayParameters.lbound=%~3" 2>nul
if not "[%~4]"=="[]" call :IsNumeric "%~4" || set /a "_SetArrayParameters.ubound=%~4" 2>nul
if not "[%~5]"=="[]" call :IsNumeric "%~5" || set /a "_SetArrayParameters.index=%~5" 2>nul
REM if not "[%~6]"=="[]" call :IsNumeric "%~6" || set /a "_SetArrayParameters.count=%~6" 2>nul
if "[%_SetArrayParameters.count%]"=="[]" if not "[%_SetArrayParameters.lbound%]"=="[]" if not "[%_SetArrayParameters.ubound%]"=="[]" set /a _SetArrayParameters.count=%_SetArrayParameters.ubound%-%_SetArrayParameters.lbound%+1  2>nul
if not "[%_SetArrayParameters.lbound%]"=="[]" Call :IsNumeric "%_SetArrayParameters.lbound%" || set /a "%~1.lbound=%_SetArrayParameters.lbound%" 2>nul
if not "[%_SetArrayParameters.ubound%]"=="[]" Call :IsNumeric "%_SetArrayParameters.ubound%" || set /a "%~1.ubound=%_SetArrayParameters.ubound%" 2>nul
if not "[%_SetArrayParameters.index%]"=="[]" Call :IsNumeric "%_SetArrayParameters.index%"  || set /a "%~1.index=%_SetArrayParameters.index%" 2>nul
if not "[%_SetArrayParameters.count%]"=="[]" Call :IsNumeric "%_SetArrayParameters.count%"  || set /a "%~1.count=%_SetArrayParameters.count%" 2>nul
Call :ClearVariablesByPrefix _SetArrayParameters & if not "[%_SetArrayParameters.ubound%]"=="[]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF

