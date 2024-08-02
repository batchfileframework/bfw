@echo off

:PrintConsoleHandle
set "PrintConsoleHandle_OutputVar=%~1"
if not defined PrintConsoleHandle_OutputVar set "PrintConsoleHandle_OutputVar=console.handle"
for /f "tokens=1" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class ConsoleAPI { [DllImport(\"kernel32.dll\", SetLastError=true)] public static extern IntPtr GetConsoleWindow(); }'; Write-Host ([ConsoleAPI]::GetConsoleWindow())"') do ( echo "%PrintConsoleHandle_OutputVar%=%%a" )
set "PrintConsoleHandle_OutputVar="
GoTo :EOF
