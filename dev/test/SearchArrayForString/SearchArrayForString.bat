@echo off 
:setup
:main


Call :SearchArrayForString-DEMO

GoTo :EOF


:SearchArrayForString-DEMO

:: Create a test array
set "testArray[0]=apple"
set "testArray[1]=banana"
set "testArray[2]=cherry"
set "testArray[3]=banana apple"
set "testArray[4]=grape apple"
set "testArray.lbound=0"
set "testArray.ubound=4"

echo call :SearchArrayForString testArray searchResults apple banana

:: Search the array
call :SearchArrayForString testArray searchResults apple banana

setlocal enabledelayedexpansion
:: Display results
echo Results:
set "index=0"
:LoopResults
if defined searchResults[%index%] (
    echo !searchResults[%index%]!
    set /a "index+=1"
    goto :LoopResults
)
endlocal


:: Expected results
REM echo.
REM echo Expected:
REM echo banana apple
REM echo grape apple

echo.
echo Expected:
echo apple
echo banana apple
echo grape apple
echo banana
echo banana apple


GoTo :EOF




::Usage Call :SearchArrayForString InputArray ResultsTuples SearchText1 SearchText2 SearchTextN
:SearchArrayForString
set "_SearchArrayForString_prefix=_SAFS"
set "_SAFS_input=%~1"
set "_SAFS_output=%~2"
if not defined %_SAFS_input%.lbound ( set "_SAFS_input_lbound=0" ) else ( call set "_SAFS_input_lbound=%%%_SAFS_input%.lbound%%" )
call set "_SAFS_input_ubound=%%%_SAFS_input%.ubound%%"
if not defined %_SAFS_output%.lbound ( set "_SAFS_output_lbound=0" ) else ( call set "_SAFS_output_lbound=%%%_SAFS_output%.lbound%%" )
if not defined %_SAFS_output%.ubound ( set "_SAFS_output_ubound=-1" ) else ( call set "_SAFS_output_ubound=%%%_SAFS_output%.ubound%%" )
set /a "_SAFS_searchlist.lbound=0"
set /a "_SAFS_searchlist.ubound=-1"
REM set _SAFS
:SearchArrayForString-argument-loop
if defined %~3 set /a "_SAFS_searchlist.ubound+=1"
if defined %~3 call set /a "_SAFS_searchlist[%_SAFS_searchlist.ubound%]=%%%~3%%"
if defined %~3.ubound Call :CopyArray %~3 _SAFS_searchlist
if not defined %~3.ubound if not defined %~3 set /a "_SAFS_searchlist.ubound+=1"
if not defined %~3.ubound if not defined %~3 set _SAFS_searchlist[%_SAFS_searchlist.ubound%]=%~3
if "[%~4]" NEQ "[]" shift & GoTo :SearchArrayForString-argument-loop
set /a "_SAFS_searchlist_index=%_SAFS_searchlist.lbound%"
REM echo.&set _SAFS_searchlist
:SearchArrayForString-loop
call set "_SAFS_currentsearch=%%_SAFS_searchlist[%_SAFS_searchlist_index%]%%"
set /a "_SAFS_input_index=0"
:SearchArrayForString-internal-loop
call set _SAFS_currentline=%%%_SAFS_input%[%_SAFS_input_index%]%%
call set _SAFS_currentcompare=%%_SAFS_currentline:%_SAFS_currentsearch%=%%
if "[%_SAFS_currentline%]" NEQ "[%_SAFS_currentcompare%]" set /a "_SAFS_output_ubound+=1"
if "[%_SAFS_currentline%]" NEQ "[%_SAFS_currentcompare%]" set /a "%_SAFS_output%[%_SAFS_output_ubound%].index=%_SAFS_input_index%" & set %_SAFS_output%[%_SAFS_output_ubound%]=%_SAFS_currentline%
set /a "_SAFS_input_index+=1"
if %_SAFS_input_index% LEQ %_SAFS_input_ubound% GoTo :SearchArrayForString-internal-loop
set /a "_SAFS_searchlist_index+=1"
if %_SAFS_searchlist_index% LEQ %_SAFS_searchlist.ubound% GoTo :SearchArrayForString-loop
if %_SAFS_output_ubound% GEQ 0 call set /a "%_SAFS_output%=%%_SAFS_output%[0]%%"
if %_SAFS_output_ubound% GEQ 0 set /a "%_SAFS_output%.lbound=%_SAFS_output_lbound%" & set /a "%_SAFS_output%.ubound=%_SAFS_output_ubound%"
set /a "_SAFS_output_ubound+=1"
Call :ClearVariablesByPrefix %_SearchArrayForString_prefix% _SearchArrayForString & exit /b %_SAFS_output_ubound%



::Usage Call :CopyArray OutputArray InputArray1 InputArray2 InputArrayN 
:CopyArray
set "_CopyArray_prefix=_CA"
set "_CopyArray_output=%~1"
if not defined %_CopyArray_output%.lbound ( set /a "_CopyArray_output_lbound=0" ) else ( call set /a "_CopyArray_output_lbound=%%%_CopyArray_output%.lbound%%" )
if not defined %_CopyArray_output%.ubound ( set /a "_CopyArray_output_ubound=-1" ) else ( call set /a "_CopyArray_output_ubound=%%%_CopyArray_output%.ubound%%" )
:CopyArray-arguments
set "_CopyArray_input=%~2"
if not defined %_CopyArray_input%.lbound ( set /a "_CopyArray_input_lbound=0" ) else ( call set /a "_CopyArray_input_lbound=%%%_CopyArray_input%.lbound%%" )
call /a set "_CopyArray_input_ubound=%%%~2%%.ubound"
set /a "_CopyArray_count=0" & set "_CopyArray_index=%_CopyArray_input_lbound%"
:CopyArray-loop
set /a "_CopyArray_input_ubound+=1" & set /a "_CopyArray_count+=1"
setlocal enabledelayedexpansion
set /a "_CopyArray_localscope=true"
for /f "delims=" %%a in ('!%_CopyArray_input%[%_CopyArray_index%]!') do (
														endlocal
														set %_CopyArray_input%[%_CopyArray_input_ubound%]=%%a
														)
if defined _CopyArray_localscope endlocal
set /a "_CopyArray_index+=1"
if %_CopyArray_index% LEQ %_CopyArray_input_ubound% GoTo :CopyArray-loop
set /a %_CopyArray_output%.ubound=%_CopyArray_input_ubound%
if "[%~3]" NEQ "[]" shift & GoTo :CopyArray-arguments
Call :ClearVariablesByPrefix %_CopyArray_prefix% _CopyArray & exit /b %_CopyArray_count%





:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF