@echo off

:setup
:main

REM Call :MoveObject-DEMO
REM Call :MoveObject-DEMO2
REM Call :MoveObject-DEMO3
REM Call :MoveObjectOnly-DEMO
REM Call :DeleteObjectOnly-DEMO
REM Call :DeleteObjectSuffixOnly-DEMO
REM Call :DeleteObject-DEMO
REM Call :CopyObject-DEMO
REM Call :CopyObjectOnly-DEMO
REM Call :CloseArrayGaps-DEMO
REM Call :IsObject-DEMO
REM Call :IsObjectStrict-DEMO
REM Call :IsArray-DEMO
Call :Arithmetic-DEMO
REM Call :GotoInFor-DEMO
GoTo :EOF

:MoveObject-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray.ubound=7

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS

echo.&echo Moving object [6] to [4]&echo.
call :moveobject myarray[6] myarray[4]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS

echo.&echo Moving object [4] to [3]&echo.
call :moveobject myarray[4] myarray[3]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS

echo.&echo Moving objects [1][2][3] to [4][5][6]&echo.
call :moveobject myarray[1] myarray[4]
call :moveobject myarray[2] myarray[5]
call :moveobject myarray[3] myarray[6]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS

GoTo :EOF

:MoveObject-DEMO2

set my.array[0]=Open Source, light and extremely simple,
set my.array[1]=It is a single executable file with no dependencies.
set my.array[2]=Just download it and add it to your PATH
set my.array[6]=Create, edit, copy, move, download your files easily,
set my.array[7]=everywhere, every time. Use it as your personal cloud.
set my.array[0].suffixA=test.sufA.0
set my.array[1].suffixA=test.sufA.1
set my.array[2].suffixA=test.sufA.2
set my.array[6].suffixA=test.sufA.6
set my.array[7].suffixA=test.sufA.7
set my.array.ubound=7

echo.&echo Printing my.array&echo.
call :echoarray my.array LINENUMBERS
echo.&call :echoarray my.array .suffixA LINENUMBERS

echo.&echo Moving object [6] to [4]&echo.
call :moveobject my.array[6] my.array[4]

echo.&echo Printing my.array&echo.
call :echoarray my.array LINENUMBERS
echo.&call :echoarray my.array .suffixA LINENUMBERS

echo.&echo Moving object [4] to [3]&echo.
call :moveobject my.array[4] my.array[3]

echo.&echo Printing my.array&echo.
call :echoarray my.array LINENUMBERS
echo.&call :echoarray my.array .suffixA LINENUMBERS

echo.&echo Moving objects [1][2][3] to [4][5][6]&echo.
call :moveobject my.array[1] my.array[4]
call :moveobject my.array[2] my.array[5]
call :moveobject my.array[3] my.array[6]

echo.&echo Printing my.array&echo.
call :echoarray my.array LINENUMBERS
echo.&call :echoarray my.array .suffixA LINENUMBERS

GoTo :EOF

:MoveObject-DEMO3
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Moving object [6] to [4]&echo.
call :moveobject myarray[6] myarray[4]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Moving object [4] to [3]&echo.
call :moveobject myarray[4] myarray[3]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Moving objects [1][2][3] to [4][5][6]&echo.
call :moveobject myarray[1] myarray[4]
call :moveobject myarray[2] myarray[5]
call :moveobject myarray[3] myarray[6]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :EOF

:MoveObjectOnly-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Moving object [6] to [4]&echo.
call :moveobjectonly myarray[6] myarray[4]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Moving object [4] to [3]&echo.
call :moveobjectonly myarray[4] myarray[3]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Moving objects [1][2][3] to [4][5][6]&echo.
call :moveobjectonly myarray[1] myarray[4]
call :moveobjectonly myarray[2] myarray[5]
call :moveobjectonly myarray[3] myarray[6]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :EOF

:CopyObject-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Copying object [6] to [4]&echo.
call :CopyObject myarray[6] myarray[4]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Copying object [4] to [3]&echo.
call :CopyObject myarray[4] myarray[3]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Copying objects [1][2][3] to [4][5][6]&echo.
call :CopyObject myarray[1] myarray[4]
call :CopyObject myarray[2] myarray[5]
call :CopyObject myarray[3] myarray[6]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :EOF

:CopyObjectOnly-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Copying object [6] to [4]&echo.
call :CopyObjectOnly myarray[6] myarray[4]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Copying object [4] to [3]&echo.
call :CopyObjectOnly myarray[4] myarray[3]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

echo.&echo Copying objects [1][2][3] to [4][5][6]&echo.
call :CopyObjectOnly myarray[1] myarray[4]
call :CopyObjectOnly myarray[2] myarray[5]
call :CopyObjectOnly myarray[3] myarray[6]

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :EOF

:CloseArrayGaps-DEMO

set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray[11]=element 11
set myarray[12]=element 12
set myarray[13]=element 13
set myarray[14]=element 14
set myarray[15]=element 15
set myarray.ubound=15

echo.&echo -------------------------------------------------------------------------------------&echo.

set /a "__CloseArrayGaps_step+=1"
GoTo :CloseArrayGaps-DEMO-%__CloseArrayGaps_step%

:CloseArrayGaps-DEMO-1

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete elements 2,5,6,14 &echo.
call :DeleteArrayElement myarray 2 5 6 14
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 2 5 6 14
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO

:CloseArrayGaps-DEMO-2

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete first array element 0 &echo.
call :DeleteArrayElement myarray 0
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 0
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO
:CloseArrayGaps-DEMO-3

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete last array element 15 &echo.
call :DeleteArrayElement myarray 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

GoTo :CloseArrayGaps-DEMO
:CloseArrayGaps-DEMO-4

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

echo.&echo Delete first, last and middle array elements 0,7,15 &echo.
call :DeleteArrayElement myarray 0 7 15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&echo Closing those gaps &echo.
call :CloseArrayGaps myarray 0,7,15
echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS

REM GoTo :CloseArrayGaps-DEMO


GoTo :EOF

:DeleteObject-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

set /a "__DeleteObject_step+=1"
goto :DeleteObject-DEMO-step-%__DeleteObject_step%

