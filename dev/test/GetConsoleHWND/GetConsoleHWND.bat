@echo off
:setup
:main
REM Call :GetConsoleAndPrintTitle-quick-DEMO
REM Call :GetConsoleAndPrintTitle-DEMO
REM Call :PrintWindowClientRectFromHWND-DEMO
REM call :PrintWindowRectangleFromHWND-DEMO
REM Call :IfInStr-DEMO
REM Call :Concatenate-DEMO
REM call :Concatenate-mini-DEMO
Call :SetEllipseWindow-DEMO
REM Call :DrawOnConsole-test
REM Call :PSReadFromEnvironementVariable
REM call :EscapeSequenceTest
GoTo :EOF

:GetConsoleAndPrintTitle-quick-DEMO

echo title of this console is 
Call :GetConsolehWND _myHWND
Call :PrintWindowTitleFromHWND %_myHWND%

GoTo :EOF

:GetConsoleAndPrintTitle-DEMO

echo.&echo Obtaining this console window's hWND (window handle pointer)

Call :GetConsolehWND

echo hWND from return value is %errorlevel%

Call :GetConsolehWND _myHWND

echo hWND from output value is %_myHWND%

echo.&echo Obtaining the Window Title of this console, hWND=%_myHWND%, using :GetWindowTitleFromHWND

Call :GetWindowTitleFromHWND %_myHWND% _myTitleOutput

echo Title of this console is %_myTitleOutput%

echo.&echo Using :PrintWindowTitleFromHWND, Title of this console is
Call :PrintWindowTitleFromHWND %_myHWND% _myTitleOutput2
echo Title of this console from PrintWindowTitleFromHWND's output value is %_myTitleOutput2%

GoTo :EOF

:PrintWindowClientRectFromHWND-DEMO
Call :GetConsolehWND
Call :PrintWindowClientRectFromHWND %errorlevel%

GoTo :EOF



for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition '
using System; 
using System.Runtime.InteropServices; 
public class ConsoleWnd { [DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow();
 }'; 
 [ConsoleWnd]::GetConsoleWindow()
 "'
 
 ) do if "[%~1]" NEQ "[]" ( set "%~1=%%a" & exit /b %%a ) else ( exit /b %%a )


'powershell -command "Add-Type -TypeDefinition '
using System;
using System.Runtime.InteropServices;
public class NativeMethods {
[DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll", SetLastError = true)] public static extern IntPtr GetDC(IntPtr hWnd);
[DllImport("user32.dll")] public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC);
[DllImport("gdi32.dll")] public static extern IntPtr CreateSolidBrush(int crColor);
[DllImport("gdi32.dll")] public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);
[DllImport("gdi32.dll")] public static extern IntPtr SelectObject(IntPtr hdc, IntPtr h);
[DllImport("gdi32.dll", SetLastError = true)] public static extern bool DeleteObject(IntPtr ho);
}';
$hWndConsole = [NativeMethods]::GetConsoleWindow();
$hDC = [NativeMethods]::GetDC($hWndConsole);
$redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF);
$oldBrush = [NativeMethods]::SelectObject($hDC, $redBrush);
[NativeMethods]::Ellipse($hDC, 0, 0, 100, 100);
[NativeMethods]::SelectObject($hDC, $oldBrush);
[NativeMethods]::DeleteObject($redBrush);
[NativeMethods]::ReleaseDC([IntPtr]::Zero, $hDC);
"'

