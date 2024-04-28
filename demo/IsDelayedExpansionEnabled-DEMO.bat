
:IsDelayedExpansionEnabled-DEMO

set testvalue=testtesttest

echo Is delayed expansion enabled ? It should not be
call :IsDelayedExpansionEnabled && echo It is enabled || echo It is not enabled

setlocal enabledelayedexpansion
echo.
echo Is delayed expansion enabled ? It should be
call :IsDelayedExpansionEnabled && echo It is enabled || echo It is not enabled
endlocal

GoTo :EOF
