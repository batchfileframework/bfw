@echo off
:setup
call :ClearLocalVariables
Call :GetTime FileTime StartDate StartTime
Call :GetCodePage InitialCodepage
Call :SetTitle "Array manipulation DEMO" 
set debug=false
set verbose=100
set silent=false
set logfile=%tmp%\%filetime%
if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
call :SetMacroPrintTime

:main

cls
%PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
if "[%silent%]"=="[true]" echo Silent mode is enabled
if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more

call :ArrayManipulation-DEMO
call :CopyValuesFromArray-DEMO
GoTo :END




:END
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions 

:CopyValuesFromArray-DEMO
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix mytestarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :CreateTestArray mytestarray 4 NOSUFFIX .suffixA .suffixB .suffixC

REM echo.
REM echo Inserted new element 2 (998) and 3 (999)
set "NewElement=999"
set "NewElement.suffixA=999A"
set "NewElement.suffixB=999B"
set "NewElement.suffixC=999C"
Call :AddArrayElement NewElement mytestarray 2
set "NewElement=998"
set "NewElement.suffixA=998A"
set "NewElement.suffixB=998B"
set "NewElement.suffixC=998C"
Call :AddArrayElement NewElement mytestarray 2
REM set mytestarray
Call :ClearVariablesByPrefix NewElement

REM GoTo :CopyValuesFromArray-DEMO-skip

echo.
echo Contents of mytestarray
echo.
set mytestarray

REM GoTo :CopyValuesFromArray-DEMO-skip

echo.
echo Searching "NOSUFFIX"  for all the search terms, there are no matches 
echo.
REM set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching "NOSUFFIX" for all the search terms, now including 3-.suffixB, but no match
echo because we are only checking in the suffix "NOSUFFIX", in other words mytestarray[x] straight
echo.
REM set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching in ".suffixB" for all the search terms, now including 3-.suffixB, 
echo there is a match of element 3
echo.
set "_CopyValuesFromArray_SearchSuffix=.suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray

REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching in ".suffixB" for all the search terms, none of the search terms match
echo also, the searchterm word2 is now an array filled with search terms
echo none of these searchterms have a match in the array, there are no results
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=blou"
set /a word2.lbound=3
set /a word2.ubound=6
set "_CopyValuesFromArray_SearchSuffix=.suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixB" for all the search terms, none of the search terms match
echo also, the searchterm word2 is now an array filled with search terms
echo one of the search terms in array "word2" is a match to element 3 "3-.suffixB"
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=3-.suffixB"
set "word2[7]=blou"
set /a word2.lbound=3
set /a word2.ubound=7
set "_CopyValuesFromArray_SearchSuffix=.suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixA" for all the search terms, none of the search terms match
echo also, the searchterm word2 is now an array filled with search terms
echo none of the search terms match in .suffixA there are no results
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=3-.suffixB"
set "word2[7]=blou"
set /a word2.lbound=3
set /a word2.ubound=7
set "_CopyValuesFromArray_SearchSuffix=.suffixA"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2



REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixA" and in ".suffixB" for all the search terms, 
echo also, the searchterm word2 is now an array filled with search terms
echo There are two matches, 3rd element in suffixB and 4th element in suffixA
echo one of the match is from the word2 array, the order is a direct search word
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=FFFFF"
set "word2[7]=blou"
set "word2[8]=ble"
set "word2[9]=4-.suffixA"
set /a word2.lbound=3
set /a word2.ubound=9
set "_CopyValuesFromArray_SearchSuffix=.suffixA .suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


