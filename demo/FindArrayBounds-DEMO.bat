
:FindArrayBounds-DEMO

Call :ClearVariablesByPrefix testarray
set testarray[uhoh]=alb
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

echo. setup a test array
set testarray


echo.
echo clearing array parameters
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
echo.
echo calling FindArrayBounds, result should be lbound -1 ubound 6 and count 8
echo.

call :FindArrayBounds testarray 
set testarray

echo.
echo clearing array parameters again
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
echo.
echo calling FindArrayBounds , result should be in testarray.parameters and lbound -1 ubound 6 and count 8
echo.

call :FindArrayBounds testarray testarray.parameters
echo set testarray.parameters
set testarray.parameters
echo.
echo set testarray
set testarray

echo.
echo clearing array parameters again
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
echo.
echo calling GetArrayParameters should return empty in testarray.parameters.again
echo.

Call :GetArrayParameters testarray testarray.parameters.again
echo.
echo set testarray.parameters.again
set testarray.parameters.again 

echo.
echo. running findarray then get array, should return in testarray.parameters.again lbound -1 ubound 6 and count 8
call :FindArrayBounds testarray
Call :GetArrayParameters testarray testarray.parameters.again
echo.
echo set testarray.parameters.again
set testarray.parameters.again 


echo.
echo running with initialize and should return lbound 0 ubound -1 count 1 in set testarray.parameters.again
Call :GetArrayParameters testarray testarray.parameters.again Initialize
echo.
echo set testarray.parameters.again
set testarray.parameters.again 

echo.
echo running FindArrayBounds, with fewer element, in particular, without a zero element
echo this should return lbound 2 ubound 6 count 5
echo.
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
set testarray[-1]=
set testarray[0]=
set testarray[1]=

call :FindArrayBounds testarray

set testarray

echo.

Call :GetAppxPackages
call :FindArrayBounds AppxPackages _testarrayparameters
echo AppxPackages.lbound %AppxPackages.lbound%
echo AppxPackages.ubound %AppxPackages.ubound%
echo AppxPackages.count %AppxPackages.count%
echo.
echo. result of FindArrayBounds on AppxPackages in _testarrayparameters, should match values

set _testarrayparameters
echo.
echo running GetArrayParameters, should match array's direct values
Call :GetArrayParameters AppxPackages AppxPackages.arrayparameters 
echo.
echo set AppxPackages.arrayparameters
set AppxPackages.arrayparameters


GoTo :EOF

