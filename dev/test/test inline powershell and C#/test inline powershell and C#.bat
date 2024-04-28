@echo off

GoTo :runps-DEMO


::Usage Call :RunPowershellByRef ScriptContainingVariable Argument1 Argument2 ... ArgumentN 
::Usage Call :RunPowershellByLabel :StartScriptLabel optional :EndScriptLabel optional ExternalFile Argument1 Argument2 ... ArgumentN
::Usage Call :RunPowershell %ScriptContainingVariable% Argument1 Argument2 ... ArgumentN
:RunPowershellByRef
:RunPowershellByLabel
:RunPowershell

::Usage Call :RunCsharpByRef ScriptContainingVariable Argument1 Argument2 ... ArgumentN
::Usage Call :RunCsharpByLabel :StartScriptLabel optional :EndScriptLabel optional ExternalFile Argument1 Argument2 ... ArgumentN
::Usage Call :RunCsharp %ScriptContainingVariable% Argument1 Argument2 ... ArgumentN
:RunCsharpByRef
:RunCsharpByLabel
:RunCsharp

::Usage Call :RunVBnetByRef ScriptContainingVariable Argument1 Argument2 ... ArgumentN
::Usage Call :RunVBnetByLabel :StartScriptLabel optional :EndScriptLabel optional ExternalFile Argument1 Argument2 ... ArgumentN
::Usage Call :RunVBnet %ScriptContainingVariable% Argument1 Argument2 ... ArgumentN
:RunVBnetByRef
:RunVBnetByLabel
:RunVBnet

::Usage Call :RunCByRef ScriptContainingVariable Argument1 Argument2 ... ArgumentN
::Usage Call :RunCByLabel :StartScriptLabel optional :EndScriptLabel optional ExternalFile Argument1 Argument2 ... ArgumentN
::Usage Call :RunC %ScriptContainingVariable% Argument1 Argument2 ... ArgumentN
:RunCByRef
:RunCByLabel
:RunC

:RunVBscript

:RunJscript
:RunJavascript
:RunECMAscript
:RunJnetscript
:RunWSHscript
:RunWSFscript

:ruby
:python
:c++
TCC tiny c compiler
TDM-GCC smallest c++ compiler
lua 


directives  

compile only
compile if needed
compile if needed and run
compile, run and wait


:runps-DEMO

call :SetLF
call :TestLF

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


goto :runps-DEMO-skip

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
echo -1

powershell -noprofile -c Add-Type -TypeDefinition ' ^
  public class Foo { ^
    public static string Bar() { return \"hi!\"; } ^
  } ^
  '; ^
  [Foo]::Bar()

echo.
echo 0
powershell -command Add-Type -TypeDefinition ' ^
	using System; ^
	public class LogicCheck { ^
	public static void Check(bool condition) { ^
	if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False");^
	} } } ^
	'; ^
	[LogicCheck]::Check($false)
echo 0.1
powershell -command Add-Type -TypeDefinition ' ^
  using System; ^
  public class LogicCheck { ^
  public static void Check(bool condition) { ^
  if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False");^
  } } } ^
  '; ^
  [LogicCheck]::Check($false)
echo 0.2
powershell -noprofile -c Add-Type -TypeDefinition ' ^
	using System; ^
	public class LogicCheck { ^
	public static void Check(bool condition) { ^
	if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False");^
	} } } ^
	'; ^
	[LogicCheck]::Check($false)
echo 0.3
powershell -noprofile -c Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } '; [LogicCheck]::Check($false)
	
echo 0.4
powershell -noprofile -c Add-Type -TypeDefinition ' using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } '; [LogicCheck]::Check($false)

echo 0.5
powershell -noprofile -c Add-Type -TypeDefinition ' ^
	using System; ^
	public class LogicCheck { ^
		public static void Check(bool condition) ^
		{ if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } ^
		} '; [LogicCheck]::Check($false)

echo 0.6
powershell -noprofile -c Add-Type -TypeDefinition ' ^
	using System; ^
	public class LogicCheck { ^
		public static void Check(bool condition) ^
		{ if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } ^
		} '; [LogicCheck]::Check($false)
echo 0.7
powershell -noprofile -c Add-Type -TypeDefinition ' ^
	using System; ^
	public class LogicCheck { ^
		public static void Check(bool condition) ^
		{ if (condition) { Console.WriteLine(""Result is True""); } else { Console.WriteLine(""Result is False""); } } ^
		} '; [LogicCheck]::Check($false)
		
		
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
echo 25
powershell -command Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%"@ [LogicCheck]::Check($false)
echo 26
powershell -command Add-Type -TypeDefinition @'%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%'@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @'%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%'@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @'%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%'@ [LogicCheck]::Check($false)
echo 27
powershell -command Add-Type -TypeDefinition @\"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%\"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @\"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%\"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @\"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%\"@ [LogicCheck]::Check($false)
echo 28
powershell -command Add-Type -TypeDefinition @"%LF%using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } }%LF%"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @"%LF%using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } }%LF%"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @"%LF%using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } }%LF%"@ [LogicCheck]::Check($false)
echo 29
powershell -command 'Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%"@ [LogicCheck]::Check($false)'
powershell -command 'Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%"@ [LogicCheck]::Check($false)'
powershell -command 'Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%"@ [LogicCheck]::Check($false)'
echo 30
powershell -command Add-Type -TypeDefinition @^"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%^"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @^"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%^"@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition @^"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%^"@ [LogicCheck]::Check($false)
echo 31
powershell -command Add-Type -TypeDefinition ^@^"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%^"^@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition ^@^"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%^"^@ [LogicCheck]::Check($false)
powershell -command Add-Type -TypeDefinition ^@^"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%^"^@ [LogicCheck]::Check($false)
echo 32
powershell -command " Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%"@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%"@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @"%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%"@ [LogicCheck]::Check($false) "
echo 33
powershell -command " Add-Type -TypeDefinition @'%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine("Result is True"); } else { Console.WriteLine("Result is False"); } } } %LF%'@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @'%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(\"Result is True\"); } else { Console.WriteLine(\"Result is False\"); } } } %LF%'@ [LogicCheck]::Check($false) "
powershell -command " Add-Type -TypeDefinition @'%LF% using System; public class LogicCheck { public static void Check(bool condition) { if (condition) { Console.WriteLine(^"Result is True^"); } else { Console.WriteLine(^"Result is False^"); } } } %LF%'@ [LogicCheck]::Check($false) "
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


:SetLF
(SET LF=^
%=this line is empty=%
)
GoTo :EOF

:TestLF
setlocal enabledelayedexpansion
if "!LF!" NEQ "!LF:~0,1!" echo Error "Linefeed definition is defect, probably multiple invisble whitespaces at the line end in the definition of LF"

FOR /F "delims=" %%n in ("!LF!") do (
  echo Error "Linefeed definition is defect, probably invisble whitespaces at the line end in the definition of LF"
)
endlocal
GoTo :EOF