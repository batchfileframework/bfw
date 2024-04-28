@echo off
:setup
:main

call :mini-demo
call :CloseArrayGaps-DEMO
call :CompactArray-DEMO

GoTo :EOF

:mini-demo

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
REM set myarray[5]=element 5
REM set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
REM call :echoarray myarray LINENUMBERS
call :echoarray myarray SHOWVARNAME
call :CloseArrayGaps myarray 5,6,7
echo.&call :echoarray myarray LINENUMBERS

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
REM set myarray[5]=element 5
REM set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
call :CompactArray myarray
echo.&call :echoarray myarray LINENUMBERS

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
REM set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
REM set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
call :CloseArrayGaps myarray 1,4,7
echo.&call :echoarray myarray LINENUMBERS

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
REM set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
REM set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
call :CompactArray myarray
echo.&call :echoarray myarray LINENUMBERS

GoTo :EOF

::Usage Call :CloseArrayGaps ArrayName IndexList1 IndexList2 IndexListN
:CloseArrayGaps
set "_CloseArrayGaps_prefix=_CAG"
set "_CAG_array=%~1" & shift
call set "_CAG_array_ubound=%%%_CAG_array%.ubound%%"
:CloseArrayGaps-arguments
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _CAG_IndexList "%~1" & shift & GoTo :CloseArrayGaps-arguments )
if defined _CAG_IndexList.lbound ( set /a "_CAG_IndexList_index=%_CAG_IndexList.lbound%" ) else ( set /a "_CAG_IndexList_index=0" )
set /a "_CAG_IndexList_ubound=%_CAG_IndexList.ubound%"
call set /a "_CAG_index=%%_CAG_IndexList[%_CAG_IndexList_index%]%%"
set /a "_CAG_next_index=%_CAG_index%+1"
set /a "_CAG_IndexList_index+=1"
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( call set /a "_CAG_next_limit=%%_CAG_IndexList[%_CAG_IndexList_index%]%%" ) else ( set /a "_CAG_next_limit=%_CAG_array_ubound%" )
GoTo :CloseArrayGaps-loop-end
:CloseArrayGaps-loop
setlocal enabledelayedexpansion
set "_CAG_localscope=true"
for /f "tokens=*" %%Z in ('echo.!%_CAG_array%[%_CAG_next_index%]!') do (
															endlocal 
															set %_CAG_array%[%_CAG_index%]=%%Z
															)
if defined _CAG_localscope endlocal
set /a "_CAG_index+=1"
set /a "_CAG_next_index+=1"
:CloseArrayGaps-loop-end
if %_CAG_next_index% LSS %_CAG_next_limit% GoTo :CloseArrayGaps-loop
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( set /a "_CAG_IndexList_index+=1" & set /a "_CAG_next_index+=1" )
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( call set /a "_CAG_next_limit=%%_CAG_IndexList[%_CAG_IndexList_index%]%%" )
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( GoTo :CloseArrayGaps-loop-end ) else ( set /a "_CAG_next_limit=%_CAG_array_ubound%" )
if %_CAG_next_index% LEQ %_CAG_array_ubound% GoTo :CloseArrayGaps-loop
set /a "%_CAG_array%.ubound=%_CAG_index%-1"
Call :ClearVariablesByPrefix %_CloseArrayGaps_prefix% _CloseArrayGaps
GoTo :EOF

:CloseArrayGaps-DEMO

set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray[11]=element 11
set myarray[12]=element 12
set myarray[13]=element 13
set myarray[14]=element 14
set myarray[15]=element 15
set myarray.ubound=15

echo.&echo -------------------------------------------------------------------------------------&echo.

set /a "__CloseArrayGaps_step+=1"
GoTo :CloseArrayGaps-DEMO-%__CloseArrayGaps_step%

:CloseArrayGaps-DEMO-1

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete elements 2,5,6,14 &echo.
call :DeleteArrayElement myarray 2 5 6 14
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 2 5 6 14
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO

:CloseArrayGaps-DEMO-2

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete first array element 0 &echo.
call :DeleteArrayElement myarray 0
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 0
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO
:CloseArrayGaps-DEMO-3

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete last array element 15 &echo.
call :DeleteArrayElement myarray 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO
:CloseArrayGaps-DEMO-4

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete first, last and middle array elements 0,7,15 &echo.
call :DeleteArrayElement myarray 0 7 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 0,7,15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

REM GoTo :CloseArrayGaps-DEMO


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


