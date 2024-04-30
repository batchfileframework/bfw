@echo off



echo before function
rem call function
call :myFunction
echo after function

rem define function
:myFunction
echo This is my function.
echo It can have multiple commands.
goto :eof

echo this will not run