:DrawOnConsole-test
for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class NativeMethods { [DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow(); [DllImport(\"user32.dll\", SetLastError = true)] public static extern IntPtr GetDC(IntPtr hWnd); [DllImport(\"user32.dll\")] public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC); [DllImport(\"gdi32.dll\")] public static extern IntPtr CreateSolidBrush(int crColor); [DllImport(\"gdi32.dll\")] public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect); [DllImport(\"gdi32.dll\")] public static extern IntPtr SelectObject(IntPtr hdc, IntPtr h); [DllImport(\"gdi32.dll\", SetLastError = true)] public static extern bool DeleteObject(IntPtr ho); }'; $hWndConsole = [NativeMethods]::GetConsoleWindow(); $hDC = [NativeMethods]::GetDC($hWndConsole); $redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF); $oldBrush = [NativeMethods]::SelectObject($hDC, $redBrush); [NativeMethods]::Ellipse($hDC, 0, 0, 100, 100); [NativeMethods]::SelectObject($hDC, $oldBrush); [NativeMethods]::DeleteObject($redBrush); [NativeMethods]::ReleaseDC([IntPtr]::Zero, $hDC);"') do break

REM for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public static class NativeMethods { [DllImport(\"user32.dll\", SetLastError = true)] public static extern IntPtr GetDC(IntPtr hWnd); [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC); [DllImport(\"gdi32.dll\")] public static extern IntPtr CreateSolidBrush(int crColor); [DllImport(\"gdi32.dll\", SetLastError = true)] public static extern bool DeleteObject(IntPtr hObject); [DllImport(\"gdi32.dll\")] public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect); [DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow(); [DllImport(\"user32.dll\", SetLastError = true)] public static extern IntPtr SetWindowsHookEx(int idHook, LowLevelProc lpfn, IntPtr hMod, uint dwThreadId); [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool UnhookWindowsHookEx(IntPtr hhk); [DllImport(\"user32.dll\")] public static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam); public delegate IntPtr LowLevelProc(int nCode, IntPtr wParam, IntPtr lParam); public const int WH_CALLWNDPROCRET = 12; public const int WM_PAINT = 0x000F; }; $windowProc = [NativeMethods+LowLevelProc] { param([int]$nCode, [IntPtr]$wParam, [IntPtr]$lParam); if ($nCode >= 0) { $message = [System.Runtime.InteropServices.Marshal]::PtrToStructure($lParam, [System.Windows.Forms.Message]); if ($message.Msg -eq [NativeMethods]::WM_PAINT) { $hWndConsole = [NativeMethods]::GetConsoleWindow();$hDC = [NativeMethods]::GetDC($hWndConsole); $redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF); [NativeMethods]::Ellipse($hDC, 0, 0, 100, 100); [NativeMethods]::ReleaseDC($hWndConsole, $hDC); [NativeMethods]::DeleteObject($redBrush); }; }; return [NativeMethods]::CallNextHookEx([IntPtr]::Zero, $nCode, $wParam, $lParam); }; $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $windowProc, [IntPtr]::Zero, [System.Diagnostics.Process]::GetCurrentProcess().Id); Write-Host \"Press Enter to exit...\"; $null = $host.UI.RawUI.ReadKey(\"NoEcho,IncludeKeyDown\"); [NativeMethods]::UnhookWindowsHookEx($hookId);"') do echo %%a
REM for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; Using System.Windows.Forms.dll; public static class NativeMethods { [DllImport(\"user32.dll\", SetLastError = true)] public static extern IntPtr GetDC(IntPtr hWnd); [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC); [DllImport(\"gdi32.dll\")] public static extern IntPtr CreateSolidBrush(int crColor); [DllImport(\"gdi32.dll\", SetLastError = true)] public static extern bool DeleteObject(IntPtr hObject); [DllImport(\"gdi32.dll\")] public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect); [DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow(); [DllImport(\"user32.dll\", SetLastError = true)] public static extern IntPtr SetWindowsHookEx(int idHook, LowLevelProc lpfn, IntPtr hMod, uint dwThreadId); [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool UnhookWindowsHookEx(IntPtr hhk); [DllImport(\"user32.dll\")] public static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam); public delegate IntPtr LowLevelProc(int nCode, IntPtr wParam, IntPtr lParam); public const int WH_CALLWNDPROCRET = 12; public const int WM_PAINT = 0x000F; }; $windowProc = [NativeMethods+LowLevelProc] { param([int]$nCode, [IntPtr]$wParam, [IntPtr]$lParam); if ($nCode -ge 0) { $message = [System.Runtime.InteropServices.Marshal]::PtrToStructure($lParam, [System.Windows.Forms.Message]); if ($message.Msg -eq [NativeMethods]::WM_PAINT) { $hWndConsole = [NativeMethods]::GetConsoleWindow(); $hDC = [NativeMethods]::GetDC($hWndConsole); $redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF); [NativeMethods]::Ellipse($hDC, 0, 0, 100, 100); [NativeMethods]::ReleaseDC($hWndConsole, $hDC); [NativeMethods]::DeleteObject($redBrush); }; }; return [NativeMethods]::CallNextHookEx([IntPtr]::Zero, $nCode, $wParam, $lParam); }; $hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $windowProc, [IntPtr]::Zero, [System.Diagnostics.Process]::GetCurrentProcess().Id); Write-Host \"Press Enter to exit...\"; $null = $host.UI.RawUI.ReadKey(\"NoEcho,IncludeKeyDown\"); [NativeMethods]::UnhookWindowsHookEx($hookId);"') do echo %%a

GoTo :EOF

:PSReadFromEnvironementVariable
set foo=a
REM set bar=write-host test;
set bar=$env:foo -or 0;
REM set fff=[int]::TryParse($myVariable, [ref]$null) ? $myVariable : 0 | Write-Output
REM for /f "tokens=*" %%a in ( 'powershell -command "$Env:Foo += '!'; $Env:Foo; iex $env:bar"' ) do echo %%a
REM set bar=[int]::TryParse($env:foo, [ref]$parsedValue) ? $parsedValue : 0 | Write-Output

for /f "tokens=*" %%a in ( 'powershell -command "iex $Env:bar"' ) do echo %%a
GoTo :EOF

:PowershellRunFromArray




GoTo :EOF
# Ensure lbound and ubound are defined and are numeric
if (![int]::TryParse($env:lbound, [ref]$lbound) -or ![int]::TryParse($env:ubound, [ref]$ubound)) {
    Write-Host "lbound and/or ubound environment variables are not properly defined or are not numeric."
    exit
}

# Loop through the range
for ($i = $lbound; $i -le $ubound; $i++) {
    Write-Host "test $i"
}


for /f "tokens=*" %%a in ( 'powershell -command "$Env:Foo += '!'; $Env:Foo; iex $env:bar"' ) do echo %%a


GoTo :EOF


:EscapeSequenceTest
echo|set /p="[?25l"         REM Hide cursor
echo|set /p="[3A"          REM Move the cursor up 3 lines
echo|set /p="Your text here" REM Print your text
echo|set /p="[?25h"         REM Show cursor
GoTo :EOF

REM get hDC of desktop ?
REM $hDC = [NativeMethods]::GetDC([IntPtr]::Zero);

REM # Add the type definitions to the current session
REM Add-Type -TypeDefinition $TypeDef -Language CSharp

# Get the desktop's device context (null means desktop)
$hDC = [NativeMethods]::GetDC([IntPtr]::Zero)

# Create a red brush
$redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF) # 0x00BBGGRR

# Select the red brush into the device context
$oldBrush = [NativeMethods]::SelectObject($hDC, $redBrush)

# Draw a red ellipse
[NativeMethods]::Ellipse($hDC, 0, 0, 100, 100) # Draws an ellipse with 100x100 size at (0,0)

# Restore the old brush
[NativeMethods]::SelectObject($hDC, $oldBrush)

# Delete the red brush
[NativeMethods]::DeleteObject($redBrush)

# Release the device context
[NativeMethods]::ReleaseDC([IntPtr]::Zero, $hDC)







paint with callback


# Define native methods
Add-Type -TypeDefinition @"
using System; using System.Runtime.InteropServices; 
public static class NativeMethods { [DllImport("user32.dll", SetLastError = true)] public static extern IntPtr GetDC(IntPtr hWnd); [DllImport("user32.dll", SetLastError = true)] public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC); [DllImport("gdi32.dll")] public static extern IntPtr CreateSolidBrush(int crColor); [DllImport("gdi32.dll", SetLastError = true)] public static extern bool DeleteObject(IntPtr hObject); [DllImport("gdi32.dll")] public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect); [DllImport("kernel32.dll")] public static extern IntPtr GetConsoleWindow(); [DllImport("user32.dll", SetLastError = true)] public static extern IntPtr SetWindowsHookEx(int idHook, LowLevelProc lpfn, IntPtr hMod, uint dwThreadId); [DllImport("user32.dll", SetLastError = true)] public static extern bool UnhookWindowsHookEx(IntPtr hhk); [DllImport("user32.dll")] public static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam); public delegate IntPtr LowLevelProc(int nCode, IntPtr wParam, IntPtr lParam); public const int WH_CALLWNDPROCRET = 12; public const int WM_PAINT = 0x000F; };
$windowProc = [NativeMethods+LowLevelProc] { param([int]$nCode, [IntPtr]$wParam, [IntPtr]$lParam); if ($nCode -ge 0) { $message = [System.Runtime.InteropServices.Marshal]::PtrToStructure($lParam, [System.Windows.Forms.Message]); if ($message.Msg -eq [NativeMethods]::WM_PAINT) { $hWndConsole = [NativeMethods]::GetConsoleWindow(); $hDC = [NativeMethods]::GetDC($hWndConsole); $redBrush = [NativeMethods]::CreateSolidBrush(0x0000FF); [NativeMethods]::Ellipse($hDC, 0, 0, 100, 100); [NativeMethods]::ReleaseDC($hWndConsole, $hDC); [NativeMethods]::DeleteObject($redBrush); }; }; return [NativeMethods]::CallNextHookEx([IntPtr]::Zero, $nCode, $wParam, $lParam); };
$hookId = [NativeMethods]::SetWindowsHookEx([NativeMethods]::WH_CALLWNDPROCRET, $windowProc, [IntPtr]::Zero, [System.Diagnostics.Process]::GetCurrentProcess().Id); Write-Host "Press Enter to exit..."; $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown"); [NativeMethods]::UnhookWindowsHookEx($hookId);












::Usage Call :GetConsolehWND optional Output
:GetConsoleHWND
for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class ConsoleWnd { [DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow(); }'; [ConsoleWnd]::GetConsoleWindow()"') do if "[%~1]" NEQ "[]" ( set "%~1=%%a" & exit /b %%a ) else ( exit /b %%a )

::Usage Call :GetWindowTitleFromHWND WindowHWND TitleOutput
:GetWindowTitleFromHWND
for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; using System.Text; public class WindowTitle { [DllImport(\"user32.dll\", CharSet = CharSet.Auto, SetLastError = true)] public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpString, int nMaxCount); }'; $buffer = New-Object System.Text.StringBuilder 256; [WindowTitle]::GetWindowText([IntPtr]%~1, $buffer, 256) | Out-Null; $buffer.ToString()"') do ( set "%~2=%%a" )
GoTo :EOF

::Usage Call :PrintWindowTitleFromHWND WindowHWND optional TitleOutput
:PrintWindowTitleFromHWND
for /f "tokens=*" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; using System.Text; public class WindowTitle { [DllImport(\"user32.dll\", CharSet = CharSet.Auto, SetLastError = true)] public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpString, int nMaxCount); }'; $buffer = New-Object System.Text.StringBuilder 256; [WindowTitle]::GetWindowText([IntPtr]%~1, $buffer, 256) | Out-Null; $buffer.ToString()"') do ( echo %%a & if "[%~2]" NEQ "[]" set "%~2=%%a" )
GoTo :EOF

::Usage Call :PrintWindowClientRectFromHWND WindowHWND
:PrintWindowClientRectFromHWND
for /f "tokens=1,2" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } public class ClientRect { [DllImport(\"user32.dll\")] public static extern bool GetClientRect(IntPtr hWnd, out RECT lpRect); }'; $rc = New-Object RECT; [ClientRect]::GetClientRect([IntPtr]%~1, [ref]$rc) | Out-Null; \"$^($rc.right^), $^($rc.bottom^)\""') do ( echo width:%%a height:%%b  )
GoTo :EOF

:PrintWindowRectangleFromHWND-DEMO
Call :GetConsolehWND
Call :PrintWindowRectangleFromHWND %errorlevel%
GoTo :EOF

:PrintWindowRectangleFromHWND

if not defined PrintWindowRectangleFromHWND Call :BuildPrintWindowRectangleFromHWND
REM for /f "tokens=1-6" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } public class WindowPos { [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';  $rc = New-Object RECT; [WindowPos]::GetWindowRect([IntPtr]%~1, [ref]$rc) | Out-Null; \"$^($rc.left^), $^($rc.top^), $^($rc.right^), $^($rc.bottom^), $^($rc.right - $rc.left^) $^($rc.bottom - $rc.top^)\""') do ( 
for /f "tokens=1-6" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } public class WindowPos { [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';  $rc = New-Object RECT; [WindowPos]::GetWindowRect([IntPtr]%~1, [ref]$rc) | Out-Null; \"$^($rc.left^), $^($rc.top^), $^($rc.right^), $^($rc.bottom^), $^($rc.right - $rc.left^) $^($rc.bottom - $rc.top^)\""') do ( 
	echo left:%%a top:%%b right:%%c bottom:%%d width:%%e height:%%f 
	echo 
	echo                     top:%%b
	echo ------------------------+--------------------------right:%%c
	echo ^|                                                 ^|
	echo ^|                                                 ^|
	echo ^|                                                 ^|
	echo ^|left:%%a                                         ^| height:%%f
	echo ^|                                                 ^|
	echo ^|                                                 ^|
	echo ^|                   width:%%e                    ^|
	echo ------------------------+--------------------------
	echo                    bottom:%%d
	)
GoTo :EOF

:BuildPrintWindowRectangleFromHWND
set "_BuildPrintWindowRectangleFromHWND_prefix=_BPWRFH
Call :GetC#.using System System.Runtime.InteropServices
Call :GetC#.struct rect
Call :GetC#.import GetWindowRect
set "_BPWRFH.type[0]=%c#.using.System%"
set "_BPWRFH.type[1]=%c#.using.System.Runtime.InteropServices%"
set "_BPWRFH.type[2]=%c#.struct.rect%"
set /a "_BPWRFH.type.ubound=2"
set "_BPWRFH.class[0]=public class WindowPos {"
set "_BPWRFH.class[1]=%c#.imports.user32.GetWindowRect%"
set "_BPWRFH.class[2]=}"
set /a "_BPWRFH.class.ubound=2"
set "_BPWRFH.main[0]=$rc = New-Object RECT;  
set "_BPWRFH.main[1]=[WindowPos]::GetWindowRect([IntPtr]%~1, [ref]$rc) | Out-Null;
set "_BPWRFH.main[2]=\"$^($rc.left^), $^($rc.top^), $^($rc.right^), $^($rc.bottom^), $^($rc.right - $rc.left^) $^($rc.bottom - $rc.top^)\"
set /a "_BPWRFH.main.ubound=2"
GoTo :EOF


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

:GetC#.struct
set "_GetC#.struct_search=%~1"
Call :IfInStr _GetC#.struct_search BITMAPINFO 				&& set c#.struct.BITMAPINFO=[StructLayout(LayoutKind.Sequential)] public struct BITMAPINFO { public BITMAPINFOHEADER bmiHeader; [MarshalAs(UnmanagedType.ByValArray, SizeConst = 1)] public RGBQUAD[] bmiColors; }&::Defines the dimensions and color information for a DIB (Device Independent Bitmap).
Call :IfInStr _GetC#.struct_search BITMAPINFOHEADER 		&& set c#.struct.BITMAPINFOHEADER=[StructLayout(LayoutKind.Sequential)] public struct BITMAPINFOHEADER { public uint biSize; public int biWidth; public int biHeight; public ushort biPlanes; public ushort biBitCount; public uint biCompression; public uint biSizeImage; public int biXPelsPerMeter; public int biYPelsPerMeter; public uint biClrUsed; public uint biClrImportant; }&::Contains information about the dimensions and color format of a DIB.
Call :IfInStr _GetC#.struct_search COLORREF 				&& set c#.struct.COLORREF=[StructLayout(LayoutKind.Sequential)] public struct COLORREF { public uint ColorDWORD; }&::A 32-bit value used to specify an RGB color.
Call :IfInStr _GetC#.struct_search HARDWAREINPUT 			&& set c#.struct.HARDWAREINPUT=[StructLayout(LayoutKind.Sequential)] public struct HARDWAREINPUT { public uint uMsg; public ushort wParamL; public ushort wParamH; }&::Contains information about a simulated message generated by a hardware device other than a keyboard or mouse.
Call :IfInStr _GetC#.struct_search INPUT 					&& set c#.struct.INPUT=[StructLayout(LayoutKind.Explicit)] public struct INPUT { [FieldOffset(0)] public int type; [FieldOffset(4)] public MOUSEINPUT mi; [FieldOffset(4)] public KEYBDINPUT ki; [FieldOffset(4)] public HARDWAREINPUT hi; }&::Used by SendInput to store information for synthesizing input events (like keystrokes, mouse movement, and mouse clicks).
Call :IfInStr _GetC#.struct_search KEYBDINPUT 				&& set c#.struct.KEYBDINPUT=[StructLayout(LayoutKind.Sequential)] public struct KEYBDINPUT { public ushort wVk; public ushort wScan; public uint dwFlags; public uint time; public IntPtr dwExtraInfo; }&::Contains information about a simulated keyboard event.
Call :IfInStr _GetC#.struct_search LASTINPUTINFO 			&& set c#.struct.LASTINPUTINFO=[StructLayout(LayoutKind.Sequential)] public struct LASTINPUTINFO { public uint cbSize; public uint dwTime; }&::Contains the time of the last input event.
Call :IfInStr _GetC#.struct_search MENUITEMINFO 			&& set c#.struct.MENUITEMINFO=[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)] public struct MENUITEMINFO { public uint cbSize; public uint fMask; public uint fType; public uint fState; public uint wID; public IntPtr hSubMenu; public IntPtr hbmpChecked; public IntPtr hbmpUnchecked; public IntPtr dwItemData; [MarshalAs(UnmanagedType.LPTStr)] public string dwTypeData; public uint cch; public IntPtr hbmpItem; }&::Contains information about a menu item.
Call :IfInStr _GetC#.struct_search MONITORINFO 				&& set c#.struct.MONITORINFO=[StructLayout(LayoutKind.Sequential)] public struct MONITORINFO { public int cbSize; public RECT rcMonitor; public RECT rcWork; public uint dwFlags; }&::Contains information about a display monitor.
Call :IfInStr _GetC#.struct_search MOUSEINPUT 				&& set c#.struct.MOUSEINPUT=[StructLayout(LayoutKind.Sequential)] public struct MOUSEINPUT { public int dx; public int dy; public uint mouseData; public uint dwFlags; public uint time; public IntPtr dwExtraInfo; }&:: Contains information about a simulated mouse event.
Call :IfInStr _GetC#.struct_search MSG 						&& set c#.struct.MSG=[StructLayout(LayoutKind.Sequential)] public struct MSG { public IntPtr hwnd; public uint message; public IntPtr wParam; public IntPtr lParam; public uint time; public POINT pt; }&::Contains message information from a thread's message queue.
Call :IfInStr _GetC#.struct_search PAINTSTRUCT 				&& set c#.struct.PAINTSTRUCT=[StructLayout(LayoutKind.Sequential)] public struct PAINTSTRUCT { public IntPtr hdc; public bool fErase; public RECT rcPaint; public bool fRestore; public bool fIncUpdate; [MarshalAs(UnmanagedType.ByValArray, SizeConst=32)] public byte[] rgbReserved; }&::Contains information for an application. This information can be used to paint the client area of a window owned by that application.
Call :IfInStr _GetC#.struct_search POINT 					&& set c#.struct.POINT=[StructLayout(LayoutKind.Sequential)] public struct POINT { public int x; public int y; }&::Represents a point (x, y) in a two-dimensional space.
Call :IfInStr _GetC#.struct_search RECT 					&& set c#.struct.RECT=[StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; }&::Describes a rectangle by the coordinates of its upper-left and lower-right corners.
Call :IfInStr _GetC#.struct_search RGBQUAD 					&& set c#.struct.RGBQUAD=[StructLayout(LayoutKind.Sequential)] public struct RGBQUAD { public byte rgbBlue; public byte rgbGreen; public byte rgbRed; public byte rgbReserved;}&::Specifies the values for individual color elements.
Call :IfInStr _GetC#.struct_search SCROLLINFO 				&& set c#.struct.SCROLLINFO=[StructLayout(LayoutKind.Sequential)] public struct SCROLLINFO { public uint cbSize; public uint fMask; public int nMin; public int nMax; public uint nPage; public int nPos; public int nTrackPos; }&::Contains scroll bar parameters to be set by the SetScrollInfo function or retrieved by the GetScrollInfo function.
Call :IfInStr _GetC#.struct_search SIZE 					&& set c#.struct.SIZE=[StructLayout(LayoutKind.Sequential)] public struct SIZE { public int cx; public int cy; }&:: Defines the width and height of a rectangle or screen.
Call :IfInStr _GetC#.struct_search TRACKMOUSEEVENT 			&& set c#.struct.TRACKMOUSEEVENT=[StructLayout(LayoutKind.Sequential)] public struct TRACKMOUSEEVENT { public uint cbSize; public uint dwFlags; public IntPtr hwndTrack; public uint dwHoverTime; }&::Used to track the movement of the mouse cursor.
Call :IfInStr _GetC#.struct_search TRIVERTEX 				&& set c#.struct.TRIVERTEX=[StructLayout(LayoutKind.Sequential)] public struct TRIVERTEX { public int x; public int y; public ushort Red; public ushort Green; public ushort Blue; public ushort Alpha;}&:: Describes a color in terms of its x, y coordinates and its red, green, blue, and alpha intensities.
Call :IfInStr _GetC#.struct_search WINDOWINFO 				&& set c#.struct.WINDOWINFO=[StructLayout(LayoutKind.Sequential)] public struct WINDOWINFO { public uint cbSize; public RECT rcWindow; public RECT rcClient; public uint dwStyle; public uint dwExStyle; public uint dwWindowStatus; public uint cxWindowBorders; public uint cyWindowBorders; public ushort atomWindowType; public ushort wCreatorVersion; }&::Contains window information.
Call :IfInStr _GetC#.struct_search WINDOWPLACEMENT 			&& set c#.struct.WINDOWPLACEMENT=[StructLayout(LayoutKind.Sequential)] public struct WINDOWPLACEMENT { public int length; public int flags; public int showCmd; public POINT ptMinPosition; public POINT ptMaxPosition; public RECT rcNormalPosition; }&::Contains information about the placement of a window on the screen.
Call :IfInStr _GetC#.struct_search WNDCLASS 				&& set c#.struct.WNDCLASS=[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)] public struct WNDCLASS { public uint style; public IntPtr lpfnWndProc; public int cbClsExtra; public int cbWndExtra; public IntPtr hInstance; public IntPtr hIcon; public IntPtr hCursor; public IntPtr hbrBackground; [MarshalAs(UnmanagedType.LPWStr)] public string lpszMenuName; [MarshalAs(UnmanagedType.LPWStr)] public string lpszClassName; }&::Contains the window class attributes set by the RegisterClass function.


REM public delegate bool LineDDAProc(int X, int Y, IntPtr lpData);&:: Is a callback function used with the LineDDA function. It is called once for each pixel on the line defined by the LineDDA function.

if "[%~2]" NEQ "[]" shift & GoTo :GetC#.struct
set "_GetC#.struct_search="
GoTo :EOF

:GetC#Structs
GoTo :EOF

:GetC#Imports-user32.dll
GoTo :EOF

:GetC#Imports-gdi32.dll
GoTo :EOF

:GetC#.import
set "_GetC#.import_search=%~1"
REM USER32
Call :IfInStr _GetC#.import_search AdjustWindowRect 		&& set c#.imports.user32.AdjustWindowRect=[DllImport("user32.dll")] public static extern bool AdjustWindowRect(ref RECT lpRect, uint dwStyle, bool bMenu);&:: AdjustWindowRect - Calculates the required size of the window rectangle, based on the desired size of the client rectangle.
Call :IfInStr _GetC#.import_search BeginPaint 				&& set c#.imports.user32.BeginPaint=[DllImport("user32.dll")] public static extern IntPtr BeginPaint(IntPtr hWnd, out PAINTSTRUCT lpPaint);&:: BeginPaint and EndPaint - Prepares the window for painting and cleans up after painting.
Call :IfInStr _GetC#.import_search BringWindowToTop 		&& set c#.imports.user32.BringWindowToTop=[DllImport("user32.dll")] public static extern bool BringWindowToTop(IntPtr hWnd);&:: BringWindowToTop - Brings the specified window to the top of the Z order.
Call :IfInStr _GetC#.import_search ChildWindowFromPoint 	&& set c#.imports.user32.ChildWindowFromPoint=[DllImport("user32.dll")] public static extern IntPtr ChildWindowFromPoint(IntPtr hWndParent, POINT Point);&:: ChildWindowFromPoint - Determines which, if any, of the child windows belonging to a parent window contains the specified point.
Call :IfInStr _GetC#.import_search ClientToScreen 			&& set c#.imports.user32.ClientToScreen=[DllImport("user32.dll")] public static extern bool ClientToScreen(IntPtr hWnd, ref POINT lpPoint);&:: ScreenToClient & ClientToScreen - Convert screen coordinates to client area coordinates and vice versa.
Call :IfInStr _GetC#.import_search DrawEdge 				&& set c#.imports.user32.DrawEdge=[DllImport("user32.dll")] public static extern bool DrawEdge(IntPtr hdc, ref RECT qrc, uint edge, uint grfFlags);&:: DrawEdge - Draws one or more edges of rectangle.
Call :IfInStr _GetC#.import_search DrawText 				&& set c#.imports.user32.DrawText=[DllImport("user32.dll")] public static extern int DrawText(IntPtr hdc, string lpchText, int nCount, ref RECT lpRect, uint uFormat);&:: DrawText - Draws formatted text in the specified rectangle.
Call :IfInStr _GetC#.import_search EnableMenuItem 			&& set c#.imports.user32.EnableMenuItem=[DllImport("user32.dll")] public static extern bool EnableMenuItem(IntPtr hMenu, uint uIDEnableItem, uint uEnable);&:: EnableMenuItem - Changes the enabled, grayed, or checked state of a menu item.
Call :IfInStr _GetC#.import_search EnableWindow 			&& set c#.imports.user32.EnableWindow=[DllImport("user32.dll")] public static extern bool EnableWindow(IntPtr hWnd, bool bEnable);&:: EnableWindow - Enables or disables mouse and keyboard input to the specified window or control.
Call :IfInStr _GetC#.import_search EndPaint 				&& set c#.imports.user32.EndPaint=[DllImport("user32.dll")] public static extern bool EndPaint(IntPtr hWnd, [In] ref PAINTSTRUCT lpPaint);&:: BeginPaint and EndPaint - Prepares the window for painting and cleans up after painting.
Call :IfInStr _GetC#.import_search EnumChildWindows 		&& set c#.imports.user32.EnumChildWindows=[DllImport("user32.dll")] public static extern bool EnumChildWindows(IntPtr hwndParent, Win32Callback lpEnumFunc, IntPtr lParam);&:: EnumChildWindows - Enumerates the child windows that belong to the specified parent window by passing the handle to each child window, in turn, to an application-defined callback function. public delegate bool Win32Callback(IntPtr hwnd, IntPtr lParam);
Call :IfInStr _GetC#.import_search FillRect 				&& set c#.imports.user32.FillRect=[DllImport("user32.dll")] public static extern int FillRect(IntPtr hDC, ref RECT lprc, IntPtr hbr);&:: FillRect - Fills a rectangle by using the specified brush.
Call :IfInStr _GetC#.import_search FindWindow 				&& set c#.imports.user32.FindWindow=[DllImport("user32.dll", SetLastError = true)] public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);&:: FindWindow - Retrieves a handle to the top-level window whose class name and window name match the specified strings.
Call :IfInStr _GetC#.import_search FlashWindow 				&& set c#.imports.user32.FlashWindow=[DllImport("user32.dll")] public static extern bool FlashWindow(IntPtr hWnd, bool bInvert);&::  FlashWindow - Flashes the window to get user's attention.
Call :IfInStr _GetC#.import_search FrameRect 				&& set c#.imports.user32.FrameRect=[DllImport("user32.dll")] public static extern int FrameRect(IntPtr hDC, ref RECT lprc, IntPtr hbr);&:: FrameRect - Draws a border around the specified rectangle using the specified brush.
Call :IfInStr _GetC#.import_search GetActiveWindow 			&& set c#.imports.user32.GetActiveWindow=[DllImport("user32.dll")] public static extern IntPtr GetActiveWindow();&:: GetActiveWindow - Retrieves the window handle to the active window attached to the calling thread's message queue.
Call :IfInStr _GetC#.import_search GetClassName 			&& set c#.imports.user32.GetClassName=[DllImport("user32.dll", SetLastError=true, CharSet=CharSet.Auto)] public static extern int GetClassName(IntPtr hWnd, StringBuilder lpClassName, int nMaxCount);&:: GetClassName - Retrieves the name of the class to which the specified window belongs.
Call :IfInStr _GetC#.import_search GetDesktopWindow 		&& set c#.imports.user32.GetDesktopWindow=[DllImport("user32.dll", SetLastError=false)] public static extern IntPtr GetDesktopWindow();&:: GetDesktopWindow - Returns a handle to the desktop window.
Call :IfInStr _GetC#.import_search GetParent 				&& set c#.imports.user32.GetParent=[DllImport("user32.dll", SetLastError = true)] public static extern IntPtr GetParent(IntPtr hWnd);&:: GetParent - Retrieves a handle to the specified child window's parent or owner.
Call :IfInStr _GetC#.import_search GetSystemMenu 			&& set c#.imports.user32.GetSystemMenu=[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] public static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);&:: GetSystemMenu - Allows access to the system menu of a window (the menu that opens when you right-click on the title bar or click on the icon in the top-left corner).
Call :IfInStr _GetC#.import_search GetWindow 				&& set c#.imports.user32.GetWindow=[DllImport("user32.dll", SetLastError = true)] public static extern IntPtr GetWindow(IntPtr hWnd, uint uCmd);&:: GetWindow - Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window. Common uCmd values include GW_CHILD, GW_HWNDNEXT, GW_HWNDPREV, etc.
Call :IfInStr _GetC#.import_search GetWindowLong 			&& set c#.imports.user32.GetWindowLong=[DllImport("user32.dll", SetLastError = true)] public static extern int GetWindowLong(IntPtr hWnd, int nIndex);&:: SetWindowLong and GetWindowLong - Change (or retrieve) an attribute of the specified window. nIndex can be values like GWL_EXSTYLE, GWL_STYLE, etc.
Call :IfInStr _GetC#.import_search GetWindowRect 			&& set c#.imports.user32.GetWindowRect=[DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
Call :IfInStr _GetC#.import_search GetWindowTextLength 		&& set c#.imports.user32.GetWindowTextLength=[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] public static extern int GetWindowTextLength(IntPtr hWnd);&:: GetWindowTextLength - Retrieves the length, in characters, of the specified window's title bar text (if the window has a title bar).
Call :IfInStr _GetC#.import_search InvertRect 				&& set c#.imports.user32.InvertRect=[DllImport("user32.dll")] public static extern bool InvertRect(IntPtr hDC, ref RECT lprc);&:: InvertRect - Inverts the colors in the specified rectangle.
Call :IfInStr _GetC#.import_search IsIconic 				&& set c#.imports.user32.IsIconic=[DllImport("user32.dll")] public static extern bool IsIconic(IntPtr hWnd);&:: IsIconic - Determines whether the specified window is minimized (iconic).
Call :IfInStr _GetC#.import_search IsWindow 				&& set c#.imports.user32.IsWindow=[DllImport("user32.dll")] public static extern bool IsWindow(IntPtr hWnd);&:: IsWindow - Determines whether the specified window handle identifies an existing window.
Call :IfInStr _GetC#.import_search IsWindowEnabled 			&& set c#.imports.user32.IsWindowEnabled=[DllImport("user32.dll")] public static extern bool IsWindowEnabled(IntPtr hWnd);&:: IsWindowEnabled - Determines whether the specified window is enabled for mouse and keyboard input.
Call :IfInStr _GetC#.import_search IsWindowVisible 			&& set c#.imports.user32.IsWindowVisible=[DllImport("user32.dll")] [return: MarshalAs(UnmanagedType.Bool)] public static extern bool IsWindowVisible(IntPtr hWnd);&:: IsWindowVisible - Determines whether the specified window is visible.
Call :IfInStr _GetC#.import_search IsZoomed 				&& set c#.imports.user32.IsZoomed=[DllImport("user32.dll")] public static extern bool IsZoomed(IntPtr hWnd);&:: IsZoomed - Checks if the window is maximized.
Call :IfInStr _GetC#.import_search ScreenToClient 			&& set c#.imports.user32.ScreenToClient=[DllImport("user32.dll")] public static extern bool ScreenToClient(IntPtr hWnd, ref POINT lpPoint);&:: ScreenToClient & ClientToScreen - Convert screen coordinates to client area coordinates and vice versa.
Call :IfInStr _GetC#.import_search SendMessage 				&& set c#.imports.user32.SendMessage=[DllImport("user32.dll", CharSet = CharSet.Auto)] public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);&:: SendMessage - Sends the specified message to a window or windows.
Call :IfInStr _GetC#.import_search SetActiveWindow 			&& set c#.imports.user32.SetActiveWindow=[DllImport("user32.dll")] public static extern IntPtr SetActiveWindow(IntPtr hWnd);&:: SetActiveWindow - Activates a window. The window must be attached to the calling thread's message queue.
Call :IfInStr _GetC#.import_search SetForegroundWindow 		&& set c#.imports.user32.SetForegroundWindow=[DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);&:: SetForegroundWindow - Brings the thread that created the specified window into the foreground and activates the window.
Call :IfInStr _GetC#.import_search SetWindowLong 			&& set c#.imports.user32.SetWindowLong=[DllImport("user32.dll")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);&:: GetWindowLong & SetWindowLong - Retrieves or sets information about a window. The function also retrieves the 32-bit (DWORD) value at the specified offset into the extra window memory.
Call :IfInStr _GetC#.import_search SetWindowLong 			&& set c#.imports.user32.SetWindowLong=[DllImport("user32.dll")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);&:: SetWindowLong and GetWindowLong - Change (or retrieve) an attribute of the specified window. nIndex can be values like GWL_EXSTYLE, GWL_STYLE, etc.
Call :IfInStr _GetC#.import_search SetWindowPos 			&& set c#.imports.user32.SetWindowPos=[DllImport("user32.dll", SetLastError = true)] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);&:: SetWindowPos - Changes the size, position, and Z order of a child, pop-up, or top-level window.
Call :IfInStr _GetC#.import_search ShowWindow 				&& set c#.imports.user32.ShowWindow=[DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);&:: ShowWindow - Sets the specified window's show state.
Call :IfInStr _GetC#.import_search WindowFromPoint 			&& set c#.imports.user32.WindowFromPoint=[DllImport("user32.dll")] public static extern IntPtr WindowFromPoint(POINT Point);&:: WindowFromPoint - Retrieves a handle to the window that contains the specified point.
REM GDI32
Call :IfInStr _GetC#.import_search AddFontResource 			&& set c#.imports.gdi32.AddFontResource=[DllImport("gdi32.dll")] public static extern int AddFontResource(string lpFileName);&:: Adds a font resource from a specified file to the system.
Call :IfInStr _GetC#.import_search Arc 						&& set c#.imports.gdi32.Arc=[DllImport("gdi32.dll")] public static extern bool Arc(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect, int nXStartArc, int nYStartArc, int nXEndArc, int nYEndArc);&:: Arc - Draws an elliptical arc.
Call :IfInStr _GetC#.import_search ArcTo 					&& set c#.imports.gdi32.ArcTo=[DllImport("gdi32.dll")] public static extern bool ArcTo(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect, int nXRadial1, int nYRadial1, int nXRadial2, int nYRadial2);&:: Draws an elliptical arc.
Call :IfInStr _GetC#.import_search BeginPath 				&& set c#.imports.gdi32.BeginPath=[DllImport("gdi32.dll")] public static extern bool BeginPath(IntPtr hdc);&:: BeginPath - Opens a path bracket in the specified device context.
Call :IfInStr _GetC#.import_search BitBlt 					&& set c#.imports.gdi32.BitBlt=[DllImport("gdi32.dll")] public static extern bool BitBlt(IntPtr hdcDest, int nXDest, int nYDest, int nWidth, int nHeight, IntPtr hdcSrc, int nXSrc, int nYSrc, uint dwRop);&:: BitBlt - Performs a bit-block transfer of the color data corresponding to a rectangle of pixels from the specified source device context into a destination device context.
Call :IfInStr _GetC#.import_search Chord 					&& set c#.imports.gdi32.Chord=[DllImport("gdi32.dll")] public static extern bool Chord(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect, int nXRadial1, int nYRadial1, int nXRadial2, int nYRadial2);&:: Chord - Draws a chord (a region bounded by the intersection of an ellipse and a line segment, called a secant).
Call :IfInStr _GetC#.import_search CombineRgn 				&& set c#.imports.gdi32.CombineRgn=[DllImport("gdi32.dll")] public static extern int CombineRgn(IntPtr hrgnDest, IntPtr hrgnSrc1, IntPtr hrgnSrc2, int fnCombineMode);&:: Combines two regions.
Call :IfInStr _GetC#.import_search CreateBitmap 			&& set c#.imports.gdi32.CreateBitmap=[DllImport("gdi32.dll")] public static extern IntPtr CreateBitmap(int nWidth, int nHeight, uint nPlanes, uint nBitCount, IntPtr lpBits);&:: CreateBitmap - Creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
Call :IfInStr _GetC#.import_search CreateBrushIndirect 		&& set c#.imports.gdi32.CreateBrushIndirect=[DllImport("gdi32.dll")] public static extern IntPtr CreateBrushIndirect(ref LOGBRUSH lplb);&:: Creates a logical brush with specified attributes.
Call :IfInStr _GetC#.import_search CreateCompatibleBitmap 	&& set c#.imports.gdi32.CreateCompatibleBitmap=[DllImport("gdi32.dll")] public static extern IntPtr CreateCompatibleBitmap(IntPtr hdc, int nWidth, int nHeight);&:: CreateCompatibleBitmap - Creates a bitmap compatible with the device that is associated with the specified device context.
Call :IfInStr _GetC#.import_search CreateCompatibleDC 		&& set c#.imports.gdi32.CreateCompatibleDC=[DllImport("gdi32.dll")] public static extern IntPtr CreateCompatibleDC(IntPtr hdc);&:: Creates a memory device context compatible with a specified device.
Call :IfInStr _GetC#.import_search CreateDCA 				&& set c#.imports.gdi32.CreateDCA=[DllImport("gdi32.dll")] public static extern IntPtr CreateDCA(string lpszDriver, string lpszDevice, string lpszOutput, IntPtr lpInitData);&::Creates a device context (DC) for a device using the specified name.
Call :IfInStr _GetC#.import_search CreateDCW 				&& set c#.imports.gdi32.CreateDCW=[DllImport("gdi32.dll")] public static extern IntPtr CreateDCW(string lpszDriver, string lpszDevice, string lpszOutput, IntPtr lpInitData);&:: Creates a device context for a device using the specified name (Unicode version).
Call :IfInStr _GetC#.import_search CreateDIBSection 		&& set c#.imports.gdi32.CreateDIBSection=[DllImport("gdi32.dll")] public static extern IntPtr CreateDIBSection(IntPtr hdc, ref BITMAPINFO pbmi, uint usage, out IntPtr ppvBits, IntPtr hSection, uint offset);&:: Creates a DIB that applications can write to directly.
Call :IfInStr _GetC#.import_search CreateDiscardableBitmap 	&& set c#.imports.gdi32.CreateDiscardableBitmap=[DllImport("gdi32.dll")] public static extern IntPtr CreateDiscardableBitmap(IntPtr hdc, int nWidth, int nHeight);&:: Creates a discardable bitmap for the specified device.
Call :IfInStr _GetC#.import_search CreateEllipticRgn 		&& set c#.imports.gdi32.CreateEllipticRgn=[DllImport("gdi32.dll")] public static extern IntPtr CreateEllipticRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);&:: Creates an elliptical region.
Call :IfInStr _GetC#.import_search CreateFont 				&& set c#.imports.gdi32.CreateFont=[DllImport("gdi32.dll")] public static extern IntPtr CreateFont(int nHeight, int nWidth, int nEscapement, int nOrientation, int fnWeight, uint fdwItalic, uint fdwUnderline, uint fdwStrikeOut, uint fdwCharSet, uint fdwOutputPrecision, uint fdwClipPrecision, uint fdwQuality, uint fdwPitchAndFamily, string lpszFace);&:: Creates a logical font with specific characteristics.
Call :IfInStr _GetC#.import_search CreateFontIndirect 		&& set c#.imports.gdi32.CreateFontIndirect=[DllImport("gdi32.dll")] public static extern IntPtr CreateFontIndirect(ref LOGFONT lpLogFont);&:: Creates a logical font that has specific characteristics.
Call :IfInStr _GetC#.import_search CreateHatchBrush 		&& set c#.imports.gdi32.CreateHatchBrush=[DllImport("gdi32.dll")] public static extern IntPtr CreateHatchBrush(int fnStyle, uint clrref);&:: Creates a logical brush with a specified hatch pattern and color.
Call :IfInStr _GetC#.import_search CreatePalette 			&& set c#.imports.gdi32.CreatePalette=[DllImport("gdi32.dll")] public static extern IntPtr CreatePalette(ref LOGPALETTE lpLogPalette);&:: Creates a logical palette.
Call :IfInStr _GetC#.import_search CreatePatternBrush 		&& set c#.imports.gdi32.CreatePatternBrush=[DllImport("gdi32.dll")] public static extern IntPtr CreatePatternBrush(IntPtr hbmp);&:: Creates a logical brush with a specified pattern.
Call :IfInStr _GetC#.import_search CreatePen 				&& set c#.imports.gdi32.CreatePen=[DllImport("gdi32.dll")] public static extern IntPtr CreatePen(PenStyle fnPenStyle, int nWidth, uint crColor);&:: CreatePen and SelectObject - Used to create a pen and select it into the specified device context for drawing.
Call :IfInStr _GetC#.import_search CreateRectRgn 			&& set c#.imports.gdi32.CreateRectRgn=[DllImport("gdi32.dll")] public static extern IntPtr CreateRectRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);&:: Creates a rectangular region.
Call :IfInStr _GetC#.import_search CreateRoundRectRgn 		&& set c#.imports.gdi32.CreateRoundRectRgn=[DllImport("gdi32.dll")] public static extern IntPtr CreateRoundRectRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect, int nWidthEllipse, int nHeightEllipse);&:: Creates a rectangular region with rounded corners.
Call :IfInStr _GetC#.import_search CreateSolidBrush 		&& set c#.imports.gdi32.CreateSolidBrush=[DllImport("gdi32.dll")] public static extern IntPtr CreateSolidBrush(uint color);&:: CreateSolidBrush - Creates a logical brush that has the specified solid color.
Call :IfInStr _GetC#.import_search DPtoLP 					&& set c#.imports.gdi32.DPtoLP=[DllImport("gdi32.dll")] public static extern bool DPtoLP(IntPtr hdc, ref POINT lpPoints, int nCount);&:: Converts device coordinates into logical coordinates.
Call :IfInStr _GetC#.import_search DeleteDC 				&& set c#.imports.gdi32.DeleteDC=[DllImport("gdi32.dll")] public static extern bool DeleteDC(IntPtr hdc);&:: Deletes a specified device context.
Call :IfInStr _GetC#.import_search DeleteObject 			&& set c#.imports.gdi32.DeleteObject=[DllImport("gdi32.dll")] public static extern bool DeleteObject(IntPtr hObject);&:: DeleteObject - Deletes a logical pen, brush, font, bitmap, region, or palette, freeing all system resources associated with the object. After the object is deleted, the specified handle is no longer valid.
Call :IfInStr _GetC#.import_search DrawText 				&& set c#.imports.gdi32.DrawText=[DllImport("user32.dll")] public static extern int DrawText(IntPtr hdc, string lpchText, int nCount, ref RECT lpRect, uint uFormat);&::DrawText - Draws formatted text in the specified rectangle.
Call :IfInStr _GetC#.import_search Ellipse 					&& set c#.imports.gdi32.Ellipse=[DllImport("gdi32.dll")] public static extern bool Ellipse(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);&:: Ellipse - Draws an ellipse. The center of the ellipse is the center of the rectangle defined by the nLeftRect, nTopRect, nRightRect, and nBottomRect parameters. The ellipse is outlined by using the current pen and is filled by using the current brush.
Call :IfInStr _GetC#.import_search EndPath 					&& set c#.imports.gdi32.EndPath=[DllImport("gdi32.dll")] public static extern bool EndPath(IntPtr hdc);&:: EndPath - Closes a path bracket and selects the path defined by the bracket into the specified device context.
Call :IfInStr _GetC#.import_search ExcludeClipRect 			&& set c#.imports.gdi32.=[DllImport("gdi32.dll")] public static extern int ExcludeClipRect(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);&:: ExcludeClipRect - Excludes the specified rectangle from the clipping region of a device context.
Call :IfInStr _GetC#.import_search ExtCreatePen 			&& set c#.imports.gdi32.ExtCreatePen=[DllImport("gdi32.dll")] public static extern bool ExtCreatePen(uint dwPenStyle, uint dwWidth, ref LOGBRUSH lplb, uint dwStyleCount, [In] uint[] lpStyle);&:: Creates a logical cosmetic or geometric pen that has the style, width, and brush attributes that are specified in a data structure.
Call :IfInStr _GetC#.import_search ExtCreateRegion 			&& set c#.imports.gdi32.ExtCreateRegion=[DllImport("gdi32.dll")] public static extern IntPtr ExtCreateRegion(IntPtr lpXform, uint nCount, byte[] rgndata);&:: Creates a region from the specified region data and transformation data.
Call :IfInStr _GetC#.import_search ExtFloodFill 			&& set c#.imports.gdi32.ExtFloodFill=[DllImport("gdi32.dll")] public static extern bool ExtFloodFill(IntPtr hdc, int nXStart, int nYStart, uint crColor, uint fuFillType);&:: Fills an area of the display surface with the current brush.
Call :IfInStr _GetC#.import_search ExtSelectClipRgn 		&& set c#.imports.gdi32.ExtSelectClipRgn=[DllImport("gdi32.dll")] public static extern int ExtSelectClipRgn(IntPtr hdc, IntPtr hrgn, int fnMode);&:: Combines the specified region with the current clip region.
Call :IfInStr _GetC#.import_search ExtTextOut 				&& set c#.imports.gdi32.ExtTextOut=[DllImport("gdi32.dll")] public static extern bool ExtTextOut(IntPtr hdc, int X, int Y, uint fuOptions, [In] ref RECT lprc, string lpString, uint cbCount, [In] int[] lpDx);&:: ExtTextOut - Draws text using the currently selected font, background color, and text color.
Call :IfInStr _GetC#.import_search FillPath 				&& set c#.imports.gdi32.FillPath=[DllImport("gdi32.dll")] public static extern bool FillPath(IntPtr hdc);&:: FillPath - Closes any open figures in a path, selects the path into the specified device context, and fills the path by using the current brush and polygon-filling mode.
Call :IfInStr _GetC#.import_search FrameRgn 				&& set c#.imports.gdi32.FrameRgn=[DllImport("gdi32.dll")] public static extern bool FrameRgn(IntPtr hdc, IntPtr hrgn, IntPtr hbr, int nWidth, int nHeight);&:: Draws a border around the specified region by using the specified brush.
Call :IfInStr _GetC#.import_search GdiComment 				&& set c#.imports.gdi32.GdiComment=[DllImport("gdi32.dll")] public static extern bool GdiComment(IntPtr hdc, uint cbSize, byte[] lpData);&:: Places a comment in the specified enhanced metafile.
Call :IfInStr _GetC#.import_search GdiFlush 				&& set c#.imports.gdi32.GdiFlush=[DllImport("gdi32.dll")] public static extern bool GdiFlush();&:: Flushes the calling thread's current batch.
Call :IfInStr _GetC#.import_search GdiGetBatchLimit 		&& set c#.imports.gdi32.GdiGetBatchLimit=[DllImport("gdi32.dll")] public static extern uint GdiGetBatchLimit();&:: Retrieves the maximum number of function calls that can be batched by the calling thread's current batch.
Call :IfInStr _GetC#.import_search GdiSetBatchLimit 		&& set c#.imports.gdi32.GdiSetBatchLimit=[DllImport("gdi32.dll")] public static extern uint GdiSetBatchLimit(uint dwLimit);&:: Sets the maximum number of function calls that can be batched by the calling thread's current batch.
Call :IfInStr _GetC#.import_search GetArcDirection 			&& set c#.imports.gdi32.GetArcDirection=[DllImport("gdi32.dll")] public static extern int GetArcDirection(IntPtr hdc);&:: Retrieves the current arc direction for the specified device context.
Call :IfInStr _GetC#.import_search GetAspectRatioFilterEx 	&& set c#.imports.gdi32.GetAspectRatioFilterEx=[DllImport("gdi32.dll")] public static extern bool GetAspectRatioFilterEx(IntPtr hdc, out SIZE lpSize);&:: Retrieves the setting for the aspect-ratio filter.
Call :IfInStr _GetC#.import_search GetBkMode 				&& set c#.imports.gdi32.GetBkMode=[DllImport("gdi32.dll")] public static extern int GetBkMode(IntPtr hdc);&:: Retrieves the current background mix mode for the specified device context.
Call :IfInStr _GetC#.import_search GetBrushOrgEx 			&& set c#.imports.gdi32.GetBrushOrgEx=[DllImport("gdi32.dll")] public static extern bool GetBrushOrgEx(IntPtr hdc, out POINT lppt);&:: Retrieves the current brush origin for the specified device context.
Call :IfInStr _GetC#.import_search GetClipBox 				&& set c#.imports.gdi32.GetClipBox=[DllImport("gdi32.dll")]public static extern int GetClipBox(IntPtr hdc, out RECT lprc);&:: Retrieves the dimensions of the tightest bounding rectangle (or "clipping box") that can enclose the current visible area of the specified device context.
Call :IfInStr _GetC#.import_search GetClipRgn 				&& set c#.imports.gdi32.GetClipRgn=[DllImport("gdi32.dll")] public static extern int GetClipRgn(IntPtr hdc, IntPtr hrgn);&:: Retrieves a handle to the current clipping region of the specified device context.
Call :IfInStr _GetC#.import_search GetCurrentObject 		&& set c#.imports.gdi32.GetCurrentObject=[DllImport("gdi32.dll")] public static extern IntPtr GetCurrentObject(IntPtr hdc, uint uObjectType);&:: Retrieves a handle to an object of the specified type.
Call :IfInStr _GetC#.import_search GetDCBrushColor 			&& set c#.imports.gdi32.GetDCBrushColor=[DllImport("gdi32.dll")] public static extern COLORREF GetDCBrushColor(IntPtr hdc);&:: Retrieves the current color of the brush selected into the specified device context (DC).
Call :IfInStr _GetC#.import_search GetDCOrgEx 				&& set c#.imports.gdi32.GetDCOrgEx=[DllImport("gdi32.dll")] public static extern bool GetDCOrgEx(IntPtr hdc, out POINT lpPoint);&:: Retrieves the final translation origin for a specified device context.
Call :IfInStr _GetC#.import_search GetDCPenColor 			&& set c#.imports.gdi32.GetDCPenColor=[DllImport("gdi32.dll")] public static extern COLORREF GetDCPenColor(IntPtr hdc);&:: Retrieves the current color of the pen selected into the specified device context (DC).
Call :IfInStr _GetC#.import_search GetDIBits 				&& set c#.imports.gdi32.GetDIBits=[DllImport("gdi32.dll")] public static extern int GetDIBits(IntPtr hdc, IntPtr hbmp, uint uStartScan, uint cScanLines, IntPtr lpvBits, ref BITMAPINFO lpbmi, uint uUsage);&:: Retrieves the bits of the specified compatible bitmap and copies them into a buffer as a DIB.
Call :IfInStr _GetC#.import_search GetDeviceCaps 			&& set c#.imports.gdi32.GetDeviceCaps=[DllImport("gdi32.dll")] public static extern int GetDeviceCaps(IntPtr hdc, int nIndex);&:: Retrieves information about a specified graphics device.
Call :IfInStr _GetC#.import_search GetGraphicsMode 			&& set c#.imports.gdi32.GetGraphicsMode=[DllImport("gdi32.dll")] public static extern int GetGraphicsMode(IntPtr hdc);&:: Retrieves the current graphics mode for the specified device context.
Call :IfInStr _GetC#.import_search GetLayout 				&& set c#.imports.gdi32.GetLayout=[DllImport("gdi32.dll")] public static extern uint GetLayout(IntPtr hdc);&:: Retrieves the layout of a device context.
Call :IfInStr _GetC#.import_search GetMapMode 				&& set c#.imports.gdi32.GetMapMode=[DllImport("gdi32.dll")] public static extern int GetMapMode(IntPtr hdc);&:: Retrieves the mapping mode of the specified device context.
Call :IfInStr _GetC#.import_search GetNearestColor 			&& set c#.imports.gdi32.GetNearestColor=[DllImport("gdi32.dll")] public static extern uint GetNearestColor(IntPtr hdc, uint crColor);&:: Retrieves the color in the current logical palette that most closely matches a specified color value.
Call :IfInStr _GetC#.import_search GetNearestPaletteIndex 	&& set c#.imports.gdi32.GetNearestPaletteIndex=[DllImport("gdi32.dll")] public static extern uint GetNearestPaletteIndex(IntPtr hPalette, uint crColor);&:: Retrieves the index of the entry in the specified logical palette that most closely matches a specified color value.
Call :IfInStr _GetC#.import_search GetObject 				&& set c#.imports.gdi32.GetObject=[DllImport("gdi32.dll")] public static extern int GetObject(IntPtr hgdiobj, int cbBuffer, IntPtr lpvObject);&:: Retrieves information about a graphics object.
Call :IfInStr _GetC#.import_search GetPixel 				&& set c#.imports.gdi32.GetPixel=[DllImport("gdi32.dll")] public static extern int GetPixel(IntPtr hdc, int nXPos, int nYPos);&:: Retrieves the red, green, blue (RGB) color value of the pixel at the specified coordinates.
Call :IfInStr _GetC#.import_search GetPolyFillMode 			&& set c#.imports.gdi32.GetPolyFillMode=[DllImport("gdi32.dll")] public static extern int GetPolyFillMode(IntPtr hdc);&:: Retrieves the current polygon fill mode for the specified device context.
Call :IfInStr _GetC#.import_search GetROP2 					&& set c#.imports.gdi32.GetROP2=[DllImport("gdi32.dll")] public static extern int GetROP2(IntPtr hdc);&:: Retrieves the current foreground mix mode of the specified device context.
Call :IfInStr _GetC#.import_search GetStockObject 			&& set c#.imports.gdi32.GetStockObject=[DllImport("gdi32.dll")] public static extern IntPtr GetStockObject(int fnObject);&:: Retrieves a handle to one of the stock GDI objects.
Call :IfInStr _GetC#.import_search GetStretchBltMode 		&& set c#.imports.gdi32.GetStretchBltMode=[DllImport("gdi32.dll")] public static extern int GetStretchBltMode(IntPtr hdc);&:: Retrieves the current stretching mode.
Call :IfInStr _GetC#.import_search GetTextAlign 			&& set c#.imports.gdi32.GetTextAlign=[DllImport("gdi32.dll")] public static extern uint GetTextAlign(IntPtr hdc);&:: Retrieves the current text-alignment setting.
Call :IfInStr _GetC#.import_search GetTextCharacterExtra 	&& set c#.imports.gdi32.GetTextCharacterExtra=[DllImport("gdi32.dll")] public static extern int GetTextCharacterExtra(IntPtr hdc);&:: Retrieves the current inter-character spacing for the specified device context.
Call :IfInStr _GetC#.import_search GetTextColor 			&& set c#.imports.gdi32.GetTextColor=[DllImport("gdi32.dll")] public static extern uint GetTextColor(IntPtr hdc);&:: Retrieves the current text color of a device context.
Call :IfInStr _GetC#.import_search GetTextMetrics 			&& set c#.imports.gdi32.GetTextMetrics=[DllImport("gdi32.dll")] public static extern bool GetTextMetrics(IntPtr hdc, out TEXTMETRIC lptm);&:: Retrieves a structure that contains metrics for the current font.
Call :IfInStr _GetC#.import_search GradientFill 			&& set c#.imports.gdi32.GradientFill=[DllImport("gdi32.dll")] public static extern bool GradientFill(IntPtr hdc, TRIVERTEX[] pVertex, uint dwNumVertex, uint[] pMesh, uint dwNumMesh, uint dwMode);&:: Fills an array of triangles or rectangles with gradient colors.
Call :IfInStr _GetC#.import_search InvertRgn 				&& set c#.imports.gdi32.InvertRgn=[DllImport("gdi32.dll")] public static extern bool InvertRgn(IntPtr hdc, IntPtr hRgn);&:: Inverts the colors in the specified region.
Call :IfInStr _GetC#.import_search LPtoDP 					&& set c#.imports.gdi32.LPtoDP=[DllImport("gdi32.dll")] public static extern bool LPtoDP(IntPtr hdc, ref POINT lpPoints, int nCount);&:: Converts logical coordinates into device coordinates.
Call :IfInStr _GetC#.import_search LineDDA 					&& set c#.imports.gdi32.LineDDA=[DllImport("gdi32.dll")] public static extern bool LineDDA(int nXStart, int nYStart, int nXEnd, int nYEnd, LineDDAProc lpLineFunc, IntPtr lpData);&:: Draws a line segment using the line-drawing function provided.
Call :IfInStr _GetC#.import_search LineTo 					&& set c#.imports.gdi32.LineTo=[DllImport("gdi32.dll")] public static extern bool LineTo(IntPtr hdc, int x, int y);&:: MoveToEx and LineTo - Moves the current position to the specified point and draws a line.
Call :IfInStr _GetC#.import_search MaskBlt 					&& set c#.imports.gdi32.MaskBlt=[DllImport("gdi32.dll")] public static extern bool MaskBlt(IntPtr hdcDest, int nXDest, int nYDest, int nWidth, int nHeight, IntPtr hdcSrc, int nXSrc, int nYSrc, IntPtr hbmMask, int xMask, int yMask, uint dwRop);&:: Combines the color data for the source and destination bitmaps.
Call :IfInStr _GetC#.import_search MoveToEx 				&& set c#.imports.gdi32.MoveToEx=[DllImport("gdi32.dll")] public static extern bool MoveToEx(IntPtr hdc, int X, int Y, IntPtr lpPoint);&:: MoveToEx - Updates the current position to the specified point and optionally returns the previous position.
Call :IfInStr _GetC#.import_search OffsetRgn 				&& set c#.imports.gdi32.OffsetRgn=[DllImport("gdi32.dll")] public static extern int OffsetRgn(IntPtr hRgn, int nXOffset, int nYOffset);&:: Moves the specified region by the specified offsets.
Call :IfInStr _GetC#.import_search PaintRgn 				&& set c#.imports.gdi32.PaintRgn=[DllImport("gdi32.dll")] public static extern bool PaintRgn(IntPtr hdc, IntPtr hrgn); &:: Paints the specified region by using the brush currently selected into the device context.
Call :IfInStr _GetC#.import_search PatBlt 					&& set c#.imports.gdi32.PatBlt=[DllImport("gdi32.dll")] public static extern bool PatBlt(IntPtr hdc, int nXLeft, int nYLeft, int nWidth, int nHeight, uint dwRop);&:: Paints the specified rectangle using the brush that is currently selected into the specified device context.
Call :IfInStr _GetC#.import_search Pie 						&& set c#.imports.gdi32.Pie=[DllImport("gdi32.dll")] public static extern bool Pie(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect, int nXRadial1, int nYRadial1, int nXRadial2, int nYRadial2);&:: Pie - Draws a pie-shaped wedge bounded by the intersection of an ellipse and two radials.
Call :IfInStr _GetC#.import_search PlgBlt 					&& set c#.imports.gdi32.PlgBlt=[DllImport("gdi32.dll")] public static extern bool PlgBlt(IntPtr hdcDest, POINT[] lpPoint, IntPtr hdcSrc, int nXSrc, int nYSrc, int nWidth, int nHeight, IntPtr hbmMask, int xMask, int yMask);&:: Performs a bit-block transfer of color data.
Call :IfInStr _GetC#.import_search PolyBezier 				&& set c#.imports.gdi32.PolyBezier=[DllImport("gdi32.dll")] public static extern bool PolyBezier(IntPtr hdc, POINT[] apt, DWORD cpt);&:: PolyBezier - Draws a series of cubic Bezier curves.
Call :IfInStr _GetC#.import_search PolyBezierTo 			&& set c#.imports.gdi32.PolyBezierTo=[DllImport("gdi32.dll")] public static extern bool PolyBezierTo(IntPtr hdc, POINT[] apt, DWORD cpt);&:: PolyBezierTo - Draws one or more cubic Bezier curves.
Call :IfInStr _GetC#.import_search PolyDraw 				&& set c#.imports.gdi32.PolyDraw=[DllImport("gdi32.dll")] public static extern bool PolyDraw(IntPtr hdc, POINT[] lppt, byte[] lpTypes, int cCount);&::Draws a set of line segments and Bézier curves.
Call :IfInStr _GetC#.import_search PolyPolygon 				&& set c#.imports.gdi32.PolyPolygon=[DllImport("gdi32.dll")] public static extern bool PolyPolygon(IntPtr hdc, POINT[] apt, int[] asz, int csz);&:: PolyPolygon - Draws multiple polygons.
Call :IfInStr _GetC#.import_search PolyPolyline 			&& set c#.imports.gdi32.PolyPolyline=[DllImport("gdi32.dll")] public static extern bool PolyPolyline(IntPtr hdc, POINT[] apt, uint[] asz, DWORD csz);&:: PolyPolyline - Draws multiple polylines.
Call :IfInStr _GetC#.import_search PolyTextOut 				&& set c#.imports.gdi32.PolyTextOut=[DllImport("gdi32.dll")] public static extern bool PolyTextOut(IntPtr hdc, POLYTEXT[] pptxt, int cStrings);&::Draws several strings using the font and text colors currently selected into the HDC.
Call :IfInStr _GetC#.import_search Polygon 					&& set c#.imports.gdi32.Polygon=[DllImport("gdi32.dll")] public static extern bool Polygon(IntPtr hdc, POINT[] apt, int cpt);&:: Polygon - Draws a polygon consisting of two or more vertices connected by straight lines.
Call :IfInStr _GetC#.import_search Polyline 				&& set c#.imports.gdi32.Polyline=[DllImport("gdi32.dll")] public static extern bool Polyline(IntPtr hdc, POINT[] apt, int cpt);&:: Polyline - Draws a series of line segments by connecting the points in the specified array.
Call :IfInStr _GetC#.import_search PolylineTo 				&& set c#.imports.gdi32.PolylineTo=[DllImport("gdi32.dll")] public static extern bool PolylineTo(IntPtr hdc, POINT[] lppt, uint cCount);&::Draws one or more straight lines.
Call :IfInStr _GetC#.import_search Rectangle 				&& set c#.imports.gdi32.Rectangle=[DllImport("gdi32.dll")] public static extern bool Rectangle(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);&:: Rectangle - Draws a rectangle.
Call :IfInStr _GetC#.import_search RemoveFontResource 		&& set c#.imports.gdi32.RemoveFontResource=[DllImport("gdi32.dll")] public static extern int RemoveFontResource(string lpFileName);&::Removes the fonts in the specified file from the system font table.
Call :IfInStr _GetC#.import_search RestoreDC 				&& set c#.imports.gdi32.RestoreDC=[DllImport("gdi32.dll")] public static extern bool RestoreDC(IntPtr hdc, int nSavedDC);&:: RestoreDC - Restores a device context (DC) to the specified state.
Call :IfInStr _GetC#.import_search RoundRect 				&& set c#.imports.gdi32.RoundRect=[DllImport("gdi32.dll")] public static extern bool RoundRect(IntPtr hdc, int nLeftRect, int nTopRect, int nRightRect, int nBottomRect, int nWidth, int nHeight);&:: RoundRect - Draws a rectangle with rounded corners.
Call :IfInStr _GetC#.import_search SaveDC 					&& set c#.imports.gdi32.SaveDC=[DllImport("gdi32.dll")] public static extern int SaveDC(IntPtr hdc);&:: SaveDC - Saves the current state of the specified device context (DC) to a context stack.
Call :IfInStr _GetC#.import_search SelectClipRgn 			&& set c#.imports.gdi32.SelectClipRgn=[DllImport("gdi32.dll")] public static extern int SelectClipRgn(IntPtr hdc, IntPtr hrgn);&:: SelectClipRgn - Selects a region as the current clipping region for the specified device context.
Call :IfInStr _GetC#.import_search SelectObject 			&& set c#.imports.gdi32.SelectObject=[DllImport("gdi32.dll")] public static extern IntPtr SelectObject(IntPtr hdc, IntPtr hgdiobj);&:: CreatePen and SelectObject - Used to create a pen and select it into the specified device context for drawing.
Call :IfInStr _GetC#.import_search SetBkColor 				&& set c#.imports.gdi32.SetBkColor=[DllImport("gdi32.dll")] public static extern uint SetBkColor(IntPtr hdc, uint crColor);&:: Sets the background color of the specified device context.
Call :IfInStr _GetC#.import_search SetBkMode 				&& set c#.imports.gdi32.SetBkMode=[DllImport("gdi32.dll")] public static extern int SetBkMode(IntPtr hdc, int iBkMode);&:: Sets the background mode for text output.
Call :IfInStr _GetC#.import_search SetBrushOrgEx 			&& set c#.imports.gdi32.SetBrushOrgEx=[DllImport("gdi32.dll")] public static extern bool SetBrushOrgEx(IntPtr hdc, int nXOrg, int nYOrg, out POINT lppt);&:: Sets the brush origin for a device context.
Call :IfInStr _GetC#.import_search SetDCBrushColor 			&& set c#.imports.gdi32.SetDCBrushColor=[DllImport("gdi32.dll")] public static extern COLORREF SetDCBrushColor(IntPtr hdc, COLORREF crColor);&:: Sets the current device context (DC) brush color to a specified color value.
Call :IfInStr _GetC#.import_search SetDCPenColor 			&& set c#.imports.gdi32.SetDCPenColor=[DllImport("gdi32.dll")] public static extern COLORREF SetDCPenColor(IntPtr hdc, COLORREF crColor);&:: Sets the current device context (DC) pen color to a specified color value.
Call :IfInStr _GetC#.import_search SetDIBits 				&& set c#.imports.gdi32.SetDIBits=[DllImport("gdi32.dll")] public static extern int SetDIBits(IntPtr hdc, IntPtr hbmp, uint uStartScan, uint cScanLines, IntPtr lpBits, ref BITMAPINFO lpbmi, uint fuColorUse);&:: Sets the pixels in a compatible bitmap (DIB) using the color data you supply.
Call :IfInStr _GetC#.import_search SetDIBitsToDevice 		&& set c#.imports.gdi32.SetDIBitsToDevice=[DllImport("gdi32.dll")] public static extern int SetDIBitsToDevice(IntPtr hdc, int XDest, int YDest, uint dwWidth, uint dwHeight, int XSrc, int YSrc, uint uStartScan, uint cScanLines, IntPtr lpvBits, ref BITMAPINFO lpbmi, uint fuColorUse);&:: Sets the pixels in the specified rectangle on the device associated with the destination device context.
Call :IfInStr _GetC#.import_search SetGraphicsMode 			&& set c#.imports.gdi32.SetGraphicsMode=[DllImport("gdi32.dll")] public static extern int SetGraphicsMode(IntPtr hdc, int iMode); &:: Sets the graphics mode for the specified device context.
Call :IfInStr _GetC#.import_search SetLayout 				&& set c#.imports.gdi32.SetLayout=[DllImport("gdi32.dll")] public static extern uint SetLayout(IntPtr hdc, uint dwLayout);&:: Sets the layout in a device context.
Call :IfInStr _GetC#.import_search SetMapMode 				&& set c#.imports.gdi32.SetMapMode=[DllImport("gdi32.dll")] public static extern int SetMapMode(IntPtr hdc, int fnMapMode);&:: Sets the mapping mode of the specified device context.
Call :IfInStr _GetC#.import_search SetPixel 				&& set c#.imports.gdi32.SetPixel=[DllImport("gdi32.dll")] public static extern uint SetPixel(IntPtr hdc, int x, int y, uint crColor);&:: SetPixel - Sets the pixel at the specified coordinates to the specified color.
Call :IfInStr _GetC#.import_search SetPixelV 				&& set c#.imports.gdi32.SetPixelV=[DllImport("gdi32.dll")] public static extern bool SetPixelV(IntPtr hdc, int X, int Y, uint crColor);&:: Sets the pixel at the specified coordinates to the closest approximation of the specified color.
Call :IfInStr _GetC#.import_search SetPolyFillMode 			&& set c#.imports.gdi32.SetPolyFillMode=[DllImport("gdi32.dll")] public static extern int SetPolyFillMode(IntPtr hdc, int iPolyFillMode);&:: Sets the polygon fill mode for functions that fill polygons.
Call :IfInStr _GetC#.import_search SetROP2 					&& set c#.imports.gdi32.SetROP2=[DllImport("gdi32.dll")] public static extern int SetROP2(IntPtr hdc, int fnDrawMode);&:: Sets the current foreground mix mode.
Call :IfInStr _GetC#.import_search SetStretchBltMode 		&& set c#.imports.gdi32.SetStretchBltMode=[DllImport("gdi32.dll")] public static extern int SetStretchBltMode(IntPtr hdc, int iStretchMode);&:: Sets the bitmap stretching mode in a device context.
Call :IfInStr _GetC#.import_search SetTextColor 			&& set c#.imports.gdi32.SetTextColor=[DllImport("gdi32.dll")] public static extern uint SetTextColor(IntPtr hdc, uint crColor);&:: Sets the text color for a specified device context.
Call :IfInStr _GetC#.import_search SetTextJustification 	&& set c#.imports.gdi32.SetTextJustification=[DllImport("gdi32.dll")] public static extern int SetTextJustification(IntPtr hdc, int nBreakExtra, int nBreakCount);&:: Specifies the amount of space the system should add to the break characters in a string of text.
Call :IfInStr _GetC#.import_search SetViewportExtEx 		&& set c#.imports.gdi32.SetViewportExtEx=[DllImport("gdi32.dll")] public static extern bool SetViewportExtEx(IntPtr hdc, int nXExtent, int nYExtent, out SIZE lpSize);&::Sets the horizontal and vertical extents of the viewport for a device context.
Call :IfInStr _GetC#.import_search SetViewportOrgEx 		&& set c#.imports.gdi32.SetViewportOrgEx=[DllImport("gdi32.dll")] public static extern bool SetViewportOrgEx(IntPtr hdc, int X, int Y, out POINT lpPoint);&::Specifies the x- and y-coordinates of the viewport origin.
Call :IfInStr _GetC#.import_search SetWindowExtEx 			&& set c#.imports.gdi32.SetWindowExtEx=[DllImport("gdi32.dll")] public static extern bool SetWindowExtEx(IntPtr hdc, int nXExtent, int nYExtent, out SIZE lpSize);&::Sets the horizontal and vertical extents of the window for a device context.
Call :IfInStr _GetC#.import_search StartDoc 				&& set c#.imports.gdi32.StartDoc=[DllImport("gdi32.dll")] public static extern int StartDoc(IntPtr hdc, ref DOCINFO lpdi);&::Starts a print job.
Call :IfInStr _GetC#.import_search StartPage 				&& set c#.imports.gdi32.StartPage=[DllImport("gdi32.dll")] public static extern int StartPage(IntPtr hdc);&::Prepares the printer driver to accept data.
Call :IfInStr _GetC#.import_search StretchBlt 				&& set c#.imports.gdi32.StretchBlt=[DllImport("gdi32.dll")] public static extern bool StretchBlt(IntPtr hdcDest, int nXOriginDest, int nYOriginDest, int nWidthDest, int nHeightDest, IntPtr hdcSrc, int nXOriginSrc, int nYOriginSrc, int nWidthSrc, int nHeightSrc, uint dwRop);&:: StretchBlt - Copies a bitmap from a source rectangle into a destination rectangle, stretching or compressing the bitmap to fit the dimensions of the destination rectangle.
Call :IfInStr _GetC#.import_search StrokeAndFillPath 		&& set c#.imports.gdi32.StrokeAndFillPath=[DllImport("gdi32.dll")] public static extern bool StrokeAndFillPath(IntPtr hdc);&:: StrokeAndFillPath - Closes any open figures in a path, selects the path into the specified device context, and then fills the path by using the current brush and polygon-filling mode.
Call :IfInStr _GetC#.import_search StrokePath 				&& set c#.imports.gdi32.StrokePath=[DllImport("gdi32.dll")] public static extern bool StrokePath(IntPtr hdc);&:: StrokePath - Renders the specified path by using the current pen.
Call :IfInStr _GetC#.import_search TextOut 					&& set c#.imports.gdi32.TextOut=[DllImport("gdi32.dll")] public static extern bool TextOut(IntPtr hdc, int nXStart, int nYStart, string lpString, int cchString);&:: TextOut - Writes a character string at the specified location, using the currently selected font, background color, and text color.
Call :IfInStr _GetC#.import_search TransparentBlt 			&& set c#.imports.gdi32.TransparentBlt=[DllImport("gdi32.dll")] public static extern bool TransparentBlt(IntPtr hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, IntPtr hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, uint crTransparent);&:: Performs a bit-block transfer, honoring transparency.


if "[%~2]" NEQ "[]" shift & GoTo :GetC#.import
set "_GetC#.import_search="
GoTo :EOF


:GetC#.using
set "_GetC#.using_search=%~1"
Call :IfInStr _GetC#.using_search System                         && set "c#.using.System=using System;"
Call :IfInStr _GetC#.using_search System.Runtime.InteropServices && set "c#.using.System.Runtime.InteropServices=using System.Runtime.InteropServices;"
if "[%~2]" NEQ "[]" shift & GoTo :GetC#.using
set "_GetC#.using_search="
GoTo :EOF

::Usage Call :IfInStr SearchingTerm SearchedString
:IfInStr
:IfInString
if "[%~1]" EQU "[]" exit /b 0
if defined %~1 call set _IfInStr_SearchTerm=%%%~1%%
if defined %~2 call set _IfInStr_SearchedString=%%%~2%%
if not defined _IfInStr_SearchTerm set _IfInStr_SearchTerm=%~1
if not defined _IfInStr_SearchedString set _IfInStr_SearchedString=%~2
call set _IfInStr_buffer=%%_IfInStr_SearchedString:%_IfInStr_SearchTerm%=%%
set "_IfInStr_SearchTerm=" & set "_IfInStr_SearchedString=" & set "_IfInStr_buffer=" & if "[%_IfInStr_SearchedString%]" EQU "[%_IfInStr_buffer%]" ( exit /b 1 ) else ( exit /b 0 ) 


:PrintWindowDimensionsFromHWND
for /f "tokens=1-6" %%a in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } public class WindowPos { [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';  $rc = New-Object RECT; [WindowPos]::GetWindowRect([IntPtr]%~1, [ref]$rc) | Out-Null; \"$^($rc.left^), $^($rc.top^), $^($rc.right^), $^($rc.bottom^), $^($rc.right - $rc.left^) $^($rc.bottom - $rc.top^)\""') do ( 
	echo left:%%a top:%%b right:%%c bottom:%%d width:%%e height:%%f 
	echo 
	echo                     top:%%b
	echo ------------------------+--------------------------right:%%c
	echo ^|                                                 ^|
	echo ^|                                                 ^|
	echo ^|                                                 ^|
	echo ^|left:%%a                                         ^| height:%%f
	echo ^|                                                 ^|
	echo ^|                                                 ^|
	echo ^|                   width:%%e                    ^|
	echo ------------------------+--------------------------
	echo                    bottom:%%d
	)
GoTo :EOF

public class ClientRect { [DllImport(\"user32.dll\")] public static extern bool GetClientRect(IntPtr hWnd, out RECT lpRect); }';
public class WindowPos { [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';

[StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } 

public class ClientRect { [DllImport(\"user32.dll\")] public static extern bool GetClientRect(IntPtr hWnd, out RECT lpRect); }';

 $rc = New-Object RECT; [ClientRect]::GetClientRect([IntPtr]%~1, [ref]$rc) | Out-Null;
 
 \"$^($rc.right^), $^($rc.bottom^)\""'
 
 ) do ( echo width:%%a height:%%b  )
 
 
 
 
 
[StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } 

public class WindowPos { [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';

  $rc = New-Object RECT; [WindowPos]::GetWindowRect([IntPtr]%~1, [ref]$rc) | Out-Null;
  
  \"$^($rc.left^), $^($rc.top^), $^($rc.right^), $^($rc.bottom^), $^($rc.right - $rc.left^) $^($rc.bottom - $rc.top^)\""'
  
  ) do ( 


"Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; 

[StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } 

public class WindowPos { [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';  

$rc = New-Object RECT;
[WindowPos]::GetWindowRect([IntPtr]%~1, [ref]$rc) | Out-Null;
\"$^($rc.left^), $^($rc.top^), $^($rc.right^), $^($rc.bottom^), $^($rc.right - $rc.left^) $^($rc.bottom - $rc.top^)\""






[DllImport("user32.dll", SetLastError = true)]
public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);

MoveWindow - Changes the position and dimensions of the specified window.




::Usage: Call :MoveWindowPosition hWND newX newY
:MoveWindowPosition
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class WindowMover { [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint); }'; [WindowMover]::MoveWindow([IntPtr]%~1, %~2, %~3, 0, 0, $false) | Out-Null; \"Moved\""') do (echo %%i)
GOTO :EOF

::Usage: Call :ResizeWindow hWND newWidth newHeight
:ResizeWindow
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class WindowResizer { [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint); }'; [WindowResizer]::MoveWindow([IntPtr]%~1, 0, 0, %~2, %~3, $false) | Out-Null; \"Resized\""') do (echo %%i)
GOTO :EOF








--------------------------------------------------------------------------------------

SetWindowRgn - Sets the window region of a window. The window region determines the area within the window where the system permits drawing. The system does not display any portion of a window that lies outside of the window region.

[DllImport("user32.dll")] public static extern int SetWindowRgn(IntPtr hWnd, IntPtr hRgn, bool bRedraw);

[StructLayout(LayoutKind.Sequential)] public struct POINT { public int x; public int y; }

SIZE - Specifies the width and height of a rectangle.
[StructLayout(LayoutKind.Sequential)] public struct SIZE { public int cx; public int cy; }

PAINTSTRUCT - Contains information for an application. This information can be used to paint the client area of a window owned by that application.
[StructLayout(LayoutKind.Sequential)] public struct PAINTSTRUCT { public IntPtr hdc; public bool fErase; public RECT rcPaint; public bool fRestore; public bool fIncUpdate; [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)] public byte[] rgbReserved; }

LOGPEN - Defines the style, width, and color of a pen.
[StructLayout(LayoutKind.Sequential)] public struct LOGPEN { public uint lopnStyle; public POINT lopnWidth; public uint lopnColor; }

LOGBRUSH - Defines the style, color, and pattern of a physical brush.
[StructLayout(LayoutKind.Sequential)] public struct LOGBRUSH { public uint lbStyle; public uint lbColor; public uint lbHatch; }




::Usage: Call :SetEllipseWindow HWND
:SetEllipseWindow2
for /f "tokens=*" %%i in ('powershell -command "
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices;
 [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } 
 public class WindowShape { 
							[DllImport(\"user32.dll\")] 
								public static extern bool SetWindowRgn(IntPtr hWnd, IntPtr hRgn, bool bRedraw); 
							[DllImport(\"gdi32.dll\")] 
								public static extern IntPtr CreateEllipticRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);
							[DllImport(\"gdi32.dll\")] 
								public static extern bool DeleteObject(IntPtr hObject); }';
								
$rect = New-Object RECT; 
$hRgn = [WindowShape]::CreateEllipticRgn($rect.left, $rect.top, $rect.right, $rect.bottom);
[WindowShape]::SetWindowRgn([IntPtr]%~1, $hRgn, $true);
[WindowShape]::DeleteObject($hRgn);"'
							
							) do ( echo %%i )
 
 
GOTO :EOF

:SetEllipseWindow-DEMO

Call :GetConsolehWND
Call :SetEllipseWindow %errorlevel%

GoTo :EOF

::Usage: Call :SetEllipseWindow HWND
:SetEllipseWindow
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; } public class WindowShape { [DllImport(\"user32.dll\")] public static extern bool SetWindowRgn(IntPtr hWnd, IntPtr hRgn, bool bRedraw); [DllImport(\"gdi32.dll\")] public static extern IntPtr CreateEllipticRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect); [DllImport(\"gdi32.dll\")] public static extern bool DeleteObject(IntPtr hObject); [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }'; $rect = New-Object RECT; [WindowShape]::GetWindowRect([IntPtr]%~1, [ref]$rect); $hRgn = [WindowShape]::CreateEllipticRgn($rect.left, $rect.top, $rect.right, $rect.bottom); [WindowShape]::SetWindowRgn([IntPtr]%~1, $hRgn, $true); [WindowShape]::DeleteObject($hRgn);"') do ( echo %%i )
GOTO :EOF

::Usage: Call :SetEllipseWindow HWND
:SetEllipseWindow3
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices;
 [StructLayout(LayoutKind.Sequential)] public struct RECT { public int left; public int top; public int right; public int bottom; }
 public class WindowShape { [DllImport(\"user32.dll\")] public static extern bool SetWindowRgn(IntPtr hWnd, IntPtr hRgn, bool bRedraw);
 [DllImport(\"gdi32.dll\")] public static extern IntPtr CreateEllipticRgn(int nLeftRect, int nTopRect, int nRightRect, int nBottomRect);
 [DllImport(\"gdi32.dll\")] public static extern bool DeleteObject(IntPtr hObject);
 [DllImport(\"user32.dll\")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect); }';
 $rect = New-Object RECT; [WindowShape]::GetWindowRect([IntPtr]%~1, [ref]$rect);
 $hRgn = [WindowShape]::CreateEllipticRgn($rect.left, $rect.top, $rect.right, $rect.bottom);
 [WindowShape]::SetWindowRgn([IntPtr]%~1, $hRgn, $true); [WindowShape]::DeleteObject($hRgn);"') do ( echo %%i )
 
 
 
GOTO :EOF
https://learn.microsoft.com/en-us/windows/win32/api/winuser/


::Usage: Call :HideTitleAndFrame HWND
:HideTitleAndFrame
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class WindowStyle { [DllImport(\"user32.dll\")] public static extern int GetWindowLong(IntPtr hWnd, int nIndex); [DllImport(\"user32.dll\")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong); public const int GWL_STYLE = -16; public const int WS_CAPTION = 0xC00000; public const int WS_THICKFRAME = 0x40000; }'; $style = [WindowStyle]::GetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE); $style = $style -band (-bnot [WindowStyle]::WS_CAPTION) -band (-bnot [WindowStyle]::WS_THICKFRAME); [WindowStyle]::SetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE, $style);"') do ( echo %%i )
GOTO :EOF

::Usage: Call :ShowTitleAndFrame HWND
:ShowTitleAndFrame
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class WindowStyle { [DllImport(\"user32.dll\")] public static extern int GetWindowLong(IntPtr hWnd, int nIndex); [DllImport(\"user32.dll\")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong); public const int GWL_STYLE = -16; public const int WS_CAPTION = 0xC00000; public const int WS_THICKFRAME = 0x40000; }'; $style = [WindowStyle]::GetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE); $style = $style -bor [WindowStyle]::WS_CAPTION -bor [WindowStyle]::WS_THICKFRAME; [WindowStyle]::SetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE, $style);"') do ( echo %%i )
GOTO :EOF

::Usage: Call :HideTitleAndFrame HWND
REM :HideTitleAndFrame
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition '
using System; using System.Runtime.InteropServices;
 public class WindowStyle { [DllImport(\"user32.dll\")] 
 public static extern int GetWindowLong(IntPtr hWnd, int nIndex);
 [DllImport(\"user32.dll\")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);
 public const int GWL_STYLE = -16; public const int WS_CAPTION = 0xC00000;
 public const int WS_THICKFRAME = 0x40000; }';
 $style = [WindowStyle]::GetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE);
 $style = $style -band (-bnot [WindowStyle]::WS_CAPTION) -band (-bnot [WindowStyle]::WS_THICKFRAME);
 [WindowStyle]::SetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE, $style);"') do ( echo %%i )
GOTO :EOF

::Usage: Call :ShowTitleAndFrame HWND
REM :ShowTitleAndFrame
for /f "tokens=*" %%i in ('powershell -command "Add-Type -TypeDefinition '
using System; using System.Runtime.InteropServices;
 public class WindowStyle { [DllImport(\"user32.dll\")] public static extern int GetWindowLong(IntPtr hWnd, int nIndex);
 [DllImport(\"user32.dll\")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);
 public const int GWL_STYLE = -16;
 public const int WS_CAPTION = 0xC00000;
 public const int WS_THICKFRAME = 0x40000; }';
 $style = [WindowStyle]::GetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE);
 $style = $style -bor [WindowStyle]::WS_CAPTION -bor [WindowStyle]::WS_THICKFRAME;
 [WindowStyle]::SetWindowLong([IntPtr]%~1, [WindowStyle]::GWL_STYLE, $style);"') do ( echo %%i )
GOTO :EOF


--------------------------------------------------------------------------------------

obtain device context from window
GetDC(), BeginPaint() 
then select GDI object
draw shit
then release device context
ReleaseDC(), EndPaint()
and delete the GDI objects

Before drawing with GDI functions, you'll need to obtain a device context (DC) for the window or device where you want to draw.
 This can be achieved using functions like GetDC(), BeginPaint(), etc. Once you have a DC, you can select GDI objects (like pens and brushes)
 into the DC to control the appearance of the graphics you draw.
After you finish drawing, always make sure to release or end the DC with functions like ReleaseDC(), EndPaint(), etc.
 Also, GDI objects like pens, brushes, and fonts should be properly cleaned up using DeleteObject() to avoid resource leaks.

    Dot or Pixels:
        SetPixel(): Sets the pixel at a specified location to a specified color.

    Lines:
        MoveToEx(): Moves the current drawing position to a specified point.
        LineTo(): Draws a line from the current drawing position up to, but not including, a specified point.

    Rectangles:
        Rectangle(): Draws a rectangle with the current pen and fills it with the current brush.
        DrawEdge(): Draws one or more edges of rectangle.
        FrameRect(): Draws a border around the specified rectangle by using the specified brush.
        InvertRect(): Inverts a rectangle in a window by performing a logical NOT operation on the color values for each pixel in the rectangle's interior.
        FillRect(): Fills a rectangle by using the specified brush.

    Circles and Ellipses:
        Ellipse(): Draws an ellipse with the current pen and fills it with the current brush.

    Polygons:
        Polygon(): Draws a polygon consisting of two or more vertices connected by straight lines.
        PolyPolygon(): Draws multiple polygons. Each polygon is outlined by using the current pen and filled by using the current brush.

    Polylines:
        Polyline(): Draws a series of line segments by connecting the points in an array.
        PolyPolyline(): Draws multiple polylines.

    Bezier Splines:
        PolyBezier(): Draws one or more Bezier curves.
        PolyBezierTo(): Draws one or more Bezier curves.

    Arcs and Pie shapes:
        Arc(): Draws an elliptical arc.
        Chord(): Draws a chord (a region bounded by the intersection of an ellipse and a line segment, called a secant).
        Pie(): Draws a pie-shaped wedge bounded by the intersection of an ellipse and two radials.

    Rounded Rectangles:
        RoundRect(): Draws a rectangle with rounded corners.

SetPixel
MoveToEx
LineTo
Rectangle
DrawEdge
FrameRect
InvertRect
FillRect
Ellipse
Polygon
PolyPolygon
Polyline
PolyPolyline
PolyBezierTo
PolyBezier
Arc
Chord
Pie
RoundRect


::Usage Call :Concatenate OutputValue optional (SEPARATOR "X") InputArray1 InputArray2 InputArrayN 
:Concatenate
if not defined _Concatenate_localscope ( setlocal enabledelayedexpansion & set "_Concatenate_localscope=true" )
if not defined _Concatenate_output ( set "_Concatenate_output=%~1" & shift & GoTo :Concatenate )
if "[%~1]" EQU "[SEPARATOR]" ( set "_Concatenate_separator=%~2" & shift & shift & GoTo :Concatenate )
set "_Concatenate_prefix=_CA"
if defined %1.ubound ( set "_Concatenate_input=%~1" ) else ( set "_Concatenate_input=_Concatenate_placeholder" & set "_Concatenate_placeholder[0]=" )
if defined %1.lbound call set /a _Concatenate_lbound=%%%~1.lbound%%
if defined %1.ubound call set /a _Concatenate_ubound=%%%~1.ubound%%
if not defined %1.lbound set /a "_Concatenate_lbound=0"
if not defined %1.ubound set /a "_Concatenate_ubound=0"
set /a "_Concatenate_index=%_Concatenate_lbound%"
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] if defined %1 set %_Concatenate_input%[%_Concatenate_index%]=!%1!
if not defined %1.lbound if not defined %1.ubound if not defined %_Concatenate_input%[%_Concatenate_index%] set "%_Concatenate_input%[%_Concatenate_index%]=%~1"
if defined !_Concatenate_separator! ( set _Concatenate_separator=!%_Concatenate_separator%! )
if not defined _Concatenate_separator set "_Concatenate_separator= "
:Concatenate-loop
set _Concatenate_buffer=!_Concatenate_buffer!!%_Concatenate_input%[%_Concatenate_index%]!!_Concatenate_separator!
set /a "_Concatenate_index+=1"
if %_Concatenate_index% LEQ %_Concatenate_ubound% GoTo :Concatenate-loop
if "[%~2]" NEQ "[]" ( shift & GoTo :Concatenate ) 
for /f "tokens=* delims==" %%a in ('echo.!_Concatenate_buffer!') do (
																endlocal
																set %_Concatenate_output%=%%a
																)
Call :ClearVariablesByPrefix %_Concatenate_prefix% _Concatenate
GoTo :EOF