REM maybe add deleting array[x] too ? Would need to be able to tell between array and array element and array index in the argument
:DeleteArrayElement inarray indexnumber1 indexnumber2 indexnumber3  
if defined %~1.ubound ( set "_DeleteArrayElement_array=%~1" & shift )
set %_DeleteArrayElement_array%[%~1]=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteArrayElement
GoTo :EOF


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
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


REM ToDo add range limits, at least lbound, if ubound, then ubound adjuster at the end will need work
REM maybe arr[] arr[].suffix or arr[].* ?
REM maybe add ability to output to a new compacted array, instead of moving elements of current array ?
REM tentative ::Usage Call :CompactArray InputArray optional OutputArray
REM tentative ::Usage Call :CompactArray InputArray optional OutputArray optional lbound=X optional ubound=Y
REM tentative ::Usage Call :CompactArray InputArray[].mysuffix optional OutputArray optional lbound=X optional ubound=Y
::Usage Call :CompactArray InputArray 
:CompactArray
set "_CompactArray_prefix=_CA
set "_CA_Input=%~1"
call set "_CA_Input_lbound=%%%_CA_Input%.lbound%%"
call set "_CA_Input_ubound=%%%_CA_Input%.ubound%%"
if "[%_CA_Input_lbound%]" EQU "[]" set "_CA_Input_lbound=0"
set /a "_CA_Index=%_CA_Input_lbound%"
set /a "_CA_Previous=%_CA_Index%-1"
if defined %_CA_Input%[%_CA_Index%] ( set /a "_CA_LastEmptyElement=%_CA_Index%+1" ) else ( set /a "_CA_LastEmptyElement=%_CA_Index%" )
:CompactArray-loop
if defined %_CA_Input%[%_CA_Index%] if %_CA_LastEmptyElement% LEQ %_CA_Previous% ( Call :MoveObject %_CA_Input%[%_CA_Index%] %_CA_Input%[%_CA_LastEmptyElement%] & set /a "_CA_LastEmptyElement+=1" )
if defined %_CA_Input%[%_CA_Index%] set /a "_CA_LastEmptyElement=%_CA_Index%+1"
set /a "_CA_Previous+=1" & set /a "_CA_Index+=1"
if %_CA_Index% LEQ %_CA_Input_ubound% GoTo :CompactArray-loop
set /a "%_CA_Input%.ubound=%_CA_LastEmptyElement%-1"
Call :ClearVariablesByPrefix %_CompactArray_prefix% _CompactArray
GoTo :EOF




:CompactArray-DEMO

Call :ClearVariablesByPrefix %_CompactArray_prefix% _CompactArray

