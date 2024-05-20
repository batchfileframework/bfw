@echo off

:QuickEditOFF
powershell -command "Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class QEOFF{[DllImport(\"kernel32.dll\")]private static extern IntPtr GetStdHandle(int nStdHandle);[DllImport(\"kernel32.dll\")]private static extern bool GetConsoleMode(IntPtr hConsoleHandle,out uint lpMode);[DllImport(\"kernel32.dll\")]private static extern bool SetConsoleMode(IntPtr hConsoleHandle, uint dwMode);public static void QuickEditOFF(){IntPtr hConIn=GetStdHandle(-10);uint dwOldMode;if(GetConsoleMode(hConIn,out dwOldMode)){SetConsoleMode(hConIn,(uint)((dwOldMode|0x80)&~0x40));}}}';[QEOFF]::QuickEditOFF()"
GoTo :EOF
