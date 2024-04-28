
::Usage Call :ListAppxPackagesByInstallStatus optional ArrayName
:: Will print a list of installed packages
:: Or instead return an array of the packages if optional ArrayName is supplied
:ListAppxPackagesByInstallStatus
Call :GetAppxPackages
GoTo :EOF

