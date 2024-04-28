@echo off
setlocal

title Quit Function Test

call :myFunction
echo This line will not be executed.
echo WITNESS > witness.file 



exit /b

:myFunction
echo Inside myFunction.
title QUITTHISNOW
taskkill /f /fi "WINDOWTITLE eq QUITTHISNOW"
exit /b
