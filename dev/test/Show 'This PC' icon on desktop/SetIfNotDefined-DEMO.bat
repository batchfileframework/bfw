
:SetIfNotDefined-DEMO

Call :ClearVariablesByPrefix myoutputvar
Call :ClearVariablesByPrefix myvalue

set "myoutputvar1=Already defined 111"
set "myoutputvar2="
set "myoutputvar3=Already defined 333"
set "myoutputvar4="

set "myvalue1=a new 1 value"
set "myvalue2=a new 2 value"
set "myvalue3="
set "myvalue4=a new 4 value"

echo.
echo Calling SetIfNotDefined set a value to myoutputvar1, which is already defined
Call :SetIfNotDefined "%myvalue1%" myoutputvar1
set myoutputvar1

echo.
echo Calling SetIfNotDefined set a value with no content to myoutputvar2
Call :SetIfNotDefined "%myvalue3%" myoutputvar2
set myoutputvar2

echo.
echo clearing myoutputvar
Call :ClearVariablesByPrefix myoutputvar

echo.
echo Doing both previous actions, plus one more, but on a single line
Call :SetIfNotDefined "%myvalue1%" myoutputvar1 "%myvalue2%" myoutputvar2 "%myvalue4%" myoutputvar4
set myoutputvar1
set myoutputvar2
set myoutputvar4

Call :ClearVariablesByPrefix myoutputvar
Call :ClearVariablesByPrefix myvalue

GoTo :EOF