echo.
echo Searching in ".suffixA" and in ".suffixB" for all the search terms, 
echo also, the searchterm word2 is now an array filled with search terms
echo There are two matches, 3rd element in suffixB and 4th element in suffixA
echo one of the match is from the word2 array, the order is a direct search word
echo also partial matching is enabled and the search term 998 is added to the list
echo in total this matches element 2 4 and 5
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=FFFFF"
set "word2[7]=blou"
set "word2[8]=998"
set "word2[9]=ble"
set "word2[10]=4-.suffixA"
set /a word2.lbound=3
set /a word2.ubound=10
set "_CopyValuesFromArray_PartialMatch=true"
set "_CopyValuesFromArray_SearchSuffix=.suffixA .suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF

echo.
echo Searching in ".suffixA" and in ".suffixB" for all the search terms, 
echo also, the searchterm word2 is now an array filled with search terms
echo There are two matches, 3rd element in suffixB and 4th element in suffixA
echo one of the match is from the word2 array, the order is a direct search word
echo also partial matching is enabled and the search term 99 is added to the list
echo in total this matches element 2 3 4 and 5
echo.
set "word2[3]=bla"
set "word2[4]=bli"
set "word2[5]=blo"
set "word2[6]=FFFFF"
set "word2[7]=blou"
set "word2[8]=AAAA"
set "word2[9]=ble"
set "word2[10]=4-.suffixA"
set /a word2.lbound=3
set /a word2.ubound=10
set "_CopyValuesFromArray_PartialMatch=true"
set "_CopyValuesFromArray_SearchSuffix=.suffixA .suffixB"
REM set "_CopyValuesFromArray_OutputSuffix=NOSUFFIX .suffixA .suffixB"
echo Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 
Call :CopyValuesFromArray mytestarray mytestoutputarray word1 word2 word3 3-.suffixB 99
echo.
echo Contents of mytestoutputarray
echo.
set mytestoutputarray
Call :ClearVariablesByPrefix mytestoutputarray
Call :ClearVariablesByPrefix _CopyValuesFromArray
Call :ClearVariablesByPrefix word2


REM :CopyValuesFromArray-DEMO-skip
REM GoTo :EOF


GoTo :EOF

:ArrayManipulation-DEMO

Call :ClearVariablesByPrefix mytestarray
Call :ClearVariablesByPrefix NewElement

Call :CreateTestArray mytestarray 4 NOSUFFIX .suffixA .suffixB .suffixC
echo. 
echo created a test array with 3 suffixes
set mytestarray

echo.
echo Inserted new element 2 (98) and 3 (99)
set "NewElement=99"
set "NewElement.suffixA=99A"
set "NewElement.suffixB=99B"
set "NewElement.suffixC=99C"
Call :AddArrayElement NewElement mytestarray 2
set "NewElement=98"
set "NewElement.suffixA=98A"
set "NewElement.suffixB=98B"
set "NewElement.suffixC=98C"
Call :AddArrayElement NewElement mytestarray 2
set mytestarray
Call :ClearVariablesByPrefix NewElement

echo.
echo This overwrote element 1 (and we created a backup in backup.mytestarray[1])
set "NewElement.bla=bla"
set "NewElement.bli=bli"
set "NewElement.blo=blo"
Call :CopyElementAndSuffix mytestarray[1] backup.mytestarray[1]
Call :CopyElementAndSuffix NewElement mytestarray[1]
set mytestarray
Call :ClearVariablesByPrefix NewElement

echo.
echo Restored from backup 
Call :CopyElementAndSuffix backup.mytestarray[1] mytestarray[1]
set mytestarray

echo. 
echo Deleted element mytestarray[1], leaving the index in the array empty
Call :ClearVariablesByPrefix mytestarray[1]
set mytestarray

echo.
echo Restored from backup and deleted the backup
Call :CopyElementAndSuffix backup.mytestarray[1] mytestarray[1]
Call :ClearVariablesByPrefix backup.mytestarray[1]
set mytestarray

echo.
echo Deleted element 1 from array, but closed the gap in the array and updated .ubound
echo also saved a backup of the entire array here for future use
Call :CopyElementAndSuffix mytestarray backup.mytestarray
Call :RemoveArrayElement mytestarray 1
set mytestarray

