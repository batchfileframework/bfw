@echo off 
Call :GetTime mydatetime mydate mytime
Set "drive=d:"
Set driverfolder=%drive%\driver.backup.%date%.%mytime%\
echo driver saving folder = %driverfolder%
echo call dism /online /export-driver /destination %driverfolder%
md %driverfolder%
call dism /online /export-driver /destination:%driverfolder%

GoTo :EOF

::Usage Call :GetTime
:GetTime 
set "_GetDate=%date%" & set "_GetTime=%time%"
set "_GetTime=%_GetTime: 0=00%"
set "_GetTime=%_GetTime: 1=01%"
set "_GetTime=%_GetTime: 2=02%"
set "_GetTime=%_GetTime: 3=03%"
set "_GetTime=%_GetTime: 4=04%"
set "_GetTime=%_GetTime: 5=05%"
set "_GetTime=%_GetTime: 6=06%"
set "_GetTime=%_GetTime: 7=07%"
set "_GetTime=%_GetTime: 8=08%"
set "_GetTime=%_GetTime: 9=09%"

set "_GetTime=%_GetTime:~0,2%h%_GetTime:~3,2%m%_GetTime:~6,2%s%_GetTime:~9,2%"
set "%~1=%_GetDate% %_GetTime%" & set "%~2=%_GetDate%" & set "%~3=%_GetTime%"
set "_GetDate=" & set "_GetTime="
GoTo :EOF