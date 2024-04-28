
:: Set _CopyValuesFromArray_PartialMatch=true if you want to allow partial matches
:: Set _CopyValuesFromArray_SearchSuffix 'the suffix that will be searched into
:: Maybe support for _CopyValuesFromArray_OutputSuffix=NOSUFFIX ?
::Usage Call :CopyValuesFromArray InputArray OutputArray SearchList1 SearchList2 SearchListN
:CopyValuesFromArray
REM @echo on
set "_CopyValuesFromArray_InputArray=%~1"
call set "_CopyValuesFromArray_InputArray.lbound=%%%~1.lbound%%"
call set "_CopyValuesFromArray_InputArray.ubound=%%%~1.ubound%%"
set "_CopyValuesFromArray_OutputArray=%~2"
call set "_CopyValuesFromArray_OutputArray.lbound=%%%~2.lbound%%"
call set "_CopyValuesFromArray_OutputArray.ubound=%%%~2.ubound%%"
if "[%_CopyValuesFromArray_OutputArray.lbound%]"=="[]" set /a "%_CopyValuesFromArray_OutputArray%.lbound=0"
if "[%_CopyValuesFromArray_OutputArray.ubound%]"=="[]" set /a "%_CopyValuesFromArray_OutputArray%.ubound=-1"
if "[%_CopyValuesFromArray_SearchSuffix%]"=="[]" set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
if not "[%_CopyValuesFromArray_SearchSuffix%]"=="[]" Call :Deconcatenate " " "%_CopyValuesFromArray_SearchSuffix%" _CopyValuesFromArray_SearchSuffix
set /a _CopyValuesFromArray_SearchList.lbound=0
set /a _CopyValuesFromArray_SearchList.ubound=-1
:CopyValuesFromArray-InputArray-SearchList-loop
set "_CopyValuesFromArray_NewSearchList=%~3"
call set _CopyValuesFromArray_NewSearchList.lbound=%%%_CopyValuesFromArray_NewSearchList%.lbound%%
call set _CopyValuesFromArray_NewSearchList.ubound=%%%_CopyValuesFromArray_NewSearchList%.ubound%%
call :IsNumeric %_CopyValuesFromArray_NewSearchList.lbound% && set "_CopyValuesFromArray_NewSearchList.lbound="
call :IsNumeric %_CopyValuesFromArray_NewSearchList.ubound% && set "_CopyValuesFromArray_NewSearchList.ubound="
if "[%_CopyValuesFromArray_NewSearchList.ubound%]"=="[]" set /a _CopyValuesFromArray_SearchList.ubound+=1
if "[%_CopyValuesFromArray_NewSearchList.ubound%]"=="[]" (
	set "_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.ubound%]=%_CopyValuesFromArray_NewSearchList%"
	GoTo :CopyValuesFromArray-InputArray-SearchList-subloop-skip
)
set _CopyValuesFromArray_NewSearchList.index=%_CopyValuesFromArray_NewSearchList.lbound%
:CopyValuesFromArray-InputArray-SearchList-subloop
set /a _CopyValuesFromArray_SearchList.ubound+=1
call set "_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.ubound%]=%%%_CopyValuesFromArray_NewSearchList%[%_CopyValuesFromArray_NewSearchList.index%]%%
set /a _CopyValuesFromArray_NewSearchList.index+=1
if %_CopyValuesFromArray_NewSearchList.index% LEQ %_CopyValuesFromArray_NewSearchList.ubound% GoTo :CopyValuesFromArray-InputArray-SearchList-subloop
:CopyValuesFromArray-InputArray-SearchList-subloop-skip
shift
if not "[%~3]"=="[]" GoTo :CopyValuesFromArray-InputArray-SearchList-loop
REM Main loop starts here
REM set _CopyValuesFromArray
set /a _CopyValuesFromArray_InputArray.index=%_CopyValuesFromArray_InputArray.lbound%
:CopyValuesFromArray-InputArray-loop
set /a _CopyValuesFromArray_SearchList.index=%_CopyValuesFromArray_SearchList.lbound%
:CopyValuesFromArray-InputArray-searchterms-loop
REM call echo searchlist call set "_CopyValuesFromArray_SearchList.current=%%_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]%%" _CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]
call set "_CopyValuesFromArray_SearchList.current=%%_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]%%"
set /a _CopyValuesFromArray_SearchSuffix.index=%_CopyValuesFromArray_SearchSuffix.lbound%
:CopyValuesFromArray-InputArray-suffix-loop
REM call echo suffixlist call set "_CopyValuesFromArray_SearchSuffix.current=%%_CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]%%" _CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]
call set "_CopyValuesFromArray_SearchSuffix.current=%%_CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]%%"
if "[%_CopyValuesFromArray_SearchSuffix.current%]"=="[NOSUFFIX]" set "_CopyValuesFromArray_SearchSuffix.current=
call set "_CopyValuesFromArray_InputArray.current=%%%_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%]%_CopyValuesFromArray_SearchSuffix.current%%%"
REM echo InputArray %_CopyValuesFromArray_InputArray.index% SearchList %_CopyValuesFromArray_SearchList.index% SearchSuffix %_CopyValuesFromArray_SearchSuffix.index% compare "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_SearchList.current%]"
if "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_SearchList.current%]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-matchfound
if not "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-nomatch
set "_CopyValuesFromArray_PartialMatch.current="
if "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" call set "_CopyValuesFromArray_PartialMatch.current=%%_CopyValuesFromArray_InputArray.current:%_CopyValuesFromArray_SearchList.current%=%%" 
if "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" if not "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_PartialMatch.current%]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-matchfound
GoTo :CopyValuesFromArray-InputArray-suffix-loop-nomatch
:CopyValuesFromArray-InputArray-suffix-loop-matchfound
REM echo match found
REM echo set /a %_CopyValuesFromArray_OutputArray%.ubound+=1
set /a %_CopyValuesFromArray_OutputArray%.ubound+=1
REM echo *_CopyValuesFromArray_OutputArray*.ubound %_CopyValuesFromArray_OutputArray%.ubound
REM call echo ***_CopyValuesFromArray_OutputArray**.ubound** %%%_CopyValuesFromArray_OutputArray%.ubound%%
REM call echo Call :CopyElementAndSuffix %_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%] %_CopyValuesFromArray_OutputArray%[%%%_CopyValuesFromArray_OutputArray%.ubound%%]
Call :CopyElementAndSuffix %_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%] %_CopyValuesFromArray_OutputArray%[%%%_CopyValuesFromArray_OutputArray%.ubound%%]
set /a _CopyValuesFromArray_InputArray.index+=1
if %_CopyValuesFromArray_InputArray.index% LEQ %_CopyValuesFromArray_InputArray.ubound% ( GoTo :CopyValuesFromArray-InputArray-loop ) else ( GoTo :CopyValuesFromArray-end)
:CopyValuesFromArray-InputArray-suffix-loop-nomatch

