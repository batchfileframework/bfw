@echo off

Call EncodeURL "https://www.example.com/test /test%/test ^!/file example.html" OutputURL
echo %OutputURL%

pause
:END
Goto :EOF

:: EncodeURL InputURL OutputURL
:EncodeURL
set internal=%1
:: Define simple macros to support JavaScript within batch
set "beginJS=mshta "javascript:code(close(new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write("
set "endJS=)));""

:: FOR /F does not need pipe
for /f %%N in (
  '%beginJS% encodeURIComponent("%internal%") %endJS%'
) do set encoded=%%N
set %2=%encoded%
GoTo :EOF
