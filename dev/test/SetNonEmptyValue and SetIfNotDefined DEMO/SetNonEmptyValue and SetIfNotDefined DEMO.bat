@echo off
:setup
call :ClearLocalVariables
Call :GetTime FileTime StartDate StartTime
Call :GetCodePage InitialCodepage
Call :SetTitle "Control 'This PC' icon on the desktop" 
set debug=false
set verbose=100
set silent=false
set logfile=%tmp%\%filetime%
if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
call :SetMacroPrintTime

:main

cls

%PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
if "[%silent%]"=="[true]" echo Silent mode is enabled
if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more



call :SetNonEmptyValueOnlyIfNotDefined-DEMO
REM call :EchoArray-DEMO
REM call :trim-DEMO
GoTo :END

:SetNonEmptyValueOnlyIfNotDefined-DEMO

echo expected results
echo emptyvalue  / variable not set +                 SetNonEmptyValue = do nothing
echo emptyvalue  / variable     set +                 SetNonEmptyValue = do nothing
echo filledvalue / variable not set +                 SetNonEmptyValue = do it
echo filledvalue / variable     set +                 SetNonEmptyValue = do it
echo emptyvalue  / variable not set +                  SetIfNotDefined = do it
echo emptyvalue  / variable     set +                  SetIfNotDefined = do nothing
echo filledvalue / variable not set +                  SetIfNotDefined = do it
echo filledvalue / variable     set +                  SetIfNotDefined = do nothing
echo emptyvalue  / variable not set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo emptyvalue  / variable     set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo filledvalue / variable not set + SetNonEmptyValueOnlyIfNotDefined = do it
echo filledvalue / variable     set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo.

echo doing :SetNonEmptyValue-DEMO-start 
Call :SetNonEmptyValue-DEMO-start
echo.
echo doing :SetIfNotDefined-DEMO-start
Call :SetIfNotDefined-DEMO-start
echo.
echo doing :SetNonEmptyValueOnlyIfNotDefined-DEMO-start
Call :SetNonEmptyValueOnlyIfNotDefined-DEMO-start

Call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset
echo.
echo For all these functions you can perform multiple one the same line
echo example Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable "%AFilledValue%" ADefinedVariable
echo.
set AnUndefinedVariable
set ADefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable "%AFilledValue%" ADefinedVariable
set AnUndefinedVariable
set ADefinedVariable


GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO-reset
set "AFilledValue=fillercontent"
set "AnEmptyValue="
set "AnUndefinedVariable="
set "ADefinedVariable=Old value in ADefinedVariable"
GoTo :EOF

:SetNonEmptyValue-DEMO-start

echo.
echo Calling :SetNonEmptyValue with AnEmptyValue to AnUndefinedVariable
Call :SetNonEmptyValue "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AnEmptyValue to ADefinedVariable
Call :SetNonEmptyValue "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AFilledValue to AnUndefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AFilledValue to ADefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetIfNotDefined-DEMO-start

echo.
echo Calling :SetIfNotDefined with AnEmptyValue to AnUndefinedVariable
Call :SetIfNotDefined "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AnEmptyValue to ADefinedVariable
Call :SetIfNotDefined "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AFilledValue to AnUndefinedVariable
Call :SetIfNotDefined "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AFilledValue to ADefinedVariable
Call :SetIfNotDefined "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO-start

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AnEmptyValue to AnUndefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AnEmptyValue to ADefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AFilledValue to AnUndefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AFilledValue to ADefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetIfNotDefined-DEMO

Call :ClearVariablesByPrefix myoutputvar
Call :ClearVariablesByPrefix myvalue

set "myoutputvar1=Already defined 111"
set "myoutputvar2="
set "myoutputvar3=Already defined 333"
set "myoutputvar4="

set "myvalue1=a new 1 value"
set "myvalue2=a new 2 value"
set "myvalue3="
set "myvalue4=a new 4 value"

echo.
echo Calling SetIfNotDefined set a value to myoutputvar1, which is already defined
Call :SetIfNotDefined "%myvalue1%" myoutputvar1
set myoutputvar1

echo.
echo Calling SetIfNotDefined set a value with no content to myoutputvar2
Call :SetIfNotDefined "%myvalue3%" myoutputvar2
set myoutputvar2

echo.
echo clearing myoutputvar
Call :ClearVariablesByPrefix myoutputvar

echo.
echo Doing both previous actions, plus one more, but on a single line
Call :SetIfNotDefined "%myvalue1%" myoutputvar1 "%myvalue2%" myoutputvar2 "%myvalue4%" myoutputvar4
set myoutputvar1
set myoutputvar2
set myoutputvar4

Call :ClearVariablesByPrefix myoutputvar
Call :ClearVariablesByPrefix myvalue

GoTo :EOF

GoTo :END



:end
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions 


::Usage Call :CreateTestArray ArrayName Count Suffixes
:: Will create array ArrayName from element 0 to Count, with all listed suffixes
:: Each array value will contain the element number followed by the suffix name
:CreateTestArray
set "_CreateTestArray_ArrayName=%~1"
set /a _CreateTestArray_ArrayCount=%~2
if "[%~3]"=="[]" (
set /a _CreateTestArray_suffix.index=0
set /a _CreateTestArray_suffix.ubound=0
set "_CreateTestArray_suffix[0]=NOSUFFIX"
GoTo :CreateTestArray-arguments-to-suffix-loop-skip
)
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-arguments-to-suffix-loop
set "_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]=%~3"
set _CreateTestArray_suffix.ubound=%_CreateTestArray_suffix.index%
set /a _CreateTestArray_suffix.index+=1
shift
if not "[%~3]"=="[]" GoTo :CreateTestArray-arguments-to-suffix-loop
:CreateTestArray-arguments-to-suffix-loop-skip
set /a _CreateTestArray_ArrayIndex=0
:CreateTestArray-loop-start
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-suffix-loop
set "_CreateTestArray_suffix.current="
call set "_CreateTestArray_suffix.current=%%_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]%%"
if "[%_CreateTestArray_suffix.current%]"=="[NOSUFFIX]" set "_CreateTestArray_suffix.current="
set "_CreateTestArray_suffix.current.content="
if not "[%_CreateTestArray_suffix.current%]"=="[]" set "_CreateTestArray_suffix.current.content=-%_CreateTestArray_suffix.current%"
set %_CreateTestArray_ArrayName%[%_CreateTestArray_ArrayIndex%]%_CreateTestArray_suffix.current%=%_CreateTestArray_ArrayIndex%%_CreateTestArray_suffix.current.content%
set /a _CreateTestArray_suffix.index+=1
if %_CreateTestArray_suffix.index% LEQ %_CreateTestArray_suffix.ubound% Goto :CreateTestArray-suffix-loop
set /a _CreateTestArray_ArrayIndex+=1
if %_CreateTestArray_ArrayIndex% LEQ %_CreateTestArray_ArrayCount% Goto :CreateTestArray-loop-start
set /a %_CreateTestArray_ArrayName%.count=%_CreateTestArray_ArrayIndex%
set /a _CreateTestArray_ArrayIndex-=1
set /a %_CreateTestArray_ArrayName%.lbound=0
set /a %_CreateTestArray_ArrayName%.ubound=%_CreateTestArray_ArrayIndex%
Call :ClearVariablesByPrefix _CreateTestArray
GoTo :EOF



REM Example usage inside a for loop
REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" && echo it was same || echo it was not
::Usage Call :FORIF your IF statement
:FORIF
REM echo just before forif %*
if %* (exit /b 0) ELSE (exit /b 1)
GoTo :EOF

::Usage Call :Left "%InputVariable%" OutputVariable lenght
:Left
set "_Left_input=%~1"
call set "%~2=%%_Left_input:~0,%~3%%"
set "_Left_input="
GoTo :EOF

::Usage Call :Right "%InputVariable%" OutputVariable lenght
:Right
set "_Right_input=%~1"
call set "%~2=%%_Right_input:~-%~3%%"
set "_Right_input="
GoTo :EOF

