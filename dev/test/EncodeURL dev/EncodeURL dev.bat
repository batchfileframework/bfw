@echo off

set encoded=

call :EncodeURL gibberish+?blahblah@ OutputURL
echo encoded url %OutputURL% 

:END
GoTo:EOF

:EncodeURL
REM setlocal
REM set "string=gibberish+?blahblah@"
set string=%1
:: Define simple macros to support JavaScript within batch
set "beginJS=mshta "javascript:code(close(new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write("
set "endJS=)));""
:: FOR /F does not need pipe
for /f %%N in (
  '%beginJS% encodeURIComponent("%1") %endJS%'
) do set encoded=%%N
echo %string% -^> %encoded%
set %2=%encoded%
GoTo :EOF