set /a _CopyValuesFromArray_SearchSuffix.index+=1
if %_CopyValuesFromArray_SearchSuffix.index% LEQ %_CopyValuesFromArray_SearchSuffix.ubound% GoTo :CopyValuesFromArray-InputArray-suffix-loop
set /a _CopyValuesFromArray_SearchList.index+=1
if %_CopyValuesFromArray_SearchList.index% LEQ %_CopyValuesFromArray_SearchList.ubound% GoTo :CopyValuesFromArray-InputArray-searchterms-loop
set /a _CopyValuesFromArray_InputArray.index+=1
if %_CopyValuesFromArray_InputArray.index% LEQ %_CopyValuesFromArray_InputArray.ubound% GoTo :CopyValuesFromArray-InputArray-loop
:CopyValuesFromArray-end
Call :ClearVariablesByPrefix _CopyValuesFromArray
GoTo :EOF

REM old version, would only handle one suffix at a time, could not insert in the middle of an array, I think
:: Set _AddArrayElementSuffix to insert text after array name
:: Example Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval
:: Example set _AddArrayElementSuffix=.subvalue NOTE You need to roll back array ubound
:: Example set /a myval.ubound=50
:: Example Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval
::Usage Call :AddArrayElement AddedValue1 AddedValue2 ... AddedValueN OutputArray
REM :AddArrayElement
REM if "[%~1]"=="[]" GoTo :EOF
REM if "[%~2]"=="[]" GoTo :EOF
REM set /a _AddArrayElement.count=0
REM set /a _AddArrayElement.lbound=0
REM set /a _AddArrayElement.ubound=0
REM set /a _AddArrayElement.index=0
REM :AddArrayElement-internal-loop-collect
REM set "_AddArrayElement[%_AddArrayElement.index%]=%~1"
REM set /a _AddArrayElement.ubound=%_AddArrayElement.index%
REM set /a _AddArrayElement.count+=1
REM set /a _AddArrayElement.index+=1
REM shift
REM if not "[%~2]"=="[]" GoTo :AddArrayElement-internal-loop-collect
REM set /a _AddArrayElement.index=0
REM :AddArrayElement-internal-loop-store
REM set /a %~1.ubound+=1
REM call set "%~1[%%%~1.ubound%%]%_AddArrayElementSuffix%=%%_AddArrayElement[%_AddArrayElement.index%]%%"
REM set /a _AddArrayElement.index+=1
REM if %_AddArrayElement.index% LEQ %_AddArrayElement.ubound% GoTo :AddArrayElement-internal-loop-store
REM Call :ClearVariablesByPrefix _AddArrayElement
REM if not "[%_AddArrayElementSuffix%]"=="[]" set "_AddArrayElementSuffix="
REM GoTo :EOF

