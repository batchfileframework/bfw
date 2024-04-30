
:: NOSUFFIX in ApplicableSuffixes refers to copying the array element without a suffix
:: if ApplicableSuffixes is empty, then all variable inside array element will be copied
::Usage Call :CopyMultipleArrayElements InputArray InputElementList OutputArray ApplicableSuffixes
:CopyMultipleArrayElements 
set "_CopyMultipleArrayElements_InputArray=%~1"
set "_CopyMultipleArrayElements_InputElementList=%~2"
call set /a _CopyMultipleArrayElements_InputElementList.ubound=%_CopyMultipleArrayElements_InputElementList%.ubound
set "_CopyMultipleArrayElements_OutputArray=%~3"
call set _CopyMultipleArrayElements_OutputArray.lbound=%%%_CopyMultipleArrayElements_OutputArray%.lbound%%
call set _CopyMultipleArrayElements_OutputArray.ubound=%%%_CopyMultipleArrayElements_OutputArray%.ubound%%
if "[%_CopyMultipleArrayElements_OutputArray.ubound%]"=="[]" set _CopyMultipleArrayElements_OutputArray.ubound=-1
set "_CopyMultipleArrayElements_ApplicableSuffixes=%~4"
if "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" set /a _CopyMultipleArrayElements_ApplicableSuffixes.ubound=0
if not "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" echo calling :Deconcatenate " " "%_CopyMultipleArrayElements_ApplicableSuffixes%" _CopyMultipleArrayElements_ApplicableSuffixes
if not "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" Call :Deconcatenate " " "%_CopyMultipleArrayElements_ApplicableSuffixes%" _CopyMultipleArrayElements_ApplicableSuffixes
set /a _CopyMultipleArrayElements_InputElementList.index=0
:CopyMultipleArrayElements-loop-InputElementList
set /a _CopyMultipleArrayElements_ApplicableSuffixes.index=0
set /a _CopyMultipleArrayElements_OutputArray.ubound+=1
:CopyMultipleArrayElements-loop-ApplicableSuffixes
call set _CopyMultipleArrayElements_ApplicableSuffixes.current=%%_CopyMultipleArrayElements_ApplicableSuffixes[%_CopyMultipleArrayElements_ApplicableSuffixes.index%]%%
if "[%_CopyMultipleArrayElements_ApplicableSuffixes.current%]"=="[NOSUFFIX]" set "_CopyMultipleArrayElements_ApplicableSuffixes.current="
if "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" (
	Call :CopyElementAndSuffix %_CopyMultipleArrayElements_InputArray%[%_CopyMultipleArrayElements_InputElementList.index%] %_CopyMultipleArrayElements_OutputArray%[%_CopyMultipleArrayElements_OutputArray.ubound%]
) else (
	call call set %_CopyMultipleArrayElements_OutputArray%[%_CopyMultipleArrayElements_OutputArray.ubound%]%_CopyMultipleArrayElements_ApplicableSuffixes.current%=%%%%%_CopyMultipleArrayElements_InputArray%[%_CopyMultipleArrayElements_InputElementList.index%]%_CopyMultipleArrayElements_ApplicableSuffixes.current%%%%%
)
set /a _CopyMultipleArrayElements_ApplicableSuffixes.index+=1
if %_CopyMultipleArrayElements_ApplicableSuffixes.index% LEQ %_CopyMultipleArrayElements_ApplicableSuffixes.ubound% GoTo :CopyMultipleArrayElements-loop-ApplicableSuffixes
set /a _CopyMultipleArrayElements_InputElementList.index+=1
if %_CopyMultipleArrayElements_InputElementList.index% LEQ %_CopyMultipleArrayElements_InputElementList.ubound% GoTo :CopyMultipleArrayElements-loop-InputElementList
if "[%_CopyMultipleArrayElements_OutputArray.lbound%]"=="[]" set /a %_CopyMultipleArrayElements_OutputArray%.lbound=0
set /a %_CopyMultipleArrayElements_OutputArray%.ubound=%_CopyMultipleArrayElements_OutputArray.ubound%
set /a %_CopyMultipleArrayElements_OutputArray%.count=%_CopyMultipleArrayElements_OutputArray.ubound%-1
Call :ClearVariablesByPrefix _CopyMultipleArrayElements
GoTo :EOF

