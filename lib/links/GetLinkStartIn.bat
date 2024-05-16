@echo off

::Usage Call :GetLinkStartIn PathToLNK optional OutputVar
:GetLinkStartIn
for /f "tokens=*" %%a in ('powershell -command "$lnkFilePath = '%~1'; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); Write-Output $shortcut.WorkingDirectory"') do ( if "[%~2]" NEQ "[]" ( set "%~2=%%a" ) else ( echo %%a ) )
GoTo :EOF

