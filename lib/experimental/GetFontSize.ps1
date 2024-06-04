Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class ConsoleFontSize {
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    private struct COORD {
        public short X;
        public short Y;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    private struct CONSOLE_FONT_INFOEX {
        public uint cbSize;
        public uint nFont;
        public COORD dwFontSize;
        public uint FontFamily;
        public uint FontWeight;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string FaceName;
    }

    [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
    private static extern bool GetCurrentConsoleFontEx(IntPtr hConsoleOutput, bool bMaximumWindow, ref CONSOLE_FONT_INFOEX lpConsoleCurrentFontEx);

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern IntPtr GetStdHandle(int nStdHandle);

    private const int STD_OUTPUT_HANDLE = -11;

    public static void GetFontSize() {
        IntPtr hConsoleOutput = GetStdHandle(STD_OUTPUT_HANDLE);
        if (hConsoleOutput == IntPtr.Zero) {
            int errorCode = Marshal.GetLastWin32Error();
            Console.WriteLine("Failed to get console handle. Error code: " + errorCode);
            Environment.Exit(1);
        }

        CONSOLE_FONT_INFOEX cfi = new CONSOLE_FONT_INFOEX();
        cfi.cbSize = (uint)Marshal.SizeOf<CONSOLE_FONT_INFOEX>();

        if (GetCurrentConsoleFontEx(hConsoleOutput, false, ref cfi)) {
            Console.WriteLine("Font Size: " + cfi.dwFontSize.Y);
            Environment.Exit(0);
        } else {
            int errorCode = Marshal.GetLastWin32Error();
            Console.WriteLine("Failed to get font size. Error code: " + errorCode);
            Environment.Exit(1);
        }
    }
}
"@

[ConsoleFontSize]::GetFontSize()
