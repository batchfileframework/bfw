@echo off

:setup
:main

call :ForIF-DEMO
REM call :test
REM Call :FunctionAutoDetect-DEMO

GoTo :EOF





:test

call :GetWhere 

GoTO :EOF


REM where to find external functions
REM read own batch file to find internal functions
REM find all function calls
REM find all function call macros

REM single command to set all function macros and adjust the right priority, and it should be cached and not need to be set again for the same function

ListFunction batchfiles  (list all functions on scree)
CopyFunction batchfile functioname newbatchfile (newbatchfile may or may not exist) (this will append function at the end of newbatchfile)
CopyFunction batchfile functioname 5 newbatchfile (This will add functionname on the 5th line in newbatchfile)
CopyFunction batchfile functioname F5 newbatchfile (This will add functionname after the 5th function in newbatchfile)
Delete Function batchfile functioname functioname1 functioname2 functionameN (this will delete functioname from batchfile)
NOCOMMENTS
NOPREAMBLE
NOPOSTSCRIPT
ONLYFUNCTION
ExtractAllFunctions OutputFolder
ExtractFunctions batchfile1 batchfile2 batchfileN functioname functioname1 functioname2 functionameN ?OutputFolder?

will check for existing function in destination
will check for existing files before overwriting

:GetWhere OutputArray Pattern1 Pattern2 PatternN

for /f 

GoTo :EOF

:GetFunctionCalls (anything like call :myfunction)  get every line and position with one, get every unique call name "myfuntion" 
:GetFunctionCallsMacros (anything like  call %:myfunction%)

:GetWhere

REM Also

:ForIFAND
:ForIFNAND
:ForIFOR
:ForIFXOR
:ForIFNOT

:: Find all "Call :XXXXXXX " 
:: Find all "Call %:XXXXXXX% " 

:GetMacroCalls
:GetFunctionCalls

:RemoveNonFunctionLabels-JustLabels
:RemoveNonFunctionLabels-JustRows


:ListFunctions
:CopyFunctions
:AppendFunction
:InsertFunction
:DeleteFunction

:GetFunctionExitsFast
:GetFunctionExitsFastJustExits
:GetFunctionExitsFastJustRows
:GetLabelsMinusExclusions


:RemoveDuplicatesInArray
:DoesArrayContain Searchtext



:DoesInternalFunctionExist
:DoesExternalFunctionExist
:GetFunction
:SetFunctionMacro





:FunctionAutoDetect-DEMO

REM determine if IsNumeric is an internal or external function, or missing function (then warn user)
REM Here we decide if both are present, do we prefer internal or external function ?


if defined :IsNumeric GoTo :FunctionAutoDetect-DEMO-skip

set "FunctionName=IsNumeric"

call DoesInternalFunctionExist %FunctionName% %FunctionName%.InternalExist && echo Function %FunctionName% exists internally || Function %FunctionName% does not exists internally
call DoesExternalFunctionExist %FunctionName% %FunctionName%.ExternalExist && echo Function %FunctionName% exists externally || Function %FunctionName% does not exists externally


::Alternates?
::GetFunction FunctionName :: returns if internal,external,notfound
::SetFunctionMacro FunctionName :: sets the function macro to internal if found internally, else externally or echo function notfound warning
::SetFunctionMacro PREFEREXTERNAL FunctionName :: sets the function macro to internal if found internally, else externally or echo function notfound warning

Set "ExternalVInerterFunctionPreference=internal"
REM Set "ExternalVInerterFunctionPreference=external"

if "[%ExternalVInerterFunctionPreference%]" EQU "[%internal%]" if "[%FunctionName%.InternalExist]" EQU "[true]" set ":IsNumeric=:IsNumeric"
if "[%ExternalVInerterFunctionPreference%]" EQU "[%external%]" if "[%FunctionName%.ExternalExist]" EQU "[true]" set ":IsNumeric=IsNumeric.bat"
if "[%ExternalVInerterFunctionPreference%]" EQU "[]" (not specified, use hardcoded preference, I would say internal)


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GetWhere

if defined myfunction.setmacro :SetMacros "function1,function2,functionN"
set "myfunction.setmacro=true"

find all function calls in a batch "call :"
find all macroed function calls in a batch "call %:xxxxx%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

:FunctionAutoDetect-DEMO-skip

