@echo off 

::Usage Call :SetLinkStartIn PathToLNK NewStartInPath
:SetLinkStartIn
powershell -command "$lnkFilePath = '%~1'; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); $shortcut.WorkingDirectory = '%~2'; $shortcut.Save()"
Goto :EOF
