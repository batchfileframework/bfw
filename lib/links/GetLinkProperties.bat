@echo off

:: Usage: Call :GetLinkProperties PathToLink [OutputObject]
:GetLinkProperties
for /f "tokens=1,* delims=*" %%a in ('powershell -command "$lnkFilePath = \"%~1\"; $shell = New-Object -ComObject Shell.Application; $folder = $shell.Namespace((Get-Item $lnkFilePath).DirectoryName); $link = $folder.ParseName((Get-Item $lnkFilePath).Name); for ($i = 0; $i -lt 266; $i++) { $propertyName = $folder.GetDetailsOf($folder.Items, $i); $propertyValue = $folder.GetDetailsOf($link, $i); if ($propertyName -and $propertyValue) { -join \"$propertyName*$propertyValue\" } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
for /f "tokens=1,* delims=*" %%a in ('powershell -command "$lnkFilePath = \"%~1\"; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); [PSCustomObject]@{ TargetPath = $shortcut.TargetPath; WorkingDirectory = $shortcut.WorkingDirectory; Arguments = $shortcut.Arguments; Description = $shortcut.Description; Hotkey = $shortcut.Hotkey; IconLocation = $shortcut.IconLocation; WindowStyle = $shortcut.WindowStyle } | ForEach-Object { $_.PSObject.Properties | ForEach-Object { \"{0}*{1}\" -f $_.Name, $_.Value } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
Goto :EOF
