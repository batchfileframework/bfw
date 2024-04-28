@echo off

Call :IsAdmin IsAdmin
if not %IsAdmin%==true Call :Elevate %*
REM if not %IsAdmin%==true set args=%*
REM if not %IsAdmin%==true Call :Elevate

if %IsAdmin%==true echo Admin privileges found
if %IsAdmin%==true echo First argument is "%~1"
if %IsAdmin%==true echo Second argument is "%~2"
if %IsAdmin%==true echo third argument is "%~3"
if %IsAdmin%==true echo fourth argument is "%~4"
if %IsAdmin%==true echo fifth argument is "%~5"
if %IsAdmin%==true echo sixth argument is "%~6"
if %IsAdmin%==true echo seventh argument is "%~7"
if %IsAdmin%==true echo eigth argument is "%~8"
if %IsAdmin%==true echo nineth argument is "%~9"
echo ARGS: %args%
if %IsAdmin%==true pause

:END
GoTo :EOF

:IsAdmin
  set %1=false
  net session >nul 2>&1
  if %ERRORLEVEL% == 0 set %1=true
GoTo :EOF

:Elevate
REM Call :IsAdmin IsAdmin
REM if %IsAdmin%==true GoTo :EOF
set args=%*
if defined args set args=%args:^^^^=^^%
if defined args set args=%args:^=^^%
if defined args set args=%args:<=^<%
if defined args set args=%args:>=^>%
if defined args set args=%args:&=^&%
if defined args set args=%args:|=^|%
if defined args set "args=%args:"=\"\"%"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  " Start-Process -Wait -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD% \"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
exit /b