::Usage Call :Mid  "%InputVariable%" OutputVariable lenght optional start=0
:Mid
if "[%~4]"=="[]" ( set /a _Mid_start=0 ) else ( set "_Mid_start=%~4" )
set "_Mid_input=%~1"
call set "%~2=%%_Mid_input:~%_Mid_start%,%~3%%"
set "_Mid_input="
GoTo :EOF


::Usage Call :LeftCut "%InputVariable%" OutputVariable lenght
:LeftCut
set "LeftCut_input=%~1"
call set "%~2=%%LeftCut_input:~%~3%%"
set "LeftCut_input="
GoTo :EOF

::Usage Call :RightCut "%InputVariable%" OutputVariable lenght
:RightCut
set "_RightCut_input=%~1"
call set "%~2=%%_RightCut_input:~,-%~3%%"
set "_RightCut_input="
GoTo :EOF

::Usage Call :MidCut  "%InputVariable%" OutputVariable lenght optional start=0
:MidCut
if "[%~4]"=="[]" ( set /a _MidCut_start=0 ) else ( set "_MidCut_start=%~4" )
set "_MidCut_input=%~1"
set /a _MidCut_end=%_MidCut_start%+%~3
call set "%~2=%%_MidCut_input:~0,%_MidCut_start%%%%%_MidCut_input:~%_MidCut_end%%%"
set "_MidCut_input=" & set "_MidCut_end="
GoTo :EOF

::Usage Call :Replace "%InputVariable%" OutputVariable "%SearchWord%" "%ReplaceWord%"
:Replace
set "_Replace_InputVariable=%~1"
set "_Replace_SearchWord=%~3"
set "_Replace_ReplaceWord=%~4"
call set "%~2=%%_Replace_InputVariable:%_Replace_SearchWord%=%_Replace_ReplaceWord%%%"
GoTo :EOF

::Usage Call :Count "%InputVariable%" OutputVariable "%SearchWord%"
:Count
set "_Count_InputVariable=%~1"
set "_Count_SearchWord=%~3"
Call :len _Count_InputVariable _Count_InputVariable.len 
Call :len _Count_SearchWord _Count_SearchWord.len 
REM echo len %_Count_InputVariable.len% %_Count_SearchWord.len%
set /a _Count_match=0
set /a _Count_index=0
:Count-loop
call set "_Count_CompareWindow=%%_Count_InputVariable:~%_Count_index%,%_Count_SearchWord.len%%%"
call set "_Count_Compare=%%_Count_CompareWindow:%_Count_SearchWord%=%%"
REM echo 1%_Count_InputVariable%1 2%_Count_CompareWindow%2 3%_Count_Compare%3 4%_Count_SearchWord%4
if not "[%_Count_CompareWindow%]"=="[%_Count_Compare%]" set /a _Count_match+=1
set /a _Count_index+=1
if %_Count_index% LSS %_Count_InputVariable.len% GoTo :Count-loop
set /a "%~2=%_Count_match%"
GoTo :EOF


:: Usage Call :IsArrayDefinedBySet Variable OutputValue
:IsArrayDefinedBySet
set /a _IsArrayDefinedBySet.index=0
for /f "tokens=1* delims=" %%a in ('set %~1 2^>^&1') do ( call set _IsArrayDefinedBySet[%%_IsArrayDefinedBySet.index%%]=%%a & call set /a _IsArrayDefinedBySet.index+=1 )
if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:Environment variable=%]" ( 
	if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:not defined=%]" 	set "_IsArrayDefinedBySet.IsDefined=false" ) else ( set "_IsArrayDefinedBySet.IsDefined=true" )
if not "[%~2]"=="[]" set "%~2=%_IsArrayDefinedBySet.IsDefined%"
Call :ClearVariablesByPrefix _IsArrayDefinedBySet & if "[%_IsArrayDefinedBySet.IsDefined%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF




::Usage Call :SetArrayParameters OutputArray ParameterVariable optional lbound optional ubound optional index optional count
:SetArrayParameters
call set "_SetArrayParameters.lbound=%%%~2.lbound%%"
call set "_SetArrayParameters.ubound=%%%~2.ubound%%"
call set "_SetArrayParameters.count=%%%~2.count%%"
call set "_SetArrayParameters.index=%%%~2.index%%"
if not "[%~3]"=="[]" call :IsNumeric "%~3" || set "_SetArrayParameters.lbound=%~3"
if not "[%~4]"=="[]" call :IsNumeric "%~4" || set "_SetArrayParameters.ubound=%~4"
if not "[%~5]"=="[]" call :IsNumeric "%~5" || set "_SetArrayParameters.index=%~5"
if not "[%~6]"=="[]" call :IsNumeric "%~6" || set "_SetArrayParameters.count=%~6"
if "[%_SetArrayParameters.count%]"=="[]" if not "[%_SetArrayParameters.lbound%]"=="[]" if not "[%_SetArrayParameters.ubound%]"=="[]" set /a _SetArrayParameters.count=%_SetArrayParameters.ubound%-%_SetArrayParameters.lbound%+1  2>nul
if not "[%_SetArrayParameters.lbound%]"=="[]" Call :IsNumeric "%_SetArrayParameters.lbound%" || set "%~1.lbound=%_SetArrayParameters.lbound%" 
if not "[%_SetArrayParameters.ubound%]"=="[]" Call :IsNumeric "%_SetArrayParameters.ubound%" || set "%~1.ubound=%_SetArrayParameters.ubound%"
if not "[%_SetArrayParameters.index%]"=="[]" Call :IsNumeric "%_SetArrayParameters.index%"  || set "%~1.index=%_SetArrayParameters.index%"
if not "[%_SetArrayParameters.count%]"=="[]" Call :IsNumeric "%_SetArrayParameters.count%"  || set "%~1.count=%_SetArrayParameters.count%"
Call :ClearVariablesByPrefix _SetArrayParameters & if not "[%_SetArrayParameters.ubound%]"=="[]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF

::Usage Call :GetArrayParameters InputArray ParameterVariable optional Initialize optional StartIndex=0
:GetArrayParameters
if "[%~3]"=="[Initialize]" (
	if "[%_GetArrayParameters.lbound%]"=="[]" set _GetArrayParameters.lbound=0
	if "[%_GetArrayParameters.ubound%]"=="[]" set _GetArrayParameters.ubound=-1
	if "[%_GetArrayParameters.count%]"=="[]" set /a _GetArrayParameters.count=%_GetArrayParameters.ubound%-%_GetArrayParameters.lbound%+1  2>nul
	if "[%_GetArrayParameters.index%]"=="[]" if "[%~4]"=="[]" ( set /a "_GetArrayParameters.index=0" ) else ( set /a "_GetArrayParameters.index=%~4" 2>nul )
)
call set _GetArrayParameters.lbound=%%%~1.lbound%%
call set _GetArrayParameters.ubound=%%%~1.ubound%%
call set _GetArrayParameters.count=%%%~1.count%%
call set _GetArrayParameters.index=%%%~1.index%%
set "%~2.lbound=%_GetArrayParameters.lbound%"
set "%~2.ubound=%_GetArrayParameters.ubound%"
set "%~2.count=%_GetArrayParameters.count%"
set "%~2.index=%_GetArrayParameters.index%"
Call :ClearVariablesByPrefix _GetArrayParameters & if "[%_GetArrayParameters.ubound%]"=="[]" ( exit /b 1 ) else ( exit /b 0 )
GoTo :EOF
::GetArrayParameters-END



::Usage Call :IsInString "%InputString%" SearchString optional OutputBool
:IsInString 
set "_IsInString_input=%~1"
set "_IsInString_search=%~2"
if not "[%_IsInString_search%]"=="[]" call set "_IsInString_compare=%%_IsInString_input:%_IsInString_search%=%%"
REM echo input %_IsInString_input% search %_IsInString_search% compare %_IsInString_compare%
if not "[%_IsInString_input%]"=="[%_IsInString_compare%]" set _IsInString_search=true
if not "[%~3]"=="[]" if "[%_IsInString_search%]"=="[true]" ( set "%~3=true" ) else ( set "%~3=false" )
Call :ClearVariablesByPrefix _IsInString & if "[%_IsInString_search%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )


::Usage Call :IsMatch FirstVariable SecondVariable
:IsMatch
echo if "[%~1]"=="[%~2]" ( exit /b 0 ) else ( exit /b 1 )
if "[%~1]"=="[%~2]" ( exit /b 0 ) else ( exit /b 1 )


REM Macro definitions
:SetMacroPrintTime
set PrintTime=& Call :PrintTime
GoTo :EOF

REM Function library


REM example function structure, with usage and signature
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
::End Functionname SHA256:1234567890 SignDate:

REM -- console functions --

::Usage Call SetTitle MyTitle
:SetTitle 
title %*
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
for /f "tokens=1,2 delims==" %%a in ('set _ 2^>nul') do set %%a=
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
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
set "%~1=%_GetDate% %_GetTime%" & set "%~2=%_GetDate%" & set "%~3=%_GetTime%"
set "_GetDate=" & set "_GetTime="
GoTo :EOF

:: Usage Call :Sleep 5 ' Sleep time in seconds
:Sleep
timeout /t %~1
GoTo :EOF

REM -- string manipulation --

REM ::Usage Call :Replace Input Search Output
REM :Replace
REM set ReplaceInput=%~1
REM set ReplaceSearch=%~2
REM call set %3=%%ReplaceInput:%ReplaceSearch%=%%
REM GoTo :EOF

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

::Usage Call :EchoValue myValue
:EchoValue
call echo %1=%%%1%%
GoTo :EOF
REM echo 1 %1 
REM echo 2 %1% 
REM echo 3 %%1 
REM echo 4 %%1%
REM echo 5 %%%1
REM echo 6 %%%1%
REM echo 7 %%%%1
REM echo 8 %%%%1%
REM echo 9 %%%%%1
REM echo 0 %%%%%1%
REM echo 1 %%%%%%1
REM echo 2 %%%%%%1%
REM echo 3 %1%%
REM echo 4 %%1%%
REM echo 5 %%%1%%
REM echo 6 %%%%1%%
REM echo 7 %%%%%1%%
REM echo 8 %%%%%%1%%
REM echo 9 %1%%%
REM echo 0 %%1%%%
REM echo 1 %%%1%%%
REM echo 2 %%%%1%%%
REM echo 3 %%%%%1%%%
REM echo 4 %%%%%%1%%%
REM echo 5 %%1% 
REM echo 6 %1% 
REM echo 7 %%%1%% 
REM echo 8 %%%1%%% 
REM echo 9 %%%%1%%%
REM echo call
REM call echo 1 %1 
REM call echo 2 %1% 
REM call echo 3 %%1 
REM call echo 4 %%1%
REM call echo 5 %%%1
REM call echo 6 %%%1%
REM call echo 7 %%%%1
REM call echo 8 %%%%1%
REM call echo 9 %%%%%1
REM call echo 0 %%%%%1%
REM call echo 1 %%%%%%1
REM call echo 2 %%%%%%1%
REM call echo 3 %1%%
REM call echo 4 %%1%%
REM call echo x5 %%%1%%
REM call echo 6 %%%%1%%
REM call echo 7 %%%%%1%%
REM call echo 8 %%%%%%1%%
REM call echo 9 %1%%%
REM call echo 0 %%1%%%
REM call echo x1 %%%1%%%
REM call echo 2 %%%%1%%%
REM call echo 3 %%%%%1%%%
REM call echo 4 %%%%%%1%%%
REM call echo 5 %%1% 
REM call echo 6 %1% 
REM call echo x7 %%%1%% 
REM call echo x8 %%%1%%% 
REM call echo 9 %%%%1%%%
GoTo :EOF

REM -- Array manipulation

::Usage Call :DecomposeText InputString optional Step
:DecomposeText
set "_DecomposeText_Input=%~1"
if "[%~2]"=="[]" ( set /a "_DecomposeText_Step=1" ) else ( set /a "_DecomposeText_Step=%~2" )
REM echo 1 Call :len "%_DecomposeText_Input%" _DecomposeText.len
Call :len _DecomposeText_Input _DecomposeText.len
REM echo 2 "%_DecomposeText_Input%" %_DecomposeText.len%
set _DecomposeText
Call :SetArrayParameters _DecomposeText_Input "" 0 %_DecomposeText.len% 0 
:DecomposeText-loop
call echo %_DecomposeText.index% %%_DecomposeText_Input:~%_DecomposeText.index%,%_DecomposeText_Step%%%
set /a "_DecomposeText.index+=%_DecomposeText_Step%""
if %_DecomposeText.index% leq %_DecomposeText.ubound% GoTo :DecomposeText-loop
Call :ClearVariablesByPrefix _DecomposeText
GoTo :EOF

REM option to not return input string in case of nomatch (useful?)
::Usage Call :Split InputString OutputArray optional Delimiter=(default is a space)
:Split

Call :ClearVariablesByPrefix _Split
set "_Split_Input=%~1"
call set "_Split_OutputArray.oldubound=%%%~2.ubound%%"
Call :GetArrayParameters %~2 _Split_OutputArray "" Initialize