echo.
echo Deleted array index containing the text "98B" but only if it's in suffixA, which it isn't
echo so nothing gets deleted
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixA"
Call :RemoveValuesFromArray mytestarray 98B
set mytestarray


echo.
echo Deleted array index containing the text "98B" in suffixB, result is element [1] is deleted
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray 98B
set mytestarray

echo.
echo Delete the texts 2-.suffixA 3-.suffixB 4-.suffixC from .suffixB
echo this deletes only array element at index 3
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray 2-.suffixA 3-.suffixB 4-.suffixC
set mytestarray

echo.
echo restored the array from previous backup
Call :ClearVariablesByPrefix mytestarray
Call :CopyElementAndSuffix backup.mytestarray mytestarray
set mytestarray

echo.
echo As before 
echo Delete the texts 2-.suffixA 3-.suffixB 4-.suffixC from .suffixB
echo this deletes only array element at index 5 
echo however in this example, the list of of texts to delete was stored in an array
set mydeletelist[0]=2-.suffixA
set mydeletelist[1]=3-.suffixB
set mydeletelist[2]=4-.suffixC
set mydeletelist.ubound=2
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray mydeletelist 
set mytestarray

echo.
echo restored the array from previous backup
Call :ClearVariablesByPrefix mytestarray
Call :CopyElementAndSuffix backup.mytestarray mytestarray
set mytestarray


echo.
echo Copying entire array elements 3,2 and 5 from mytestarray to mynewtestarray, then showing contents of mynewtestarray
Call :ClearVariablesByPrefix mynewtestarray
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :CopyMultipleArrayElements mytestarray myelementlist mynewtestarray
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

echo.
echo Copying array elements 3,2 and 5 from mytestarray to mynewtestarray, then showing contents of mynewtestarray
echo however this time we only copy NOSUFFIX and .suffixC
Call :ClearVariablesByPrefix mynewtestarray
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :CopyMultipleArrayElements mytestarray myelementlist mynewtestarray "NOSUFFIX .suffixC"
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

echo. 
echo Copying array elements from mytestarray to mynewtestarray
echo as previous test, elements 3,2 and 5 from mytestarray are copied
echo but this time we take "suffixless value" and .suffixC and we're putting them in .suffixB and NOSUFFIX
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixC"
set "_DerefArrayOutputSuffix=.suffixB NOSUFFIX"
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :DereferenceArrayToArray myelementlist mytestarray mynewtestarray
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

Goto :EOF


::Usage Call :CreateTestArray ArrayName Count Suffixes
:: Will create array ArrayName from element 0 to Count, with all listed suffixes
:: Each array value will contain the element number followed by the suffix name
:CreateTestArray
set "_CreateTestArray_ArrayName=%~1"
set /a _CreateTestArray_ArrayCount=%~2
if "[%~3]"=="[]" (
set /a _CreateTestArray_suffix.index=0
set /a _CreateTestArray_suffix.ubound=0
set "_CreateTestArray_suffix[0]=NOSUFFIX"
GoTo :CreateTestArray-arguments-to-suffix-loop-skip
)
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-arguments-to-suffix-loop
set "_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]=%~3"
set _CreateTestArray_suffix.ubound=%_CreateTestArray_suffix.index%
set /a _CreateTestArray_suffix.index+=1
shift
if not "[%~3]"=="[]" GoTo :CreateTestArray-arguments-to-suffix-loop
:CreateTestArray-arguments-to-suffix-loop-skip
set /a _CreateTestArray_ArrayIndex=0
:CreateTestArray-loop-start
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-suffix-loop
set "_CreateTestArray_suffix.current="
call set "_CreateTestArray_suffix.current=%%_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]%%"
if "[%_CreateTestArray_suffix.current%]"=="[NOSUFFIX]" set "_CreateTestArray_suffix.current="
set "_CreateTestArray_suffix.current.content="
if not "[%_CreateTestArray_suffix.current%]"=="[]" set "_CreateTestArray_suffix.current.content=-%_CreateTestArray_suffix.current%"
set %_CreateTestArray_ArrayName%[%_CreateTestArray_ArrayIndex%]%_CreateTestArray_suffix.current%=%_CreateTestArray_ArrayIndex%%_CreateTestArray_suffix.current.content%
set /a _CreateTestArray_suffix.index+=1
if %_CreateTestArray_suffix.index% LEQ %_CreateTestArray_suffix.ubound% Goto :CreateTestArray-suffix-loop
set /a _CreateTestArray_ArrayIndex+=1
if %_CreateTestArray_ArrayIndex% LEQ %_CreateTestArray_ArrayCount% Goto :CreateTestArray-loop-start
set /a %_CreateTestArray_ArrayName%.count=%_CreateTestArray_ArrayIndex%
set /a _CreateTestArray_ArrayIndex-=1
set /a %_CreateTestArray_ArrayName%.lbound=0
set /a %_CreateTestArray_ArrayName%.ubound=%_CreateTestArray_ArrayIndex%
Call :ClearVariablesByPrefix _CreateTestArray
GoTo :EOF