:DeleteObject-DEMO-step-1

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObject-DEMO
:DeleteObject-DEMO-step-2

echo.&echo Delete object [6] &echo.
call :DeleteObject myarray[6]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObject-DEMO
:DeleteObject-DEMO-step-3

echo.&echo Delete object [3], which does not exist &echo.
call :DeleteObject myarray[3]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObject-DEMO
:DeleteObject-DEMO-step-4

echo.&echo Delete object [0] &echo.
call :DeleteObject myarray[0]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObject-DEMO
:DeleteObject-DEMO-step-5

echo.&echo Delete object [7] &echo.
call :DeleteObject myarray[7]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObject-DEMO
:DeleteObject-DEMO-step-6

echo.&echo Delete object [1] [2] [7]  &echo.
call :DeleteObject myarray[1] myarray[2] myarray[7]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS


GoTo :EOF

:DeleteObjectOnly-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

set /a "__DeleteObjectOnly_step+=1"
goto :DeleteObjectOnly-DEMO-step-%__DeleteObjectOnly_step%

:DeleteObjectOnly-DEMO-step-1

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectOnly-DEMO
:DeleteObjectOnly-DEMO-step-2

echo.&echo Delete object (only) [6] &echo.
call :deleteobjectonly myarray[6]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectOnly-DEMO
:DeleteObjectOnly-DEMO-step-3

echo.&echo Delete object (only) [3], which does not exist &echo.
call :deleteobjectonly myarray[3]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectOnly-DEMO
:DeleteObjectOnly-DEMO-step-4

echo.&echo Delete object (only) [0] &echo.
call :deleteobjectonly myarray[0]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectOnly-DEMO
:DeleteObjectOnly-DEMO-step-5

echo.&echo Delete object (only) [7] &echo.
call :deleteobjectonly myarray[7]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectOnly-DEMO
:DeleteObjectOnly-DEMO-step-6

echo.&echo Delete object (only) [1] [2] [7]  &echo.
call :deleteobjectonly myarray[1] myarray[2] myarray[7]

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS


GoTo :EOF

:DeleteObjectSuffixOnly-DEMO
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[6]=Create, edit, copy, move, download your files easily,
set myarray[7]=everywhere, every time. Use it as your personal cloud.
set myarray[0].suffixA=test.sufA.0
set myarray[1].suffixA=test.sufA.1
set myarray[2].suffixA=test.sufA.2
set myarray[6].suffixA=test.sufA.6
set myarray[7].suffixA=test.sufA.7
set myarray[0].suffixB=test.sufB.0
set myarray[1].suffixB=test.sufB.1
set myarray[2].suffixB=test.sufB.2
set myarray[6].suffixB=test.sufB.6
set myarray[7].suffixB=test.sufB.7
set myarray.ubound=7

set /a "__DeleteObjectSuffixOnly_step+=1"
goto :DeleteObjectSuffixOnly-DEMO-step-%__DeleteObjectSuffixOnly_step%

:DeleteObjectSuffixOnly-DEMO-step-1

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectSuffixOnly-DEMO
:DeleteObjectSuffixOnly-DEMO-step-2

echo.&echo Delete object with suffix (only) [6B] &echo.
call :DeleteObjectSuffixOnly myarray[6] .suffixB

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectSuffixOnly-DEMO
:DeleteObjectSuffixOnly-DEMO-step-3

echo.&echo Delete object with suffix(only) [3A], which does not exist &echo.
call :DeleteObjectSuffixOnly myarray[3] .suffixA

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectSuffixOnly-DEMO
:DeleteObjectSuffixOnly-DEMO-step-4

echo.&echo Delete object with suffix(only) [0B] &echo.
call :DeleteObjectSuffixOnly myarray[0] .suffixB

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectSuffixOnly-DEMO
:DeleteObjectSuffixOnly-DEMO-step-5

echo.&echo Delete object with suffix(only) [7A] &echo.
call :DeleteObjectSuffixOnly myarray[7] .suffixA

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS

GoTo :DeleteObjectSuffixOnly-DEMO
:DeleteObjectSuffixOnly-DEMO-step-6

echo.&echo Delete object (only) with suffix[1A] [2B] [7B]  &echo.
call :DeleteObjectSuffixOnly myarray[1] .suffixA myarray[2] .suffixB myarray[7] .suffixB

call :echoarray myarray LINENUMBERS
echo.&call :echoarray myarray .suffixA LINENUMBERS
echo.&call :echoarray myarray .suffixB LINENUMBERS


GoTo :EOF

REM this DEMO tests the functionality of using a goto / label inside a for loop
REM goto exits the for loop entirely inside of skipping a block of code
:GotoInFor-DEMO

echo.&echo looping through for testing
for /l %%a in (1,1,10) do (
	echo start of the loop %%a
	echo middle of the loop %%a
	echo end of the loop %%a
	)

echo.&echo looping through with a goto
for /l %%a in (1,1,10) do (
	echo start of the loop %%a
	GoTo :UniqueLabelGoToInFor
	echo middle of the loop %%a
	:UniqueLabelGoToInFor
	echo end of the loop %%a
	)

echo.&echo looping through with a if goto
for /l %%a in (1,1,10) do (
	echo start of the loop %%a
	if %%a LSS 5 GoTo :UniqueLabelGoToInFor
	echo middle of the loop %%a
	:UniqueLabelGoToInFor
	echo end of the loop %%a
	)

GoTo :EOF


gaps array caching, searching for gaps is long, when found, gaps should be stored in myarray.gaps[x], operation that create new gaps, should clear .gap to let other functions they need to find the gaps
insert with index number, check if destination element exist if yes, shift all array elements to make space then copy the element
insert without an index number, find the first gap in the array, copy the variable there, if there isn't, then it's the same as append
append, this will copy to the last array element
DELETE will leave a gap in the array, REMOVE will close the gap in the array

:GetFirstArrayGap returns the index of the first gap in an array starting from lbound, an optional suffix can be specified 
:GetArrayGaps returns and array ?or index string? of all gaps between lbound and ubound in an array, an optional suffix can be specified