REM set testvar=19827451928574928
REM echo isnumeric with a variable
REM Call :IsNumeric "%testvar%" && echo it is not numeric || echo it is numeric
REM echo isnumeric with a number
REM call :isnumeric "1" && echo is was not numeric || ( echo it was numeric )
REM echo isnumeric with a letter
REM call :isnumeric "a" && echo is was not numeric || ( echo it was numeric )
REM echo isnumeric with a double quote empty
REM call :isnumeric "" && echo is was not numeric || ( echo it was numeric )
REM echo isnumeric with no input 
REM call :isnumeric && echo is was not numeric || ( echo it was numeric )

REM echo now with an output variable
REM set testvar=19827451928574928
REM echo isnumeric with a variable
REM Call :IsNumeric "%testvar%" _myouput
REM echo output was %_myouput%
REM echo isnumeric with a number
REM call :isnumeric "1"
REM echo output was %_myouput%
REM echo isnumeric with a letter
REM call :isnumeric "a"
REM echo output was %_myouput%
REM echo isnumeric with a double quote empty
REM call :isnumeric ""
REM echo output was %_myouput%
REM REM echo isnumeric with no input (same as empty doublequote when you have output variable)
REM REM call :isnumeric ""
REM REM echo output was %_myouput%

set testvar=19827451928574928
echo isnumeric with a variable
Call %:IsNumeric% "%testvar%" && echo it is not numeric || echo it is numeric
echo isnumeric with a number
call %:IsNumeric% "1" && echo is was not numeric || ( echo it was numeric )
echo isnumeric with a letter
call %:IsNumeric% "a" && echo is was not numeric || ( echo it was numeric )
echo isnumeric with a double quote empty
call %:IsNumeric% "" && echo is was not numeric || ( echo it was numeric )
echo isnumeric with no input 
call %:IsNumeric% && echo is was not numeric || ( echo it was numeric )

echo now with an output variable
set testvar=19827451928574928
echo isnumeric with a variable
Call %:IsNumeric% "%testvar%" _myouput
echo output was %_myouput%
echo isnumeric with a number
call %:IsNumeric% "1"
echo output was %_myouput%
echo isnumeric with a letter
call %:IsNumeric% "a"
echo output was %_myouput%
echo isnumeric with a double quote empty
call %:IsNumeric% ""
echo output was %_myouput%
REM echo isnumeric with no input (same as empty doublequote when you have output variable)
REM call %:IsNumeric% ""
REM echo output was %_myouput%


GoTo :EOF



:: Input can be byval or byref
:: will return && "success" if not numeric and || "fail" if numeric
::Usage Call :IsNumeric Input optional Output
:IsNumeric
echo running internal :IsNumeric function
if "[%~1]"=="[]" exit /b 0
if defined %~1 ( call set "_IsNumeric_input=%%%~1%%" ) else ( set "_IsNumeric_input=%~1" )
set "IsNumericInternal=0123456789"
echo.%_IsNumeric_input%| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF


:GetLabels-DEMO

echo.& echo This DEMO function demonstrates the various GetLabels functions

echo.& echo GetLabelsFast myfile.bat _LabelsFastArray will return _LabelsFastArray[X]=rownumber and _LabelsFastArray[x].name=functionname

GetLabelsFast


echo.& echo GetLabelsFastJustLabels myfile.bat _LabelsFastJustLabels will return _LabelsFastJustLabels[x].name=functionname
GetLabelsFastJustLabels


echo.& echo GetLabelsFastJustLabelsAndRow myfile.bat _LabelsFastJustLabelsAndRow will return _LabelsFastJustLabelsAndRow[x].name=functionname and _LabelsFastJustLabelsAndRow[x].row=rownumber
GetLabelsFastJustLabelsAndRow


echo.& echo GetLabelsFastRowsOnly myfile.bat _LabelsFastRowsOnly will return _LabelsFastRowsOnly[rownumber]=functionname
GetLabelsFastRowsOnly
set _LabelsFastRowsOnly