REM DereferenceArrayToArray and CopyMultipleArrayElements are almost identical, should be rewritten as a unique function that does it all

REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
REM This function takes elements numbers from ElementsArray
REM Then it retrieves those elements from the ReferenceArray (with suffix, if provided)
REM And outputs them to OutputArray
REM Elements are appended to OutputArray starting from OutputArray.ubound
REM Suffixes are defined with _DerefArrayReferenceSuffix, space separated for multiple elements
REM The suffixes will be used on the output array unless overriden by _DerefArrayOutputSuffix
REM The suffix NOSUFFIX has the special meaning of an empty suffix
::Usage Call :DereferenceArrayToArray ElementsArray ReferenceArray OutputArray
:DereferenceArrayToArray
if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
if "[%~3]"=="[]" GoTo :EOF
set "_DerefArrayElementsArray=%~1" & set "_DerefArrayReferenceArray=%~2" & set "_DerefArrayOutputArray=%~3"
REM call echo call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
if not "[%_DerefArrayReferenceSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayReferenceSuffix%" _DerefArrayReferenceSuffix
if not "[%_DerefArrayOutputSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayOutputSuffix%" _DerefArrayOutputSuffix
if "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" set /a _DerefArrayReferenceSuffix.ubound=0
REM Set _DerefArrayOutput's index to OutputArray's .ubound+1, if any, or else set to zero
set _DerefArrayOutput.index=%_DerefArrayOutputArray.ubound%
if not "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index+=1
if "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index=0
set /a _DerefArrayElements.index=0
:DereferenceArrayToArray-output-loop
set /a _DerefArraySuffix.index=0
:DereferenceArrayToArray-suffix-loop
REM if %_DerefArrayElements.index% LEQ 0 call  echo %_DerefArrayReferenceSuffix[0]% %_DerefArrayReferenceSuffix% %_DerefArraySuffix.index% 
call set "_DerefArrayReferenceSuffix=%%_DerefArrayReferenceSuffix[%_DerefArraySuffix.index%]%%"
call set "_DerefArrayOutputSuffix=%%_DerefArrayOutputSuffix[%_DerefArraySuffix.index%]%%"
if "[%_DerefArrayReferenceSuffix%]"=="[NOSUFFIX]" set _DerefArrayReferenceSuffix=
if "[%_DerefArrayOutputSuffix%]"=="[]" set "_DerefArrayOutputSuffix=%_DerefArrayReferenceSuffix%"
if "[%_DerefArrayOutputSuffix%]"=="[NOSUFFIX]" set _DerefArrayOutputSuffix=
REM if %_DerefArrayElements.index%==0 echo ref-suffix "%_DerefArrayReferenceSuffix%" out-suffix "%_DerefArrayOutputSuffix%"
REM call call echo %%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%% %_DerefArrayReferenceSuffix%
call call set %_DerefArrayOutputArray%[%_DerefArrayOutput.index%]%_DerefArrayOutputSuffix%=%%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%%
set %_DerefArrayOutputArray%.ubound=%_DerefArrayOutput.index%
set /a _DerefArraySuffix.index+=1
REM echo _DerefArrayReferenceSuffix.ubound is %_DerefArrayReferenceSuffix.ubound%
REM echo if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
REM if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% GoTo :DereferenceArrayToArray-suffix-loop
set /a _DerefArrayOutput.index+=1
set /a _DerefArrayElements.index+=1
if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
REM Call :ClearVariablesByPrefix _DerefArray
REM set _DerefArray
GoTo :EOF

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

