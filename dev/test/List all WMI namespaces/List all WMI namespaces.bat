@echo off

set PS_SCRIPT=%TMP%\list_namespaces.ps1


(
echo Function Get-WmiNamespace {
echo     Param ^(
echo         $Namespace='root'
echo     ^)
echo     Get-WmiObject -Namespace $Namespace -Class __NAMESPACE ^| ForEach-Object {
echo             ^($ns = '{0}\{1}' -f $_.__NAMESPACE,$_.Name^)
echo             Get-WmiNamespace $ns
echo     }
echo }
echo Get-WmiNamespace
) > %PS_SCRIPT%

powershell -file %PS_SCRIPT%

del %PS_SCRIPT%