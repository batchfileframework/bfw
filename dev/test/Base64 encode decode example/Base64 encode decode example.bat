@echo off
rem command line "Base64 encode decode example.bat" parameter1 parameter2 parameter3 value1=true -command "path and file"

rem Set params=%*
Set params=parameter1 parameter2 parameter3 value1=true -command "path and file"

call :ReturnHumanErrorCode -1073741502 MyVari
echo %Myvari%


echo call :EncodeToBase64 Base64String %params% 
call :EncodeToBase64 Base64String %params% 
echo Encoded: %Base64String%
echo call :DecodeFromBase64 DecodedString %Base64String%
call :DecodeFromBase64 DecodedString %Base64String%
echo Decoded: %DecodedString%

echo.

echo input string %params% 
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params:"=\"%'))"`) do set "MYVAR=%%a"
echo encoded string %MYVAR%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo decoded string %MYVAR2%

echo %Base64String%
echo %MYVAR%
echo %DecodedString%
echo %MYVAR2%

GoTo :EOF

:EncodeToBase64
set InputString=%* & set FirstArg=%1
call set InputString=%%InputString:%FirstArg%=%%
set InputString=%InputString:"=\"% 
set InputString=%InputString:~1%
echo input encode %InputString% 
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%InputString%'))"`) do set "%1=%%a"
goto :eof

:DecodeFromBase64
set InputBase64=%* & set FirstArg=%1
call set InputBase64=%%InputBase64:%FirstArg%=%%
set InputBase64=%InputBase64:~1%
echo input decode string %InputBase64%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%InputBase64%'))"`) do set "%1=%%a"
goto :eof

REM call :ListProcessPIDs processname
:ListProcessPIDs
set PIDList=
setlocal enabledelayedexpansion
for /f "tokens=2" %%a in ('tasklist ^| find "%1" ^| sort') do set PIDList=!PIDList!,%%a
echo !PIDList:~1!
endlocal
GoTo :EOF

REM call :CreateMultiLineString
:CreateMultiLineString
setlocal enableDelayedExpansion
set NL=^


:: Two empty lines required
set "myVariable=This is the first line.!NL!This is the second line.!NL!And this is the third line."
echo !myVariable!
endlocal
GoTo :EOF

:FunctionExampleMultiLineInput
REM for %%i in ("%input_string:,=","%") do echo %%~i
for /f "delims=SEPARATOR" %%i in ("%input_string%") do echo %%i
GoTo :EOF

:: call :ReturnHumanErrorCode %ErrorLevel% HumanReadableMessage
:ReturnHumanErrorCode
SETLOCAL
set val0=Program successfully completed.
set val1=Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe.
set val2=The system cannot find the file specified. Indicates that the file cannot be found in specified location.
set val3=The system cannot find the path specified. Indicates that the specified path cannot be found.
set val5=Access is denied. Indicates that user has no access right to specified resource.
set val9009=Program is not recognized as an internal or external command, operable program or batch file. Indicates that command, application name or path has been misspelled when configuring the Action.
set val0x2331=%val9009%
set val221225495=Not enough virtual memory is available. It indicates that Windows has run out of memory.
set val0xC0000017=%val221225495%
set val-1073741801=%val221225495%
set val3221225786=The application terminated as a result of a CTRL+C. Indicates that the application has been terminated either by the user's keyboard input CTRL+C or CTRL+Break or closing command prompt window.
set val0xC000013A=%val3221225786%
set val-1073741510=%val3221225786%
set val3221225794=The application failed to initialize properly. Indicates that the application has been launched on a Desktop to which the current user has no access rights. Another possible cause is that either gdi32.dll or user32.dll has failed to initialize.
set val0xC0000142=%val3221225794%
set val-1073741502=%val3221225794%
set varname=val%1
call set result=%%%varname%%%
ENDLOCAL & SET %2=%result%
GoTo :EOF

