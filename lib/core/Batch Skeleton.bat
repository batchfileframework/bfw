@echo off
:setup
call :ClearLocalVariables
Call :GetTime FileTime StartDate StartTime
Call :GetCodePage InitialCodepage
Call :SetTitle "Batch skeleton file" 
set scriptname=%~0
set debug=false
set verbose=100
set silent=false
set quiet=false
set logfile=%tmp%\%scriptname%-%filetime%-log.txt
set logerrfile=%tmp%\%scriptname%-%filetime%-log.err.txt
if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :Elevate & exit /b)
Call :EnableMacros


:main

%PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
if "[%silent%]"=="[true]" echo Silent mode is enabled
if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more
GoTo :end

:end
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=
set _ElevateAndWait=

GoTo :EOF
REM Exit /b %returnvalue%

REM Macro definitions
:EnableMacros
set PrintTime=& Call :PrintTime
GoTo :EOF

REM Internal Functions

REM :Banner
:BANNER
if /i "[%quiet%]"=="[true]" GoTo :EOF
if /i "[%silent%]"=="[true]" GoTo :EOF
Call :VERSION
Call :EchoArguments
echo Description of actions to be taken based on arguments
GoTo :EOF


REM :Version
:VERSION
echo This is FunctionName, version 0.0.0
GoTo :EOF

REM HELP
:HELP
echo This is the 'batch skeleton' script, 
echo a starting point for creating new script
echo pre-loaded with structures and function
echo to make batch file scripting easier
echo this :HELP function should be replace
echo with usage information about the newly made
echo script and it should be displayed
echo if the arguments are invalid or contain
echo arguments like -h /h -? /? --help and so on
GoTo :EOF

REM Macro definitions
:SetMacroPrintTime
set PrintTime=& Call :PrintTime
GoTo :EOF

REM Function library


REM example function structure, with usage and signature
:: Version 1.0.x, release date
:: Publication URL
:: Usage Call :FunctionNameHELP parameter optional parameter 'clarification comments
:FunctionNameHELP
echo Name and usage
echo dependencies
echo Date and URL
echo by YourName
echo examples 
echo examples 
echo examples 
echo credit 
:GoTo :EOF
:FunctionName
::End Functionname SHA256:1234567890 SignDate:1900-01-01 'ISO8861 format

REM -- console functions --

::Usage SetTitle MyTitle
:SetTitle 
title %~1
GoTo:EOF

:: Perform self-elevation, passing all arguments through.
:ElevateAndWait
set _ElevateAndWait=-Wait
:Elevate
  if defined args set args=%args:^=^^%
  if defined args set args=%args:<=^<%
  if defined args set args=%args:>=^>%
  if defined args set args=%args:&=^&%
  if defined args set args=%args:|=^|%
  if defined args set "args=%args:"=\"\"%"
  :: Note:  
  ::  * To keep the elevated session open until explicitly exited by the user,
  ::    use /k instead of /c
  powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    " Start-Process %_ElevateAndWait% -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD% \"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
goto :EOF
REM https://stackoverflow.com/questions/76040676/batch-file-auto-elevation-using-powershell-and-not-mangling-the-arguments-but-pr/76055486?noredirect=1#comment134178642_76055486

:: Test if this session is elevated.
:: `net session` only succeeds and therefore reports exit code 0 
:: in an elevated session.
:IsAdmin
if not "[%1]"=="[]" set %1=false
  net session >NUL 2>&1
  if %ERRORLEVEL% == 0 if not "[%1]"=="[]" set %1=true
  net session >NUL 2>&1
goto :EOF

:: Usage Call :ClearLocalVariables
:ClearLocalVariables
for /f "tokens=1,2 delims==" %%a in ('set _') do set %%a=
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~1]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

:GoToFolderOfBatchFile
pushd %1
GoTo :EOF

:ReturnToInitialFolder
popd
GoTo :EOF

::Usage Call :ShowCodepage 
:ShowCodepage
chcp
GoTo :EOF

::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF

::Usage Call :SetCodePage NewCodePage
:SetCodePage
chcp %~1
GoTo :EOF

REM -- time functions --

::Usage Call :PrintTime
:PrintTime
echo %date% %time%
GoTo :EOF

::Usage Call :GetTime
:GetTime
set _GetDate=%date% & set _GetTime=%time%
set _GetTime=%_GetTime: 0=00%
set _GetTime=%_GetTime:~0,2%h%_GetTime:~3,2%m%_GetTime:~6,2%s%_GetTime:~9,2%
set %~1=%_GetDate% %_GetTime% & set %~2=%_GetDate% & set %~3=%_GetTime%
set _GetDate= & set _GetTime=
GoTo :EOF

:: Usage Call :Sleep 5 ' Sleep time in seconds
:Sleep
timeout /t %~1
GoTo :EOF

REM -- string manipulation --

::Usage Call :Replace Input Search Output
:Replace
set ReplaceInput=%~1
set ReplaceSearch=%~2
call set %3=%%ReplaceInput:%ReplaceSearch%=%%
GoTo :EOF

::Usage Call :TrimQuotes %variable% variable
:TrimQuotes
set TrimQuotes=%~1
set %2=%TrimQuotes%
GoTo :EOF

::Usage Call :TrimTrailingBackslash %Input% Output 
:TrimTrailingBackslash
set TrimTrailingBackslashInput=%1
if "%TrimTrailingBackslashInput:~-1%"=="\" ( 
  set %2=%TrimTrailingBackslashInput:~0,-1%
  ) else (
  set %2=%TrimTrailingBackslashInput%
  )
