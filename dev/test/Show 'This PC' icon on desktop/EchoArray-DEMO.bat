
:EchoArray-DEMO

Call :ClearVariablesByPrefix testarray
set testarray[uhoh]=alb--uhoh
set testarray[-1]=alb
set testarray[0]=bla
set testarray[1]=bli
set testarray[2]=blo
set testarray[3]=blou
set testarray[4]=ble
set testarray[5]=bly
set testarray[6]=blu
set /a testarray.lbound=-1
set /a testarray.ubound=6
set /a testarray.count=%testarray.ubound%-%testarray.lbound%+1

echo.
echo plain echo array
Call :EchoArray testarray

echo.
echo echo array but array is undefined
Call :EchoArray wrongtestarray

echo.
echo echo array from element 3 
Call :EchoArray testarray 3

echo.
echo echo array to element 4
Call :EchoArray testarray "" 4

echo.
echo echo array from element 3 to 6
Call :EchoArray testarray 3 6

echo.
echo echo array from element -1 to -1
Call :EchoArray testarray -1 -1

set testarray[uhoh].pelican=albpelicanIuhoh
set testarray[-1].pelican=albpelicanI-1
set testarray[0].pelican=blapelicanI0
set testarray[1].pelican=blipelicanI1
set testarray[2].pelican=blopelicanI2
set testarray[3].pelican=bloupelicanI3
set testarray[4].pelican=blepelicanI4
set testarray[5].pelican=blypelicanI5
set testarray[6].pelican=blupelicanI6

echo.
echo echo array from element 3 to 6 but only with suffix .pelican
Call :EchoArray testarray 3 6 ".pelican"

GoTo :EOF

