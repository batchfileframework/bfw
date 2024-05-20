@echo off

:QuickEditON
powershell -command "Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class QEON{[DllImport(\"kernel32.dll\")]private static extern IntPtr GetStdHandle(int nStdHandle);[DllImport(\"kernel32.dll\")]private static extern bool GetConsoleMode(IntPtr hConsoleHandle,out uint lpMode);[DllImport(\"kernel32.dll\")]private static extern bool SetConsoleMode(IntPtr hConsoleHandle, uint dwMode);  public static void QuickEditON(){IntPtr hConIn=GetStdHandle(-10);uint dwOldMode;if(GetConsoleMode(hConIn,out dwOldMode)){SetConsoleMode(hConIn,dwOldMode|0xC0);}}}';[QEON]::QuickEditON()"
GoTo :EOF