echo.& echo GetLabelsFastPlusLookup myfile.bat _LabelsFastPlusLookup will return _LabelsFastPlusLookup[X]=rownumber , _LabelsFastPlusLookup[x].name=functionname and _LabelsFastPlusLookup[functionname]=rownumber
call :GetLabelsFastPlusLookup myfile.bat _LabelsFastPlusLookup
for /l %%a in (1,1,10) do (
							call echo _LabelsFastPlusLookup[%%a]=%%_LabelsFastPlusLookup[%%a]%%
							call echo _LabelsFastPlusLookup[%%a].name=%%_LabelsFastPlusLookup[%%a].name%%
							call call echo _LabelsFastPlusLookup[%%_LabelsFastPlusLookup[%%a].name%%]=%%%%_LabelsFastPlusLookup[%%_LabelsFastPlusLookup[%%a].name%%]%%%%
						   )


echo.& echo GetLabelsFastLookupOnly myfile.bat _LabelsFastLookupOnly will return _LabelsFastLookupOnly[functionname]=rownumber
Call :GetLabelsFastLookupOnly myfile.bat _LabelsFastLookupOnly
REM for /f "delims=" %%a in ('set _LabelsFastLookupOnly') do (
														  REM set /a _myloop+=1
														  REM call :ForIF _myloop GTR 10 && echo %%a || echo no
														 REM )
set _LabelsFastLookupOnly

echo.& echo GetLabels myfile.bat _LabelsFastLookupOnly will return _LabelsFastLookupOnly[functionname]=rownumber
GetLabels


GoTo :EOF




::Usage Call :ForIF FirstTerm Operator SecondTerm
:ForIF
set "_ForIF_first_term=%~1"
set "_ForIF_operator=%~2"
set "_ForIF_second_term=%~3"
echo AA%_ForIF_first_term%
if defined %_ForIF_first_term% call set "_ForIF_first_term=%%%_ForIF_first_term%%%"
if defined %_ForIF_second_term% call set "_ForIF_second_term=%%%_ForIF_second_term%%%"
echo BB%_ForIF_first_term%
if "%_ForIF_first_term%" %_ForIF_operator% "%_ForIF_second_term%" ( echo 1yes "%_ForIF_first_term%" %_ForIF_operator% "%_ForIF_second_term%" ) else ( echo 1no "%_ForIF_first_term%" %_ForIF_operator% "%_ForIF_second_term%" )
if "%_ForIF_first_term%" %_ForIF_operator% "%_ForIF_second_term%" ( set "_ForIF_first_term=" & set "_ForIF_operator=" & set "_ForIF_second_term=" & exit /b 0 ) else ( 
							set "_ForIF_first_term=" & set "_ForIF_operator=" & set "_ForIF_second_term=" & exit /b 1 )




::Usage Call :GetEndOfFunction Filename OutputArray optional OutputRows
:GetEndOfFunction
set "_GetEndOfFunction_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetEndOfFunction_output_rows=%_GetEndOfFunction_output%.rows" ) else ( set "_GetEndOfFunction_output_rows=%~3" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N /I /C:":EndOf_" "%~1" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetEndOfFunction_output%.ubound=%%f" & set %_GetEndOfFunction_output%[%%f]=%%g
	for /f "tokens=1,2,* delims=:" %%f in ("%%a") do set %_GetEndOfFunction_output%[%%f].text=:%%h
	for /f "tokens=1,2,* delims=:" %%f in ("%%a") do set %_GetEndOfFunction_output_rows%[%%g]=:%%h
	for /f "tokens=1,2,* delims=:" %%f in ("%%a") do set %_GetEndOfFunction_output_rows%[%%g].type=EndOf_Function
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=*" %%z in ("%%h") do set %_GetEndOfFunction_output%[%%f].name=%%~z
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetEndOfFunction_output%.name[%%~z]=%%g
	for /f "tokens=2 delims=:" %%b in ("%%a") do for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24 delims=:" %%c in ("%%a") do for %%A in (%%c %%d %%e %%f %%g %%h %%i %%j %%k %%l %%m %%n %%o %%p %%q %%r %%s %%t %%u %%v %%w %%x %%y %%z) do (
											set _GetEndOfFunction_buffer=%%A
											setlocal enabledelayedexpansion
											if "[!_GetEndOfFunction_buffer:~,6!]" EQU "[EndOf_]" set _GetEndOfFunction_buffer2=!_GetEndOfFunction_buffer!
											for %%Z in (!_GetEndOfFunction_buffer2!) do endlocal & set %_GetEndOfFunction_output%.name[%%~Z]=%%b
											endlocal 
											)
	)
	set /a "%_GetEndOfFunction_output%.lbound=1" & set "_GetEndOfFunction_output=" & set "_GetEndOfFunction_output_rows="
