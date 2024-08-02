@echo off

:GetConsoleHandle
set "GetConsoleHandle_OutputVar=%~1"
if not defined GetConsoleHandle_OutputVar set "GetConsoleHandle_OutputVar=console.handle"
for /f "tokens=1" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class ConsoleAPI { [DllImport(\"kernel32.dll\", SetLastError=true)] public static extern IntPtr GetConsoleWindow(); }'; Write-Host ([ConsoleAPI]::GetConsoleWindow())"') do ( set "%GetConsoleHandle_OutputVar%=%%a" )
set "GetConsoleHandle_OutputVar="
GoTo :EOF
