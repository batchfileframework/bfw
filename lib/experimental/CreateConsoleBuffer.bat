@echo off

:CreateConsoleBuffer
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class ConsoleAPI { [DllImport(\"kernel32.dll\", SetLastError=true)] public static extern IntPtr CreateConsoleScreenBuffer(uint dwDesiredAccess, uint dwShareMode, IntPtr lpSecurityAttributes, uint dwFlags, IntPtr lpScreenBufferData); }'; $FILE_SHARE_READ=0x1; $FILE_SHARE_WRITE=0x2; $CONSOLE_TEXTMODE_BUFFER=1; $bufferHandle = [ConsoleAPI]::CreateConsoleScreenBuffer([BitConverter]::ToUInt32([BitConverter]::GetBytes(0xC0000000), 0), $FILE_SHARE_READ -bor $FILE_SHARE_WRITE, [IntPtr]::Zero, $CONSOLE_TEXTMODE_BUFFER, [IntPtr]::Zero); Write-Host $bufferHandle"
GoTo :EOF
