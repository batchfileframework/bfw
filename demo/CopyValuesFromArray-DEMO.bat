
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

