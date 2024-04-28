
:GetArrayParameters-DEMO

set "mytestarray[0]=bla"
set "mytestarray[1]=bla"
set "mytestarray[2]=bla"
set /a mytestarray.lbound=0
set /a mytestarray.ubound=2
set /a mytestarray.count=3

echo.
echo testing with a declared array
echo.
Call :GetArrayParameters mytestarray _test1params && echo it was an array || echo it was not an array
echo. 
echo set mytestarray
set mytestarray
echo set _test1params
set _test1params
echo.

echo.
echo testing with a undeclared variable
echo.
Call :GetArrayParameters mynonarray _test2params && echo it was an array || echo it was not an array
echo. 
echo set mynonarray
set mynonarray
echo set _test2params
set _test2params
echo.

echo.
echo testing with a undeclared variable with Initialize
echo.
Call :GetArrayParameters mynonarray3 _test3params Initialize && echo it was an array || echo it was not an array
echo. 
echo set mynonarray3
set mynonarray3
echo set _test3params
set _test3params
echo.

echo.
echo testing with a undeclared variable with Initialize and specify an index of -1
echo.
Call :GetArrayParameters mynonarray4 _test4params Initialize -1 && echo it was an array || echo it was not an array
echo. 
echo set mynonarray4
set mynonarray4
echo set _test4params
set _test4params
echo.

GoTo :EOF