:CopyArrayElements inarray[X] or inarray (one or more elements) outarray[x] or outarray optional (one or more elements) (if no element, append to last element or place in first array gap ? that is insert vs append)
:InsertArrayElements inarray[X] or inarray (one or more elements) outarray[x] or outarray optional (one or more elements) if no element, search array for a gap, if there is one, it will be 
:AppendArrayElements

:MoveArrayElements inarray[X] or inarray (one or more elements) outarray[x] or outarray optional (one or more elements) (if no element, append to last element or place in first array gap ?)

:RemoveArrayElements inarray[X] or inarray (one or more elements)




:CopyArrayElement inarray[X] or ( inarray index number ) outarray[x] or (outarray optional index number)
:MoveArrayElement inarray[X] or ( inarray index number ) outarray[x] or (outarray optional index number)











:GetType
numeric
alphanumeric
range
array (dimension number)
object (object type ?)

:IsRange
Determine if input argument(s) are valid index ranges 
that is one of the following
a number
space or comma separated numbers

REM incomplete
::Usage Call :ForEach array indexlist command
:ForEach 
set "_ForEach_array=%~1"
set "_ForEach_indexlist=%~2"
if defined %~3 set "_ForEach_command=%~3"
if defined %_ForEach_indexlist%.lbound ( call set /a "_ForEach_indexlist_lbound=%%%_ForEach_indexlist%.lbound%%" ) else ( set /a "_ForEach_indexlist_lbound=0" ) 
call set /a "_ForEach_indexlist_ubound=%%%_ForEach_indexlist%.ubound%%"
set /a "_ForEach_index=%_ForEach_indexlist_lbound%"
:ForEach-loop


set /a "_ForEach_index+=1"
if %_ForEach_index% LEQ %_ForEach_indexlist_ubound% GoTo :ForEach-loop

GoTo :EOF

:IsDefined

exit /b result

:GetArrayDimensions

exit /b count

:InStb
:IsInString


:Arithmetic-DEMO

echo.&echo Performing calculations byval&echo.

set myresult=
Call :Calculate 2+2 myresult
echo 2+2 is %myresult%
Call :Calculate 2+2+5465+1 myresult
echo 2+2+5465+1 is %myresult%
Call :Calculate 100-25-25+50 myresult
echo 100-25-25+50 is %myresult%
Call :Calculate 25/5 myresult
echo 25/5 is %myresult%
Call :Calculate 10*10 myresult
echo 10*10 is %myresult%
Call :Calculate 99%%%%20 myresult
echo 99%%20 is %myresult%
Call :Calculate 10+10/2 myresult
echo 10+10/2 is %myresult%
Call :Calculate (10+10)/2 myresult
echo (10+10)/2 is %myresult%

set myarray[0]=2+2
set myarray[1]=2+2+5465+1
set myarray[2]=100-25-25+50
set myarray[3]=25/5
set myarray[4]=10*10
set myarray[5]=99%%20
set myarray[6]=10+10/2
set myarray[7]=(10+10)/2


echo.&echo Performing calculations byref&echo.
set myresult=
Call :Calculate myarray[0] myresult
echo %myarray[0]% is %myresult%
Call :Calculate myarray[1] myresult
echo %myarray[1]% is %myresult%
Call :Calculate myarray[2] myresult
echo %myarray[2]% is %myresult%
Call :Calculate myarray[3] myresult
echo %myarray[3]% is %myresult%
Call :Calculate myarray[4] myresult
echo %myarray[4]% is %myresult%
Call :Calculate myarray[5] myresult
echo %myarray[5]% is %myresult%
Call :Calculate myarray[6] myresult
echo %myarray[6]% is %myresult%
Call :Calculate myarray[7] myresult
echo %myarray[7]% is %myresult%

set myarray.ubound=7
echo.&echo Performing calculations from array byref&echo.
Call :Calculate myarray myresults
call :echoarray myresults

GoTo :EOF


REM maybe another version, or parameter, where each subsequent operation is performed on the result of the previous calculation ? (maybe only if it starts with a operator ?)
::Usage Call :Calculate operations result operations2 result2 operationsN resultN
:Arithmetic
:Calculate
set "_Arithmetic_operation=%~1"
set "_Arithmetic_output=%~2"
if defined %~1.ubound GoTo :Arithmetic-loop-setup
if defined %_Arithmetic_operation% call set "_Arithmetic_operation=%%%_Arithmetic_operation%%%"
set /a "_Arithmetic_result=%_Arithmetic_operation%" 
set /a "%_Arithmetic_output%=%_Arithmetic_result%" & GoTo :Arithmetic-end
:Arithmetic-loop-setup
if defined %_Arithmetic_output%.ubound ( call set /a "_Arithmetic_output_ubound=%%%_Arithmetic_output%.ubound%%" ) else ( set /a "_Arithmetic_output_ubound=-1" )
if defined %_Arithmetic_operation%.lbound ( call set /a "_Arithmetic_operation_lbound=%%%_Arithmetic_operation%.lbound%%" ) else ( set /a "_Arithmetic_operation_lbound=0" )
call set /a "_Arithmetic_operation_ubound=%%%_Arithmetic_operation%.ubound%%"
set /a "_Arithmetic_operation_index=%_Arithmetic_operation_lbound%"
:Arithmetic-loop
set /a "_Arithmetic_output_ubound+=1"
call set /a "_Arithmetic_result=%%%_Arithmetic_operation%[%_Arithmetic_operation_index%]%%"
set /a "%_Arithmetic_output%[%_Arithmetic_output_ubound%]=%_Arithmetic_result%"
set /a "_Arithmetic_operation_index+=1"
if %_Arithmetic_operation_index% LEQ %_Arithmetic_operation_ubound% GoTo :Arithmetic-loop
set /a "%_Arithmetic_output%.ubound=%_Arithmetic_output_ubound%"
:Arithmetic-end

REM if %~3 %~4 clear and goto start
exit /b %_Arithmetic_result%

:IsArray-DEMO

set NotAnObject=test

set IsAnObject=test
set IsAnObject.suffixA=test
set IsAnObject.suffixB=test
set IsAnObject.suffixC=test

set IsAnotherObject.suffixA=test
set IsAnotherObject.suffixB=test
set IsAnotherObject.suffixC=test

