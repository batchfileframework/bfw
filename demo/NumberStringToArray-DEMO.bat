
:NumberStringToArray-DEMO
Call :ClearVariablesByPrefix _SNA _ATS _RLZ _CopyArray
Call :ClearVariablesByPrefix MyNumber

REM goto :NumberStringToArray-DEMO-skip

Call :NumberStringToArray "64 12 44 883 100 2 48 377" MyNumberArray
set MyNumberArray

echo.
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "" MyNumberArray
echo this should cause an error
set MyNumberArray

echo.
echo single number array
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "24" MyNumberArray
set MyNumberArray

echo.
echo creating array, and sorting it
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "64 12 44 883 100 2 48 377" MyNumberArray
set MyNumberArray
Call :SortNumberArray MyNumberArray
echo.
echo after sorting
set MyNumberArray 

echo.
echo creating array, and sorting it, in reverse order
Call :ClearVariablesByPrefix MyNumberArray
Call :NumberStringToArray "64 12 44 883 100 2 48 377" MyNumberArray
set MyNumberArray
Call :SortNumberArray MyNumberArray DESCENDING
echo.
echo after sorting
set MyNumberArray

echo.
echo Generating 10 random 3 digit number and sorting them
Call :ClearVariablesByPrefix MyNumberArray
set /a "NumberStringToArray_DEMO_loop=0"
:NumberStringToArray-DEMO-loop
call :GetRandomString 3 MyNumberArray[%NumberStringToArray_DEMO_loop%] NUMERICONLY ESCNOTLASTDIGIT NOLEN
Call :RemoveLeadingZeros MyNumberArray[%NumberStringToArray_DEMO_loop%]
set /a "NumberStringToArray_DEMO_loop+=1"
if %NumberStringToArray_DEMO_loop% LSS 10 GoTo :NumberStringToArray-DEMO-loop
set /a "MyNumberArray.ubound=%NumberStringToArray_DEMO_loop%-1"
echo.
echo original
set MyNumberArray
Call :SortNumberArray MyNumberArray 
echo sorted ascending order
set MyNumberArray
Call :SortNumberArray MyNumberArray DESCENDING
echo sorted descending order
set MyNumberArray

:NumberStringToArray-DEMO-skip

echo.
echo Generating 10 random 3 digit number and sorting them
echo but this time as a string
echo then this string gets sorted both direction
Call :ClearVariablesByPrefix MyNumberArray
set /a "NumberStringToArray_DEMO_loop=0"
:NumberStringToArray-DEMO-loop2
call :GetRandomString 3 MyNumberArray[%NumberStringToArray_DEMO_loop%] NUMERICONLY ESCNOTLASTDIGIT NOLEN
Call :RemoveLeadingZeros MyNumberArray[%NumberStringToArray_DEMO_loop%]
call set "MyNumberNew=%%MyNumberArray[%NumberStringToArray_DEMO_loop%]%% "
set "MyNumberString=%MyNumberString%%MyNumberNew%"
set /a "NumberStringToArray_DEMO_loop+=1"
if %NumberStringToArray_DEMO_loop% LSS 10 GoTo :NumberStringToArray-DEMO-loop2
set /a "MyNumberArray.ubound=%NumberStringToArray_DEMO_loop%-1"

echo.
echo Number string from GetRandom
echo %MyNumberString%
Call :NumberStringToArray "%MyNumberString%" MyNumberArrayAscending
Call :SortNumberArray MyNumberArrayAscending
Call :ArrayToString MyNumberArrayAscending MyNumberStringAscending " "
echo Number string sorted ascending
echo %MyNumberStringAscending%

Call :NumberStringToArray "%MyNumberString%" MyNumberArrayDescending
Call :SortNumberArray MyNumberArrayDescending DESCENDING
Call :ArrayToString MyNumberArrayDescending MyNumberStringDescending " "
echo Number string sorted descending
echo %MyNumberStringDescending%

GoTo :EOF
