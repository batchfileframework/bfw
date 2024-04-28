
::Usage Call :countLines returnvariable filename
::counts the number of lines in a file
:countLines result= "%file%"
setLocal disableDelayedExpansion
(set "lc=0" & call)
for /f "delims=:" %%N in ('
    cmd /d /a /c type "%~2" ^^^& ^<nul set /p "=#" ^| (^
    2^>nul findStr /n "^" ^&^& echo(^) ^| ^
    2^>nul findStr /blv 1: ^| 2^>nul findStr /lnxc:" "
') do (set "lc=%%N" & call;) %= for /f =%
endlocal & set "%1=%lc%"
exit /b %errorLevel% %= countLines =%
REM https://stackoverflow.com/a/49089494/6104460