set IsNotStrictlyAnObject1=test
set IsNotStrictlyAnObject1[42]=test
set IsNotStrictlyAnObject2=test
set IsNotStrictlyAnObject2Extra=test
set IsNotStrictlyAnObject3[42]=test
set IsNotStrictlyAnObject4Extra=test

set IsAnArray1.lbound=0
set IsAnArray2.ubound=666
set IsAnArray3.datatype=array
set IsAnArray4=test
set IsAnArray4[666]=test
set IsAnArray5[666][123]=test
set IsAnArray6[666][123][456]=test

echo.&echo Testing function Call :IsArray ArrayName optional Output  With the optional output&echo.

set myoutput=
Call :IsArray NotAnObject myoutput
echo IsArray NotAnObject ? %myoutput%& set myoutput=
Call :IsArray IsAnotherObject myoutput
echo IsArray IsAnotherObject ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject1 myoutput
echo IsArray IsNotStrictlyAnObject1 ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject2 myoutput
echo IsArray IsNotStrictlyAnObject2 ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject3 myoutput
echo IsArray IsNotStrictlyAnObject3 ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject4 myoutput
echo IsArray IsNotStrictlyAnObject4 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray1 myoutput
echo IsArray IsAnArray1 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray2 myoutput
echo IsArray IsAnArray2 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray3 myoutput
echo IsArray IsAnArray3 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray4 myoutput
echo IsArray IsAnArray4 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray5 myoutput
echo IsArray IsAnArray5 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray6 myoutput
echo IsArray IsAnArray6 ? %myoutput%& set myoutput=

echo.&echo Testing function Call :IsArray ArrayName optional Output  Without the optional output, using return value&echo.

Call :IsArray NotAnObject && echo NotAnObject is an array || echo NotAnObject is not array 
Call :IsArray IsAnotherObject && echo IsAnotherObject is an array || echo IsAnotherObject is not array 
Call :IsArray IsNotStrictlyAnObject1 && echo IsNotStrictlyAnObject1 is an array || echo IsNotStrictlyAnObject1 is not array 
Call :IsArray IsNotStrictlyAnObject2 && echo IsNotStrictlyAnObject2 is an array || echo IsNotStrictlyAnObject2 is not array 
Call :IsArray IsNotStrictlyAnObject3 && echo IsNotStrictlyAnObject3 is an array || echo IsNotStrictlyAnObject3 is not array 
Call :IsArray IsNotStrictlyAnObject4 && echo IsNotStrictlyAnObject4 is an array || echo IsNotStrictlyAnObject4 is not array 
Call :IsArray IsAnArray1 && echo IsAnArray1 is an array || echo IsAnArray1 is not array 
Call :IsArray IsAnArray2 && echo IsAnArray2 is an array || echo IsAnArray2 is not array 
Call :IsArray IsAnArray3 && echo IsAnArray3 is an array || echo IsAnArray3 is not array 
Call :IsArray IsAnArray4 && echo IsAnArray4 is an array || echo IsAnArray4 is not array 
Call :IsArray IsAnArray5 && echo IsAnArray5 is an array || echo IsAnArray5 is not array 
Call :IsArray IsAnArray6 && echo IsAnArray6 is an array || echo IsAnArray6 is not array 

GoTo :EOF




::Usage :IsArray ArrayName optional output
:IsArray
set /a "_IsArray=1"
if defined %~1.lbound ( set /a "_IsArray=0" & GoTo :IsArray-end )
if defined %~1.ubound ( set /a "_IsArray=0" & GoTo :IsArray-end )
if defined %~1.datatype call set "_IsArray_datatype=%%%~1.datatype%%"
if "[%_IsArray_datatype%]" EQU "[array]" ( set /a "_IsArray=0" & GoTo :IsArray-end )
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do  (
	if "[%%a]" NEQ "[%~1]" (
							setlocal enabledelayedexpansion
							set _IsArray_buffer=%%a
							set _IsArray_buffer=!_IsArray_buffer:%~1=!
							set _IsArray_buffer=!_IsArray_buffer:~,1!
							if "[!_IsArray_buffer!]" EQU "[[]" ( endlocal & set /a "_IsArray=0" & GoTo :IsArray-end )
							endlocal
							)
	)
:IsArray-end
if "[%~2]" NEQ "[]" if "[%_IsArray%]" EQU "[0]" ( set "%~2=true" ) else ( set "%~2=false" )
set "IsArray=" & set "_IsArray_datatype=" & exit /b %_IsArray%


:IsObject-DEMO

set NotAnObject=test

set IsAnObject=test
set IsAnObject.suffixA=test
set IsAnObject.suffixB=test
set IsAnObject.suffixC=test

set IsAnotherObject.suffixA=test
set IsAnotherObject.suffixB=test
set IsAnotherObject.suffixC=test

echo.&echo Testing function Call :IsObject ObjectName optional Output  With the optional output&echo.

set myoutput=
Call :IsObject NotAnObject myoutput
echo IsObject NotAnObject ? %myoutput%
set myoutput=
Call :IsObject IsAnObject myoutput
echo IsObject IsAnObject ? %myoutput%
set myoutput=
Call :IsObject IsAnotherObject myoutput
echo IsObject IsAnotherObject ? %myoutput%
set myoutput=

echo.&echo Testing function Call :IsObject ObjectName optional Output  Without the optional output, using return value&echo.

Call :IsObject NotAnObject && echo NotAnObject is an object || echo NotAnObject is not object 
Call :IsObject IsAnObject && echo IsAnObject is an object || echo IsAnObject is not object 
Call :IsObject IsAnotherObject && echo IsAnotherObject is an object || echo IsAnotherObject is not object 

GoTo :EOF

:IsObjectStrict-DEMO

set NotAnObject=test

set IsAnObject=test
set IsAnObject.suffixA=test
set IsAnObject.suffixB=test
set IsAnObject.suffixC=test

set IsAnotherObject.suffixA=test
set IsAnotherObject.suffixB=test
set IsAnotherObject.suffixC=test

set IsNotStrictlyAnObject1=test
set IsNotStrictlyAnObject1[42]=test

set IsNotStrictlyAnObject2=test
set IsNotStrictlyAnObject2Extra=test

