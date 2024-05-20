@echo off

:PrintQuickEdit
powershell -command "Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class QuickEditStatus{[DllImport(\"kernel32.dll\")]private static extern IntPtr GetStdHandle(int nStdHandle);[DllImport(\"kernel32.dll\")]private static extern bool GetConsoleMode(IntPtr hConsoleHandle,out uint lpMode);public static void PrintQuickEdit(){IntPtr hConIn=GetStdHandle(-10);uint dwOldMode;if(GetConsoleMode(hConIn,out dwOldMode)){if((dwOldMode & 0x40) != 0){System.Console.WriteLine(\"quickedit=true\");System.Environment.Exit(0);}else{System.Console.WriteLine(\"quickedit=false\");System.Environment.Exit(1);}}else{System.Console.WriteLine(\"Failed to get console mode.\");System.Environment.Exit(1);}}}';[QuickEditStatus]::PrintQuickEdit()"
GoTo :EOF
