
:runps-DEMO

set "ps_argument_1="

set pscommand[0]=Write-Host "Result is 1"
set pscommand[1]=Write-Host ^"Result is 2^"
set pscommand[2]=Write-Host ^"Result is 3^";
set pscommand[3]=Write-Host ^"Result is first^"; Write-Host ^"Result is second^";
set pscommand[4]=if ($true) { Write-Host "Result is True"; } else { Write-Host "Result is False"; }
set pscommand[5]=if ($false) { Write-Host "Result is True"; } else { Write-Host "Result is False"; }

set pscommand[6]=if ($true)^
{^
Write-Host "Result is True"; ^
} else {^
Write-Host "Result is False"; ^
}

set pscommand[7]=if ($false)^
{^
Write-Host ^"Result is True^"; ^
} else {^
Write-Host ^"Result is False^"; ^
}

set pscommand[8]=if ($true)^
{^
Write-Host ^"Result is True^"; ^
} else {^
Write-Host ^"Result is False^"; ^
}

set pscommand[9]=if ($%ps_argument_1%)^
{^
Write-Host ^"Result is True^"; ^
} else {^
Write-Host ^"Result is False^"; ^
}


set pscommand[10]=if ($true)^
{^
Write-Host "Result is True"; ^
} else {^
Write-Host "Result is False"; ^
}

set pscommand[11]=if ($false)^
{^
Write-Host "Result is True"; ^
} else {^
Write-Host "Result is False"; ^
}

set pscommand[12]=if ($%ps_argument_1%)^
{^
Write-Host "Result is True"; ^
} else {^
Write-Host "Result is False"; ^
}


REM goto :runps-DEMO-skip

echo running pscommand
echo simple command, no string escaping
set pscommand[0]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[0]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[0]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[0]!
echo delayed expansion, in quotes
powershell -command "!pscommand[0]!"
endlocal 
echo.

echo running pscommand 
echo simple command, string escaping escaped
set pscommand[1]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[1]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[1]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[1]!
echo delayed expansion, in quotes
powershell -command "!pscommand[1]!"
endlocal 
echo.

echo running pscommand 
echo simple command, no string escaping plus terminator ";"
set pscommand[2]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[2]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[2]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[2]!
echo delayed expansion, in quotes
powershell -command "!pscommand[2]!"
endlocal 
echo.

echo running pscommand 
echo two simple command, string escaping escaped, separated by terminators ";"
set pscommand[3]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[3]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[3]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[3]!
echo delayed expansion, in quotes
powershell -command "!pscommand[3]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, strings not escaped, value is true
set pscommand[4]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[4]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[4]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[4]!
echo delayed expansion, in quotes
powershell -command "!pscommand[4]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, strings not escaped, value is false
set pscommand[5]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[5]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[5]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[5]!
echo delayed expansion, in quotes
powershell -command "!pscommand[5]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, value is true, quotes not escaped, written in multiline format
set pscommand[6]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[6]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[6]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[6]!
echo delayed expansion, in quotes
powershell -command "!pscommand[6]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, value is false, quotes escaped, written in multiline format
set pscommand[7]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[7]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[7]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[7]!
echo delayed expansion, in quotes
powershell -command "!pscommand[7]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, value is false, quotes escaped, written in multiline format
set pscommand[8]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[8]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[8]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[8]!
echo delayed expansion, in quotes
powershell -command "!pscommand[8]!"
endlocal 
echo.

set "ps_argument_1=true"
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo simple decision, value is determined by variable ps_argument_1
echo quotes escaped, written in multiline format
echo this will not work because pscommand[9] was created with empty ps_argument_1
set pscommand[9]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[9]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[9]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[9]!
echo delayed expansion, in quotes
powershell -command "!pscommand[9]!"
endlocal 
echo.

set "ps_argument_1=false"
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo simple decision, value is determined by variable ps_argument_1
echo quotes escaped, written in multiline format
echo this will not work because pscommand[9] was created with empty ps_argument_1
set pscommand[9]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[9]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[9]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[9]!
echo delayed expansion, in quotes
powershell -command "!pscommand[9]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, value is true, quotes not escaped, written in multiline format
set pscommand[10]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[10]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[10]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[10]!
echo delayed expansion, in quotes
powershell -command "!pscommand[10]!"
endlocal 
echo.

echo running pscommand 
echo simple decision, value is true, quotes not escaped, written in multiline format
set pscommand[11]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[11]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[11]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[11]!
echo delayed expansion, in quotes
powershell -command "!pscommand[11]!"
endlocal 
echo.