::Usage Call :AddArrayElement InputElement OutputArray OutputIndex
:AddArrayElement
Call :ClearVariablesByPrefix _AddArrayElement
set "_AddArrayElement_InputElement=%~1"
set "_AddArrayElement_OutputArray=%~2"
set "_AddArrayElement_OutputIndex=%~3"
call set /a "_AddArrayElement_OutputUbound=%%%_AddArrayElement_OutputArray%.ubound%%"
REM Start loop at OutputArray ubound and then work my way back until OutputIndex
call set /a _AddArrayElement_OutputArray.index=%%%_AddArrayElement_OutputArray%.ubound%%
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
set /a %_AddArrayElement_OutputArray%.ubound+=1
set /a %_AddArrayElement_OutputArray%.count+=1
if "[%_AddArrayElement_OutputIndex%]"=="[]" set /a _AddArrayElement_OutputIndex=%_AddArrayElement_OutputUbound% + 1
if %_AddArrayElement_OutputIndex% GEQ %_AddArrayElement_OutputUbound% GoTo :AddArrayElement-OutputArray-loop-skip
:AddArrayElement-OutputArray-loop
REM Move value to the next index, for every position in the array until OutputIndex
REM echo moving %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%] 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
)
set /a _AddArrayElement_OutputArray.index-=1
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
if %_AddArrayElement_OutputArray.index% GEQ %_AddArrayElement_OutputIndex% GoTo :AddArrayElement-OutputArray-loop
:AddArrayElement-OutputArray-loop-skip
REM Clear the destination index of the OutputArray
REM call echo Clearing %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] %%%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%].PackageFullName%%
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] 2^>NUL') do (
	set "%%a="
)
REM Copy InputElement into the destination index of the OutputArray
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_InputElement% 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_tokensubst%%]" && echo it was same || echo it was not same
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo %%_token%%=%%b
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
)
GoTo :EOF


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

REM Example usage inside a for loop
REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" && echo it was same || echo it was not
::Usage Call :FORIF your IF statement
:FORIF
REM echo just before forif %*
if %* (exit /b 0) ELSE (exit /b 1)
GoTo :EOF



::Usage Call :CopyElementAndSuffix InputElement OutputElement DontClearOutput
:CopyElementAndSuffix
set "_CopyElementAndSuffix_Input=%~1"
set "_CopyElementAndSuffix_Output=%~2"
set "_CopyElementAndSuffix_Directive=%~3"
if not "[%_CopyElementAndSuffix_Directive%]"=="[DontClearOutput]" (
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Output% 2^>NUL') do ( set "%%a=" )
)
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Input% 2^>NUL') do (
	call set "_token=%%a"
	call set "%%_token:%_CopyElementAndSuffix_Input%=%_CopyElementAndSuffix_Output%%%=%%b"
)
GoTo :EOF

