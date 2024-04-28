
:AddEscapeCharacters-DEMO

REM goto :AddEscapeCharacters-DEMO-skip1
REM goto :AddEscapeCharacters-DEMO-skip2
REM goto :AddEscapeCharacters-DEMO-skip3

echo.
set "_mystring=abcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a%%bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a^bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a<bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a>bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a|bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a&bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a<>bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a||bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a&&bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%


set " _mystring=" & set "_outstring=" & echo.
set "_mystring=ab"c^^d"ef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
set _outstring
echo %_outstring%

:AddEscapeCharacters-DEMO-skip1

echo cleaner output

echo.
set "_mystring=abcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a%%bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a^bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a<bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a>bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a|bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a&bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a<>bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a||bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=a&&bcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

set " _mystring=" & set "_outstring=" & echo.
set "_mystring=ab"c^^d"ef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

:AddEscapeCharacters-DEMO-skip2


echo.
set "_mystring=abcdefabcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

echo.
set "_mystring=abc<>def"abc^<^>def"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

echo.
set "_mystring=abc||de"fa""bc^|^|def"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

echo.
set "_mystring=ab^&cde"fab^^^&cdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

echo.
set "_mystring=abc|^de"fa"bc|^def"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

echo.
set "_mystring=abc%%de"f"a"bc%%def"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

echo.
set "_mystring=%%a%%bcde"fa"b%%cd%%ef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

goto:eof

echo.
set "_mystring=abcdefabcdef"
set _mystring
Call :AddEscapeCharacters _mystring _outstring
echo _mystring=%_outstring%

GoTo :EOF

