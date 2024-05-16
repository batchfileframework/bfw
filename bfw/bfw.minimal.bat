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

:ShiftedArgumentCaller
set _ShiftedArgumentCaller_function=%~1
shift
set "_ShiftedArgumentCaller_function=" & GoTo :%_ShiftedArgumentCaller_function%
GoTo :EOF


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
if "[%~2]" EQU "[UNPACK]" ( set "_AFTB_Unpack=true" & shift & GoTo :AddFunctionToBatch-args )
Call :ClearVariablesByPrefix _AFTB_FunctionRows
Call :IsFile "%~2" && ( set "_AFTB_SourceBatch=%~2" & shift & GoTo :AddFunctionToBatch-args ) || set "_AFTB_FunctionName=%~2"
REM if defined bfw.root
REM determine quel fichier
REM ficher dans repertoire courrant
REM ou fichier dans bfw\lib ?
if "[%_AFTB_FunctionName%]" EQU "[CORE]" ( Call :GetBatchCore "%_AFTB_SourceBatch%" _AFTB_FunctionRows & GoTo :AddFunctionToBatch-end )
Call :GetFunctionRows "%_AFTB_SourceBatch%" "%_AFTB_FunctionName%" _AFTB_FunctionRows
if "[%_AFTB_Unpack%]" EQU "[true]" ( set /a _AFTB_FunctionRows.preamble=%_AFTB_FunctionRows.start%+1 & set /a _AFTB_FunctionRows.postscript=%_AFTB_FunctionRows.exit%-1 & set "_AFTB_Unpack=" )
:AddFunctionToBatch-end
Call :AppendFileLineToFile "%_AFTB_SourceBatch%" "%_AFTB_output%" %_AFTB_FunctionRows.preamble%-%_AFTB_FunctionRows.postscript%
if "[%~3]" NEQ "[]" ( shift & GoTo :AddFunctionToBatch-args )
Call :ClearVariablesByPrefix %_AddFunctionToBatch_prefix% _AddFunctionToBatch_prefix  & GoTo :EOF


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
Call :GetLabelRow "%_GFR_BatchFile%" %_GFR_FunctionName% %_GFR_OutputObject%.start
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
echo.%_GFE_Function%| findstr /r "[^0123456789]" >nul && ( set "_GFE_FunctionName=%_GFE_Function%" & Call :GetLabelRow %_GFE_BatchFile% %_GFE_Function% _GFE_Function ) || Call :GetFunctionName %_GFE_BatchFile% %_GFE_Function% _GFE_FunctionName
Call :GetNextExitRow %_GFE_BatchFile% %_GFE_Function% _GFE_FunctionNextExit
Call :GetNextFunctionRow %_GFE_BatchFile% %_GFE_FunctionNextExit% _GFE_FunctionNextFunction
Call :GetPreviousExitRow %_GFE_BatchFile% %_GFE_FunctionNextFunction% _GFE_FunctionExit
set /a _GFE_FunctionEOFExit=0 & Call :GetEOFrow %_GFE_BatchFile% %_GFE_FunctionName% _GFE_FunctionEOFExit
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


:ListFunctions BatchFile optional OutputVariable BatchFile2 ... BatchFileN
set "_ListFunctions_prefix=_LF"
Call :IsFile "%~1" && set "_LF_InputFile=%~1" || ( set "_LF_Output=%~1" & if "[%~2]" NEQ "[]" ( shift & GoTo :ListFunctions ) else ( GoTo :ListFunctions-end ) )
set "_LF_InputFile=%~1"
:ListFunctions-args
for /F "usebackq eol= tokens=2 delims=(&:=+ " %%a in (`^(type %_LF_InputFile% ^| findstr /n /r /c:"^:[^:]" ^) 2^>nul`) do ( Call :IsFunctionLabelExcluded %%a || call set "_LF_FunctionList=%%_LF_FunctionList%% %%a" )
:ListFunctions-end
if "[%~2]" NEQ "[]" ( shift & GoTo :ListFunctions )
if defined _LF_Output ( set "%_LF_Output%=%_LF_FunctionList:~1%" ) else ( echo.%_LF_FunctionList:~1% )
Call :ClearVariablesByPrefix %_ListFunctions_prefix% _ListFunctions_prefix & GoTo :EOF


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
if "[%~3]" NEQ "[]" set "%~3=%_GNFR_current%" 
if "[%_GNFR_ReturnName%]" EQU "[true]" set "%~3=%_GNFR_current_FunctionName%" 
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
set "_IFLE_ExclusionList=%~2"
if "[%_IFLE_ExclusionList%]" EQU "[]" set "_IFLE_ExclusionList=main setup macro end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"
for %%a in (%_IFLE_input%) do set _IFLE_last_token=%%a
REM set _IFLE
for %%a in (%_IFLE_ExclusionList%) do if %%a EQU %_IFLE_last_token% ( set /a _IFLE_exit=0 & GoTo :IsFunctionLabelExcluded-end ) 
if "[%_IFLE_input:~,6%]" EQU "[EndOf_]" ( set /a _IFLE_exit=0 & GoTo :IsFunctionLabelExcluded-end ) 
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