set "ps_argument_1=true"
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo simple decision, value is determined by variable ps_argument_1
echo quotes not escaped, written in multiline format
echo this will not work because pscommand[12] was created with empty ps_argument_1
set pscommand[12]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[12]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[12]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[12]!
echo delayed expansion, in quotes
powershell -command "!pscommand[12]!"
endlocal 
echo.

set "ps_argument_1=false"
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo this will not work because pscommand[12] was created with empty ps_argument_1
set pscommand[12]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[12]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[12]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[12]!
echo delayed expansion, in quotes
powershell -command "!pscommand[12]!"
endlocal 
echo.


set "ps_argument_1=true"
set pscommand[9]=if ($%ps_argument_1%)^
{^
Write-Host ^"Result is True^"; ^
} else {^
Write-Host ^"Result is False^"; ^
}
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo simple decision, value is determined by variable ps_argument_1
echo quotes escaped, written in multiline format
echo this time, pscommand set with internal variable pre-set
set pscommand[9]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[9]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[9]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[9]!
echo delayed expansion, in quotes
powershell -command "!pscommand[9]!"
endlocal 
echo.


set "ps_argument_1=false"
set pscommand[9]=if ($%ps_argument_1%)^
{^
Write-Host ^"Result is True^"; ^
} else {^
Write-Host ^"Result is False^"; ^
}
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo simple decision, value is determined by variable ps_argument_1
echo quotes escaped, written in multiline format
echo this time, pscommand set with internal variable pre-set
set pscommand[9]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[9]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[9]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[9]!
echo delayed expansion, in quotes
powershell -command "!pscommand[9]!"
endlocal 
echo.



set "ps_argument_1=true"
set pscommand[12]=if ($%ps_argument_1%)^
{^
Write-Host "Result is True"; ^
} else {^
Write-Host "Result is False"; ^
}
echo running pscommand with ps_argument_1 = %ps_argument_1%
echo simple decision, value is determined by variable ps_argument_1
echo quotes not escaped, written in multiline format
set pscommand[12]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[12]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[12]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[12]!
echo delayed expansion, in quotes
powershell -command "!pscommand[12]!"
endlocal 
echo.

set "ps_argument_1=false"
set pscommand[12]=if ($%ps_argument_1%)^
{^
Write-Host "Result is True"; ^
} else {^
Write-Host "Result is False"; ^
}
echo running pscommand with ps_argument_1 = %ps_argument_1%
set pscommand[12]
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[12]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[12]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[12]!
echo delayed expansion, in quotes
powershell -command "!pscommand[12]!"
endlocal 
echo.

:runps-DEMO-skip


REM set pscommand[14]=Add-Type -TypeDefinition @"^
REM using System;^
REM public class LogicCheck^
REM {^
    REM public static void Check(bool condition)^
    REM {^
        REM if (condition)^
        REM {^
            REM Console.WriteLine("Result is True");^
        REM }^
        REM else^
        REM {^
            REM Console.WriteLine("Result is False");^
        REM }^
    REM }^
REM }^"@^
REM [LogicCheck]::Check($false)

REM set pscommand[14]=Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } "@ [LogicCheck]::Check($false)

REM set pscommand[14]
REM echo running command to hide cursor
REM echo.
REM echo on

