@echo off

echo Testing if a folder requires admin

echo Testing user profile, should return true
Call :IsFolderWritable %USERPROFILE%\ IsFolderWritable
Echo Folder writable status is %IsFolderWritable%

echo Testing C:\WINDOWS\SYSTEM32\, should return false
Call :IsFolderWritable C:\WINDOWS\SYSTEM32\ IsFolderWritable
Echo Folder writable status is %IsFolderWritable%

Call :IsFolderWritable %commandsroot%\ IsFolderWritable
if not %IsFolderWritable%==true echo Destination folder %commandsroot% is NOT writable, run as admin ( %IsFolderWritable% ) & pause

Call :IsFolderWritable %USERPROFILE%\ IsFolderWritable || echo yes && echo no
Call :IsFolderWritable %USERPROFILE%\ IsFolderWritable && echo yes || echo no
Call :IsFolderWritable C:\WINDOWS\SYSTEM32\ IsFolderWritable && echo yes || echo no




GoTo :EOF

:IsFolderWritable
set tmpfile=%~1.deleteme
set %2=false
(> %tmpfile% echo) 2>NUL && (del %tmpfile% && set %2=true || set %2=true ) || set %2=false
GoTo :EOF

pause
