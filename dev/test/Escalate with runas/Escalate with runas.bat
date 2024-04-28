@echo off

Call :IsAdmin IsAdmin

echo Is admin ? %IsAdmin%

if %IsAdmin%==true echo Admin privileges found
if not %IsAdmin%==true echo No admin privileges found
if not %IsAdmin%==true echo Re-executing script as admin
if not %IsAdmin%==true Call :RunAsAdmin %*

echo After RunAs

echo end of script
pause
GoTo :EOF

REM Only works if administrator is unlocked and you will need to enter the password
REM Currently will mangle arguments
:RunAsAdmin
  set "params=%*"
  set params=%params:"=^"%
  set "batchpath=%~f0"
  echo /user:%userdomain%\administrator %batchPath% %params%
  runas /user:%userdomain%\administrator "%batchPath% %params%"
GoTo :EOF


:IsAdmin
  set %1=false
  net session >nul 2>&1
  if %ERRORLEVEL% == 0 set %1=true
GoTo :EOF