echo.
echo 1
powershell -command Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } "@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } "@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } "@ [LogicCheck]::Check($false)
echo 2
powershell -command Add-Type -TypeDefinition @' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } '@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } '@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } '@ [LogicCheck]::Check($false)
echo 3
powershell -command Add-Type -TypeDefinition @\" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } \"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @\" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } \"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @\" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } \"@ [LogicCheck]::Check($false)
echo 4
powershell -command Add-Type -TypeDefinition @"using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } }"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @"using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } }"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @"using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } }"@ [LogicCheck]::Check($false)
echo 5
powershell -command 'Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } "@ [LogicCheck]::Check($false)'
powershell -command 'Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } "@ [LogicCheck]::Check($false)'
powershell -command 'Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } "@ [LogicCheck]::Check($false)'
echo 6
powershell -command Add-Type -TypeDefinition @^" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } ^"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @^" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } ^"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @^" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } ^"@ [LogicCheck]::Check($false)
echo 7
powershell -command Add-Type -TypeDefinition ^@^" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } ^"^@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition ^@^" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } ^"^@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition ^@^" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } ^"^@ [LogicCheck]::Check($false)
echo 8
powershell -command " Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } "@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } "@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } "@ [LogicCheck]::Check($false) "
echo 9
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)
echo 10
powershell -command " Add-Type -TypeDefinition @' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } '@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } '@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } '@ [LogicCheck]::Check($false) "
echo 11
powershell -command "Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)"
powershell -command "Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)"
powershell -command "Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)"
echo 12
powershell -command 'Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)'
powershell -command 'Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)'
powershell -command 'Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)'
echo 13
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)
echo 14
powershell -command Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } ' [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } ' [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } ' [LogicCheck]::Check($false)
echo 15
powershell -command Add-Type -TypeDefinition " using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } " [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition " using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } " [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition " using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } " [LogicCheck]::Check($false)
echo 16
powershell -command Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } \" [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } \" [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } \" [LogicCheck]::Check($false)
echo 17
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)
echo 18
powershell -command Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)'
powershell -command Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)'
powershell -command Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)'
echo 19
powershell -command Add-Type -TypeDefinition " using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)"
powershell -command Add-Type -TypeDefinition " using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)"
powershell -command Add-Type -TypeDefinition " using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)"
echo 20
powershell -command Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false) \"
powershell -command Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false) \"
powershell -command Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false) \"
echo 21
powershell -command " Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } [LogicCheck]::Check($false)"
powershell -command " Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } [LogicCheck]::Check($false)"
powershell -command " Add-Type -TypeDefinition using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } [LogicCheck]::Check($false)"
echo 22
powershell -command " Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } ' [LogicCheck]::Check($false)"
powershell -command " Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } ' [LogicCheck]::Check($false)"
powershell -command " Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } ' [LogicCheck]::Check($false)"
echo 23
powershell -command " Add-Type -TypeDefinition "" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } "" [LogicCheck]::Check($false)"
powershell -command " Add-Type -TypeDefinition "" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } "" [LogicCheck]::Check($false)"
powershell -command " Add-Type -TypeDefinition "" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } "" [LogicCheck]::Check($false)"
echo 24
powershell -command " Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } \" [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } \" [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition \" using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } \" [LogicCheck]::Check($false) "

REM echo no delayed expansion, without quotes
REM powershell -command %pscommand[14]%

REM echo.
REM echo no delayed expansion, in quotes
REM powershell -command "%pscommand[14]%"

REM setlocal enableDelayedExpansion
REM echo delayed expansion, without quotes
REM powershell -command !pscommand[14]!

REM echo delayed expansion, in quotes
REM powershell -command "!pscommand[14]!"

REM endlocal 
REM echo.

REM powershell -command Add-Type -TypeDefinition "using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True");        } else { Console.WriteLine("Result is False"); } } }" [LogicCheck]::Check($false)


goto :eof


set pscommand[13]=Add-Type -TypeDefinition @^"^
using System;^
using System.Runtime.InteropServices;^
public class ConsoleUtils {^
    private const int STD_OUTPUT_HANDLE = -11;^
    [StructLayout(LayoutKind.Sequential)]^
    public struct COORD {^
        public short X;^
        public short Y;^
    };^
    [StructLayout(LayoutKind.Sequential)]^
    public struct CONSOLE_CURSOR_INFO {^
        public uint Size;^
        public bool Visible;^
    };^
    [DllImport(^"kernel32.dll^", SetLastError = true)]^
    public static extern IntPtr GetStdHandle(int nStdHandle);^
    [DllImport(^"kernel32.dll^")]^
    public static extern bool GetConsoleCursorInfo(IntPtr hConsoleOutput, out CONSOLE_CURSOR_INFO cci);^
    [DllImport(^"kernel32.dll^")]^
    public static extern bool SetConsoleCursorInfo(IntPtr hConsoleOutput, ref CONSOLE_CURSOR_INFO cci);^
    public static void HideCursor() {^
        IntPtr consoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);^
        CONSOLE_CURSOR_INFO cci;^
        if (GetConsoleCursorInfo(consoleHandle, out cci)) {^
            cci.Visible = false;^
            SetConsoleCursorInfo(consoleHandle, ref cci);^
        }^
    };^
};^
^"@ -IgnoreWarnings^
[ConsoleUtils]::HideCursor()




set pscommand[13]
echo running command to hide cursor
echo.
REM echo on
echo no delayed expansion, without quotes
powershell -command %pscommand[13]%
echo no delayed expansion, in quotes
powershell -command "%pscommand[13]%"
setlocal enableDelayedExpansion
echo delayed expansion, without quotes
powershell -command !pscommand[13]!
echo delayed expansion, in quotes
powershell -command "!pscommand[13]!"
endlocal 
echo.




GoTo :EOF
REM call :runps-DEMO-set-pscommand


REM GoTo :EOF