set myarray[0].suffixA=DOS - Script Snippets 	DOS Batch Script Snippets.
set myarray[1].suffixA=DOS - String Manipulation 	Basic string manipulation in batch like you are used to from other programming languages.
set myarray[2].suffixA=DOS - String Operations 	Basic string operations in batch like you are used to from other programming languages.
set myarray[3].suffixA=DOS - XCopy Copy Tips 	Use XCopy for more than copy. I.e. check if a file is open and more...
set myarray[4].suffixA=DOS Batch - Date and Time 	Using date and time functions in DOS.
set myarray[5].suffixA=Conception conviviale: Le système de culture en eau profonde à recirculation est économe en eau, 
set myarray[6].suffixA=économe en main-d'œuvre et à haut rendement. Il comporte des joints étanches pour garantir l'absence 
set myarray[7].suffixA=de fuites et des clapets anti-retour en ligne pour éviter les inversions de flux. De plus, il y a un 
set myarray[8].suffixA=dispositif de niveau d'eau sur le côté du seau pour vous 
set myarray[9].suffixA=permettre d'observer l'état de l'eau à tout moment.
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[3]=Create, edit, copy, move, download your files easily,
set myarray[4]=everywhere, every time. Use it as your personal cloud.
set myarray[5]=I have done the following Steps:
set myarray[6]=1 - Import the Barcodes Fonts to the Memory off the Printer
set myarray[7]=2- Configured the Device type in SAP, According to the Xerox Document, for version 4.0 (I'm using ECC 5.0).
set myarray[8]=3 - Print the Production Order. But no barcodes appears. I'm i'm using barcodes CD__00 e CD__01 in the Sapscript.
set myarray[9]=Does any one know way the barcodes are no Printed.
set myarray.ubound=9

set /a "__CompactArray_step+=1"

GoTo :CompactArray-DEMO-%__CompactArray_step%

:CompactArray-DEMO-1

echo.&echo Printing original array, myarray and myarray[].suffixA&echo.
Call :EchoArray myarray LINENUMBERS
echo.
Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-2

echo.&echo Delete Object 5, print array, then run compact array&echo.
Call :DeleteObject myarray[5]
Call :EchoArray myarray LINENUMBERS
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-3

echo.&echo Delete Object 5+6, print array, then run compact array&echo.
Call :DeleteObject myarray[5]
Call :DeleteObject myarray[6]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-4

echo.&echo Delete Object 5+6, print array, then run compact array&echo.
Call :DeleteObject myarray[5]
Call :DeleteObject myarray[6]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS


GoTo :CompactArray-DEMO
:CompactArray-DEMO-5

echo.&echo Delete Object 3,5+6, print array, then run compact array&echo.
Call :DeleteObject myarray[3]
Call :DeleteObject myarray[5]
Call :DeleteObject myarray[6]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-6

echo.&echo Delete Object 0, print array, then run compact array&echo.
Call :DeleteObject myarray[0]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-7

echo.&echo Delete Object 9, print array, then run compact array&echo.
Call :DeleteObject myarray[9]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
GoTo :CompactArray-DEMO
:CompactArray-DEMO-8

echo.&echo Array with no gaps&echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

Call :ClearVariablesByPrefix myarray __CompactArray_step

GoTo :EOF

:DeleteObject
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF

:MoveObject
REM echo for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do if "[%%a]" EQU "[%~1]" set %~2=%%b
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do if "[%%a]" EQU "[%~1]" set %~2=%%b
REM echo for /f "tokens=1 delims==" %%a in ('set %~1. 2^>nul') do for /f "tokens=2 eol== delims=.=" %%b in ('set %%a 2^>nul') do for /f "tokens=2* delims==" %%c in ('set %%a 2^>nul') do set %~2.%%b=%%c
for /f "tokens=1 delims==" %%a in ('set %~1. 2^>nul') do for /f "tokens=2 eol== delims=.=" %%b in ('set %%a 2^>nul') do for /f "tokens=2* delims==" %%c in ('set %%a 2^>nul') do set %~2.%%b=%%c
REM echo if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF


REM :MoveObject
REM set "_MoveObject_prefix=_MO"
REM set _MO_Input=%~1
REM set _MO_Output=%~2

REM REM this should copy all variable suffix to the new destination
REM for /f "tokens=1,2* delims==" %%a in ('set %_MO_Input% 2^>nul') do  (
	REM setlocal enabledelayedexpansion
	REM set "_MO_localscope=true"
	REM set _MO_Suffix_buffer_input=%%a
	REM set _MO_Suffix_buffer_output=%_MO_Output%!_MO_Suffix_buffer_input:%_MO_Input%=!
	REM for /f "tokens=*" %%Z in ('echo.!_MO_Suffix_buffer_output!') do (
																REM endlocal
																REM set %%Z=%%b
																REM )
	REM )
REM if defined _MO_localscope endlocal

REM REM this clears the old base variable
REM if "[%_MO_Input%]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %_MO_Input% 2^>nul') do set %%a=
REM Call :ClearVariablesByPrefix %_MoveObject_prefix% _MoveObject 
REM if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :MoveObject
REM GoTo :EOF
:CloseArrayGaps-DEMO

set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray[11]=element 11
set myarray[12]=element 12
set myarray[13]=element 13
set myarray[14]=element 14
set myarray[15]=element 15
set myarray.ubound=15

echo.&echo -------------------------------------------------------------------------------------&echo.

set /a "__CloseArrayGaps_step+=1"
GoTo :CloseArrayGaps-DEMO-%__CloseArrayGaps_step%

:CloseArrayGaps-DEMO-1

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete elements 2,5,6,14 &echo.
call :DeleteArrayElement myarray 2 5 6 14
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 2 5 6 14
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO

:CloseArrayGaps-DEMO-2

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete first array element 0 &echo.
call :DeleteArrayElement myarray 0
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 0
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO
:CloseArrayGaps-DEMO-3

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete last array element 15 &echo.
call :DeleteArrayElement myarray 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO
:CloseArrayGaps-DEMO-4

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete first, last and middle array elements 0,7,15 &echo.
call :DeleteArrayElement myarray 0 7 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 0,7,15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

REM GoTo :CloseArrayGaps-DEMO


GoTo :EOF

