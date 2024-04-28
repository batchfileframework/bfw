
::Usage Call :InstallAppxPackages PackageList
:InstallAppxPackages
REM if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -Package '%~1'"
echo powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
REM call echo %%%~1.ubound%% REM weird \Program Files\WindowsApps\Microsoft.Winget.Source_2023.515.1421.333_neutral__8wekyb3d8bbwe.ubound
call set "_InstallAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_InstallAppxPackages_PackageList_ubound=%]"=="[]" GoTo :EOF
set /a _InstallAppxPackages_index=0
:InstallAppxPackages-internal-loop
call echo call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
set /a _InstallAppxPackages_index+=1
if %_InstallAppxPackages_index% LEQ %_InstallAppxPackages_PackageList_ubound% GoTo :InstallAppxPackages-internal-loop
GoTo :EOF

