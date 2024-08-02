@echo off

:GetActiveBufferHandle
set "GetActiveBufferHandle_output=%~1"
if not defined GetActiveBufferHandle_output set "GetActiveBufferHandle_output=console.buffer.active"
for /f "tokens=1" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class ConsoleAPI { [DllImport(\"kernel32.dll\", SetLastError=true)] public static extern IntPtr GetStdHandle(int nStdHandle); }'; $STD_OUTPUT_HANDLE=-11; Write-Host ([ConsoleAPI]::GetStdHandle($STD_OUTPUT_HANDLE))"') do ( set "%GetActiveBufferHandle_output%=%%a" )
set "GetActiveBufferHandle_output="
GoTo :EOF