::Usage Call :RemoveArrayElement ArrayToRemoveElementFrom ElementNumber
::This function will remove the Nth element from an array, including all suffixes, 
::and then pull back all values to fill in the empty index
:RemoveArrayElement
Call :ClearVariablesByPrefix _RemoveArrayElement
set "_RemoveArrayElement_array=%~1"
set "_RemoveArrayElement_index=%~2"
REM call echo Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
REM echo _RemoveArrayElement_ElementIsNumeric %_RemoveArrayElement_ElementIsNumeric%
set "_RemoveArrayElement_ElementDeleted=false"
REM This for loop deleted the specified array element
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
    set "_RemoveArrayElement_ElementDeleted=true"
	set "%%a="
)
if not "[%_RemoveArrayElement_ElementIsNumeric%]"=="[true]" GoTo :RemoveArrayElement-end
set /a "_RemoveArrayElement_next_index=%_RemoveArrayElement_index%"
REM If the specified element was numeric, move over the next value to empty index
:RemoveArrayElement-internal-loop
set /a _RemoveArrayElement_next_index+=1
set "_token=" & set "_RemoveArrayElement_ElementCopied=false"
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%] 2^>NUL') do (
	set "_RemoveArrayElement_ElementCopied=true"
	call set "_token=%%a"
	call set "%%_token:%_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%]=%_RemoveArrayElement_array%[%_RemoveArrayElement_index%]%%=%%b"
)
REM Repeat for every array element until we find an empty index
if "[%_RemoveArrayElement_ElementCopied%]"=="[true]" set /a "_RemoveArrayElement_index=%_RemoveArrayElement_next_index%" & GoTo :RemoveArrayElement-internal-loop
REM Erase last index which is a duplicate of the second to last one
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
	set "%%a="
)
set /a _RemoveArrayElement_index-=1
set /a "%_RemoveArrayElement_array%.ubound-=1" 2>NUL
set /a "%_RemoveArrayElement_array%.count-=1" 2>NUL
:RemoveArrayElement-end
Call :ClearVariablesByPrefix _RemoveArrayElement
GoTo :EOF

REM _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
REM It should be possible to specify the search suffix for ArrayToModify
REM can we match only array element numbers ? Or any content ?
::Usage Call :RemoveValuesFromArray ArrayToRemoveFrom DeleteList1 DeleteList2
:: DeleteLists consist of an array with a series of values to delete from ArrayToModify
:RemoveValuesFromArray
REM Call :ClearVariablesByPrefix _RemoveValuesFromArray REM this would wipe out _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
set "_RemoveValuesFromArray_ArrayToRemoveFrom=%~1"
call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
:RemoveValuesFromArray-Next-DeleteList-loop
set "_RemoveValuesFromArray_DeleteList=%~2"
Call :IsNumeric %%%_RemoveValuesFromArray_DeleteList%.ubound%% _RemoveValuesFromArray_DeleteList.IsArray
if not "[%_RemoveValuesFromArray_DeleteList.IsArray%]"=="[true]" (
	set "_RemoveValuesFromArray_DeleteList.value=%~2"
	set /a _RemoveValuesFromArray_DeleteList.ubound=0
	set /a _RemoveValuesFromArray_ArrayToRemoveFrom.index=0
	GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
)
call set /a _RemoveValuesFromArray_DeleteList.ubound=%%%_RemoveValuesFromArray_DeleteList%.ubound%%
set /a _RemoveValuesFromArray_DeleteList.index=0
:RemoveValuesFromArray-DeleteList-loop
call set "_RemoveValuesFromArray_DeleteList.value=%%%_RemoveValuesFromArray_DeleteList%[%_RemoveValuesFromArray_DeleteList.index%]%%"
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index=0"
:RemoveValuesFromArray-ArrayToRemoveFrom-loop
call set "_RemoveValuesFromArray_ArrayToRemoveFrom.value=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%[%_RemoveValuesFromArray_ArrayToRemoveFrom.index%]%_RemoveValuesFromArray_ArrayToRemoveFrom.suffix%%%"
if "[%_RemoveValuesFromArray_ArrayToRemoveFrom.value%]"=="[%_RemoveValuesFromArray_DeleteList.value%]" (
	Call :RemoveArrayElement %_RemoveValuesFromArray_ArrayToRemoveFrom% %_RemoveValuesFromArray_ArrayToRemoveFrom.index%
	call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
)
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index+=1"
if %_RemoveValuesFromArray_ArrayToRemoveFrom.index% LEQ %_RemoveValuesFromArray_ArrayToRemoveFrom.ubound% GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
set /a _RemoveValuesFromArray_DeleteList.index+=1
if %_RemoveValuesFromArray_DeleteList.index% LEQ %_RemoveValuesFromArray_DeleteList.ubound% GoTo :RemoveValuesFromArray-DeleteList-loop
shift
set "_RemoveValuesFromArray_DeleteList.IsArray="
if not "[%~2]"=="[]" GoTo :RemoveValuesFromArray-Next-DeleteList-loop
Call :ClearVariablesByPrefix _RemoveValuesFromArray
GoTo :EOF

