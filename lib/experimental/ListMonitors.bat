@echo off

:ListMonitors
REM for /f "tokens=1,* delims=*" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"$_.Name=$_.Value\" } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne ''CimInstanceProperties'') { ''$($_.Name)=$($_.Value)'' } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne ''CimInstanceProperties'') { \"\"$($_.Name)=$($_.Value)\"\" } } } "') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne \"CimInstanceProperties\") { \"\"$($_.Name)=$($_.Value)\"\" } } } "') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne ''CimInstanceProperties'') { \"\"$($_.Name)=$($_.Value)\"\" } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne \"CimInstanceProperties\") { \"\"$($_.Name)=$($_.Value)\"\" } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne ''CimInstanceProperties'') { ''$($_.Name)=$($_.Value)'' }}}"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne ''CimInstanceProperties'') { if ($_.Value -is [System.Array]) { ''$($_.Name)=''+($_.Value -join '' '')+'' } else { ''$($_.Name)=$($_.Value)'' } } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne ''CimInstanceProperties'') { if ($_.Value -is [System.Array]) { ''$($_.Name)=''+($_.Value -join '' '')+'' } else { ''$($_.Name)=$($_.Value)'' } } }}"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"$($_.Name)=$($_.Value)\" }}}"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"\"$($_.Name)=$($_.Value)\"\" } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Invoke-Expression \"Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \\\"$($_.Name)=$($_.Value)\\\" } } }\""') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "tokens=1,* delims==" %%a in ('powershell -command "Invoke-Expression \"Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \\\"$($_.Name)=$($_.Value)\\\" } } }\""') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "usebackq tokens=1,* delims==" %%a in (`powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { '^"$($_.Name)=$($_.Value)'^" } } }"`) do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "usebackq tokens=1,* delims==" %%a in (`powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { ^"$($_.Name)=$($_.Value)^" } } }"`) do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
REM for /f "usebackq tokens=1,* delims==" %%a in (`powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"\$($_.Name)=$($_.Value)\" } } }"`) do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
for /f "usebackq tokens=1,* delims==" %%a in (`powershell -Command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID ^| ForEach-Object { $_.PSObject.Properties ^| ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"^"$($_.Name)=$($_.Value)^"\" } } }"`) do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )



REM for /f "tokens=1,* delims=*" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"$($_.Name)=$($_.Value)\" } } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
                                      

REM for /f "tokens=1,* delims=*" %%a in ('powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne \"CimInstanceProperties\") { \"$($_.Name)*$($_.Value)\" }}}"') do echo %%aET%%b    if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )

GoTo :EOF 
REM powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | Format-List *"
powershell -command "Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object { $_.PSObject.Properties | ForEach-Object { if ($_.Name -ne 'CimInstanceProperties') { \"$($_.Name)=$($_.Value)\" }}}"
powershell -command "Get-WmiObject -Namespace root\wmi -Class WmiMonitorBasicDisplayParams | Format-List *"
powershell -command "Get-WmiObject -Namespace root\wmi -Class WmiMonitorDescriptorMethods | Format-List *"
powershell -command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Screen]::AllScreens | ForEach-Object { $_ | Format-List * }"
powershell -command "Get-WmiObject Win32_DesktopMonitor | Format-List *"
powershell -command "$monitors = Get-WmiObject -Namespace root\wmi -Class WmiMonitorDescriptorMethods;foreach ($monitor in $monitors) { $edidData = $monitor.WmiGetMonitorRawEEdidV1Block(0); if ($edidData) { if ($edidData.BlockContent) { $edidArray = $edidData.BlockContent; $edidString = [System.BitConverter]::ToString($edidArray); Write-Output $edidString; } else { Write-Output 'No EDID block content found'; } } else { Write-Output 'No EDID data found'; }}"





GoTo :EOF



:: Usage: Call :GetLinkProperties PathToLink [OutputObject]
:GetLinkProperties
for /f "tokens=1,* delims=*" %%a in ('powershell -command "$lnkFilePath = \"%~1\"; $shell = New-Object -ComObject Shell.Application; $folder = $shell.Namespace((Get-Item $lnkFilePath).DirectoryName); $link = $folder.ParseName((Get-Item $lnkFilePath).Name); for ($i = 0; $i -lt 266; $i++) { $propertyName = $folder.GetDetailsOf($folder.Items, $i); $propertyValue = $folder.GetDetailsOf($link, $i); if ($propertyName -and $propertyValue) { -join \"$propertyName*$propertyValue\" } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
for /f "tokens=1,* delims=*" %%a in ('powershell -command "$lnkFilePath = \"%~1\"; $wsh = New-Object -ComObject WScript.Shell; $shortcut = $wsh.CreateShortcut($lnkFilePath); [PSCustomObject]@{ TargetPath = $shortcut.TargetPath; WorkingDirectory = $shortcut.WorkingDirectory; Arguments = $shortcut.Arguments; Description = $shortcut.Description; Hotkey = $shortcut.Hotkey; IconLocation = $shortcut.IconLocation; WindowStyle = $shortcut.WindowStyle } | ForEach-Object { $_.PSObject.Properties | ForEach-Object { \"{0}*{1}\" -f $_.Name, $_.Value } }"') do if "[%~2]" NEQ "[]" ( set "%~2.%%a=%%b" ) else ( echo %%a:%%b )
Goto :EOF