@echo off
:setup
:main
Call :GetIndexArray-simple-DEMO
REM Call :GetIndexArray-DEMO
GoTo :EOF


:GetIndexArray-simple-DEMO

echo.&echo test1
Call :GetIndexArray __GIADEMO_IndexArray "12"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test2
Call :GetIndexArray __GIADEMO_IndexArray "12-18"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test3
Call :GetIndexArray __GIADEMO_IndexArray "18-12"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test4
Call :GetIndexArray __GIADEMO_IndexArray "6,18-12,7"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test5
Call :GetIndexArray __GIADEMO_IndexArray "6,5-8,7"
Call :EchoArray __GIADEMO_IndexArray SHOWVARNAME
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test6
Call :GetIndexArray __GIADEMO_IndexArray "6,7,8,9" "1,2,3,4" "99,98-94,93" "123098,124187,12098124"
Call :EchoArray __GIADEMO_IndexArray & Call :ClearVariablesByPrefix __GIADEMO


echo.&echo test7
set __GIADEMO[0]=6,7
set __GIADEMO[1]=8
set __GIADEMO[2]=9-11
set __GIADEMO[3]=12498,12875,2,1-0
set __GIADEMO.ubound=3

Call :GetIndexArray __GIADEMO_IndexArray "6,7,8,9" __GIADEMO "1,2,3,4"
Call :EchoArray __GIADEMO_IndexArray  & Call :ClearVariablesByPrefix __GIADEMO

echo.&echo test8
Call :GetIndexArray __GIADEMO_IndexArray "1,2,3"
Call :GetIndexArray __GIADEMO_IndexArray "4-6" "7"
Call :GetIndexArray __GIADEMO_IndexArray "8" "9-10" "00,11-14-15-15-15-15-20,39" "40"
Call :EchoArray __GIADEMO_IndexArray  & Call :ClearVariablesByPrefix __GIADEMO

GoTo :EOF

:GetIndexArray-DEMO

Call :ClearVariablesByPrefix  _GIA __GIADEMO
GoTo :GetIndexArray-DEMO-skip
echo.
set "__GIADEMO_range1="
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

REM :GetIndexArray-DEMO-skip

echo.
set "__GIADEMO_range1=12"
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12,28"
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12,28"
set "__GIADEMO_range2=32"
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2="
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "%__GIADEMO_range2%" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2[7]=68"
set "__GIADEMO_range2[8]=69"
set "__GIADEMO_range2[9]=71"
set "__GIADEMO_range2.lbound=7"
set "__GIADEMO_range2.ubound=9"
set "__GIADEMO_range3="
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2[7]=68"
set "__GIADEMO_range2[8]=69"
set "__GIADEMO_range2[9]=71"
set "__GIADEMO_range2.lbound=7"
set "__GIADEMO_range2.ubound=9"
set "__GIADEMO_range3=100-105-99,299"
set "__GIADEMO_range4="
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "%__GIADEMO_range4%" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray
Call :ClearVariablesByPrefix __GIADEMO

echo.
set "__GIADEMO_range1=12-18"
set "__GIADEMO_range2[7]=68"
set "__GIADEMO_range2[8]=69"
set "__GIADEMO_range2[9]=71"
set "__GIADEMO_range2.lbound=7"
set "__GIADEMO_range2.ubound=9"
set "__GIADEMO_range3=100-105-105-105-99,299"
set "__GIADEMO_range4[0]=1"
set "__GIADEMO_range4[1]=3"
set "__GIADEMO_range4[2]=5-7"
set "__GIADEMO_range4[3]=11,13-15,8,7,6"
set "__GIADEMO_range4.ubound=3"
echo GetIndexArray testing ranges "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "__GIADEMO_range4" 
Call :GetIndexArray __GIADEMO_IndexArray "%__GIADEMO_range1%" "__GIADEMO_range2" "%__GIADEMO_range3%" "__GIADEMO_range4" 
REM set __GIADEMO_IndexArray 2>nul
Call :EchoArray __GIADEMO_IndexArray

echo. 
echo mirroring previous results through :GetIndexArray a second time
Call :GetIndexArray __GIADEMO_MirrorArray __GIADEMO_IndexArray
Call :EchoArray __GIADEMO_MirrorArray

echo.
echo Trying EchoArray IndexList Feature
Call :EchoArray __GIADEMO_MirrorArray "25-28,36-35,29,34,30,0-1,31,2,32,3,33,4-6,7-9,23-16,10-15,24"
REM set __GIADEMO_MirrorArray
Call :ClearVariablesByPrefix __GIADEMO

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




:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF