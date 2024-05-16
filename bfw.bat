@echo off

:setup

REM save %~0 in a variable
REM save all argument, and each arguments, to a variable/variable array

REM set "_IFLE_ExclusionList=main setup macro end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"

:main

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end

REM set "_IFLE_ExclusionList="

GoTo :EOF

::save filename from %0 before shifting
:ShiftedArgumentCaller
set _ShiftedArgumentCaller_function=%~1
shift
set "_ShiftedArgumentCaller_function=" & GoTo :%_ShiftedArgumentCaller_function%
GoTo :EOF

--------- untouched above -----------------------


TODO 
in :main
getfunctionrow, check if function exists in current file, if yes cache result
if does not exist, but bfw.root is defined search bfw.root for exactfunctionname.bat
run that with compiled arguments string
put %* in  a variable without damaging it
leftcut string to remove functioncaller

for all function, default to batch file %~0 if no batch file is specified
autodetect batchfile when isfile is true and ext is .bat

for all get row/name functions
check startrow paramter is numeric, if not get row from name using
echo.%_GFE_Function%| findstr /r "[^0123456789]" >nul && ( set "_GFE_FunctionName=%_GFE_Function%" & Call :GetLabelRow "%_GFE_BatchFile%" %_GFE_Function% _GFE_Function ) || Call :GetFunctionName "%_GFE_BatchFile%" %_GFE_Function% _GFE_FunctionName
Don't get the name if it's not needed


complete these alias :GetBaseFunctionRow :GetBaseFunctionName


:comparefunction  batch1 functionname batch2 functionname (line by line comparison of whole function)
GoTo :EOF

:comparefunctionFC  batch1 functionname batch2 functionname (line by line comparison of whole function)
GoTo :EOF

:split inputstring delimiter output
GoTo :EOF

:backupfile (auto put in %temp%\bfw)
get time and date
create copy of the file in 
%temp%\bfw\backup\filename.ext.date.time.backup
GoTo :EOF

:deletefunction batchfile functionname1 functionname2 functionnameN
create file backup
get each functionrows and store a range array element
for each range array element
copy lines from file to buffer file from start to beginning of range, then skip the range of the first function
then copy lines from the end of the function to the start of the next
if there is no further function, copy all remaining lines until the end of the file
then overwrite original file with buffer file
GoTo :EOF

:updatebatch batchfile  (updates library function, if different to those in bfw.root/lib)
get list of all functions in the file
for each function, find function in library
compare function with library version
if different, create backup of file, then overwrite old function with new function from library
GoTo :EOF

:GetFunctionDependencies batchfile outputvar optional functionnames ...
::returns all dependencies of all or select functions
getfunctionrows
for each line of text from the function
find call statements
for each call statement, get functionname and type (internal, external, macro, command, program)
call :myfunction - internal call
call myfunction.bat - external call
call %:myfunction% - macro call
call echo - command call
call findstr - program call

split line on "call ", there must always be a space or tab between call and function name (do we really check for tabs ?)


GoTo :EOF

:GetBatchImports batchfile outputvar
::returns list of imports
find all lines starting with imports/rem imports /:: imports
on those lines, split by space
return list of all items on all lines
GoTo :EOF

:GetUnfulfilledDependencies batchfile outputvar optional functionname    / full fill imports (check if not already fullfilled)
::returns list of functioncalls not in the batch file
if functionname is given
run GetBatchImports GetFunctionDependencies on function, if function is given, if not run on whole file
then get listfunction, and substract all functions already populated
GoTo :EOF

:GetBatchImports batchfile returnvariable 
::returns count of import
::returns space separate list of imports
for each import
check if label exists
for requested functions
GoTo :EOF



:Hello
echo Hello,world
GoTo :EOF

:install
if no argument, if call install bfw
if argument = "path" next argument is install path
md %userprofile%\bfw
md %temp%\bfw
copy bfw.bat to %userprofile%\bfw
add bfw to path
add bfw to env variables
add bfw.root to env variables
goto :eof

:uninstall
remove bfw variables, remove from path
move bfw folder to recycle bin
GoTo :EOF

:update
GoTo :EOF

:shortcutify
getlistfunciton
for each function, create shortcut
GoTo :EOF

:symlinkify
GoTo :EOF

:hardlinkify
GoTo :EOF

:ExportFunction
create new file containing the function
also include all required dependencies
include function switcher core ?
GoTo :EOF


:FindFunction batchfile searchterm result return function row and name
set "_FindFunction_prefix=_FF"
set "_FindFunction_InputFile=%~1"
set "_FindFunction_Search=%~2"
set "_FindFunction_Output=%~3"
search all label for search pattern  findstr /N "^:[^:]" "%_FindFunction_InputFile%" | findstr /I /C:"%_FindFunction_SearchTerm%"

for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%_FindFunction_InputFile%" ^| findstr /I /C:"%_FindFunction_SearchTerm%" ') do ( if %%a GTR %_GNFR_StartRow% ( set /a _GNFR_current=%%a & GoTo :GetNextFunctionRow-exit-loop ) )
take first match
check if excluded with Call :IsFunctionLabelExcluded FunctionLabel optional ExclusionList && IsExcluded || IsNotExcluded
if yes, get next match, if no, return that match 
GoTo :EOF

--- dealing with aliases

:PrintWithoutNewline
echo|set /p="%*"
GoTo :EOF

:TestExpansionOnSetLine
REM https://stackoverflow.com/questions/3942265/errorlevel-in-a-for-loop-windows-batch
set "_TestExpansionOnSetLine=myvalue" & echo _TestExpansionOnSetLine is %_TestExpansionOnSetLine%
set "_TestExpansionOnSetLine2=myothervalue" & call echo _TestExpansionOnSetLine2 is %_TestExpansionOnSetLine2%
REM echo test 1
REM ( exit /b 0 ) && echo this was true || echo this was false
REM echo test 2
REM ( exit /b 1 ) && echo this was true || echo this was false
REM echo test 3
REM ( exit 0 ) && echo this was true || echo this was false
REM echo test 4
REM ( exit 1 ) && echo this was true || echo this was false
echo test 5
( echo true | find "true" >nul) && echo this was true || echo this was false
echo test 6
( echo false | find "true">nul) && echo this was true || echo this was false
echo test 7
set "_TestExpansionOnSetLine3=myotherothervalue" &  ( echo true | find "true" >nul) && echo _TestExpansionOnSetLine3 is %_TestExpansionOnSetLine3%
echo test 8
set "_TestExpansionOnSetLine4=myotherothervalue" &  ( echo true | find "true" >nul) && call echo _TestExpansionOnSetLine4 is %_TestExpansionOnSetLine4%

REM what is this ?
REM ( if %errorlevel% NEQ 0 && echo 4this was true ) ||  ( echo 4this was false )
GoTo :EOF

::Usage Call :GetFunctionAliases-demo BatchFile optional FunctionName 
:GetFunctionAliases-demo
REM echo on 
set "_GetFunctionAliases_InputFile=%~1"
set "_GetFunctionAliases_FunctionName=%~2"
if not defined _GetFunctionAliases_InputFile set "_GetFunctionAliases_InputFile=%~dpnx0"
if not defined _GetFunctionAliases_FunctionName Call :ListFunctions "%_GetFunctionAliases_InputFile%"  _GetFunctionAliases_FunctionName 
echo Test functions %_GetFunctionAliases_FunctionName%
echo.
for %%a in (%_GetFunctionAliases_FunctionName%) do (
			Call :IsBaseFunction "%_GetFunctionAliases_InputFile%" "%%a" _GetFunctionAliases_GetFunctionAliases && echo Function %%a is a base function. || call :PrintWithoutNewline Function %%a is not a base function. 
			if errorlevel 1 Call :GetBasefunction "%_GetFunctionAliases_InputFile%" "%%a" _GetFunctionAliases_BaseFunction
			if errorlevel 1 ( Call echo  Base function:%%_GetFunctionAliases_BaseFunction%%& ( echo false | find "true">nul) )
			if not errorlevel 1 ( Call :DoesFunctionHaveAliases "%_GetFunctionAliases_InputFile%" "%%a" && Call :GetFunctionAliases "%_GetFunctionAliases_InputFile%" "%%a" )
 )
Call :ClearVariablesByPrefix _GetFunctionAliases
REM Call :DoesFunctionHaveAliases BatchFile FunctionName optional ReturnVariable && FunctionHasAliases || FunctionHasNoAlias
GoTo :EOF



::Usage Call :IsBaseFunction-demo BatchFile optional FunctionName 
:IsBaseFunction-demo
set "_IsBaseFunction_InputFile=%~1"
set "_IsBaseFunction_FunctionName=%~2"
if not defined _IsBaseFunction_InputFile set "_IsBaseFunction_InputFile=%~dpnx0"
if not defined _IsBaseFunction_FunctionName Call :ListFunctions "%_IsBaseFunction_InputFile%"  _IsBaseFunction_FunctionName 
for %%a in (%_IsBaseFunction_FunctionName%) do (
			Call :IsBaseFunction "%_IsBaseFunction_InputFile%" "%%a" _IsBaseFunction_IsBaseFunction && echo Function %%a is a base function. || call :PrintWithoutNewline Function %%a is not a base function. 
			if errorlevel 1 Call :GetBasefunction "%_IsBaseFunction_InputFile%" "%%a" _IsBaseFunction_BaseFunction
			if errorlevel 1 Call echo  Base function:%%_IsBaseFunction_BaseFunction%%
 )
Call :ClearVariablesByPrefix _IsBaseFunction
GoTo :EOF



::Usage Call IsFunctionAlias BatchFile FunctionName ReturnVariable && Function is alias || function is not alias
::Usage Call IsBaseFunction BatchFile FunctionName ReturnVariable && Function is base function || function is not base function
:IsFunctionAlias BatchFile FunctionName
Set "_IBF_IsAlias=true"
:IsBaseFunction 
set "_IsBaseFunction_prefix=_IBF"
set "_IBF_InputFile=%~1"
set "_IBF_FunctionName=%~2"
set "_IBF_Output=%~3"
Call :GetBasefunction "%_IBF_InputFile%" "%_IBF_FunctionName%" _IBF_BaseFunction
if "[%_IBF_FunctionName%]" EQU "[%_IBF_BaseFunction%]" ( if defined _IBF_Output set "%_IBF_Output%=true" ) else ( if defined _IBF_Output set "%_IBF_Output%=false" )
if defined _IBF_IsAlias if "[%_IBF_FunctionName%]" NEQ "[%_IBF_BaseFunction%]" ( if defined _IBF_Output set "%_IBF_Output%=true" ) else ( if defined _IBF_Output set "%_IBF_Output%=false" )
Call :ClearVariablesByPrefix %_IsBaseFunction_prefix% _IsBaseFunction_prefix & if "[%_IBF_FunctionName%]" EQU "[%_IBF_BaseFunction%]" ( exit /b 0 ) else ( exit /b 1 )



:GetBaseFunction-demo
set "_GetBaseFunction_InputFile=%~1"
set "_GetBaseFunction_FunctionName=%~2"
Call :GetBasefunction "%_GetBaseFunction_InputFile%" "%_GetBaseFunction_FunctionName%" _GetBaseFunction_BaseFunction
echo base function name for :%_GetBaseFunction_FunctionName% is :%_GetBaseFunction_BaseFunction% at line %errorlevel%
GoTo :EOF

::Usage Call :GetBasefunction BatchFile FunctionName ReturnVariable 
::returns row number of BaseFunction
:GetBaseFunctionRow
:GetBaseFunctionName
:GetBaseFunction
set "_GetBaseFunction_prefix=_GBF"
set "_GBF_BatchFile=%~1"
set "_GBF_FunctionName=%~2"
set "_GBF_Output=%~3"
Call :GetFunctionExit "%_GBF_BatchFile%" "%_GBF_FunctionName%" _GBF_FunctionExit
Call :GetPreviousFunctionName "%_GBF_BatchFile%" %_GBF_FunctionExit% %_GBF_Output%
Call :ClearVariablesByPrefix %_GetBaseFunction_prefix% _GetBaseFunction_prefix & exit /b %errorlevel%

