@echo off
echo Checking for administrative privileges...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative privileges detected.
) else (
    echo Acquiring administrative privileges...
    set "params=%*"
    set params=%params:"=\"%
    set "batchPath=%~f0"
	echo /user:%userdomain%\%username% %batchPath% %params%
    runas /user:%userdomain%\%username% "%batchPath% %params%"
    exit
)


net session >nul 2>&1
if %errorLevel% == 0 (
	echo Your batch file has administrative privileges.
) else (
	echo Your batch file does not have administrative privileges.
)
echo Command line arguments: %*

pause
