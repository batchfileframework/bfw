
:: Test if this session is elevated.
:: `net session` only succeeds and therefore reports exit code 0 
:: in an elevated session.
:IsAdmin
  if not "[%1]"=="[]" set %1=false
  net session >NUL 2>&1
  if %ERRORLEVEL% == 0 if not "[%1]"=="[]" set %1=true
goto :EOF
