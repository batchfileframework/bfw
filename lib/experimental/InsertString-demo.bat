@echo off

:setup
:macro
:main

REM detect if first argument is a existing function in this file
REM detect if first argument is a file in %bfw.root%\lib
REM demo should be case
for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~n0]" EQU "[bfw]" if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~n0]" EQU "[bfw]" if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end


GoTo :EOF


:InsertString-demo

set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"

REM Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[0] 10
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[1] 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[2] REPEAT 0 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[3] REPEAT 1 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[4] REPEAT 2 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[5] REPEAT 3 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[6] REPEAT 4 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[7] REPEAT 5 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[8] REPEAT 6 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[9] REPEAT 7 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[10] REPEAT 8 10 " ABC "
set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789K123456789L123456789M123456789N123456789"
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[11] REPEAT 9 10 " ABC "
set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[12] REPEAT 10 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[13] REPEAT 11 10 " ABC "
Call :InsertString _InsertString_demo_testvar _InsertString_demo_output[14] ALL 10 " ABC "
set /a _InsertString_demo_output.ubound=14
Call :EchoArray _InsertString_demo_output

Call :ClearVariablesByPrefix  _InsertString

Call :ReplaceString-demo
Call :DeleteString-demo

GoTo :EOF

:ReplaceString-demo

set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"

REM Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[0] 10
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[1] 10 " ABC "
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[2] REPEAT 0 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[3] REPEAT 1 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[4] REPEAT 2 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[5] REPEAT 3 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[6] REPEAT 4 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[7] REPEAT 5 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[8] REPEAT 6 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[9] REPEAT 7 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[10] REPEAT 8 10 " ABC " 
set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789K123456789L123456789M123456789N123456789"
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[11] REPEAT 9 10 " ABC " 
set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[12] REPEAT 10 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[13] REPEAT 11 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[14] ALL 10 " ABC " 
Call :ReplaceString _InsertString_demo_testvar _InsertString_demo_output[15] 10 " ABC " 25 " DEF " 40 " GHI " 55 " KLM "
set /a _InsertString_demo_output.ubound=15
Call :EchoArray _InsertString_demo_output

Call :ClearVariablesByPrefix  _InsertString
GoTo :EOF

:DeleteString-demo

set "_InsertString_demo_testvar=A123456789B123456789C123456789D123456789E123456789F123456789G123456789H123456789I123456789J123456789"

REM Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[0] 10
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[1] 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[2] REPEAT 0 10 5 
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[3] REPEAT 1 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[4] REPEAT 2 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[5] REPEAT 3 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[6] REPEAT 4 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[7] REPEAT 5 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[8] REPEAT 6 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[9] REPEAT 7 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[10] REPEAT 8 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[11] REPEAT 9 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[12] REPEAT 10 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[13] REPEAT 11 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[14] ALL 10 5
Call :DeleteString _InsertString_demo_testvar _InsertString_demo_output[15] 10 5 25 5 40 5 55 5
set /a _InsertString_demo_output.ubound=15
Call :EchoArray _InsertString_demo_output

Call :ClearVariablesByPrefix  _InsertString
GoTo :EOF

::Usage Call :DeleteString InputString OutputString [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndex1 InsertString1  ... [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndexN InsertStringN
:DeleteString
set "_IS_ReplaceMode=true"
set "_IS_DeleteMode=true"
GoTo :InsertString
::Usage Call :ReplaceString InputString OutputString [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndex1 InsertString1  ... [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndexN InsertStringN
:ReplaceString
set "_IS_ReplaceMode=true"
::Usage Call :InsertString InputString OutputString [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndex1 InsertString1  ... [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndexN InsertStringN
:InsertString
set "_InsertString_prefix=_IS"
setlocal enabledelayedexpansion
if "[%~1]" EQU "[APPEND]" ( set "_IS_AppendMode=true" & shift)
set "_IS_LocalScope=true"
set "_IS_InputString=%~1"
set "_IS_OutputString=%~2"
if defined _IS_AppendMode if defined !_IS_OutputString! set "_IS_ResidualOutput=!_IS_OutputString!"
set /a _IS_InsertCountIndex=0
set /a _IS_InsertCount=-1
:InsertString-args
if "[%~3]" EQU "[REPEAT]" ( for /f "tokens=1,2 delims=," %%a in ("%~4") do ( set /a _IS_InsertCount=%%a & set /a _IS_InsertSkip=%%b 2>nul ) & shift & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[ALL]" ( set "_IS_AllTheString=true" & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[OVERSPLIT]" ( set "_IS_Oversplit=true" & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[LEN]" ( set /a _IS_InsertString_Pointer_len=%~4 & shift & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[RESET]" ( set "_IS_Oversplit=" & set "_IS_InsertString_Pointer_len=" & set "_IS_Oversplit=" & set "_IS_InsertCount=" & set "_IS_InsertSkip=" & shift & GoTo :InsertString-args )
if defined _IS_AllTheString set "_IS_Oversplit="
set /a _IS_InsertIndex=%~3
set "_IS_InsertString=%~4"
shift & shift
set "_IS_InputString_Pointer=_IS_InputString" & if defined !_IS_InputString! set "_IS_InputString_Pointer=!_IS_InputString!"
set "_IS_InsertString_Pointer=_IS_InsertString" & if defined !_IS_InsertString! set "_IS_InsertString_Pointer=!_IS_InsertString!"
if defined _IS_DeleteMode set "_IS_InsertString_Pointer=_IS_Blank"
if not defined _IS_InsertString_Pointer_len ( set /a _IS_InsertString_Pointer_len=0 & if defined _IS_ReplaceMode call :len !_IS_InsertString_Pointer! _IS_InsertString_Pointer_len )
if defined _IS_DeleteMode set /a _IS_InsertString_Pointer_len=%_IS_InsertString%
set /a _IS_StartIndex=0
set /a _IS_NextIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
:InsertString-count-loop
if not defined _IS_Oversplit if "[!%_IS_InputString_Pointer%:~%_IS_NextIndex%!]" EQU "[]" GoTo :InsertString-count-end
set "_IS_NewOutput=!_IS_NewOutput!!%_IS_InputString_Pointer%:~%_IS_StartIndex%,%_IS_InsertIndex%!!%_IS_InsertString_Pointer%!"
set /a _IS_StartIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
if defined _IS_InsertSkip set /a _IS_InsertIndex=%_IS_InsertSkip%
set /a _IS_NextIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
if %_IS_InsertCountIndex% LSS %_IS_InsertCount% (  set /a _IS_InsertCountIndex+=1 & GoTo :InsertString-count-loop )
if defined _IS_AllTheString GoTo :InsertString-count-loop
:InsertString-count-end
set "_IS_NewOutput=!_IS_ResidualOutput!!_IS_NewOutput!!%_IS_InputString_Pointer%:~%_IS_StartIndex%!" & set "_IS_ResidualOutput="
if "[%~3]" NEQ "[]" ( set "_IS_InputString=!_IS_NewOutput!" & set "_IS_NewOutput=" & set "_IS_Oversplit=" & set "_IS_InsertString_Pointer_len=" & set "_IS_Oversplit=" & set "_IS_InsertCount=" & set "_IS_InsertSkip=" & GoTo :InsertString-args )
for /f "tokens=1* delims=" %%a in ("!_IS_NewOutput!") do ( endlocal & set %_IS_OutputString%=%%a )
if defined _IS_LocalScope endlocal
Call :ClearVariablesByPrefix %_InsertString_prefix% _InsertString_prefix & GoTo :EOF


REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound%%" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound%%"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
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



:len <stringVar> <resultVar>
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


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF
