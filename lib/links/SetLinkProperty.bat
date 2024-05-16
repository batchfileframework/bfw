@echo off

:: Usage: Call :SetLinkProperty PathToLink ( one of TargetPath WorkingDirectory Arguments Description Hotkey IconLocation WindowStyle  )  Value
:SetLinkProperty
powershell -command "$lnkFilePath = '%~1'; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); $shortcut.%~2 = '%~3'; $shortcut.Save()"
Goto :EOF

REM powershell -command "$lnkFilePath = '%~1'; $propertyName = '%~2'; $value = '%~3'; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); if ($propertyName -eq 'WorkingDirectory') { $shortcut.WorkingDirectory = $value } elseif ($propertyName -eq 'TargetPath') { $shortcut.TargetPath = $value } elseif ($propertyName -eq 'Arguments') { $shortcut.Arguments = $value } elseif ($propertyName -eq 'Description') { $shortcut.Description = $value } elseif ($propertyName -eq 'IconLocation') { $shortcut.IconLocation = $value } elseif ($propertyName -eq 'Hotkey') { $shortcut.Hotkey = $value } elseif ($propertyName -eq 'WindowStyle') { $shortcut.WindowStyle = [int]$value } $shortcut.Save()"
REM Goto :EOF



