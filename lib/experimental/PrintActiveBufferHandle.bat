@echo off

:PrintActiveBufferHandle
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class ConsoleAPI { [DllImport(\"kernel32.dll\", SetLastError=true)] public static extern IntPtr GetStdHandle(int nStdHandle); }'; $STD_OUTPUT_HANDLE=-11; Write-Host ([ConsoleAPI]::GetStdHandle($STD_OUTPUT_HANDLE))"
GoTo :EOF