set IsNotStrictlyAnObject3[42]=test

set IsNotStrictlyAnObject4Extra=test

echo.&echo Testing function Call :IsObjectStrict ObjectName optional Output  With the optional output&echo.

set myoutput=
Call :IsObjectStrict NotAnObject myoutput
echo IsObjectStrict NotAnObject ? %myoutput%
set myoutput=
Call :IsObjectStrict IsAnObject myoutput
echo IsObjectStrict IsAnObject ? %myoutput%
set myoutput=
Call :IsObjectStrict IsAnotherObject myoutput
echo IsObjectStrict IsAnotherObject ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject1 myoutput
echo IsObjectStrict IsNotStrictlyAnObject1 ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject2 myoutput
echo IsObjectStrict IsNotStrictlyAnObject2 ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject3 myoutput
echo IsObjectStrict IsNotStrictlyAnObject3 ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject4 myoutput
echo IsObjectStrict IsNotStrictlyAnObject4 ? %myoutput%
set myoutput=

echo.&echo Testing function Call :IsObjectStrict ObjectName optional Output  Without the optional output, using return value&echo.

Call :IsObjectStrict NotAnObject && echo NotAnObject is an object || echo NotAnObject is not object 
Call :IsObjectStrict IsAnObject && echo IsAnObject is an object || echo IsAnObject is not object 
Call :IsObjectStrict IsAnotherObject && echo IsAnotherObject is an object || echo IsAnotherObject is not object 
Call :IsObjectStrict IsNotStrictlyAnObject1 && echo IsNotStrictlyAnObject1 is an object || echo IsNotStrictlyAnObject1 is not object 
Call :IsObjectStrict IsNotStrictlyAnObject2 && echo IsNotStrictlyAnObject2 is an object || echo IsNotStrictlyAnObject2 is not object 
Call :IsObjectStrict IsNotStrictlyAnObject3 && echo IsNotStrictlyAnObject3 is an object || echo IsNotStrictlyAnObject3 is not object 
Call :IsObjectStrict IsNotStrictlyAnObject4 && echo IsNotStrictlyAnObject4 is an object || echo IsNotStrictlyAnObject4 is not object 

GoTo :EOF

::Usage Call :IsObjectStrict ObjectName optional Output
:IsObjectStrict
set /a "_IsObjectStrict=1"
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do  (
	if "[%%a]" NEQ "[%~1]" (
							setlocal enabledelayedexpansion
							set _IsObjectStrict_buffer=%%a
							set _IsObjectStrict_buffer=!_IsObjectStrict_buffer:%~1=!
							set _IsObjectStrict_buffer=!_IsObjectStrict_buffer:~,1!
							if "[!_IsObjectStrict_buffer!]" EQU "[.]" ( endlocal & set /a "_IsObjectStrict=0" & GoTo :IsObjectStrict-for-exit )
							endlocal
							)
	)

:IsObjectStrict-for-exit
if "[%~2]" NEQ "[]" if "[%_IsObjectStrict%]" EQU "[0]" ( set "%~2=true" ) else ( set "%~2=false"  )
set "_IsObjectStrict=" & exit /b %_IsObjectStrict%


::Usage Call :IsObject ObjectName optional Output
:IsObject
set /a "_IsObject=1"
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do  (
	if "[%%a]" NEQ "[%~1]" ( set /a "_IsObject=0" & GoTo :IsObject-for-exit )
	)
:IsObject-for-exit
if "[%~2]" NEQ "[]" if "[%_IsObject%]" EQU "[0]" ( set "%~2=true" ) else ( set "%~2=false"  )
set "_IsObject=" & exit /b %_IsObject%


:RemoveArrayObject objectname[x] or arrayname indexe(s)
check if it is part of an array, if yes, close the gap created, if any (relative to ubound)
:RemoveArrayObjectOnly objectname
same as :RemoveObject

REM :DeleteArrayElements inarray[X] or inarray (one or more elements) add GetIndexArray support ?
REM if defined %~1 set %~1=
REM if defined %~1.ubound set %~1=
REM check if %~1 ends with ] , if it does then next argument is a list of indexes to delete, delete them
REM GoTo :EOF

REM not inarray[X] or inarray index number
::Usage Call :RemoveArrayElement arrayname indexnumber1 indexnumber2 indexnumberN
:RemoveArrayElement 
if defined %~1.ubound ( set "_RemoveArrayElement_array=%~1" & shift )
set "_RemoveArrayElement_removed_elements=%_RemoveArrayElement_removed_elements% %~2"
Call :DeleteObject %_RemoveArrayElement_array%[%~2] & shift
if "[%~2]" NEQ "[]" GoTo :RemoveArrayElement
Call :CloseArrayObjectGaps %_RemoveArrayElement_array% %_RemoveArrayElement_removed_elements%
GoTo :EOF

REM maybe add deleting array[x] too ? Would need to be able to tell between array and array element and array index in the argument
:DeleteArrayElement inarray indexnumber1 indexnumber2 indexnumber3  
if defined %~1.ubound ( set "_DeleteArrayElement_array=%~1" & shift )
set %_DeleteArrayElement_array%[%~1]=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteArrayElement
GoTo :EOF

:DeleteObject objectname
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteObject
GoTo :EOF

:DeleteObjectOnly objectname
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do if "[%~1]" NEQ "[%%a]" set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteObjectOnly
GoTo :EOF

:DeleteObjectSuffixOnly objectname .suffix
set "_DeleteObjectSuffixOnly_prefix=_DOSO"
set "_DOSO_input=%~1"
set "_DOSO_suffix=%~2"
for /f "tokens=1,2* delims==" %%a in ('set %_DOSO_input% 2^>nul') do  (
	setlocal enabledelayedexpansion
	set "_DOSO_localscope=true"
	set _DOSO_Suffix_buffer=%%a
	set _DOSO_Suffix_buffer=!_DOSO_Suffix_buffer:%_DOSO_input%=!
	for /f "tokens=*" %%Z in ('echo.!_DOSO_Suffix_buffer!') do (
																endlocal 
																if "[%_DOSO_suffix%]" EQU "[%%Z]" set %%a=
																)
	if defined _DOSO_localscope endlocal
	)