GoTo :EOF

::Usage Call :GetEmptyLines Filename OutputArray optional OutputRows
:GetEmptyLines
set "_GetEmptyLines_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetEmptyLines_output_rows=%_GetEmptyLines_output%.rows" ) else ( set "_GetEmptyLines_output_rows=%_GetEmptyLines_output%" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^$" "%~1" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2* delims=:" %%f in ("%%a") do set /a "%_GetEmptyLines_output%.ubound=%%f" & set %_GetEmptyLines_output%[%%f]=%%g
	for /f "tokens=1,2* delims=:" %%f in ("%%a") do set %_GetEmptyLines_output_rows%[%%g].type=EmptyLine
	)
set /a "%_GetEmptyLines_output%.lbound=1" & set "_GetEmptyLines_output=" & set "_GetEmptyLines_output_rows="
GoTo :EOF

::Usage Call :RemoveNonFunctionLabels ListOfLabels .rowsArray
:RemoveNonFunctionLabels
set "_RemoveNonFunctionLabels_prefix=_RNFL"
set "_RNFL_Labels=%~1"
call set "_RNFL_Labels_lbound=%%%~1.lbound%%"
call set "_RNFL_Labels_ubound=%%%~1.ubound%%"
if "[%_RNFL_Labels_lbound%]" EQU "[]" set /a "_RNFL_Labels_lbound=0"
set "_RNFL_Rows=%~2"
set /a "_RNFL_Index=%_RNFL_Labels_lbound%"
:RemoveNonFunctionLabels-loop
Call set "_RNFL_CurrentLabel=%%%_RNFL_Labels%[%_RNFL_Index%].name%%" & call set "_RNFL_CurrentRow=%%%_RNFL_Labels%[%_RNFL_Index%]%%" 
Call :IsFunctionLabelExcluded %_RNFL_CurrentLabel% && ( set "%_RNFL_Rows%[%_RNFL_CurrentRow%]=" & set "%_RNFL_Rows%[%_RNFL_CurrentRow%].type=" &  set "%_RNFL_Labels%[%_RNFL_Index%]=" & set "%_RNFL_Labels%[%_RNFL_Index%].name=" & set "%_RNFL_Labels%.name[%_RNFL_CurrentLabel%]=" )
set /a "_RNFL_Index+=1"
if %_RNFL_Index% LEQ %_RNFL_Labels_ubound% GoTo :RemoveNonFunctionLabels-loop
Call :ClearVariablesByPrefix %_RemoveNonFunctionLabels_prefix% _RemoveNonFunctionLabels
GoTo :EOF

::Usage Call :IsFunctionLabelExcluded FunctionLabel ExclusionList
:IsFunctionLabelExcluded
set "_IFLE_input=%~1"
set "_IFLE_input=%_IFLE_input:-= %"
set "_IFLE_input=%_IFLE_input::= %"
set "_IFLE_ExclusionList=%~2"
if "[%_IFLE_ExclusionList%]" EQU "[]" set "_IFLE_ExclusionList=loop loop2 loop3 loop# end skip skip2 skipn test test1 testn cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9"
for %%a in (%_IFLE_input%) do set _IFLE_last_token=%%a
for %%a in (%_IFLE_ExclusionList%) do if %%a EQU %_IFLE_last_token% exit /b 0
exit /b 1

::Usage Call :GetFunctionExits OutputArray Filename
:GetFunctionExits
set "_GetFunctionExits_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetFunctionExits_output_rows=%_GetFunctionExits_output%.rows" ) else ( set "_GetFunctionExits_output_rows=%~3" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N /I /C:"goto :EOF" /C:"exit /B" "%~1" ^| findstr /N "^"') do ( 
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetFunctionExits_output%.ubound=%%f" & set %_GetFunctionExits_output%[%%f]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set %_GetFunctionExits_output_rows%[%%g].type=FunctionExit
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=2,* delims=:" %%b in ("%%a") do set %_GetFunctionExits_output%[%%f].text=%%c
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=2,* delims=:" %%b in ("%%a") do set %_GetFunctionExits_output_rows%[%%g].text=%%c
	)
	set /a "%_GetFunctionExits_output%.lbound=1" & set "_GetFunctionExits_output=" & set "_GetFunctionExits_output_rows="
GoTo :EOF



::Usage Call :GetLabels BatchFile LabelObjectArray optional RowsArray
:GetLabels
set "_GetLabels_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetLabels_output_rows=%_GetLabels_output%.rows" ) else ( set "_GetLabels_output_rows=%~3" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabels_output%.ubound=%%f" & set %_GetLabels_output%[%%f]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set %_GetLabels_output_rows%[%%g].type=label
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%[%%f].name=%%~z
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%.name[%%~z]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output_rows%[%%g]=%%~z
	)
set /a "%_GetLabels_output%.lbound=1" & set "_GetLabels_output=" & set "_GetLabels_output_rows="
GoTo :EOF

::Usage Call :GetLabelsFast BatchFile LabelObjectArray
:GetLabelsFast
set "_GetLabelsFast_output=%~2"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabelsFast_output%.ubound=%%f" & set %_GetLabelsFast_output%[%%f]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFast_output%[%%f].name=%%~z
	)
set /a "%_GetLabelsFast_output%.lbound=1" & set "_GetLabelsFast_output="
GoTo :EOF

::Usage Call :GetLabelsFastJustLabels BatchFile LabelObjectArray
:GetLabelsFastJustLabels
set "_GetLabelsFastJustLabels_output=%~2"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabelsFastJustLabels_output%.ubound=%%f"
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFastJustLabels_output%[%%f]=%%~z
	)
set /a "%_GetLabelsFastJustLabels_output%.lbound=1" & set "_GetLabelsFastJustLabels_output="
GoTo :EOF

::Usage Call :GetLabelsFastJustLabelsAndRow BatchFile LabelObjectArray
:GetLabelsFastJustLabelsAndRow
set "_GetLabelsFastJustLabelsAndRow_output=%~2"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabelsFastJustLabelsAndRow_output%.ubound=%%f" & set %_GetLabelsFastJustLabelsAndRow_output%[%%f].row=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFastJustLabelsAndRow_output%[%%f]=%%~z
	)
set /a "%_GetLabelsFastJustLabelsAndRow_output%.lbound=1" & set "_GetLabelsFastJustLabelsAndRow_output="
GoTo :EOF

::Usage Call :GetLabelsFastRowsOnly BatchFile LabelRowsArray
:GetLabelsFastRowsOnly
set "_GetLabelsFastRowsOnly_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetLabelsFastRowsOnly_output_rows=%_GetLabelsFastRowsOnly_output%.rows" ) else ( set "_GetLabelsFastRowsOnly_output_rows=%~3" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFastRowsOnly_output_rows%[%%g]=%%~z
	)
set "_GetLabelsFastRowsOnly_output=" & set "_GetLabelsFastRowsOnly_output_rows="
GoTo :EOF

::Usage Call :GetLabelsFastPlusLookup BatchFile LabelObjectArray
:GetLabelsFastPlusLookup
set "_GetLabelsFastPlusLookup_output=%~2"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabelsFastPlusLookup_output%.ubound=%%f" & set %_GetLabelsFastPlusLookup_output%[%%f]=%%g
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFastPlusLookup_output%[%%f].name=%%~z
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFastPlusLookup_output%.name[%%~z]=%%g
	)
set /a "%_GetLabelsFastPlusLookup_output%.lbound=1" & set "_GetLabelsFastPlusLookup_output="
GoTo :EOF

::Usage Call :GetLabelsFastLookupOnly BatchFile LabelLookupArray
:GetLabelsFastLookupOnly
set "_GetLabelsFastLookupOnly_output=%~2"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabelsFastLookupOnly_output%[%%~z]=%%g
	)
set "_GetLabelsFastLookupOnly_output="
GoTo :EOF

::Usage Call :DoesLabelExist BatchFile searchterm
::Returns Row number of the label, 0 if not found
:DoesLabelExist BatchFile searchterm
set "_GetLabelsFastLookupOnly_Search=%~2"
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do if "[%%~z]" EQU "[%_GetLabelsFastLookupOnly_Search%]" ( set "_GetLabelsFastLookupOnly_Search=" & exit /b %%g )
	)
exit /b 0