if "[%~3]"=="[]" set "_Split_Delimiter= "
call :len _Split_Input _Split_Input.len
call :len _Split_Delimiter _Split_Delimiter.len
Call :SetArrayParameters _Split_Input "" 0 %_Split_Input.len% 0 
set /a _Split_Input.start=0
set /a _Split_Input.end=0
set _Split
Call :DecomposeText "%_Split_Input%"
:Split-main-loop
REM echo index %_Split_Input.index%
REM echo call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
REM call echo echo call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
REM echo window %_Split_Input.CompareWindow% FFGG if "[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]" (
if "[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]" (
	echo match found I"[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]"I %_Split_Input.start% %_Split_Input.end%
	set /a _Split_OutputArray.ubound+=1 
	call set "%_Split_OutputArray%[%_Split_OutputArray.ubound%]=%%_Split_Input:~%_Split_Input.start%,%_Split_Input.end%%%"
	REM echo set /a _Split_Input.index+=%_Split_Delimiter.len%
	set /a _Split_Input.index+=%_Split_Delimiter.len%
	REM call echo call set /a _Split_Input.start=%%_Split_Input.index%%
	call set /a _Split_Input.start=%%_Split_Input.index%%
)

echo set /a _Split_Input.end=%_Split_Input.index%
set /a _Split_Input.end=%_Split_Input.index%
set /a _Split_Input.index+=1
if %_Split_Input.index% leq %_Split_Input.ubound% GoTo :Split-main-loop

REM if %_Split_OutputArray.ubound% equ -1 set "_Split_nomatch=true" & set /a "_Split_OutputArray.ubound=0" & set "%_Split_OutputArray%[0]=_Split_Input" echo NO MATCH FOUND, set output.ubound=0 COPY Input to [0]
Call :SetArrayParameters "%_Split_OutputArray%" _Split_OutputArray


REM this should exit 0 only if there's at least one match
GoTo :EOF


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

::Usage Call :DeconcatenateFast Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
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


::Usage Call :SetNonEmptyValueOnlyIfNotDefined
:SetNonEmptyValueOnlyIfNotDefined
set "_SetNonEmptyValueOnlyIfNotDefined_Output=%~2"
if not "[%~1]"=="[]" if not defined %_SetNonEmptyValueOnlyIfNotDefined_Output% set "%_SetNonEmptyValueOnlyIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetNonEmptyValueOnlyIfNotDefined
set "_SetNonEmptyValueOnlyIfNotDefined_Output="
GoTo :EOF

::Usage Call :SetNonEmptyValue "%InputValue%" OutputVariable optional "%InputValue2%" OutputVariable2 optional "%InputValueN%" OutputVariableN
:SetNonEmptyValue
set "_SetNonEmptyValue_Output=%~2"
if not "[%~1]"=="[]" set "%_SetNonEmptyValue_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetNonEmptyValue
set "_SetNonEmptyValue_Output="
GoTo :EOF

::Usage Call :SetIfNotDefined "%ValueIfUnset%" OutputVariable optional VariableName2 "%ValueIfUnset2%" optional optional VariableNameN "%ValueIfUnsetN%"
:SetIfNotDefined
set "_SetIfNotDefined_Output=%~2"
if not defined %_SetIfNotDefined_Output% set "%_SetIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetIfNotDefined
set "_SetIfNotDefined_Output="
GoTo :EOF

::Usage Call :EchoArray InputArray optional Start optional End optional Suffix
:EchoArray
set "_EchoArray_input=%~1"
Call :IsArrayDefinedBySet "%_EchoArray_input%" || GoTo :EchoArray-end
call :SetNonEmptyValue "%~2" _EchoArray_start "%~3" _EchoArray_end "%~4" _EchoArray_suffix
Call :GetArrayParameters %_EchoArray_input% _EchoArray_input 
REM if "[%_EchoArray_start%]"=="[]" set /a "_EchoArray_start=%_EchoArray_input.lbound%"
REM if "[%_EchoArray_end%]"=="[]" set /a "_EchoArray_end=%_EchoArray_input.ubound%"
Call :SetIfNotDefined "%_EchoArray_input.lbound%" _EchoArray_start
Call :SetIfNotDefined "%_EchoArray_input.ubound%" _EchoArray_end
set /a _EchoArray_input.index+=%_EchoArray_start%
REM set _EchoArray
:EchoArray-loop
call echo %%%_EchoArray_input%[%_EchoArray_input.index%]%_EchoArray_suffix%%%
set /a _EchoArray_input.index+=1
if %_EchoArray_input.index% leq %_EchoArray_end% GoTo :EchoArray-loop
:EchoArray-end
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF


REM -- misc --

::Usage Call :IsNumeric "%Value%" optional Output
:IsNumeric
if "[%~1]"=="[]" exit /b 0
set "IsNumericInternal=-0123456789"
echo.%~1| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM The minus sign in the wrong place will still return numeric
REM Call :IsNumeric "%var%" && echo it is not numeric || echo it is numeric
REM echo isnumeric with a number
REM call :isnumeric "1" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a letter
REM call :isnumeric "a" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a double quote empty
REM call :isnumeric "" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with no input 
REM call :isnumeric && echo is was not numeric || ( echo it was numeric & echo also you smell )
::IsNumeric-END

::Usage Call :HexPrefixStripper InputHex OutputDecimal ' This just strips leading "0x" if present
:HexPrefixStripper
if "[%~1]"=="[]" GoTo :EOF
set "_HexPrefixStripper_buffer=%~1"
set "%~2=%~1"
if "[%_HexPrefixStripper_buffer:~0,2%]"=="[0x]" call set "%~2=%_HexPrefixStripper_buffer:~2%"
set "_HexPrefixStripper_buffer="
GoTo :EOF


::Usage Call :altlen InputString OutputResult
:altlen 
set "_len_input=%~1"
if not defined _len_input ( set /a "_len=0" GoTo :len-end ) else ( set /a "_len=1" & set /a "_len.index=4096" )
:len-loop
call set "_len.sample=%%_len_input:~%_len.index%,1%%"
if not "[%_len.sample%]"=="[]" set /a "_len+=%_len.index%" & call set "_len_input=%%_len_input:~%_len.index%!%%
set /a "_len.index/=2"
if %_len.index% GTR 0 GoTo :len-loop
:len-end
set /a "%~2=%_len%"
exit /b %_len% & Call :ClearVariablesByPrefix _len


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
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)


::Usage Call :false ReturnValue 'Always returns false, both return value and errorlevel
:false 
if not "[%1]"=="[]" set %1=false
exit /b 1
Call :false ReturnValue && echo it is never true (errorlevel 0) || echo it is always false (errorlevel not 0)
REM thanks https://www.tutorialspoint.com/batch_script/
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)