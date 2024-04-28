@echo off

set TestArguments=parameter1 parameter2 parameter3 value1=true -command "c:\path\ and file.ext"
set TestArguments2=parameter1 parameter2 parameter3 value1=true -command "c:\path\ and file.ext" "<>^\/\\^^^^/&^&&|"

echo Arguments are %*

Call :IsAdmin IsAdmin
echo Is admin ? %IsAdmin%

if %IsAdmin%==true echo Admin privileges found
if not %IsAdmin%==true echo No admin privileges found
if not %IsAdmin%==true echo Re-executing script as admin

REM if not %IsAdmin%==true Call :RunAsAdmin %*
REM if not %IsAdmin%==true Call :Elevate %*
REM if not %IsAdmin%==true Call :ElevateAlternate %*
if not %IsAdmin%==true Call :ElevateWithVBS 
REM if not %IsAdmin%==true Call :ElevateAlternate %TestArguments%

echo After elevation
Call :IsAdmin IsAdmin
echo After elevation Is admin ? %IsAdmin%
echo arguments are %*
echo end of script
pause
GoTo :EOF

REM Returns error The token '&&' is not a valid statement separator in this version and Expressions are only allowed as the first element of a pipeline.
:Elevate
set args=%*
if defined args set args=%args:^=^^%
if defined args set args=%args:<=^<%
if defined args set args=%args:>=^>%
if defined args set args=%args:&=^&%
if defined args set args=%args:|=^|%
if defined args set "args=%args:"=\"\"%"
REM See mklement0's explanation at https://stackoverflow.com/questions/54658352/passing-quoted-arguments-from-batch-file-to-powershell-start-self-elevation/54701990#54701990
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  " Start-Process -Wait -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD%\"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
GoTo :EOF

REM Gets UAC prompt but console just disappears
:ElevateAlternate
@echo off & setlocal EnableExtensions DisableDelayedExpansion
Set "Args=%*"
echo running alternate version
net file 1>nul 2>&1 || (powershell -ex unrestricted -Command ^
  Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c %~f0 %Args:"=\""%'
  goto :eof)
GoTo :EOF

:ElevateWithVBS
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

REM Only works if administrator is unlocked and you will need to enter the password
REM Currently will mangle arguments
:RunAsAdmin
  set "params=%*"
  set params=%params:"=^"%
  set "batchpath=%~f0"
  echo runas /user:%userdomain%\administrator %batchPath% %params%
  runas /user:%userdomain%\administrator "%batchPath% %params%"
GoTo :EOF

:IsAdmin
  set %1=false
  net session >nul 2>&1
  if %ERRORLEVEL% == 0 set %1=true
GoTo :EOF