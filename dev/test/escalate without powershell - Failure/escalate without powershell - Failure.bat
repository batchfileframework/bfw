@echo on
setlocal EnableDelayedExpansion

REM example test command :  "escalate without powershell.bat" parameter1 parameter2 parameter3 value1=true -command "path and file"
set IsEncodedArgs=false
set "BatchPath=%~f0"
set "Params=%*"
set CleanParams=%Params:"=^"%
set CleanParams=%CleanParams:&=^&%
echo %CleanParams%
if not "%CleanParams:-RunInConsole=%" == "%CleanParams%" ( set IsRunningInConsole=true )
pause
pause
if not "!Params:RunInConsole=!" == "%Params%" ( set IsRunningInConsole=true )
if not !Params:EncodedArgs=! == !Params! ( set IsEncodedArgs=true )


if %IsEncodedArgs% == true ( call :GetLastArgument %* )


if defined LastArgument ( for /f "delims=" %%A in ('powershell -Command "[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes('%LastArgument%'))"') do set "decoded_args=%%A" )



if defined decoded_args ( echo Found decoded arguments )



if defined decoded_args ( echo %decoded_args% )


REM This is a test section to make sure command line parameters aren't mangled during escalation
echo Command line
echo %cmdcmdline%
echo batch file name 
echo %~f0
echo command line parameters 
echo %*
echo Variable BatchPath
echo %BatchPath%
echo Variable params
echo %params%


if not %IsEncodedArgs% == true1 (
  for /f "delims=" %%A in ('powershell -Command "[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes('%params%'))"') do set "encoded_args=%%A"
  echo Encoded arguments to base64
  echo %encoded_args%
  pause
  for /f "delims=" %%A in ('powershell -Command "[Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('%encoded_args%'))"') do set "decoded_args=%%A"
  echo %decoded_args%
)

REM It is optional to check whether we are in the console or GUI
call :is_running_in_console
if not %IsRunningInConsole% == true ( echo we are not running in console )

pause

call :Got_Admin
if not %GotAdmin% == true ( call :Get_Admin )
if not %GotAdmin% == true ( GoTo :EOF )

REM Rest of your script here
echo GotAdmin?  %GotAdmin% Running in console ? %IsRunningInConsole%
pause

GoTo :EOF

REM Function to check for and then obtain admin privileges
:Got_Admin
  net session >nul 2>&1
  set GotAdmin=false & if %errorLevel% == 0 ( set GotAdmin=true )
GoTo :EOF

:Get_Admin_With_Argument_AS_IS
  echo Acquiring administrative privileges...
  if %IsRunningInConsole% == true ( set RunInConsoleParam='-RunInConsole' , )
  echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '-Escalated',%RunInConsoleParam% '-EncodedArgs', '%encoded_args%'"
  powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '-Escalated',%RunInConsoleParam% '-EncodedArgs', '%encoded_args%'"
GoTo :EOF
:Get_Admin
REM Function to obtain admin privileges via UAC request
:Get_Admin_With_Argument_Encoding
  echo Acquiring administrative privileges...
  if %IsRunningInConsole% == true ( set RunInConsoleParam='-RunInConsole' , )
  echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '-Escalated',%RunInConsoleParam% '-EncodedArgs', '%encoded_args%'"
  powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '-Escalated',%RunInConsoleParam% '-EncodedArgs', '%encoded_args%'"
GoTo :EOF

REM Checking for console function is not mandatory for privilege escalation
:is_running_in_console
  if %IsRunningInConsole% == true ( GoTo :EOF )
  Set "CleanedCMD=%cmdcmdline:"=_%"
  Set IsRunningInConsole=false & if "%CleanedCMD:cmd.exe=%" == "%CleanedCMD%" ( Set IsRunningInConsole=true )
GoTo :EOF

REM Incomplete , should take all arguments and return lastargument not set a global variable
:GetLastArgument
  set "LastArgument=%~1"
  shift
  if not "%~1"=="" goto :GetLastArgument
goto :eof

REM :Get_Admin
REM   echo Acquiring administrative privileges...
REM   echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList ('-Escalated', [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('%encoded_args%')) -join ' ')"
REM   powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList ('-Escalated', [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('%encoded_args%')) -join ' ')"
REM GoTo :EOF

echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('%encoded_args%'))"
  powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('%encoded_args%'))"
  rem echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=`"%' "
  rem powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=`"%' "




REM :Get_Admin
  REM echo Acquiring administrative privileges...
  REM echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=`"%' "
  REM powershell -Command `Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params%' `
  REM rem this was almost working
  REM rem echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=`"%' "
  rem powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=`"%' "
REM GoTo :EOF

REM :Get_Admin
REM  echo Acquiring administrative privileges...
REM  rem echo Current script name and parameters are %~f0 %*
REM  rem echo %*
REM  rem set "batchPath=%~f0" & set "params=%*" & set params=%params:"=\"%
REM  rem set "BatchPath=%~f0" 
REM  rem set "Params=%*"
REM  rem set params=%params:"=\"%
REM  echo Running command : powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=\"%' "
REM  powershell -Command "Start-Process '%batchPath%' -Verb RunAs -ArgumentList '%params:"=`"%' "
  REM
  rem echo runas /user:%userdomain%\%username% "%batchPath%" %params%
  rem echo runas /user:%userdomain%\%username% %batchPath% %params%
  rem runas /user:%userdomain%\%username% "%batchPath%" %params%
REM GoTo :EOF



rem D:\>runas /user:user test
rem Enter the password for user:
rem Attempting to start test as user "USER-MEF3AKIAEM\user" ...
rem RUNAS ERROR: Unable to run - test
rem 1326: The user name or password is incorrect.

rem this version did not work, always give error 
rem D:\>runas /user:administrator test.bat
rem Enter the password for administrator:
rem Attempting to start test.bat as user "USER-MEF3AKIAEM\administrator" ...
rem RUNAS ERROR: Unable to run - test.bat
rem 1326: The user name or password is incorrect.

REM :Get_Admin
REM   echo Acquiring administrative privileges...
REM   echo Current script name and parameters are %~f0 %*
REM   rem set "batchPath=%~f0" & set "params=%*" & set params=%params:"=\"%
REM   set "batchPath=%~f0" 
REM   set "params=%*"
REM   rem set params=%params:"=\"%
REM   echo runas /user:%userdomain%\%username% "%batchPath%" %params%
REM   echo runas /user:%userdomain%\%username% %batchPath% %params%
REM   runas /user:%userdomain%\%username% "%batchPath%" %params%
REM GoTo :EOF





rem Previous version
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative privileges detected.
) else (
    echo Acquiring administrative privileges...
    set "params=%*"
    set params=%params:"=\"%
    set "batchPath=%~f0"
	echo /user:%userdomain%\%username% %batchPath% %params%
    runas /user:%userdomain%\%username% "%batchPath% %params%"
    exit
)


net session >nul 2>&1
if %errorLevel% == 0 (
	echo Your batch file has administrative privileges.
) else (
	echo Your batch file does not have administrative privileges.
)
echo Command line arguments: %*

pause



