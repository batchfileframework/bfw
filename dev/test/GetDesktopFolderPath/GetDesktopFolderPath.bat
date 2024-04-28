@echo off

Call :GetDesktopFolderPath DesktopPath

echo Desktop folder path is %DesktopPath%

pause

GoTo :EOF

:GetDesktopFolderPath
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO ( SET "%1=%%f" )
GoTo :EOF