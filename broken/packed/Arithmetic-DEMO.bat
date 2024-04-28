@echo off
:setup
:main

call :Arithmetic-DEMO

GoTo :EOF


:Arithmetic-DEMO

echo.&echo Performing calculations byval&echo.

set myresult=
Call :Calculate 2+2 myresult
echo 2+2 is %myresult%
Call :Calculate 2+2+5465+1 myresult
echo 2+2+5465+1 is %myresult%
Call :Calculate 100-25-25+50 myresult
echo 100-25-25+50 is %myresult%
Call :Calculate 25/5 myresult
echo 25/5 is %myresult%
Call :Calculate 10*10 myresult
echo 10*10 is %myresult%
Call :Calculate 99%%%%20 myresult
echo 99%%20 is %myresult%
Call :Calculate 10+10/2 myresult
echo 10+10/2 is %myresult%
Call :Calculate (10+10)/2 myresult
echo (10+10)/2 is %myresult%

set myarray[0]=2+2
set myarray[1]=2+2+5465+1
set myarray[2]=100-25-25+50
set myarray[3]=25/5
set myarray[4]=10*10
set myarray[5]=99%%20
set myarray[6]=10+10/2
set myarray[7]=(10+10)/2


echo.&echo Performing calculations byref&echo.
set myresult=
Call :Calculate myarray[0] myresult
echo %myarray[0]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[1] myresult
echo %myarray[1]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[2] myresult
echo %myarray[2]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[3] myresult
echo %myarray[3]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[4] myresult
echo %myarray[4]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[5] myresult
echo %myarray[5]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[6] myresult
echo %myarray[6]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[7] myresult
echo %myarray[7]% is %myresult%, errorlevel is %errorlevel%

set myarray.ubound=7
echo.&echo Performing calculations from array byref&echo.
Call :Calculate myarray myresults
call :echoarray myresults

GoTo :EOF


REM maybe another version, or parameter, where each subsequent operation is performed on the result of the previous calculation ? (maybe only if it starts with a operator ?)
::Usage Call :Calculate operations result operations2 result2 operationsN resultN
:Arithmetic
:Calculate
set "_Arithmetic_operation=%~1"
set "_Arithmetic_output=%~2"
if defined %~1.ubound GoTo :Arithmetic-loop-setup
if defined %_Arithmetic_operation% call set "_Arithmetic_operation=%%%_Arithmetic_operation%%%"
set /a "_Arithmetic_result=%_Arithmetic_operation%" 
set /a "%_Arithmetic_output%=%_Arithmetic_result%" & GoTo :Arithmetic-end
:Arithmetic-loop-setup
if defined %_Arithmetic_output%.ubound ( call set /a "_Arithmetic_output_ubound=%%%_Arithmetic_output%.ubound%%" ) else ( set /a "_Arithmetic_output_ubound=-1" )
if defined %_Arithmetic_operation%.lbound ( call set /a "_Arithmetic_operation_lbound=%%%_Arithmetic_operation%.lbound%%" ) else ( set /a "_Arithmetic_operation_lbound=0" )
call set /a "_Arithmetic_operation_ubound=%%%_Arithmetic_operation%.ubound%%"
set /a "_Arithmetic_operation_index=%_Arithmetic_operation_lbound%"
:Arithmetic-loop
set /a "_Arithmetic_output_ubound+=1"
call set /a "_Arithmetic_result=%%%_Arithmetic_operation%[%_Arithmetic_operation_index%]%%"
set /a "%_Arithmetic_output%[%_Arithmetic_output_ubound%]=%_Arithmetic_result%"
set /a "_Arithmetic_operation_index+=1"
if %_Arithmetic_operation_index% LEQ %_Arithmetic_operation_ubound% GoTo :Arithmetic-loop
set /a "%_Arithmetic_output%.ubound=%_Arithmetic_output_ubound%"
:Arithmetic-end
REM if %~3 %~4 clear and goto start
exit /b %_Arithmetic_result%



REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
REM if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _EchoArray_IndexList "%~1" & shift & GoTo :EchoArray-arguments )
:EchoArray-arguments-end
if defined _EchoArray_IndexList.ubound set /a "_EchoArray_ubound=%_EchoArray_IndexList.ubound%"
setlocal enabledelayedexpansion
:EchoArray-loop
if not defined _EchoArray_IndexList.ubound ( set "_EchoArray_index_actual=%_EchoArray_index%" ) else ( set "_EchoArray_index_actual=!_EchoArray_IndexList[%_EchoArray_index%]!" )
if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:
if defined _EchoArray_showvariablename set _EchoArray_prefix=%_EchoArray_input%[%_EchoArray_index_actual%]:
if defined _EchoArray_showvariablename if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:%_EchoArray_input%[%_EchoArray_index_actual%]:
if not defined _EchoArray_verticalmode GoTo :EchoArray-normalmode-loop-next
<nul set /p =%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%! 
GoTo :EchoArray-loop-next
:EchoArray-normalmode-loop-next
REM echo(%_EchoArray_prefix%%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%
echo(%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%!
:EchoArray-loop-next
set /a "_EchoArray_index+=1"
if %_EchoArray_index% LEQ %_EchoArray_ubound% GoTo :EchoArray-loop
:EchoArray-loop-end
endlocal
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF

REM finished ?
::Usage Call :GetIndexArray OutputIndexArray ListOfIndex1 ListOfIndex2 ... ListOfIndexN
::Lists of index are appended to the OutputIndexArray, Lists of index can contain
::single elements "18" 
::comma or space separated elements "10,14,23" "10 14 23"
::single ranges "2-9"
::multiple ranges "45-47,48-94" "45-47 48-94"
::ranges can be in descending order "33-66 66-33"
::ranges can includes more than two end stops "33-67-66-99" 
::or a mix of all the above
::not implemented keywords like start middle quarter third twothird threequarter  "start-45,middle-end,third-twothird,start-end,1-end"
::not implemented percentages 10% 20% 33% 100%  "10%-20%,0%-100%,start-100%"
::not implemented features would require knowing the starting and ending index of the reference array
:GetIndexArray
set "_GetIndexArray_prefix=_GIA"
set "_GIA_output=%~1"
if "[%_GIA_output%]" EQU "[]" GoTo :EOF
if "[%_GIA_output%]" NEQ "[%_GIA_output:[]=%]" set "_GIA_output_suffix=%_GIA_output:*]=%" & set "_GIA_output=%_GIA_output:*[=%"
call set "_GIA_output_lbound=%%%~1.lbound%%"
call set "_GIA_output_ubound=%%%~1.ubound%%"
if "[%_GIA_output_lbound%]" EQU "[]" set /a "_GIA_output_lbound=0"
if "[%_GIA_output_ubound%]" EQU "[]" set /a "_GIA_output_ubound=%_GIA_output_lbound%-1"
shift
:GetIndexArray-arguments
if "[%~1]" EQU "[]" GoTo :EOF
Call :ClearVariablesByPrefix _GIA_current_list
set "_GIA_current_list=%~1"
set /a "_GIA_current_list_index=0"
for /f %%a in ('set %_GIA_current_list%[ 2^>nul') do GoTo :GetIndexArray-isarray-arguments
for %%a in (%_GIA_current_list:,= %) do ( call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1" )
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
REM set _GIA_current_list
GoTo :GetIndexArray-loop
:GetIndexArray-isarray-arguments
call set /a "_GIA_current_list_array_index=%%%_GIA_current_list%.lbound%%" 2>nul
if not defined _GIA_current_list_array_index set /a "_GIA_current_list_array_index=0"
call set /a "_GIA_current_list_array_ubound=%%%_GIA_current_list%.ubound%%" 2>nul
:GetIndexArray-isarray-arguments-loop
call set _GIA_current_list_array_element=%%%_GIA_current_list%[%_GIA_current_list_array_index%]%%
for %%a in (%_GIA_current_list_array_element:,= %) do call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1"
set /a "_GIA_current_list_array_index+=1"
if %_GIA_current_list_array_index% LEQ %_GIA_current_list_array_ubound% GoTo :GetIndexArray-isarray-arguments-loop
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
:GetIndexArray-loop
REM set _GIA_current_list
call set "_GIA_current_list_element=%%_GIA_current_list[%_GIA_current_list_index%]%%
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" GoTo :GetIndexArray-range-skip
set /a "_GIA_current_list_element_index=0"
REM echo for %%a in (%_GIA_current_list_element:-= %)
for %%a in (%_GIA_current_list_element:-= %) do ( call set "_GIA_current_list_element[%%_GIA_current_list_element_index%%]=%%a" & call set /a "_GIA_current_list_element_index+=1" )
REM set _GIA_current_list_element
set /a "_GIA_current_list_element_ubound=%_GIA_current_list_element_index%-1" & set /a "_GIA_current_list_element_index=0"
call set /a "_GIA_current_list_element_start=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
:GetIndexArray-range-loop
call set /a "_GIA_current_list_element_end=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element_start%" & GoTo :GetIndexArray-range-next)
REM if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% echo TEST II %_GIA_current_list_element_start% II& GoTo :GetIndexArray-range-next
if %_GIA_current_list_element_start% GTR %_GIA_current_list_element_end% ( set "_GIA_current_list_element_direction=-" ) else ( set "_GIA_current_list_element_direction=+" )
set /a "_GIA_current_list_element_start%_GIA_current_list_element_direction%=1"
REM for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( echo TEST II %%a II )
for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%%a" )
:GetIndexArray-range-next
set /a "_GIA_current_list_element_start=%_GIA_current_list_element_end%"
set /a "_GIA_current_list_element_index+=1"
if %_GIA_current_list_element_index% LEQ %_GIA_current_list_element_ubound% GoTo :GetIndexArray-range-loop
:GetIndexArray-range-skip
REM if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" echo TEST JJ %_GIA_current_list_element% JJ
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element%" )
:GetIndexArray-loop-end
Call :ClearVariablesByPrefix _GIA_current_list_element
set /a "_GIA_current_list_index+=1"
if %_GIA_current_list_index% LEQ %_GIA_current_list_ubound% GoTo :GetIndexArray-loop
shift 
if "[%~1]" NEQ "[]" GoTo :GetIndexArray-arguments
set /a "%_GIA_output%.ubound=%_GIA_output_ubound%"
Call :ClearVariablesByPrefix %_GetIndexArray_prefix% _GetIndexArray
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF


:Arithmetic-DEMO

echo.&echo Performing calculations byval&echo.

set myresult=
Call :Calculate 2+2 myresult
echo 2+2 is %myresult%
Call :Calculate 2+2+5465+1 myresult
echo 2+2+5465+1 is %myresult%
Call :Calculate 100-25-25+50 myresult
echo 100-25-25+50 is %myresult%
Call :Calculate 25/5 myresult
echo 25/5 is %myresult%
Call :Calculate 10*10 myresult
echo 10*10 is %myresult%
Call :Calculate 99%%%%20 myresult
echo 99%%20 is %myresult%
Call :Calculate 10+10/2 myresult
echo 10+10/2 is %myresult%
Call :Calculate (10+10)/2 myresult
echo (10+10)/2 is %myresult%

set myarray[0]=2+2
set myarray[1]=2+2+5465+1
set myarray[2]=100-25-25+50
set myarray[3]=25/5
set myarray[4]=10*10
set myarray[5]=99%%20
set myarray[6]=10+10/2
set myarray[7]=(10+10)/2


echo.&echo Performing calculations byref&echo.
set myresult=
Call :Calculate myarray[0] myresult
echo %myarray[0]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[1] myresult
echo %myarray[1]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[2] myresult
echo %myarray[2]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[3] myresult
echo %myarray[3]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[4] myresult
echo %myarray[4]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[5] myresult
echo %myarray[5]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[6] myresult
echo %myarray[6]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[7] myresult
echo %myarray[7]% is %myresult%, errorlevel is %errorlevel%

set myarray.ubound=7
echo.&echo Performing calculations from array byref&echo.
Call :Calculate myarray myresults
call :echoarray myresults

GoTo :EOF


:Arithmetic-DEMO

echo.&echo Performing calculations byval&echo.

set myresult=
Call :Calculate 2+2 myresult
echo 2+2 is %myresult%
Call :Calculate 2+2+5465+1 myresult
echo 2+2+5465+1 is %myresult%
Call :Calculate 100-25-25+50 myresult
echo 100-25-25+50 is %myresult%
Call :Calculate 25/5 myresult
echo 25/5 is %myresult%
Call :Calculate 10*10 myresult
echo 10*10 is %myresult%
Call :Calculate 99%%%%20 myresult
echo 99%%20 is %myresult%
Call :Calculate 10+10/2 myresult
echo 10+10/2 is %myresult%
Call :Calculate (10+10)/2 myresult
echo (10+10)/2 is %myresult%

set myarray[0]=2+2
set myarray[1]=2+2+5465+1
set myarray[2]=100-25-25+50
set myarray[3]=25/5
set myarray[4]=10*10
set myarray[5]=99%%20
set myarray[6]=10+10/2
set myarray[7]=(10+10)/2


echo.&echo Performing calculations byref&echo.
set myresult=
Call :Calculate myarray[0] myresult
echo %myarray[0]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[1] myresult
echo %myarray[1]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[2] myresult
echo %myarray[2]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[3] myresult
echo %myarray[3]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[4] myresult
echo %myarray[4]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[5] myresult
echo %myarray[5]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[6] myresult
echo %myarray[6]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[7] myresult
echo %myarray[7]% is %myresult%, errorlevel is %errorlevel%

set myarray.ubound=7
echo.&echo Performing calculations from array byref&echo.
Call :Calculate myarray myresults
call :echoarray myresults

GoTo :EOF


:Arithmetic-DEMO

echo.&echo Performing calculations byval&echo.

set myresult=
Call :Calculate 2+2 myresult
echo 2+2 is %myresult%
Call :Calculate 2+2+5465+1 myresult
echo 2+2+5465+1 is %myresult%
Call :Calculate 100-25-25+50 myresult
echo 100-25-25+50 is %myresult%
Call :Calculate 25/5 myresult
echo 25/5 is %myresult%
Call :Calculate 10*10 myresult
echo 10*10 is %myresult%
Call :Calculate 99%%%%20 myresult
echo 99%%20 is %myresult%
Call :Calculate 10+10/2 myresult
echo 10+10/2 is %myresult%
Call :Calculate (10+10)/2 myresult
echo (10+10)/2 is %myresult%

set myarray[0]=2+2
set myarray[1]=2+2+5465+1
set myarray[2]=100-25-25+50
set myarray[3]=25/5
set myarray[4]=10*10
set myarray[5]=99%%20
set myarray[6]=10+10/2
set myarray[7]=(10+10)/2


echo.&echo Performing calculations byref&echo.
set myresult=
Call :Calculate myarray[0] myresult
echo %myarray[0]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[1] myresult
echo %myarray[1]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[2] myresult
echo %myarray[2]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[3] myresult
echo %myarray[3]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[4] myresult
echo %myarray[4]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[5] myresult
echo %myarray[5]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[6] myresult
echo %myarray[6]% is %myresult%, errorlevel is %errorlevel%
Call :Calculate myarray[7] myresult
echo %myarray[7]% is %myresult%, errorlevel is %errorlevel%

set myarray.ubound=7
echo.&echo Performing calculations from array byref&echo.
Call :Calculate myarray myresults
call :echoarray myresults

GoTo :EOF

