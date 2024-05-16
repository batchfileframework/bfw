
::Usage Call :CreateShortcut FileOrigin ShortcutFile
:CreateShortcut 
echo powershell -ExecutionPolicy Bypass -NoLogo -NonInteractive -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%~2'); $S.TargetPath = '%~1'; $S.Save()"
powershell -ExecutionPolicy Bypass -NoLogo -NonInteractive -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%~2'); $S.TargetPath = '%~1'; $S.Save()"
GoTo :EOF