GoTo :EOF


REM Untested
::Usage Call :deasterisk Input Output
:deasterisk
FOR /f "tokens=1* delims=*" %%i IN ("%~1") DO (
   SET _deasterisk=%%j
   IF DEFINED _deasterisk (
      SET _deasterisk=%%i%%j
      GOTO :deasterisk
   ) ELSE (
      SET _deasterisk=%%i
   )
)
set %2=%_deasterisk%
GoTo :EOF
REM https://stackoverflow.com/questions/15441422/replace-character-of-string-in-batch-script

REM -- Array manipulation

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:deconcatenate
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:deconcatenate_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:deconcatenate_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :deconcatenate_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo writing set %~3[%_token%] = %_buffer% 
if "[%_IsDelimiter%]"=="[true]" call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :deconcatenate_input_loop
if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:DeconcatenateFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set /a index=0
set /a %3.lbound=%index%
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%~3[%%index%%]=%%w"
	set /a "index+=1"
)
set /a "index-=1"
set %3.ubound=%index%
GoTo :EOF

:: Requires :len (maybe support %ReturnEmpty% for special cases ?)
::Usage Call :GetLastElement Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=%_input.len%-1 & set "_char=" & set "_buffer="
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetLastElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor-=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetLastElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_char%%_buffer%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetLastElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" echo is a delimiter and buffer not empty %_buffer% 
if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" set "%~3=%_buffer%" & GoTo :EOF
if %_cursor% LSS %_input.len% goto :GetLastElement_input_loop
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%3=%%~w"
)
GoTo :EOF

::Usage Call :GetNthElement Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
::set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetNthElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetNthElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetNthElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo if %_token% EQU %4 
if "[%_IsDelimiter%]"=="[true]" if %_token% EQU %4 set "%~3=%_buffer%" & GoTo :EOF 
if "[%_IsDelimiter%]"=="[true]" set "_buffer=" && set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :GetNthElement_input_loop
::if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
if %_token% EQU %4 set "%~3=%_buffer%"
GoTo :EOF

::Usage Call :GetNthElementFast Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set "_buffer="
set /a index=0
call set _input="%%_input:%_delimiter%=" "%%"
setlocal enableDelayedExpansion
for %%w in (%_input%) do (
	REM echo %%w
	call set "_buffer=%%~w"
	if !index! EQU %4 GoTo :GetNthElementFast_ExitFor
	set /a "index+=1"
)
REM clearing buffer, index did not reach count
 set "_buffer="
:GetNthElementFast_ExitFor
endlocal & set "%3=%_buffer%"
GoTo :EOF

:: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
:: Example set EchoArrayPrefix=InputArray[%%index%%]=
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "len=%%%~1.len%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
if not ["%len%"]==[""] call echo %~1.len %%%~1.len%%
if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop

::Usage Call :Ubound InputArray UboundOutput ' make this better, search "set" for the real ubound
:Ubound
set %2=%~1.ubound
GoTo :EOF

::Usage Call :Lbound InputArray LboundOutput' make this better, search "set" for the real ubound
:lbound
set %2=%~1.lbound
GoTo :EOF

:: ClearArray InputArray optional start optional end
:ClearArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
if not ["%~1.lbound"]==[""] set %~1.lbound=
if not ["%~1.ubound"]==[""] set %~1.ubound=
if not ["%~1.count"]==[""] set %~1.count=
if not ["%~1.next"]==[""] set %~1.next=
if not ["%~1.previous"]==[""] set %~1.previous=
:ClearArray-internal-loop
if not defined %~1[%index%] GoTo :ClearArray-end
call set %%%~1[%index%]%=
set /a index+=1
if %index% GTR %limit% goto :ClearArray-end
GoTo :ClearArray-internal-loop
:ClearArray-end
set index=
set limit=
GoTo :EOF


REM -- misc --

::Usage Call :IsNumeric "%Value%" optional Output
:IsNumeric
if "[%~1]"=="[]" exit /b 0
set "IsNumericInternal=0123456789"
echo.%~1| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM Call :IsNumeric "%var%" && echo it is not numeric || echo it is numeric
REM echo isnumeric with a number
REM call :isnumeric "1" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a letter
REM call :isnumeric "a" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a double quote empty
REM call :isnumeric "" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with no input 
REM call :isnumeric && echo is was not numeric || ( echo it was numeric & echo also you smell )
::IsNumeric-END

REM incomplete
:: Call :InStB input search result
:InStB
set "InputSTR=%1"
set "SearchSTR=%2"
set %3=false
echo input string %InputSTR%
echo search string %SearchSTR%
echo third param %3
call set TestSTR=%%InputSTR:%SearchSTR:~1,-1%=%%
echo test string %InputSTR%
echo test string %TestSTR%
if %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( set %3=true )
GoTo :EOF
REM Add example if test || && etc..

:len <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~1!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~2=%len%"
    exit /b
)
REM https://stackoverflow.com/a/5841587

::Usage Call :True ReturnValue 'Always returns true, both return value and errorlevel
:true 
if not "[%1]"=="[]" set %1=true
exit /b 0
REM Call :True ReturnValue && echo it is always true (errorlevel 0) || echo it is never false (errorlevel not 0)

::Usage Call :false ReturnValue 'Always returns false, both return value and errorlevel
:false 
if not "[%1]"=="[]" set %1=false
exit /b 1
REM Call :false ReturnValue && echo it is never true (errorlevel 0) || echo it is always false (errorlevel not 0)
REM thanks https://www.tutorialspoint.com/batch_script/