REM Macro definitions
:SetMacroPrintTime
set PrintTime=& Call :PrintTime
GoTo :EOF

REM Function library

REM example function structure, with usage and signature
:FunctionNameHELP
echo Name and usage
echo dependencies
echo Date and URL
echo by YourName
echo examples 
echo examples 
echo examples 
echo credit 
:GoTo :EOF
:FunctionName
::End Functionname SHA256:1234567890 SignDate:

::Usage Call SetTitle MyTitle
:SetTitle 
title %*
GoTo:EOF

::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF

::Usage Call :SetCodePage NewCodePage
:SetCodePage
chcp %~1
GoTo :EOF

::Usage Call :PrintTime
:PrintTime
echo %date% %time%
GoTo :EOF

::Usage Call :GetTime
:GetTime
set _GetDate=%date% & set _GetTime=%time%
set _GetTime=%_GetTime: 0=00%
set _GetTime=%_GetTime:~0,2%h%_GetTime:~3,2%m%_GetTime:~6,2%s%_GetTime:~9,2%
set "%~1=%_GetDate% %_GetTime%" & set "%~2=%_GetDate%" & set "%~3=%_GetTime%"
set "_GetDate=" & set "_GetTime="
GoTo :EOF

:: Usage Call :ClearLocalVariables
:ClearLocalVariables
for /f "tokens=1,2 delims==" %%a in ('set _ 2^>nul') do set %%a=
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF

::Usage Call :IsNumeric Value optional Output
:IsNumeric
set "IsNumericInternal=0123456789"
echo.%1| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:deconcatenate
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:deconcatenate_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:deconcatenate_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :deconcatenate_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo writing set %~3[%_token%] = %_buffer% 
if "[%_IsDelimiter%]"=="[true]" call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :deconcatenate_input_loop
if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
GoTo :EOF

:len <resultVar> <stringVar>
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
:ArrayManipulation-DEMO

Call :ClearVariablesByPrefix mytestarray
Call :ClearVariablesByPrefix NewElement

Call :CreateTestArray mytestarray 4 NOSUFFIX .suffixA .suffixB .suffixC
echo. 
echo created a test array with 3 suffixes
set mytestarray

echo.
echo Inserted new element 2 (98) and 3 (99)
set "NewElement=99"
set "NewElement.suffixA=99A"
set "NewElement.suffixB=99B"
set "NewElement.suffixC=99C"
Call :AddArrayElement NewElement mytestarray 2
set "NewElement=98"
set "NewElement.suffixA=98A"
set "NewElement.suffixB=98B"
set "NewElement.suffixC=98C"
Call :AddArrayElement NewElement mytestarray 2
set mytestarray
Call :ClearVariablesByPrefix NewElement

