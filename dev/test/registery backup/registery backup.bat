@echo off

rem Get the user's Documents folder
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" ^| find "Personal"') do (
    set "documentsFolder=%%a"
)

rem Create the backup folder path
set "backupFolder=%documentsFolder%\Registry Backup"

rem Create the backup folder if it doesn't exist
if not exist "%backupFolder%" mkdir "%backupFolder%"

rem Get current date and time for the timestamp
date /t
for /f "tokens=1,2,3 delims=- " %%a in ('date /t') do (
    set "timestampDate=%%a-%%b-%%c"
)

for /f "tokens=1,2 delims=: " %%a in ('time /t') do (
    set "timestampTime=%%ah%%b"
)
set "timestamp=%timestampDate%_%timestampTime%"

rem Create a subfolder with the timestamp
set "destinationDirectory=%backupFolder%\%timestamp%"
mkdir "%destinationDirectory%"

echo Creating registery backup at %destinationDirectory%

rem Copy the registry hive files
robocopy "%SystemRoot%\System32\config" "%destinationDirectory%" DEFAULT SAM SECURITY SOFTWARE SYSTEM /ZB

echo Registry hive files copied to %destinationDirectory%
pause
