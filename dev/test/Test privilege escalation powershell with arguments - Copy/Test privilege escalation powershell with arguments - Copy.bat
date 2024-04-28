@echo off
setlocal

:: Test whether this invocation is elevated (`net session` only works with elevation).
:: If already running elevated (as admin), continue below.
net session >NUL 2>NUL && goto :elevated

:: If not, reinvoke with elevation.
set args=%*
if defined args set args=%args:^=^^%
if defined args set args=%args:<=^<%
if defined args set args=%args:>=^>%
if defined args set args=%args:&=^&%
if defined args set args=%args:|=^|%
if defined args set "args=%args:"=\"\"%"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  " Start-Process -Wait -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD%\"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
exit /b

:elevated

:: =====================================================
:: Now we are running elevated, in the same working dir., with args passed through.
:: YOUR CODE GOES HERE.

echo First argument is "%~1"
echo Second argument is "%~2"

pause