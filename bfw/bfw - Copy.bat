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

objective create bfw.bat
that contains everything to make bfw.bat

:CoreFunctionCopier
:AddFunctionToBatch
:ListFunctions

:ShiftedArgumentCaller
set _ShiftedArgumentCaller_function=%~1
shift
set "_ShiftedArgumentCaller_function=" & GoTo :%_ShiftedArgumentCaller_function%
GoTo :EOF

:install
:uninstall
:update

:listfunction
:getfunctionlist
:createnakedfunction
:shortcutify
:symlinkify
:hardlinkify
