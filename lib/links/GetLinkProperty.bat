@echo off

:: Usage: Call :GetLinkProperty PathToLink ( one of TargetPath WorkingDirectory Arguments Description Hotkey IconLocation WindowStyle  )  optional ReturnVariable
:GetLinkProperty
for /f "tokens=*" %%a in ('powershell -command "$lnkFilePath = '%~1'; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); Write-Output $shortcut.%~2"') do ( if "[%~3]" NEQ "[]" ( set "%~3=%%a" ) else ( echo %%a ) )
Goto :EOF
