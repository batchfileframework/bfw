@echo off
setlocal


set "string=gibberish+?blahblah@"


:: Define simple macros to support JavaScript within batch
set "beginJS=mshta "javascript:code(close(new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write("
set "endJS=)));""



:: FOR /F does not need pipe
for /f %%N in (
  '%beginJS% encodeURIComponent("%string%") %endJS%'
) do set encoded=%%N
echo %string% -^> %encoded%