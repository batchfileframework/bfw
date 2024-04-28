@echo off

Call :DecimalToCharacterDEMO
Call :chrDEMO
Call :ascDEMO

GoTo :EOF

:DecimalToCharacterDEMO
set /a index=65
:DecimalToCharacterDEMO_start
set ASCII_code=%index%
Call :DecimalToCharacter %ASCII_code% Output_character
echo DecimalToCharacterDEMO: ASCII %ASCII_code% Character %Output_character% 
set /a index+=1
if %index% LEQ 90 goto :DecimalToCharacterDEMO_start
GoTo :EOF

:chrDEMO
set /a index=65
:chrDEMO_start
set ASCII_code=%index%
Call :chr %ASCII_code% Output_character
echo chrDEMO: ASCII %ASCII_code% Character %Output_character% 
set /a index+=1
if %index% LEQ 90 goto :chrDEMO_start
GoTo :EOF

:ascDEMO
set /a index=65
:ascDEMO_start
set ASCII_code=%index%
Call :DecimalToCharacter %ASCII_code% Output_characterDTC
Call :chr %ASCII_code% Output_characterCHR
Call :asc %Output_characterDTC% 0 CodeDTC
Call :asc %Output_characterCHR% 0 CodeCHR
echo ascDEMO: ASCII %ASCII_code% CharacterDTC %Output_characterDTC% CharacterCHR %Output_characterCHR% CodeDTC %CodeDTC% CodeCHR %CodeCHR%
set /a index+=1
if %index% LEQ 90 goto :ascDEMO_start
GoTo :EOF


::Usage Call :DecimalToCharacter ASCII_code Output_character 
:DecimalToCharacter 
cmd /C exit %1
set %2=%=ExitCodeAscii%
GoTo :EOF
REM https://stackoverflow.com/a/37209642
REM https://stackoverflow.com/questions/38000901/loop-through-ascii-codes-in-batch-file

REM for /L %%A in (65,1,90) do (
    REM echo %%A
    REM cmd /C exit %%A
    REM call echo %%^=ExitCodeAscii%%
REM )

:asc        StrVar IntVal [RtnVar]
::
::  Computes the ASCII code for a specified character within the string
::  contained by variable StrVar. The position within the string is specified
::  by the IntVal argument. A non-negative value is relative to the beginning
::  of the string, with 0 specifying the first character. A negative value is
::  relative to the end of the string, with -1 specifying the last character.
::
::  Sets RtnVar=result
::  or displays result if RtnVar not specified
::
::  IntVal may be passed as a variable without enclosing the name in quotes.
:::
::: Dependencies - asciiMap
:::
  setlocal disableDelayedExpansion
  set /a n=%~2 2>nul
  call set "chr=%%%~1:~%n%,1%%"
  call :asciiMap ascii
  setlocal enableDelayedExpansion
  if "!chr!"==" " set /a rtn=32&goto :asc.end
  set rtn=
  for /l %%n in (0,1,255) do if "!ascii:~%%n,1!"=="!chr!" set rtn=%%n
  :asc.end
  (endlocal & rem -- return values
    endlocal
    if "%~3" neq "" (set %~3=%rtn%) else (echo:%rtn%)
  )
exit /b

:chr        IntVal [RtnVar]
::
::  Converts ASCII code IntVal into the corresponding character.
::
::  Sets RtnVar=result
::  or displays result if RtnVar not specified
::
::  IntVal must be a value between 0 and 255.
::
::  Aborts with an error message to stderr and errorlevel 1 if IntVal
::  corresponds to one of the following problematic characters:
::
::    Dec   Hex   Oct  Char
::    ---  ----  ----  ----
::      0  0x00    00  NUL  (null)
::      3  0x03    03  ETX  (end of text)
::      8  0x08   010  BS   (backspace)
::      9  0x09   011  TAB  (horizontal tab)
::     10  0x0A   012  LF   (line feed)
::     11  0x0B   013  VT   (vertical tab)
::     12  0x0C   014  FF   (form feed)
::     13  0x0D   015  CR   (carriage return)
::     26  0x1A   032  SUB  (substitute)
::    127  0x7F  0177  DEL  (delete)
::
::  IntVal may be passed as a variable without enclosing the name in quotes.
:::
::: Dependencies - asciiMap
:::
  setlocal disableDelayedExpansion
  set /a n=%~1 2>nul
  if %n%==32 set "c= "&goto :chr.end
  call :asciiMap map
  call set "c=%%map:~%n%,1%%"
  if "%c%%c%"=="  " (
    echo ERROR: Problematic ASCII Code >&2
    exit /b 1
  )
  :chr.end
  (endlocal & rem -- return values
    if "%~2" neq "" (set %~2=^%c%) else (echo:^%c%)
  )
exit /b


:asciiMap   rtnVar
::
::  Sets variable rtnVar to a 256 character string containing the complete
::  extended ASCII character set except a space has been substituted for each
::  of the following problematic characters:
::
::    Dec   Hex   Oct  Char
::    ---  ----  ----  ----
::      0  0x00    00  NUL  (null)
::      3  0x03    03  ETX  (end of text)
::      8  0x08   010  BS   (backspace)
::      9  0x09   011  TAB  (horizontal tab)
::     10  0x0A   012  LF   (line feed)
::     11  0x0B   013  VT   (vertical tab)
::     12  0x0C   014  FF   (form feed)
::     13  0x0D   015  CR   (carriage return)
::     26  0x0A   032  SUB  (substitute)
::    127  0x7F  0177  DEL  (delete)
:::
::: Dependencies - <none>
:::
  set %~1=          !^"#$%%^&'^(^)*+,-./0123456789:;^<=^>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^^_`abcdefghijklmnopqrstuvwxyz{^|}~ €‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ
exit /b
REM https://www.dostips.com/forum/viewtopic.php?p=6817#p6817


:CreateLF varByRef
setlocal
set LF=^


for %%a in ("!lf!") do (
   endlocal
   set "%~1=%%~a"
)
goto :eof
REM https://www.dostips.com/forum/viewtopic.php?p=6817#p6817