
::Usage Call :IsFunctionLabelExcluded FunctionLabel ExclusionList
:IsFunctionLabelExcluded
set "_IFLE_input=%~1"
set "_IFLE_input=%_IFLE_input:-= %"
set "_IFLE_input=%_IFLE_input::= %"
set "_IFLE_ExclusionList=%~2"
if "[%_IFLE_ExclusionList%]" EQU "[]" set "_IFLE_ExclusionList=main setup end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"
for %%a in (%_IFLE_input%) do set _IFLE_last_token=%%a
for %%a in (%_IFLE_ExclusionList%) do if %%a EQU %_IFLE_last_token% exit /b 0
if "[%_IFLE_input:~,6%]" EQU "[EndOf_]" exit /b 0
exit /b 1