if defined _DOSO_localscope endlocal
Call :ClearVariablesByPrefix %_DeleteObjectSuffixOnly_prefix% _DeleteObjectSuffixOnly
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :DeleteObjectSuffixOnly
GoTo :EOF

:CopyObject objectname destinationobject
set "_CopyObject_prefix=_CO"
set _CO_Input=%~1
set _CO_Output=%~2

for /f "tokens=1,2* delims==" %%a in ('set %_CO_Input% 2^>nul') do  (
	setlocal enabledelayedexpansion
	set "_CO_localscope=true"
	set _CO_Suffix_buffer_input=%%a
	set _CO_Suffix_buffer_output=%_CO_Output%!_CO_Suffix_buffer_input:%_CO_Input%=!
	for /f "tokens=*" %%Z in ('echo.!_CO_Suffix_buffer_output!') do (
																endlocal 
																set %%Z=%%b
																)
	if defined _CO_localscope endlocal
	)
if defined _CO_localscope endlocal
Call :ClearVariablesByPrefix %_CopyObject_prefix% _CopyObject 
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :CopyObject
GoTo :EOF

:CopyObjectOnly objectname destinationobject
set "_CopyObjectOnly_prefix=_COO"
set _COO_Input=%~1
set _COO_Output=%~2

REM this should copy all variable suffix to the new destination
for /f "tokens=1,2* delims==" %%a in ('set %_COO_Input% 2^>nul') do  (
	setlocal enabledelayedexpansion
	set "_COO_localscope=true"
	set _COO_Suffix_buffer_input=%%a
	set _COO_Suffix_buffer_output=%_COO_Output%!_COO_Suffix_buffer_input:%_COO_Input%=!
	for /f "tokens=*" %%Z in ('echo.!_COO_Suffix_buffer_output!') do (
																endlocal 
																if "[%_COO_Input%]" NEQ "[%%a]" set %%Z=%%b
																)
	if defined _COO_localscope endlocal
	)
if defined _COO_localscope endlocal

Call :ClearVariablesByPrefix %_CopyObjectOnly_prefix% _CopyObjectOnly 
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :CopyObjectOnly
GoTo :EOF



:MoveObjectOnly
set "_MoveObjectOnly_prefix=_MOI"
set _MOI_Input=%~1
set _MOI_Output=%~2

REM this should copy all variable suffix to the new destination
for /f "tokens=1,2* delims==" %%a in ('set %_MOI_Input% 2^>nul') do  (
	setlocal enabledelayedexpansion
	set "_MOI_localscope=true"
	set _MOI_Suffix_buffer_input=%%a
	set _MOI_Suffix_buffer_output=%_MOI_Output%!_MOI_Suffix_buffer_input:%_MOI_Input%=!
	for /f "tokens=*" %%Z in ('echo.!_MOI_Suffix_buffer_output!') do (
																endlocal 
																if "[%_MOI_Input%]" NEQ "[%%a]" set %%Z=%%b
																)
	if defined _MOI_localscope endlocal
	)
if defined _MOI_localscope endlocal

REM this clears the old base variable
if "[%_MOI_Input%]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %_MOI_Input% 2^>nul') do if "[%_MOI_Input%]" NEQ "[%%a]" set %%a=
Call :ClearVariablesByPrefix %_MoveObjectOnly_prefix% _MoveObjectOnly 
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :MoveObjectOnly
GoTo :EOF

:MoveObject
set "_MoveObject_prefix=_MO"
set _MO_Input=%~1
set _MO_Output=%~2
REM this should copy all variable suffix to the new destination
for /f "tokens=1,2* delims==" %%a in ('set %_MO_Input% 2^>nul') do  (
	setlocal enabledelayedexpansion
	set "_MO_localscope=true"
	set _MO_Suffix_buffer_input=%%a
	set _MO_Suffix_buffer_output=%_MO_Output%!_MO_Suffix_buffer_input:%_MO_Input%=!
	for /f "tokens=*" %%Z in ('echo.!_MO_Suffix_buffer_output!') do (
																endlocal
																set %%Z=%%b
																)
	)
if defined _MO_localscope endlocal
REM this clears the old base variable
if "[%_MO_Input%]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %_MO_Input% 2^>nul') do set %%a=
Call :ClearVariablesByPrefix %_MoveObject_prefix% _MoveObject 
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :MoveObject
GoTo :EOF

::Usage Call :CloseArrayObjectGaps ArrayName IndexList1 IndexList2 IndexListN
:CloseArrayObjectGaps
set "_CloseArrayObjectGaps_prefix=_CAOG"
set "_CAOG_array=%~1" & shift
call set "_CAOG_array_ubound=%%%_CAOG_array%.ubound%%"
:CloseArrayObjectGaps-arguments
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _CAOG_IndexList "%~1" & shift & GoTo :CloseArrayObjectGaps-arguments )
if defined _CAOG_IndexList.lbound ( set /a "_CAOG_IndexList_index=%_CAOG_IndexList.lbound%" ) else ( set /a "_CAOG_IndexList_index=0" )
set /a "_CAOG_IndexList_ubound=%_CAOG_IndexList.ubound%"
call set /a "_CAOG_index=%%_CAOG_IndexList[%_CAOG_IndexList_index%]%%"
set /a "_CAOG_next_index=%_CAOG_index%+1"
set /a "_CAOG_IndexList_index+=1"
if %_CAOG_IndexList_index% LEQ %_CAOG_IndexList_ubound% ( call set /a "_CAOG_next_limit=%%_CAOG_IndexList[%_CAOG_IndexList_index%]%%" ) else ( set /a "_CAOG_next_limit=%_CAOG_array_ubound%" )
:CloseArrayObjectGaps-loop
setlocal enabledelayedexpansion
Call :MoveObject %_CAOG_array%[%_CAOG_next_index%] %_CAOG_array%[%_CAOG_index%]
set /a "_CAOG_index+=1"
set /a "_CAOG_next_index+=1"
:CloseArrayObjectGaps-loop-end
if %_CAOG_next_index% LSS %_CAOG_next_limit% GoTo :CloseArrayObjectGaps-loop
if %_CAOG_IndexList_index% LEQ %_CAOG_IndexList_ubound% ( set /a "_CAOG_IndexList_index+=1" & set /a "_CAOG_next_index+=1" )
if %_CAOG_IndexList_index% LEQ %_CAOG_IndexList_ubound% ( call set /a "_CAOG_next_limit=%%_CAOG_IndexList[%_CAOG_IndexList_index%]%%" )
if %_CAOG_IndexList_index% LEQ %_CAOG_IndexList_ubound% ( GoTo :CloseArrayObjectGaps-loop-end ) else ( set /a "_CAOG_next_limit=%_CAOG_array_ubound%" )
if %_CAOG_next_index% LEQ %_CAOG_array_ubound% GoTo :CloseArrayObjectGaps-loop
set /a "%_CAOG_array%.ubound=%_CAOG_index%-1"
Call :ClearVariablesByPrefix %_CloseArrayObjectGaps_prefix% _CloseArrayObjectGaps
GoTo :EOF

::Usage Call :CloseArrayGaps ArrayName IndexList1 IndexList2 IndexListN
:CloseArrayGaps
set "_CloseArrayGaps_prefix=_CAG"
set "_CAG_array=%~1" & shift
call set "_CAG_array_ubound=%%%_CAG_array%.ubound%%"
:CloseArrayGaps-arguments
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _CAG_IndexList "%~1" & shift & GoTo :CloseArrayGaps-arguments )
if defined _CAG_IndexList.lbound ( set /a "_CAG_IndexList_index=%_CAG_IndexList.lbound%" ) else ( set /a "_CAG_IndexList_index=0" )
set /a "_CAG_IndexList_ubound=%_CAG_IndexList.ubound%"
call set /a "_CAG_index=%%_CAG_IndexList[%_CAG_IndexList_index%]%%"
set /a "_CAG_next_index=%_CAG_index%+1"
set /a "_CAG_IndexList_index+=1"
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( call set /a "_CAG_next_limit=%%_CAG_IndexList[%_CAG_IndexList_index%]%%" ) else ( set /a "_CAG_next_limit=%_CAG_array_ubound%" )
:CloseArrayGaps-loop
setlocal enabledelayedexpansion
set "_CAG_localscope=true"
for /f "tokens=*" %%Z in ('echo.!%_CAG_array%[%_CAG_next_index%]!') do (
															endlocal 
															set %_CAG_array%[%_CAG_index%]=%%Z
															)
if defined _CAG_localscope endlocal
set /a "_CAG_index+=1"
set /a "_CAG_next_index+=1"
:CloseArrayGaps-loop-end
if %_CAG_next_index% LSS %_CAG_next_limit% GoTo :CloseArrayGaps-loop
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( set /a "_CAG_IndexList_index+=1" & set /a "_CAG_next_index+=1" )
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( call set /a "_CAG_next_limit=%%_CAG_IndexList[%_CAG_IndexList_index%]%%" )
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( GoTo :CloseArrayGaps-loop-end ) else ( set /a "_CAG_next_limit=%_CAG_array_ubound%" )
if %_CAG_next_index% LEQ %_CAG_array_ubound% GoTo :CloseArrayGaps-loop
set /a "%_CAG_array%.ubound=%_CAG_index%-1"
Call :ClearVariablesByPrefix %_CloseArrayGaps_prefix% _CloseArrayGaps
GoTo :EOF

REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
REM if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
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




