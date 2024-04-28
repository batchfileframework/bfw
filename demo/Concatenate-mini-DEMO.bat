
:Concatenate-mini-DEMO

echo -------------------------------
Call :Concatenate _myConcatenated-Mini-1 "abc" "def" "ghi"

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-1 "abc" "def" "ghi"
echo Demonstrate concatenate of 3 strings by value, default separator of " " is used
echo.&echo %_myConcatenated-Mini-1%

echo -------------------------------

set myvar=jkl
set myothervar=mno
set myotherothervar=pqr

Call :Concatenate _myConcatenated-Mini-2 myvar myothervar myotherothervar 

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-2 myvar myothervar myotherothervar 
echo Demonstrate concatenate of 3 strings by reference, default separator of " " is used
echo.&echo %_myConcatenated-Mini-2%

echo -------------------------------

set myarray[0]=stu
set myarray[1]=vwx
set myarray[2]=yzA
set /a "myarray.ubound=2"

Call :Concatenate _myConcatenated-Mini-3 myarray

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-3 myarray 
echo Demonstrate concatenate of 3 strings in an array
echo.&echo %_myConcatenated-Mini-3%

echo -------------------------------

Call :Concatenate  _myConcatenated-Mini-4 "abc" "def" "ghi" myvar myothervar myotherothervar myarray

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-4 "abc" "def" "ghi" myvar myothervar myotherothervar myarray
echo Demonstrate concatenate with all 3 previous methods combined
echo.&echo %_myConcatenated-Mini-4%

echo -------------------------------

Call :Concatenate _myConcatenated-Mini-5 SEPARATOR 1 "abc" "def" "ghi" myvar myothervar myotherothervar myarray 

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-5 SEPARATOR 1 "abc" "def" "ghi" myvar myothervar myotherothervar myarray 
echo Demonstrate same as previous, but a separator is specified to "1"
echo.&echo %_myConcatenated-Mini-5%

echo -------------------------------
Call :Concatenate _myConcatenated-Mini-6 "abc" "def" "ghi" myvar SEPARATOR 1 myothervar myotherothervar myarray

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-6 "abc" "def" "ghi" myvar SEPARATOR 1 myothervar myotherothervar myarray 
echo Demonstrate same as previous, but a separator is specified to "1" starting from myothervar/vwx only
echo.&echo %_myConcatenated-Mini-6%

echo -------------------------------
Call :Concatenate _myConcatenated-Mini-7 "abc" SEPARATOR 1 "def" "ghi" myvar SEPARATOR 2 myothervar myotherothervar SEPARATOR " " myarray 

echo.&echo.&echo result for Call :Concatenate _myConcatenated-Mini-7 "abc" SEPARATOR 1 "def" "ghi" myvar SEPARATOR 2 myothervar myotherothervar SEPARATOR " " myarray 
echo Demonstrate same as previous, but multiple separators are used
echo.&echo %_myConcatenated-Mini-7%

echo -------------------------------


GoTo :EOF