::Usage Call :DoesFunctionHaveAliases BatchFile FunctionName optional ReturnVariable && FunctionHasAliases || FunctionHasNoAlias
:DoesFunctionHaveAliases
set "_DoesFunctionHaveAliases_prefix=_DFHA"
set "_DFHA_InputFile=%~1"
set "_DFHA_FunctionName=%~2"
set "_DFHA_Output=%~3"
Call :GetBaseFunction "%_DFHA_InputFile%" "%_DFHA_FunctionName%" _DFHA_BaseFunctionName
if "[%_DFHA_FunctionName%]" EQU "[%_DFHA_BaseFunctionName%]" ( if defined _DFHA_Output set "%_DFHA_Output%=false" & exit /b 1 )
set /a _DFHA_CurrentRow=%errorlevel%
Call :GetFunctionPreambleRow "%_DFHA_InputFile%" "%_DFHA_CurrentRow%" _DFHA_BaseFunctionPreambleRow
Call :GetPreviousFunctionName "%_DFHA_InputFile%" %_DFHA_CurrentRow% _DFHA_PreviousFunctionName
set /a _DFHA_PreviousFunctionRow=%errorlevel%
set "_DFHA_result=true"
if %_DFHA_PreviousFunctionRow% LEQ %_DFHA_BaseFunctionPreambleRow% set "_DFHA_result=false"
if defined _DFHA_Output set "%_DFHA_Output%=%_DFHA_result%"
if "[%_DFHA_result%]" EQU "[true]" echo Function %_DFHA_FunctionName% has aliases
Call :ClearVariablesByPrefix %_GetFunctionAliases_prefix% _GetFunctionAliases_prefix & if "[%_DFHA_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )

::Usage Call :GetFunctionAliases batchfile functionname returnvariable
::returns number of aliases found, prints them if there is no return variable
:GetFunctionAliases
set "_GetFunctionAliases_prefix=_GFA"
set "_GFA_InputFile=%~1"
set "_GFA_FunctionName=%~2"
set "_GFA_Output=%~3"
set /a _GFA_Count=0
Call :GetBaseFunction "%_GFA_InputFile%" "%_GFA_FunctionName%" _GFA_BaseFunctionName
set /a _GFA_CurrentRow=%errorlevel%
Call :GetFunctionPreambleRow "%_GFA_InputFile%" "%_GFA_CurrentRow%" _GFA_BaseFunctionPreambleRow
:GetFunctionAliases-loop
Call :GetPreviousFunctionName "%_GFA_InputFile%" %_GFA_CurrentRow% _GFA_PreviousFunctionName
set /a _GFA_PreviousFunctionRow=%errorlevel%
if %_GFA_PreviousFunctionRow% EQU %_GFA_CurrentRow% GoTo :GetFunctionAliases-end
if %_GFA_PreviousFunctionRow% LEQ %_GFA_BaseFunctionPreambleRow% GoTo :GetFunctionAliases-end
set /a _GFA_Count+=1
set "_GFA_Buffer=%_GFA_Buffer% %_GFA_PreviousFunctionName%"
set /a _GFA_CurrentRow = _GFA_previousfunctionrow
GoTo :GetFunctionAliases-loop
:GetFunctionAliases-end
if defined _GFA_Output set "%_GFA_Output%=%_GFA_Buffer%"
if not defined _GFA_Output echo Function %_GFA_BaseFunctionName% aliases:%_GFA_Buffer%
Call :ClearVariablesByPrefix %_GetFunctionAliases_prefix% _GetFunctionAliases_prefix & exit /b %_GFA_Count%

--- more todo ---


--------- untouched below ----------------------- modified getfunctionrow/name

REM source function should be able to be invoked by
REM sourcebatch then function name
REM relativepath\sourcebatch.bat:FunctionName
REM bfw\lib\section\sourcebatch.bat:FunctionName .bat is optional bfw\lib\section can be omitted to just bfw\sourcebatch
REM just the FunctionName if not found in the current sourcebatch, then search all files in bfw\lib\
REM FOR NOW JUST MATCH FILE AND FUNCTION
:: NOPREAMBLE NOPOSTSCRIPT PREAMBLEONLY POSTSCRIPTONLY FUNCTIONONLY UNPACK PLUSDEPENDENCIES
::Usage Call :AddFunctionToBatch DestinationBatch SourceBatch FunctionName1 FunctionName2 ... FunctionNameN
:AddFunctionToBatch
set "_AddFunctionToBatch_prefix=_AFTB
set "_AFTB_output=%~1"
:AddFunctionToBatch-args
if "[%~2]" EQU "[UNPACK]" ( set "_AFTB_SwitchUnpack=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NOPREAMBLE]" ( set "_AFTB_SwitchNoPreamble=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NOPOSTSCRIPT]" ( set "_AFTB_SwitchNoPostscript=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[PREAMBLEONLY]" ( set "_AFTB_SwitchPreambleOnly=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[POSTSCRIPTONLY]" ( set "_AFTB_SwitchPostscriptOnly=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[FUNCTIONONLY]" ( set "_AFTB_SwitchFunctionOnly=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NOPROVISIONING]" ( set "_AFTB_SwitchNoProvisioning=true" & shift & GoTo :AddFunctionToBatch-args )
if "[%~2]" EQU "[NORMAL]" ( Call :ClearVariablesByPrefix _AFTB_Switch & shift & GoTo :AddFunctionToBatch-args )
Call :ClearVariablesByPrefix _AFTB_FunctionRows _AFTB_BFWFunctionFile
Call :IsFile "%~2" && ( set "_AFTB_SourceBatch=%~2" & shift & GoTo :AddFunctionToBatch-args ) || set "_AFTB_FunctionName=%~2"
if "[%_AFTB_FunctionName%]" EQU "[CORE]" Call :GetBatchCore "%_AFTB_SourceBatch%" _AFTB_FunctionRows
REM CHECK LOCAL FOLDER FOR %_AFTB_FunctionName%.bat
if not defined _AFTB_FunctionRows.start Call :GetFunctionRows "%_AFTB_SourceBatch%" "%_AFTB_FunctionName%" _AFTB_FunctionRows
if not defined _AFTB_FunctionRows.start if not defined _AFTB_NoProvisioning if defined bfw.root Call :GetBFWLIBFunction  "%_AFTB_FunctionName%" _AFTB_BFWFunctionFile _AFTB_FunctionRows
if not defined _AFTB_FunctionRows.start ( echo Function %_AFTB_FunctionName% not found & GoTo :AddFunctionToBatch-end  )
set /a _AFTB_StartLine=%_AFTB_FunctionRows.preamble% & set /a _AFTB_EndLine=%_AFTB_FunctionRows.postscript%
if defined _AFTB_SwitchNoPreamble set /a _AFTB_StartLine=%_AFTB_FunctionRows.start% 
if defined _AFTB_SwitchNoPostscript set /a _AFTB_EndLine=%_AFTB_FunctionRows.exit%
if defined _AFTB_SwitchPreambleOnly set /a _AFTB_EndLine=%_AFTB_FunctionRows.start%
if defined _AFTB_SwitchPostscriptOnly set /a _AFTB_StartLine=%_AFTB_FunctionRows.exit% 
if defined _AFTB_SwitchFunctionOnly ( set /a _AFTB_StartLine=%_AFTB_FunctionRows.start% & set /a _AFTB_EndLine=%_AFTB_FunctionRows.exit% )
if %_AFTB_StartLine% EQU %_AFTB_EndLine% GoTo :AddFunctionToBatch-end
if defined _AFTB_SwitchUnpack ( set /a _AFTB_StartLine=%_AFTB_FunctionRows.start%+1 & set /a _AFTB_EndLine=%_AFTB_FunctionRows.exit%-1 & set "_AFTB_SwitchUnpack=" )
if exist "%_AFTB_output%" Call :GetLabelRow "%_AFTB_output%" "%_AFTB_FunctionName%" || GoTo :AddFunctionToBatch-end
if defined _AFTB_BFWFunctionFile ( set "_AFTB_SourceFile=%_AFTB_BFWFunctionFile%" ) else ( set "_AFTB_SourceFile=%_AFTB_SourceBatch%" )
Call :AppendFileLineToFile "%_AFTB_SourceFile%" "%_AFTB_output%" %_AFTB_FunctionRows.preamble%-%_AFTB_FunctionRows.postscript%
REM IF PLUSDEPENDENCIES ADD DEPENDENCIES TO FILE by calling :GetBatchFunctionCalls and then calling :AddFunctionToBatch with found functions
:AddFunctionToBatch-end
if "[%~3]" NEQ "[]" ( shift & GoTo :AddFunctionToBatch-args )
Call :ClearVariablesByPrefix %_AddFunctionToBatch_prefix% _AddFunctionToBatch_prefix  & GoTo :EOF


::Usage Call :ExtractAllBatchFunction SourceBatchFile optional DestionationFolder
:ExtractAllBatchFunction
Call :ListFunctions "%~1" _ExtractAllBatchFunction_FunctionList
if "[%~2]" NEQ "[]" ( set "_ExtractAllBatchFunction_OutputFolder=%~2" ) else ( set "_ExtractAllBatchFunction_OutputFolder=%cd%\" )
Call :ExtractBatchFunction DESTINATIONFOLDER "%_ExtractAllBatchFunction_OutputFolder%" "%~1" %_ExtractAllBatchFunction_FunctionList%
set "_ExtractAllBatchFunction_FunctionList=" & set "_ExtractAllBatchFunction_OutputFolder="
GoTo :EOF

::Usage Call :ExtractBatchFunction SourceBatchFile FunctionName1 FunctionName2 ... FunctionNameN SourceBatchFile FunctionName1a ...FunctionNameNa
:ExtractBatchFunction
set "_ExtractBatchFunction_prefix=_EBF"
if "[%~1]" EQU "[DESTINATIONFOLDER]" ( set "_EBF_DestinationFolder=%~2" & shift & shift & GoTo :ExtractBatchFunction )
if "[%~1]" EQU "[DESTINATIONFILE]" ( set "_EBF_DestinationFile=%~2" & shift & shift & GoTo :ExtractBatchFunction )
Call :IsFile "%~1" && ( set "_EBF_SourceBatch=%~1" & shift & GoTo :ExtractBatchFunction ) || set "_EBF_FunctionName=%~1"
if not defined _EBF_DestinationFolder set "_EBF_DestinationFolder=%cd%\"
if defined _EBF_DestinationFile ( set "_EBF_DestinationFilepath=%_EBF_DestinationFolder%%_EBF_DestinationFile%" ) else ( set "_EBF_DestinationFilepath=%_EBF_DestinationFolder%%_EBF_FunctionName%.bat" )
if not defined bfw.silent echo Writing function %_EBF_FunctionName%
Call :AddFunctionToBatch "%_EBF_DestinationFilepath%" "%_EBF_SourceBatch%" "%_EBF_FunctionName%"
if "[%~2]" NEQ "[]" ( shift & GoTo :ExtractBatchFunction )
Call :ClearVariablesByPrefix %_ExtractBatchFunction_prefix% _ExtractBatchFunction_prefix & GoTo :EOF




REM :FindBatchDuplicateFunctions :find all function labels, returns list of duplicated labels
REM :FindMissingDependencies :check all calls in all functions, for each dependencies, check if it is fulfilled, returns list of unfulfilled dependencies
REM :FindDuplicateWords "a series of of words" :returns number of duplicates (1 duplicates)
REM :GetDuplicateWords "a series of of words" :returns number of duplicates (1 duplicates) : returns list of duplicated words "of"
REM :IsWordDuplicated "myword" "a series of of myword" returns number of times searchword is found in string
REM :GetWordCound "searchword" "a series of words" :returns number of times searchword is found in string, if searchword is "", returns total word count
REM :DeleteFunction name a function, it gets deleted, there should be a way to specify the function index if there are more than one function matching the name

REM FindFunction ?
REM ::Usage Call :GetFunction batchfile OutputArray optional FunctionSearchPattern
REM :GetFunction
REM set "_GetFunction_prefix=_GF"
REM for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	REM )


REM source function should be able to be invoked by
REM sourcebatch then function name
REM relativepath\sourcebatch.bat:FunctionName
REM bfw\lib\section\sourcebatch.bat:FunctionName .bat is optional bfw\lib\section can be omitted to just bfw\sourcebatch
REM just the FunctionName if not found in the current sourcebatch, then search all files in bfw\lib\
REM FOR NOW JUST MATCH FILE AND FUNCTION
:: NOPREAMBLE NOPOSTSCRIPT PREAMBLEONLY POSTSCRIPTONLY FUNCTIONONLY UNPACK PLUSDEPENDENCIES
::Usage Call :PrintBatchFunction DestinationBatch SourceBatch FunctionName1 FunctionName2 ... FunctionNameN
:PrintBatchFunction
set "_PrintBatchFunction_prefix=_PBF"
:PrintBatchFunction-args
if "[%~1]" EQU "[UNPACK]" ( set "_PBF_SwitchUnpack=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NOPREAMBLE]" ( set "_PBF_SwitchNoPreamble=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NOPOSTSCRIPT]" ( set "_PBF_SwitchNoPostscript=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[PREAMBLEONLY]" ( set "_PBF_SwitchPreambleOnly=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[POSTSCRIPTONLY]" ( set "_PBF_SwitchPostscriptOnly=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[FUNCTIONONLY]" ( set "_PBF_SwitchFunctionOnly=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NOPROVISIONING]" ( set "_PBF_SwitchNoProvisioning=true" & shift & GoTo :PrintBatchFunction-args )
if "[%~1]" EQU "[NORMAL]" ( Call :ClearVariablesByPrefix _PBF_Switch & shift & GoTo :PrintBatchFunction-args )
Call :ClearVariablesByPrefix _PBF_FunctionRows _PBF_BFWFunctionFile
Call :IsFile "%~1" && ( set "_PBF_SourceBatch=%~1" & shift & GoTo :PrintBatchFunction-args ) || set "_PBF_FunctionName=%~1"
if "[%_PBF_FunctionName%]" EQU "[CORE]" Call :GetBatchCore "%_PBF_SourceBatch%" _PBF_FunctionRows
REM CHECK LOCAL FOLDER FOR %_PBF_FunctionName%.bat
if not defined _PBF_FunctionRows.start Call :GetFunctionRows "%_PBF_SourceBatch%" "%_PBF_FunctionName%" _PBF_FunctionRows
if not defined _PBF_FunctionRows.start if not defined _PBF_NoProvisioning if defined bfw.root Call :GetBFWLIBFunction  "%_PBF_FunctionName%" _PBF_BFWFunctionFile _PBF_FunctionRows
if not defined _PBF_FunctionRows.start ( echo Function %_PBF_FunctionName% not found & GoTo :PrintBatchFunction-end  )
set /a _PBF_StartLine=%_PBF_FunctionRows.preamble% & set /a _PBF_EndLine=%_PBF_FunctionRows.postscript%
if defined _PBF_SwitchNoPreamble set /a _PBF_StartLine=%_PBF_FunctionRows.start% 
if defined _PBF_SwitchNoPostscript set /a _PBF_EndLine=%_PBF_FunctionRows.exit%
if defined _PBF_SwitchPreambleOnly set /a _PBF_EndLine=%_PBF_FunctionRows.start%
if defined _PBF_SwitchPostscriptOnly set /a _PBF_StartLine=%_PBF_FunctionRows.exit% 
if defined _PBF_SwitchFunctionOnly ( set /a _PBF_StartLine=%_PBF_FunctionRows.start% & set /a _PBF_EndLine=%_PBF_FunctionRows.exit% )
if %_PBF_StartLine% EQU %_PBF_EndLine% GoTo :PrintBatchFunction-end
if defined _PBF_SwitchUnpack ( set /a _PBF_StartLine=%_PBF_FunctionRows.start%+1 & set /a _PBF_EndLine=%_PBF_FunctionRows.exit%-1 & set "_PBF_SwitchUnpack=" )
if defined _AFTB_BFWFunctionFile ( set "_AFTB_SourceFile=%_AFTB_BFWFunctionFile%" ) else ( set "_AFTB_SourceFile=%_AFTB_SourceBatch%" )
Call :PrintFileLine "%_AFTB_SourceFile%" %_PBF_FunctionRows.preamble%-%_PBF_FunctionRows.postscript%
REM IF PLUSDEPENDENCIES ADD DEPENDENCIES TO FILE by calling :GetBatchFunctionCalls and then calling :PrintBatchFunction with found functions
:PrintBatchFunction-end
if "[%~2]" NEQ "[]" ( shift & GoTo :PrintBatchFunction-args )
Call :ClearVariablesByPrefix %_PrintBatchFunction_prefix% _PrintBatchFunction_prefix  & GoTo :EOF


::Usage Call :GetBFWLIBFunction FunctionName1 FunctionRowsObject1 ... FunctionNameN FunctionRowsObjectN
:GetBFWLIBFunction
if not defined bfw.root exit /b 1
Call :FindFileByFilename "%bfw.root%\lib" "%FunctionName1%" _GetBFWLIBFunction_FilePath || exit /b 1
GoTo :EOF

::Usage Call :FindFile SearchFolder Filename ReturnVariable
:FindFileByFilename
for /r "%~1" %%a in (*.*) do if /I "[%%~na]" EQU "[%~2]" ( set "%~3=%%a" & exit /b 0 )
exit /b 1 

::Usage Call :GetLastToken InputString OutputLastToken
:GetLastToken
for %%a in (%~1) do set %~2=%%a
GoTo :EOF

::Usage Call :IsLastToken InputString SearchString optional OutputValue
:IsLastToken
set "_IsLastToken_result=false"
if defined %~1 call set _IsLastToken_input=%%%~1%%
if not defined _IsLastToken_input set "_IsLastToken_input=%~1"
set "_IsLastToken_input=%_IsLastToken_input:-= %"
set "_IsLastToken_input=%_IsLastToken_input::= %"
for %%a in (%_IsLastToken_input%) do if "[%%a]" EQU "[%~2]" set "_IsLastToken_result=true"
set "_IsLastToken_input=" & set "_IsLastToken_result=" & if "[%_IsLastToken_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )

::Usage Call :GetLabels BatchFile LabelObjectArray optional RowsArray
:GetLabelsOnly
set "_GetLabels_output=%~2"
if "[%~3]" EQU "[]" ( set "_GetLabels_output_rows=%_GetLabels_output%.rows" ) else ( set "_GetLabels_output_rows=%~3" )
for /f delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%~1" ^| findstr /N "^"') do (
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set /a "%_GetLabels_output%.ubound=%%f" & REM set %_GetLabels_output%[%%f]=%%g
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do set %_GetLabels_output_rows%[%%g].type=label
	for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%[%%f].name=%%~z
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output%.name[%%~z]=%%g
	REM for /f "tokens=1,2,3* delims=:" %%f in ("%%a") do for /f "tokens=1,2*" %%z in ("%%h") do set %_GetLabels_output_rows%[%%g]=%%~z
	)
set /a "%_GetLabels_output%.lbound=1" & set "_GetLabels_output=" & set "_GetLabels_output_rows="
GoTo :EOF




::Usage Call :IsFile optional _OutputVar File1 File2 ... FileN && IsFile || IsNotFile
:IsFile
set "_IsFile_buffer=%~1"
if /i "[%_IsFile_buffer:~0,10%]" EQU "[_OutputVar]" ( set "_IsFile_output=%~1" & shift )
set "_IsFile_buffer="
:IsFile-loop
set "_IsFile_Filename=%~a1"
if "[%_IsFile_Filename:~0,1%]" EQU "[-]" ( set "_IsFile_result=true" ) else ( set "_IsFile_result=false" )
if "[%_IsFile_output%]" NEQ "[]" set "%_IsFile_output%=%_IsFile_result%"
if "[%_IsFile_result%]" EQU "[true]" if "[%~2]" NEQ "[]" ( shift & GoTo :IsFile-loop )
set "_IsFile_Filename=" & set "_IsFile_output=" & set "_IsFile_result=" & if "[%_IsFile_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )

::Usage Call :GetFunctionRows BatchFile FunctionName OutputObject
:GetFunctionRows
set "_GetFunctionRows_prefix=_GFR"
set "_GFR_BatchFile=%~1"
set "_GFR_FunctionName=%~2"
set "_GFR_OutputObject=%~3"
Set "%_GFR_OutputObject%.name=%_GFR_FunctionName%"
Call :GetLabelRow "%_GFR_BatchFile%" %_GFR_FunctionName% %_GFR_OutputObject%.start && exit /b 1
Call :GetFunctionExit "%_GFR_BatchFile%" %%%_GFR_OutputObject%.start%% %_GFR_OutputObject%.exit
Call :GetFunctionPreambleRow "%_GFR_BatchFile%" %%%_GFR_OutputObject%.start%% %_GFR_OutputObject%.preamble
Call :GetFunctionPostscriptRow "%_GFR_BatchFile%" %%%_GFR_OutputObject%.start%% %_GFR_OutputObject%.postscript
Call :ClearVariablesByPrefix %_GetFunctionRows_prefix% _GetFunctionRows_prefix  & GoTo :EOF

::Usage Call :GetLabelRow BatchFile FunctionName optional OutputRow
:GetLabelRow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /I /N "^:%~2" "%~1" ^| findstr /I /V "::%~2[a-zA-Z0-9\-\/\?\!\@\%%\$\#\^\*\)\{\}\[\]\:\_]"') do ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a )
exit /b 0

::Usage Call :GetFunctionExit BatchFile FunctionName or Row optional OutputRow
:GetFunctionExit
set "_GetFunctionExit_prefix=_GFE"
set "_GFE_BatchFile=%~1"
set "_GFE_Function=%~2"
set "_GFE_Output=%~3"
echo.%_GFE_Function%| findstr /r "[^0123456789]" >nul && ( set "_GFE_FunctionName=%_GFE_Function%" & Call :GetLabelRow "%_GFE_BatchFile%" %_GFE_Function% _GFE_Function ) || Call :GetFunctionName "%_GFE_BatchFile%" %_GFE_Function% _GFE_FunctionName
Call :GetNextExitRow "%_GFE_BatchFile%" %_GFE_Function% _GFE_FunctionNextExit
Call :GetNextFunctionRow "%_GFE_BatchFile%" %_GFE_FunctionNextExit% _GFE_FunctionNextFunction
Call :GetPreviousExitRow "%_GFE_BatchFile%" %_GFE_FunctionNextFunction% _GFE_FunctionExit
set /a _GFE_FunctionEOFExit=0 & Call :GetEOFrow "%_GFE_BatchFile%" %_GFE_FunctionName% _GFE_FunctionEOFExit
if %_GFE_FunctionEOFExit% GTR 0 set /a _GFE_FunctionExit=%_GFE_FunctionEOFExit%
if defined _GFE_Output set /a %_GFE_Output%=%_GFE_FunctionExit%
Call :ClearVariablesByPrefix %_GetFunctionExit_prefix% _GetFunctionExit_prefix & exit /b %_GFE_FunctionExit%

::Usage Call :GetFunctionPreambleRow BatchFile FunctionNameOrRow optional OutputRow
:GetFunctionPreambleRow
Call :GetPreviousEmptyRow "%~1" "%~2" "%~3"
exit /b %errorlevel%

::Usage Call :GetFunctionPostscriptRow BatchFile FunctionNameOrRow optional OutputRow
:GetFunctionPostscriptRow
Call :GetFunctionExit "%~1" "%~2" _GFPR_ExitRow
Call :GetNextEmptyRow "%~1" "%_GFPR_ExitRow%" "%~3"
set "_GFPR_ExitRow=" & exit /b %errorlevel%

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

::Usage Call :GetFunctionName File LineNumber OutputValue
:GetFunctionName
for /F "usebackq eol= tokens=1,2 delims=(&:=+ " %%i in (`^(type "%~1" ^| findstr /n /r /c:".*" ^| findstr /B /C:"%~2:" ^) 2^>nul`) do ( set "%~3=%%j" & exit /b 0 )
REM proposed alternative for /F "tokens=2 delims=(&:=+ " %%i in ('%SystemRoot%\System32\findstr.exe /n "" "%~1" ^| %SystemRoot%\System32\findstr.exe /B /C:"%~2:"') do set "%~3=%%i" & exit /b 0
exit /b 1

::Usage Call :GetBatchCore File optional OutputValue
::Returns core function final line number
:GetBatchCore
Call :GetLabelRow "%~1" End _GetBatchCore_EndRow
Call :GetNextFunctionRow "%~1" %_GetBatchCore_EndRow% _GetBatchCore_FirstFunction
Call :GetPreviousExitRow "%~1" %_GetBatchCore_FirstFunction% _GetBatchCore_FirstFunctionExit
Call :GetNextEmptyRow "%~1" %_GetBatchCore_FirstFunctionExit% _GetBatchCore_CorePostscript
if "[%~2]" NEQ "[]" ( set /a %~2.preamble=1 & set /a %~2.start=1 & set /a %~2.exit=%_GetBatchCore_FirstFunctionExit% & set /a %~2.postscript=%_GetBatchCore_CorePostscript% )
set "_GetBatchCore_EndRow=" & set "_GetBatchCore_FirstFunction=" & set "_GetBatchCore_FirstFunctionExit=" & set "_GetBatchCore_CorePostscript=" & exit /b %_GetBatchCore_CorePostscript%

::Usage Call :GetNextExitRow BatchFile StartRow optional OutputRow
:GetNextExitRow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N /I /C:"goto :EOF" /C:"exit /B" "%~1"') do ( if %%a GTR %~2 ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a ) )
exit /b 0

::Usage Call :ListFunctions BatchFile optional OutputVariable BatchFile2 ... BatchFileN
:ListFunctions
set "_ListFunctions_prefix=_LF"
Call :IsFile "%~1" && set "_LF_InputFile=%~1" || ( set "_LF_Output=%~1" & if "[%~2]" NEQ "[]" ( shift & GoTo :ListFunctions ) else ( GoTo :ListFunctions-end ) )
set "_LF_InputFile=%~1"
:ListFunctions-args
for /F "usebackq eol= tokens=2 delims=(&:=+ " %%a in (`^(type "%_LF_InputFile%" ^| findstr /n /r /c:"^:[^:]" ^) 2^>nul`) do ( Call :IsFunctionLabelExcluded %%a || call set "_LF_FunctionList=%%_LF_FunctionList%% %%a" )
:ListFunctions-end
if "[%~2]" NEQ "[]" ( shift & GoTo :ListFunctions )
if defined _LF_Output set "%_LF_Output%=%_LF_FunctionList:~1%"
if not defined _LF_Output echo.%_LF_FunctionList:~1%
Call :ClearVariablesByPrefix %_ListFunctions_prefix% _ListFunctions_prefix & GoTo :EOF

::Usage Call :GetPreviousFunctionName BatchFile StartRow optional OutputRow
::Usage Call :GetPreviousFunctionRow BatchFile StartRow optional OutputRow
:GetPreviousFunctionName
set "_GPFR_ReturnName=true"
:GetPreviousFunctionRow
REM echo :GetPreviousFunctionRow
set "_GetPreviousFunctionRow_prefix=_GPFR"
set "_GPFR_BatchFile=%~1"
set "_GPFR_StartRow=%~2"
set "_GPFR_Output=%~3"
:GetPreviousFunctionRow-args
REM echo :GetPreviousFunctionRow-args _GPFR_StartRow %_GPFR_StartRow% _GPFR_current %_GPFR_current%
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%_GPFR_BatchFile%"') do ( if %%a GEQ %_GPFR_StartRow% ( GoTo :GetPreviousFunctionRow-exit-loop ) else ( set /a _GPFR_current=%%a ) )
exit /b -1
:GetPreviousFunctionRow-exit-loop
if %_GPFR_StartRow% EQU %_GPFR_current% exit /b -1
Call :GetFunctionName "%~1" %_GPFR_current% _GPFR_current_FunctionName
Call :IsFunctionLabelExcluded %_GPFR_current_FunctionName% && ( set /a _GPFR_StartRow=%_GPFR_current% & GoTo :GetPreviousFunctionRow-args )
if "[%_GPFR_Output%]" NEQ "[]" set "%_GPFR_Output%=%_GPFR_current%" 
if "[%_GPFR_Output%]" NEQ "[]" if "[%_GPFR_ReturnName%]" EQU "[true]" set "%_GPFR_Output%=%_GPFR_current_FunctionName%"
Call :ClearVariablesByPrefix %_GetPreviousFunctionRow_prefix% _GetPreviousFunctionRow_prefix  & exit /b %_GPFR_current%

::Usage Call :GetNextFunctionName BatchFile StartRow optional OutputRow
::Usage Call :GetNextFunctionRow BatchFile StartRow optional OutputRow
:GetNextFunctionName
set "_GNFR_ReturnName=true"
:GetNextFunctionRow
set "_GetNextFunctionRow_prefix=_GNFR"
set "_GNFR_BatchFile=%~1"
set "_GNFR_StartRow=%~2"
set "_GNFR_Output=%~3"
:GetNextFunctionRow-args
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^:[^:]" "%_GNFR_BatchFile%"') do ( if %%a GTR %_GNFR_StartRow% ( set /a _GNFR_current=%%a & GoTo :GetNextFunctionRow-exit-loop ) )
Call :countLines _GNFR_current "%_GNFR_BatchFile%" 2>nul
set /a _GNFR_current-=1 & GoTo :GetNextFunctionRow-skip
:GetNextFunctionRow-exit-loop
Call :GetFunctionName "%~1" %_GNFR_current% _GNFR_current_FunctionName
Call :IsFunctionLabelExcluded _GNFR_current_FunctionName && ( set /a _GNFR_StartRow=%_GNFR_current% & GoTo :GetNextFunctionRow-args )
:GetNextFunctionRow-skip
if "[%_GNFR_Output%]" NEQ "[]" set "%_GNFR_Output%=%_GNFR_current%" 
if "[%_GNFR_Output%]" NEQ "[]" if "[%_GNFR_ReturnName%]" EQU "[true]" set "%_GNFR_Output%=%_GNFR_current_FunctionName%" 
Call :ClearVariablesByPrefix %_GetNextFunctionRow_prefix% _GetNextFunctionRow_prefix  & exit /b %_GNFR_current%

::Usage Call :GetPreviousExitRow BatchFile StartRow optional OutputRow
:GetPreviousExitRow
set "_GPER_previous="
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N /I /C:"goto :EOF" /C:"exit /B" "%~1"') do ( ( if %%a LSS %~2 set /a _GPER_previous=%%a ) & if %%a GEQ %~2 ( GoTo :GetPreviousExitRow-exit-loop ) )
:GetPreviousExitRow-exit-loop
if "[%~3]" NEQ "[]" call set "%~3=%_GPER_previous%"
set "_GPER_previous=" & exit /b %_GPER_previous%

::Usage Call :GetEOFrow BatchFile FunctionName optional OutputRow
:GetEOFrow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N /I /C:"EndOf_%~2" "%~1"') do ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a )
exit /b 0

::Usage Call :countLines returnvariable filename
::counts the number of lines in a file
:countLines result= "%file%"
setLocal disableDelayedExpansion
(set "lc=0" & call)
for /f "delims=:" %%N in ('
    cmd /d /a /c type "%~2" ^^^& ^<nul set /p "=#" ^| (^
    2^>nul findStr /n "^" ^&^& echo(^) ^| ^
    2^>nul findStr /blv 1: ^| 2^>nul findStr /lnxc:" "
') do (set "lc=%%N" & call;) %= for /f =%
endlocal & set "%1=%lc%"
exit /b %errorLevel% %= countLines =%
https://stackoverflow.com/a/49089494/6104460

::Usage Call :IsFunctionLabelExcluded FunctionLabel optional ExclusionList && IsExcluded || IsNotExcluded
:IsFunctionLabelExcluded
set "_IsFunctionLabelExcluded_prefix=_IFLE"
set /a _IFLE_exit=1
if defined %~1 call set _IFLE_input=%%%~1%%
if not defined _IFLE_input set "_IFLE_input=%~1"
set "_IFLE_input=%_IFLE_input:-= %"
set "_IFLE_input=%_IFLE_input::= %"
set "_IFLE_input=%_IFLE_input:)= %"
set "_IFLE_input=%_IFLE_input:(= %"
set "_IFLE_ExclusionList=%~2"
if "[%_IFLE_ExclusionList%]" EQU "[]" set "_IFLE_ExclusionList=main setup macro end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"
for %%a in (%_IFLE_input%) do ( set _IFLE_last_token=%%a )
for %%a in (%_IFLE_ExclusionList%) do if %%a EQU %_IFLE_last_token% ( set /a _IFLE_exit=0 & GoTo :IsFunctionLabelExcluded-end ) 
if "[%_IFLE_input:~,6%]" EQU "[EndOF_]" ( set /a _IFLE_exit=0 & GoTo :IsFunctionLabelExcluded-end ) 
:IsFunctionLabelExcluded-end
Call :ClearVariablesByPrefix %_IsFunctionLabelExcluded_prefix% _IsFunctionLabelExcluded_prefix  & exit /b %_IFLE_exit%

::Usage Call :AppendFileLineToFile inputfile outputfile 3 4 50-75 5 6 7 ... N
:AppendFileLineToFile
set "_AppendFileLineToFile_prefix=_AFLTF"
set "_AFLTF_InputFile=%~1"
set "_AFLTF_OutputFile=%~2"
:AppendFileLineToFile-args
for /f "delims=- tokens=1,2" %%a in ("%~3") do ( set "_AFLTF_Start=%%a" & set "_AFLTF_Stop=%%b"  )
if not defined _AFLTF_Stop set /a _AFLTF_Stop=%_AFLTF_Start%
if %_AFLTF_Start% GTR 1 set /a "_AFLTF_skip=%_AFLTF_Start%-1"
if %_AFLTF_Start% GTR 1 ( set "_AFLTF_skip=skip^=%_AFLTF_skip%^" ) else ( set "_AFLTF_skip=" )
for /f %_AFLTF_skip% delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^" "%_AFLTF_InputFile%"') do ( 
	for /f "delims=:" %%f in ("%%a") do if %%f GTR %_AFLTF_Stop% GoTo :AppendFileLineToFile-end
	set _AFLTF_buffer=%%a
	Setlocal enabledelayedexpansion
	set _AFLTF_buffer=!_AFLTF_buffer:*:=!
	>> "%_AFLTF_OutputFile%" echo(!_AFLTF_buffer!
	endlocal
	) 
:AppendFileLineToFile-end
if "[%~4]" NEQ "[]" ( shift & GoTo :AppendFileLineToFile-arg )
Call :ClearVariablesByPrefix %_AppendFileLineToFile_prefix% _AppendFileLineToFile_prefix & GoTo :EOF

::Usage Call :PrintFileLine inputfile 3 4 50-75 5 6 7 ... N
:PrintFileLine
set "_PrintFileLine_prefix=_PFL"
set "_PFL_InputFile=%~1"
:PrintFileLine-args
for /f "delims=- tokens=1,2" %%a in ("%~3") do ( set "_PFL_Start=%%a" & set "_PFL_Stop=%%b"  )
if not defined _PFL_Stop set /a _PFL_Stop=%_PFL_Start%
if %_PFL_Start% GTR 1 set /a "_PFL_skip=%_PFL_Start%-1"
if %_PFL_Start% GTR 1 ( set "_PFL_skip=skip^=%_PFL_skip%^" ) else ( set "_PFL_skip=" )
for /f %_PFL_skip% delims^=^ eol^= %%a in ('%SystemRoot%\System32\findstr /N "^" "%_PFL_InputFile%"') do ( 
	for /f "delims=:" %%f in ("%%a") do if %%f GTR %_PFL_Stop% GoTo :PrintFileLine-end
	set _PFL_buffer=%%a
	Setlocal enabledelayedexpansion
	set _PFL_buffer=!_PFL_buffer:*:=!
	echo(!_PFL_buffer!
	endlocal
	) 
:PrintFileLine-end
if "[%~4]" NEQ "[]" ( shift & GoTo :PrintFileLine-arg )
Call :ClearVariablesByPrefix %_PrintFileLine_prefix% _PrintFileLine_prefix & GoTo :EOF


::Usage Call :GetPreviousEmptyRow BatchFile StartRow optional OutputRow
:GetPreviousEmptyRow
set "_GPEW_previous="
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^$" "%~1"') do ( ( if %%a LSS %~2 set /a _GPEW_previous=%%a ) & if %%a GEQ %~2 ( GoTo :GetPreviousEmptyRow-exit-loop ) )
exit /b 0
:GetPreviousEmptyRow-exit-loop
if "[%~3]" NEQ "[]" call set "%~3=%_GPEW_previous%"
set "_GPEW_previous=" & exit /b %_GPEW_previous%

::Usage Call :GetNextEmptyRow BatchFile StartRow optional OutputRow
:GetNextEmptyRow
for /f delims^=:^ tokens^=1 %%a in ('%SystemRoot%\System32\findstr /N "^$" "%~1"' ) do ( if %%a GTR %~2 ( if "[%~3]" NEQ "[]" set "%~3=%%a" & exit /b %%a ) )
Call :countLines _GetNextEmptyRow_lastrow "%~1"
set /a _GetNextEmptyRow_lastrow+=1
if "[%~3]" NEQ "[]" set "%~3=%_GetNextEmptyRow_lastrow%"
exit /b %_GetNextEmptyRow_lastrow%

:BFWFunctionSwitcher-text
@echo off

:setup

REM set "_IFLE_ExclusionList=main setup macro end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"

:main

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end

REM set "_IFLE_ExclusionList="

GoTo :EOF
:EndOF_BFWFunctionSwitcher-text

