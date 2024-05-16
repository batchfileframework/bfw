@echo off

:: Usage: Call :GetLinkPropertiesNames PathToLink 
:GetLinkPropertiesNames
for /f "tokens=1,* delims=*" %%a in ('powershell -command "$lnkFilePath = \"%~1\"; $shell = New-Object -ComObject Shell.Application; $folder = $shell.Namespace((Get-Item $lnkFilePath).DirectoryName); $link = $folder.ParseName((Get-Item $lnkFilePath).Name); for ($i = 0; $i -lt 266; $i++) { $propertyName = $folder.GetDetailsOf($folder.Items, $i); $propertyValue = $folder.GetDetailsOf($link, $i); if ($propertyName -and $propertyValue) { -join \"$propertyName*$propertyValue\" } }"') do echo %%a
Goto :EOF
