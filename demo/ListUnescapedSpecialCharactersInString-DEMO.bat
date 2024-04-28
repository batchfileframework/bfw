
:ListUnescapedSpecialCharactersInString-DEMO

REM goto :ListUnescapedSpecialCharactersInString-DEMO-1
REM goto :ListUnescapedSpecialCharactersInString-DEMO-2
goto :ListUnescapedSpecialCharactersInString-DEMO-3

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set "_mystring=ab%%cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set _mystring=abc%%def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set "_mystring=abcd"ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set _mystring=abcde"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set "_mystring=abcd&ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set _mystring=abc^&def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set "_mystring=ab<cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set _mystring=a^<bcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set "_mystring=ab>cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set _mystring=abc^>def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set "_mystring=abcd|ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
set _mystring=abcde^|f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring

echo.
echo Same as previous, but with added escape characters as needed so satify "properly escaped"  status

Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set "_mystring=ab%%%%cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set _mystring=abc%%%%def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set "_mystring=abcd^"ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set _mystring=abcde^^"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set "_mystring=abcd^&ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set _mystring=abc^^^&def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set "_mystring=ab^<cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set _mystring=a^^^<bcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set "_mystring=ab^>cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set _mystring=abc^^^>def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set "_mystring=abcd^|ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 

echo.
set _mystring=abcde^^^|f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring 


:ListUnescapedSpecialCharactersInString-DEMO-1

echo.
echo Output in array form of all unescaped special character

Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab%%cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc%%def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd"ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd&ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^&def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab<cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=a^<bcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab>cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^>def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd|ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde^|f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar


:ListUnescapedSpecialCharactersInString-DEMO-2



echo.
echo Same as previous, but with added escape characters as needed so satify "properly escaped"  status

Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab%%%%cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc%%%%def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd^"ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde^^"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd^&ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^^^&def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab^<cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=a^^^<bcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab^>cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^^^>def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd^|ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde^^^|f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar


echo.
echo Same as previous, but with one escape carret too many on each line, excess adjacent escape characters like carret, percentsigns (and doublequotes) need more attention

Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab%%%%%cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc%%%%%def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd^^"ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde^^^"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd^^&ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

rem broken 'def' is not recognized as an internal or external command,
echo.
set _mystring=abc^^^^&def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab^^<cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

rem broken The system cannot find the file specified. ??  <bcdef
echo.
set _mystring=a^^^^<bcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab^^>cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

REM broken
echo.
set _mystring=abc^^^^>def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd^^|ef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar


:ListUnescapedSpecialCharactersInString-DEMO-3

echo.
set "_mystring=abcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a^bcdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abc^def"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a^b"cde"f"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab"c^de"f"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a^b"cdef"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab"c^def"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar


echo same thing but set without enclosing double quotes

echo.
set _mystring=abcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=a^bcdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=a^b"cde"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=ab"c^de"f
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=a^b"cdef
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=ab"c^def
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar


REM This breaks the script on first set line
REM echo.
REM set _mystring=abcde^^^^|f
REM set _mystring
REM Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
REM Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
REM Call :ClearVariablesByPrefix IndexOfSpecialChar

echo demo finished

REM set "_mystring=abc^"def%%ghi^&k^<l^>m^^n|"
REM Call :InsertEscapeCharacters _mystring

goto :eof

