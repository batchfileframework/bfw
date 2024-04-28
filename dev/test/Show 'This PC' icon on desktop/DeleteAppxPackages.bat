
::Usage Call :DeleteAppxPackages PackageList
:DeleteAppxPackages
if not "[%~1]"=="[]" powershell -Command "Remove-AppxPackage -Package '%~1'"
call echo %%%~1.ubound%%
call set "_DeleteAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_DeleteAppxPackages_PackageList_ubound=%]"="[]" GoTo :EOF
set /a _DeleteAppxPackages_index=0
:DeleteAppxPackages-internal-loop
call echo call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
set /a _DeleteAppxPackages_index+=1
if %_DeleteAppxPackages_index% LEQ %_DeleteAppxPackages_PackageList_ubound% GoTo :DeleteAppxPackages-internal-loop
GoTo :EOF

