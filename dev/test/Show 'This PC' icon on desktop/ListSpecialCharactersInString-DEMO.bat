
:ListSpecialCharactersInString-DEMO

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set "_mystring=ab%%cdef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set _mystring=abc%%def
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set "_mystring=abcd"ef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set _mystring=abcde"f
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set "_mystring=abcd&ef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set _mystring=abc^&def
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set "_mystring=ab<cdef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set _mystring=a^<bcdef
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set "_mystring=ab>cdef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set _mystring=abc^>def
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set "_mystring=abcd|ef"
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
set _mystring=abcde^|f
set _mystring
Call :ListSpecialCharactersInString _mystring

echo.
echo now with output index of all special characters found

Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=a%bcdef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab%%cdef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc%%def
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd"ef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde"f
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd&ef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^&def
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab<cdef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=a^<bcdef
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=ab>cdef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abc^>def
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set "_mystring=abcd|ef"
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo.
set _mystring=abcde^|f
set _mystring
Call :ListSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
set IndexOfSpecialChar[
Call :ClearVariablesByPrefix IndexOfSpecialChar




REM set "_mystring=abc^"def%%ghi^&k^<l^>m^^n|"
REM Call :InsertEscapeCharacters _mystring

goto :eof