echo.
echo This overwrote element 1 (and we created a backup in backup.mytestarray[1])
set "NewElement.bla=bla"
set "NewElement.bli=bli"
set "NewElement.blo=blo"
Call :CopyElementAndSuffix mytestarray[1] backup.mytestarray[1]
Call :CopyElementAndSuffix NewElement mytestarray[1]
set mytestarray
Call :ClearVariablesByPrefix NewElement

echo.
echo Restored from backup 
Call :CopyElementAndSuffix backup.mytestarray[1] mytestarray[1]
set mytestarray

echo. 
echo Deleted element mytestarray[1], leaving the index in the array empty
Call :ClearVariablesByPrefix mytestarray[1]
set mytestarray

echo.
echo Restored from backup and deleted the backup
Call :CopyElementAndSuffix backup.mytestarray[1] mytestarray[1]
Call :ClearVariablesByPrefix backup.mytestarray[1]
set mytestarray

echo.
echo Deleted element 1 from array, but closed the gap in the array and updated .ubound
echo also saved a backup of the entire array here for future use
Call :CopyElementAndSuffix mytestarray backup.mytestarray
Call :RemoveArrayElement mytestarray 1
set mytestarray

echo.
echo Deleted array index containing the text "98B" but only if it's in suffixA, which it isn't
echo so nothing gets deleted
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixA"
Call :RemoveValuesFromArray mytestarray 98B
set mytestarray


echo.
echo Deleted array index containing the text "98B" in suffixB, result is element [1] is deleted
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray 98B
set mytestarray

echo.
echo Delete the texts 2-.suffixA 3-.suffixB 4-.suffixC from .suffixB
echo this deletes only array element at index 3
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray 2-.suffixA 3-.suffixB 4-.suffixC
set mytestarray

echo.
echo restored the array from previous backup
Call :ClearVariablesByPrefix mytestarray
Call :CopyElementAndSuffix backup.mytestarray mytestarray
set mytestarray

echo.
echo As before 
echo Delete the texts 2-.suffixA 3-.suffixB 4-.suffixC from .suffixB
echo this deletes only array element at index 5 
echo however in this example, the list of of texts to delete was stored in an array
set mydeletelist[0]=2-.suffixA
set mydeletelist[1]=3-.suffixB
set mydeletelist[2]=4-.suffixC
set mydeletelist.ubound=2
set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.suffixB"
Call :RemoveValuesFromArray mytestarray mydeletelist 
set mytestarray

echo.
echo restored the array from previous backup
Call :ClearVariablesByPrefix mytestarray
Call :CopyElementAndSuffix backup.mytestarray mytestarray
set mytestarray


echo.
echo Copying entire array elements 3,2 and 5 from mytestarray to mynewtestarray, then showing contents of mynewtestarray
Call :ClearVariablesByPrefix mynewtestarray
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :CopyMultipleArrayElements mytestarray myelementlist mynewtestarray
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

echo.
echo Copying array elements 3,2 and 5 from mytestarray to mynewtestarray, then showing contents of mynewtestarray
echo however this time we only copy NOSUFFIX and .suffixC
Call :ClearVariablesByPrefix mynewtestarray
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :CopyMultipleArrayElements mytestarray myelementlist mynewtestarray "NOSUFFIX .suffixC"
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

echo. 
echo Copying array elements from mytestarray to mynewtestarray
echo as previous test, elements 3,2 and 5 from mytestarray are copied
echo but this time we take "suffixless value" and .suffixC and we're putting them in .suffixB and NOSUFFIX
set "_DerefArrayReferenceSuffix=NOSUFFIX .suffixC"
set "_DerefArrayOutputSuffix=.suffixB NOSUFFIX"
set myelementlist[0]=3
set myelementlist[1]=2
set myelementlist[2]=5
set myelementlist.ubound=2
Call :DereferenceArrayToArray myelementlist mytestarray mynewtestarray
set mynewtestarray
Call :ClearVariablesByPrefix myelementlist
Call :ClearVariablesByPrefix mynewtestarray

Goto :EOF

