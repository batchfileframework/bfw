
::Usage Call :GetTempFile OutputFilename optional ext optional prefix optional suffix 
:GetTempFile
set "_GetTempFile.time=%date%.%time:~0,2%h%time:~3,2%m%time:~6,2%s%time:~9,2%"
set "_GetTempFile.time=%_GetTempFile.time: =0%
if "[%~2]"=="[]" ( set "_GetTempFile.ext=.tmp" ) else ( set "_GetTempFile.ext=%~2" )
set "_GetTempFile=%temp%\%~3%random%.%_GetTempFile.time%%~4%_GetTempFile.ext%"
if exist "%_GetTempFile%" goto :GetTempFile
set "%~1=%_GetTempFile%"
set "_GetTempFile=" & set "_GetTempFile.time="
GoTo :EOF