REM NOTE the echo line was modified to put the redirect in front, but this has not been verified to work  NOTE
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :ArrayToFile InputArray OutputFile optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:ArrayToFile
set "_ArrayToFile_input=%~1"
call set /a "_ArrayToFile_lbound=%%%~1.lbound" 2>nul
if "[%_ArrayToFile_lbound%]" EQU "[]" set /a "_ArrayToFile_lbound=0"
call set /a "_ArrayToFile_ubound=%%%~1.ubound"
set /a "_ArrayToFile_index=%_ArrayToFile_lbound%"
shift
set "_ArrayToFile_output=%~1"
shift
:ArrayToFile-arguments
set "_ArrayToFile_buffer=%~1"
if not defined _ArrayToFile_buffer GoTo :ArrayToFile-arguments-end
if "[%_ArrayToFile_buffer:~,1%]" EQU "[.]" ( set "_ArrayToFile_suffix=%_ArrayToFile_buffer%" & shift & GoTo :ArrayToFile-arguments )
if "[%_ArrayToFile_buffer%]" EQU "[LINENUMBERS]" ( set "_ArrayToFile_showlinenumbers=true" & shift & GoTo :ArrayToFile-arguments )
if "[%_ArrayToFile_buffer%]" EQU "[SHOWVARNAME]" ( set "_ArrayToFile_showvariablename=true" & shift & GoTo :ArrayToFile-arguments )
if "[%_ArrayToFile_buffer%]" EQU "[VERTICALMODE]" ( set "_ArrayToFile_verticalmode=true" & shift & GoTo :ArrayToFile-arguments )
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _ArrayToFile_IndexList "%~1" & shift & GoTo :ArrayToFile-arguments )
:ArrayToFile-arguments-end
if defined _ArrayToFile_IndexList.ubound set /a "_ArrayToFile_ubound=%_ArrayToFile_IndexList.ubound%"
setlocal enabledelayedexpansion
:ArrayToFile-loop
if not defined _ArrayToFile_IndexList.ubound ( set "_ArrayToFile_index_actual=%_ArrayToFile_index%" ) else ( set "_ArrayToFile_index_actual=!_ArrayToFile_IndexList[%_ArrayToFile_index%]!" )
if defined _ArrayToFile_showlinenumbers set _ArrayToFile_prefix=%_ArrayToFile_index%:
if defined _ArrayToFile_showvariablename set _ArrayToFile_prefix=%_ArrayToFile_input%[%_ArrayToFile_index_actual%]:
if defined _ArrayToFile_showvariablename if defined _ArrayToFile_showlinenumbers set _ArrayToFile_prefix=%_ArrayToFile_index%:%_ArrayToFile_input%[%_ArrayToFile_index_actual%]:
if not defined _ArrayToFile_verticalmode GoTo :ArrayToFile-normalmode-loop-next
<nul set /p =%_ArrayToFile_prefix%!%_ArrayToFile_input%[%_ArrayToFile_index_actual%]%_ArrayToFile_suffix%!>>%_ArrayToFile_output%
GoTo :ArrayToFile-loop-next
:ArrayToFile-normalmode-loop-next
>>%_ArrayToFile_output% echo(%_ArrayToFile_prefix%!%_ArrayToFile_input%[%_ArrayToFile_index_actual%]%_ArrayToFile_suffix%!
:ArrayToFile-loop-next
set /a "_ArrayToFile_index+=1"
if %_ArrayToFile_index% LEQ %_ArrayToFile_ubound% GoTo :ArrayToFile-loop
:ArrayToFile-loop-end
endlocal
Call :ClearVariablesByPrefix _ArrayToFile
GoTo :EOF



:DeleteObject
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteObject
GoTo :EOF
:DeleteObjectOnly
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1. 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteObjectOnly
GoTo :EOF



REM finished ?
::Usage Call :GetIndexArray OutputIndexArray ListOfIndex1 ListOfIndex2 ... ListOfIndexN
::Lists of index are appended to the OutputIndexArray, Lists of index can contain
::single elements "18" 
::comma or space separated elements "10,14,23" "10 14 23"
::single ranges "2-9"
::multiple ranges "45-47,48-94" "45-47 48-94"
::ranges can be in descending order "33-66 66-33"
::ranges can includes more than two end stops "33-67-66-99" 
::or a mix of all the above
::not implemented keywords like start middle quarter third twothird threequarter  "start-45,middle-end,third-twothird,start-end,1-end"
::not implemented percentages 10% 20% 33% 100%  "10%-20%,0%-100%,start-100%"
::not implemented features would require knowing the starting and ending index of the reference array
:GetIndexArray
set "_GetIndexArray_prefix=_GIA"
set "_GIA_output=%~1"
if "[%_GIA_output%]" EQU "[]" GoTo :EOF
if "[%_GIA_output%]" NEQ "[%_GIA_output:[]=%]" set "_GIA_output_suffix=%_GIA_output:*]=%" & set "_GIA_output=%_GIA_output:*[=%"
call set "_GIA_output_lbound=%%%~1.lbound%%"
call set "_GIA_output_ubound=%%%~1.ubound%%"
if "[%_GIA_output_lbound%]" EQU "[]" set /a "_GIA_output_lbound=0"
if "[%_GIA_output_ubound%]" EQU "[]" set /a "_GIA_output_ubound=%_GIA_output_lbound%-1"
shift
:GetIndexArray-arguments
if "[%~1]" EQU "[]" GoTo :EOF
Call :ClearVariablesByPrefix _GIA_current_list
set "_GIA_current_list=%~1"
set /a "_GIA_current_list_index=0"
for /f %%a in ('set %_GIA_current_list%[ 2^>nul') do GoTo :GetIndexArray-isarray-arguments
for %%a in (%_GIA_current_list:,= %) do ( call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1" )
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
REM set _GIA_current_list
GoTo :GetIndexArray-loop
:GetIndexArray-isarray-arguments
call set /a "_GIA_current_list_array_index=%%%_GIA_current_list%.lbound%%" 2>nul
if not defined _GIA_current_list_array_index set /a "_GIA_current_list_array_index=0"
call set /a "_GIA_current_list_array_ubound=%%%_GIA_current_list%.ubound%%" 2>nul
:GetIndexArray-isarray-arguments-loop
call set _GIA_current_list_array_element=%%%_GIA_current_list%[%_GIA_current_list_array_index%]%%
for %%a in (%_GIA_current_list_array_element:,= %) do call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1"
set /a "_GIA_current_list_array_index+=1"
if %_GIA_current_list_array_index% LEQ %_GIA_current_list_array_ubound% GoTo :GetIndexArray-isarray-arguments-loop
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
:GetIndexArray-loop
REM set _GIA_current_list
call set "_GIA_current_list_element=%%_GIA_current_list[%_GIA_current_list_index%]%%
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" GoTo :GetIndexArray-range-skip
set /a "_GIA_current_list_element_index=0"
REM echo for %%a in (%_GIA_current_list_element:-= %)
for %%a in (%_GIA_current_list_element:-= %) do ( call set "_GIA_current_list_element[%%_GIA_current_list_element_index%%]=%%a" & call set /a "_GIA_current_list_element_index+=1" )
REM set _GIA_current_list_element
set /a "_GIA_current_list_element_ubound=%_GIA_current_list_element_index%-1" & set /a "_GIA_current_list_element_index=0"
call set /a "_GIA_current_list_element_start=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
:GetIndexArray-range-loop
call set /a "_GIA_current_list_element_end=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element_start%" & GoTo :GetIndexArray-range-next)
REM if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% echo TEST II %_GIA_current_list_element_start% II& GoTo :GetIndexArray-range-next
if %_GIA_current_list_element_start% GTR %_GIA_current_list_element_end% ( set "_GIA_current_list_element_direction=-" ) else ( set "_GIA_current_list_element_direction=+" )
set /a "_GIA_current_list_element_start%_GIA_current_list_element_direction%=1"
REM for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( echo TEST II %%a II )
for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%%a" )
:GetIndexArray-range-next
set /a "_GIA_current_list_element_start=%_GIA_current_list_element_end%"
set /a "_GIA_current_list_element_index+=1"
if %_GIA_current_list_element_index% LEQ %_GIA_current_list_element_ubound% GoTo :GetIndexArray-range-loop
:GetIndexArray-range-skip
REM if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" echo TEST JJ %_GIA_current_list_element% JJ
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element%" )
:GetIndexArray-loop-end
Call :ClearVariablesByPrefix _GIA_current_list_element
set /a "_GIA_current_list_index+=1"
if %_GIA_current_list_index% LEQ %_GIA_current_list_ubound% GoTo :GetIndexArray-loop
shift 
if "[%~1]" NEQ "[]" GoTo :GetIndexArray-arguments
set /a "%_GIA_output%.ubound=%_GIA_output_ubound%"
Call :ClearVariablesByPrefix %_GetIndexArray_prefix% _GetIndexArray
GoTo :EOF


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF