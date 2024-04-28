
::Usage Call :lenFromVar VariableName OutputResult
:: 8172 max lenght, breaks batch file if len=8173
:lenByRef
REM setlocal enableDelayedExpansion
REM endlocal & set "_len=!%1!" & GoTo :len-skip-preamble
call set "_len=%%%1%%" 
echo lenByRef %_len%
GoTo :len-skip-preamble
::Usage Call :len "%InputString%" OutputResult
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175)
:len
set "_len=%~1"
set "_len=%_len:^^=^%"
set "_len=%_len:""="%"
echo len %_len%
:len-skip-preamble
if not defined _len set /a "_len.count=0" GoTo :len-end
set /a "_len.count=1"
if "%_len:~4096,1%" NEQ "" ( set /a "_len.count+=4096" & set "_len=%_len:~4096%" )
if "%_len:~2048,1%" NEQ "" ( set /a "_len.count+=2048" & set "_len=%_len:~2048%" )
if "%_len:~1024,1%" NEQ "" ( set /a "_len.count+=1024" & set "_len=%_len:~1024%" )
if "%_len:~512,1%" NEQ "" ( set /a "_len.count+=512" & set "_len=%_len:~512%" )
if "%_len:~256,1%" NEQ "" ( set /a "_len.count+=256" & set "_len=%_len:~256%" )
if "%_len:~128,1%" NEQ "" ( set /a "_len.count+=128" & set "_len=%_len:~128%" )
if "%_len:~64,1%" NEQ "" ( set /a "_len.count+=64" & set "_len=%_len:~64%" )
if "%_len:~32,1%" NEQ "" ( set /a "_len.count+=32" & set "_len=%_len:~32%" )
if "%_len:~16,1%" NEQ "" ( set /a "_len.count+=16" & set "_len=%_len:~16%" )
if "%_len:~8,1%" NEQ "" ( set /a "_len.count+=8" & set "_len=%_len:~8%" )
if "%_len:~4,1%" NEQ "" ( set /a "_len.count+=4" & set "_len=%_len:~4%" )
if "%_len:~2,1%" NEQ "" ( set /a "_len.count+=2" & set "_len=%_len:~2%" )
if "%_len:~1,1%" NEQ "" ( set /a "_len.count+=1" & set "_len=%_len:~1%" )
:len-end
set /a "%~2=%_len.count%"
set "_len.count=" & set "_len=" & exit /b %_len.count%

