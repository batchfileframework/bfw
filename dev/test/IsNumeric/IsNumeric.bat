:: Input can be byval or byref
:: will return && "success" if not numeric and || "fail" if numeric
::Usage Call :IsNumeric Input optional Output
:IsNumeric
echo running external IsNumeric.bat function
if "[%~1]"=="[]" exit /b 0
if defined %~1 ( call set "_IsNumeric_input=%%%~1%%" ) else ( set "_IsNumeric_input=%~1" )
set "IsNumericInternal=0123456789"
echo.%_IsNumeric_input%| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF