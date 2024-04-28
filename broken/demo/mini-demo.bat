
:mini-demo

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
REM set myarray[5]=element 5
REM set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
REM call :echoarray myarray LINENUMBERS
call :echoarray myarray SHOWVARNAME
call :CloseArrayGaps myarray 5,6,7
echo.&call :echoarray myarray LINENUMBERS

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
set myarray[4]=element 4
REM set myarray[5]=element 5
REM set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
call :CompactArray myarray
echo.&call :echoarray myarray LINENUMBERS

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
REM set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
REM set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
call :CloseArrayGaps myarray 1,4,7
echo.&call :echoarray myarray LINENUMBERS

Call :ClearVariablesByPrefix myarray
set myarray[0]=element 0
REM set myarray[1]=element 1
set myarray[2]=element 2
set myarray[3]=element 3
REM set myarray[4]=element 4
set myarray[5]=element 5
set myarray[6]=element 6
REM set myarray[7]=element 7
set myarray[8]=element 8
set myarray[9]=element 9
set myarray[10]=element 10
set myarray.ubound=10

echo.&echo Printing myarray&echo.
call :echoarray myarray LINENUMBERS
call :CompactArray myarray
echo.&call :echoarray myarray LINENUMBERS

GoTo :EOF

