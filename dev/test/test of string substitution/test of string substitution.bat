@echo on
set firststr=ABC Def ghi KlM NoP
set secondstr=The lazy brown fox
set firstword=abc
set secondword=def
set thirdword=ghi


echo Demonstration of string substitution

echo First string is : %firststr%
echo Second string is : %secondstr%
echo 1st, 2nd ^& 3rd word : %firstword%, %secondword%, %thirdword%

echo.

echo 1 Replace word def from first string with nothing
echo %firststr:def=%

echo.

echo 2 Replace word def from first string with nothing, but using the secondword
call set mynewvar=%%firststr:%secondword%=%%
echo %mynewvar%

echo.

Echo 3 Trunkate string after the word def
set selectstr=%firststr:*def=%
call set mynewvar=%%firststr:%selectstr%=%%
echo %mynewvar%

echo.

Echo 4 Trunkate string after the word def
call set selectstr=%%firststr:*%secondword%=%%
echo result selectstr: %selectstr%
call set mynewvar=%%firststr:%selectstr%=%%
echo result mynewvar: %mynewvar%

echo.

Echo 5 Trunkate string before the word def
call set selectstr=%firststr:def*=%
call set mynewvar=%%firststr:%selectstr%=%%
echo %mynewvar%

echo.

Echo 6 Trunkate string before the word def
call set selectstr=%%firststr:%secondword%*=%%
echo result selectstr: %selectstr%
call set mynewvar=%%firststr:%selectstr%=%%
echo result mynewvar: %mynewvar%

pause