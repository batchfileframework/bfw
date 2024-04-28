
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

REM old function, retired
REM REM Prefix/suffix variable should be unique and start with _
REM REM TODO clean up variables, maybe use set instead ?
REM :: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
REM :: Example set EchoArrayPrefix=InputArray[%%index%%]=
REM :: EchoArray InputArray optional start optional end
REM :EchoArray
REM set /a index=0 
REM set /a limit=2147483647
REM if not ["%~2"]==[""] set /a index=%~2
REM if not ["%~3"]==[""] set /a limit=%~3
REM call set "lbound=%%%~1.lbound%%" 
REM call set "ubound=%%%~1.ubound%%"
REM call set "count=%%%~1.count%%"
REM call set "next=%%%~1.next%%"
REM call set "previous=%%%~1.previous%%"
REM if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
REM if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
REM if not ["%count%"]==[""] call echo %~1.count %%%~1.count%%
REM if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
REM if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
REM :EchoArray-internal-loop
REM if not defined %1[%index%] GoTo :EOF
REM call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
REM set /a index+=1
REM if %index% GTR %limit% goto :EOF
REM GoTo :EchoArray-internal-loop


REM Obsoleted
REM ::Usage Call :Ubound InputArray UboundOutput ' make this better, search "set" for the real ubound
REM :ubound
REM set %2=%~1.ubound
REM GoTo :EOF

REM Obsoleted
REM ::Usage Call :Lbound InputArray LboundOutput' make this better, search "set" for the real ubound
REM :lbound
REM set %2=%~1.lbound
REM GoTo :EOF

