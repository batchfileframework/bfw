
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
for %%a in (%_IFLE_ExclusionList%) do if %%a EQU %_IFLE_last_token% ( set /a _IFLE_exit=0 & GoTo :IsFunctionLabelExcluded-end ) 
if "[%_IFLE_input:~,6%]" EQU "[EndOF_]" ( set /a _IFLE_exit=0 & GoTo :IsFunctionLabelExcluded-end ) 
:IsFunctionLabelExcluded-end
Call :ClearVariablesByPrefix %_IsFunctionLabelExcluded_prefix% _IsFunctionLabelExcluded_prefix  & exit /b %_IFLE_exit%

