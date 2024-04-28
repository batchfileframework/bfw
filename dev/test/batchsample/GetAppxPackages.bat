
::Usage Call :GetAppxPackages
:GetAppxPackages
Call :ClearVariablesByPrefix AppxPackages
set /a "AppxPackages.lbound=0"
set /a "AppxPackages.ubound=0"
set /a "AppxPackages.count=0"
for /f "tokens=1-24 delims=|" %%a in ('powershell -Command "$i = 0; Get-AppxPackage -AllUsers | ForEach-Object { (&{ if ($_.GetHashCode().ToString()) { $_.GetHashCode().ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.GetType()) { $_.GetType() } else { 'NoValue' } }) + '|' + (&{ if ($_.ToString()) { $_.ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.Architecture) { $_.Architecture } else { 'NoValue' } }) + '|' + (&{ if ($_.Dependencies) { $_.Dependencies } else { 'NoDependencies' } }) + '|' + (&{ if ($_.InstallLocation) { $_.InstallLocation } else { 'NoValue' } }) + '|' + (&{ if ($_.IsBundle) { $_.IsBundle } else { 'NoValue' } }) + '|' + (&{ if ($_.IsDevelopmentMode) { $_.IsDevelopmentMode } else { 'NoValue' } }) + '|' + (&{ if ($_.IsFramework) { $_.IsFramework } else { 'NoValue' } }) + '|' + (&{ if ($_.IsPartiallyStaged) { $_.IsPartiallyStaged } else { 'NoValue' } }) + '|' + (&{ if ($_.IsResourcePackage) { $_.IsResourcePackage } else { 'NoValue' } }) + '|' + (&{ if ($_.Name) { $_.Name } else { 'NoValue' } }) + '|' + (&{ if ($_.NonRemovable) { $_.NonRemovable } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFamilyName) { $_.PackageFamilyName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFullName) { $_.PackageFullName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageUserInformation) { $_.PackageUserInformation } else { 'NoValue' } }) + '|' + (&{ if ($_.Publisher) { $_.Publisher } else { 'NoValue' } }) + '|' + (&{ if ($_.PublisherId) { $_.PublisherId } else { 'NoValue' } }) + '|' + (&{ if ($_.ResourceId) { $_.ResourceId } else { 'NoValue' } }) + '|' + (&{ if ($_.SignatureKind) { $_.SignatureKind } else { 'NoValue' } }) + '|' + (&{ if ($_.Status) { $_.Status } else { 'NoValue' } }) + '|' + (&{ if ($_.Version) { $_.Version } else { 'NoValue' } }) + '|' + $i++ }"') do (
set "AppxPackages[%%w].GetHashCode=%%a"
set "AppxPackages[%%w].GetType=%%b"
set "AppxPackages[%%w].ToString=%%c"
set "AppxPackages[%%w].Architecture=%%d"
set "AppxPackages[%%w].Dependencies=%%e"
set "AppxPackages[%%w].InstallLocation=%%f"
set "AppxPackages[%%w].IsBundle=%%g"
set "AppxPackages[%%w].IsDevelopmentMode=%%h"
set "AppxPackages[%%w].IsFramework=%%i"
set "AppxPackages[%%w].IsPartiallyStaged=%%j"
set "AppxPackages[%%w].IsResourcePackage=%%k"
set "AppxPackages[%%w].Name=%%l"
set "AppxPackages[%%w].NonRemovable=%%m"
set "AppxPackages[%%w].PackageFamilyName=%%n"
set "AppxPackages[%%w].PackageFullName=%%o"
set "AppxPackages[%%w].PackageUserInformation=%%p"
set "AppxPackages[%%w].Publisher=%%q"
set "AppxPackages[%%w].PublisherId=%%r"
set "AppxPackages[%%w].ResourceId=%%s"
set "AppxPackages[%%w].SignatureKind=%%t"
set "AppxPackages[%%w].Status=%%u"
set "AppxPackages[%%w].Version=%%v"
set "AppxPackages.ubound=%%w"
)
set /a "AppxPackages.count=%AppxPackages.ubound%+1"
GoTo :EOF

