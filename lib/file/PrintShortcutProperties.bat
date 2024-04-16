
:: Usage Call :PrintShortcutProperties "ShortcutFile"
:PrintShortcutProperties
powershell -ExecutionPolicy Bypass -NoLogo -NonInteractive -Command "$shortcutPath = '%~1'; $shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut($shortcutPath); Write-Output ('Target Path: ' + $shortcut.TargetPath); Write-Output ('Working Directory: ' + $shortcut.WorkingDirectory); Write-Output ('Arguments: ' + $shortcut.Arguments); Write-Output ('Description: ' + $shortcut.Description); Write-Output ('Hotkey: ' + $shortcut.Hotkey); Write-Output ('Icon Location: ' + $shortcut.IconLocation); Write-Output ('Window Style: ' + $shortcut.WindowStyle); Write-Output ('Relative Path: ' + $shortcut.RelativePath);"
GoTo :EOF

