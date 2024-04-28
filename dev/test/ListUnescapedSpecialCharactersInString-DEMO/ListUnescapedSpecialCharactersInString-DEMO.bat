
@echo off
:setup
REM call :ClearLocalVariables
REM Call :GetTime FileTime StartDate StartTime
REM Call :GetCodePage InitialCodepage
REM Call :SetTitle "Control 'This PC' icon on the desktop" 
REM set debug=false
REM set verbose=100
REM set silent=false
REM set logfile=%tmp%\%filetime%
REM if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
REM call :SetMacroPrintTime

:main

cls


call :ListUnescapedSpecialCharactersInString-DEMO
REM call :ListSpecialCharactersInString-DEMO
REM call :ElseIF-DEMO
REM call :IsArrayDefinedBySet-DEMO
REM call :GetArrayParameters-DEMO




GoTo :END

:end
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=

GoTo :EOF
REM Exit /b %returnvalue%


:ListUnescapedSpecialCharactersInString-DEMO

REM goto :ListUnescapedSpecialCharactersInString-DEMO-1
REM goto :ListUnescapedSpecialCharactersInString-DEMO-2
REM goto :ListUnescapedSpecialCharactersInString-DEMO-3

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

rem broken 'def' is not recognized as an internal or external command, (fixed by quoting ?)
echo.
set "_mystring=abc^^^^&def"
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

rem broken The system cannot find the file specified. ??  <bcdef (fixed by quoting ?)
echo.
set "_mystring=a^^^^<bcdef"
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

REM broken (fixed by quoting?)
echo.
set "_mystring=abc^^^^>def"
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


REM This breaks the script on first set line (fixed by quoting ?)
echo.
set "_mystring=abcde^^^^|f"
set _mystring
Call :ListUnescapedSpecialCharactersInString _mystring IndexOfSpecialChar SILENT
Call :IsArrayDefinedBySet IndexOfSpecialChar[ && set IndexOfSpecialChar[ || echo Array IndexOfSpecialChar[x] is empty 
Call :ClearVariablesByPrefix IndexOfSpecialChar

echo demo finished

REM set "_mystring=abc^"def%%ghi^&k^<l^>m^^n|"
REM Call :InsertEscapeCharacters _mystring

goto :eof





::Usage Call :ListUnescapedSpecialCharactersInString byref InputVariable byref optional OutputArray optional SILENT
:ListUnescapedSpecialCharactersInString
Call :ClearVariablesByPrefix _ListUnescapedSpecialCharactersInString
if "[%~2]" NEQ "[]" Call :GetArrayParameters %~2 _ListUnescapedSpecialCharactersInString_OutputArray Initialize -1
if "[%~3]" EQU "[SILENT]" ( set "_ListUnescapedSpecialCharactersInString_silent=true" ) else ( set "_ListUnescapedSpecialCharactersInString_silent=false" )
set /a "_ListUnescapedSpecialCharactersInString_previous_index=-1"
set /a "_ListUnescapedSpecialCharactersInString_index=0"
set /a "_ListUnescapedSpecialCharactersInString_next_index=1"
set "_ListUnescapedSpecialCharactersInString_quote_state=unquoted"
set /a "_ListUnescapedSpecialCharactersInString_quote_count=0"
setlocal enabledelayedexpansion
:ListUnescapedSpecialCharactersInString-loop
set "_ListUnescapedSpecialCharactersInString_previous_char=" & set "_ListUnescapedSpecialCharactersInString_next_char=" & set "_ListUnescapedSpecialCharactersInString_char="
if %_ListUnescapedSpecialCharactersInString_previous_index% GEQ 0 set "_ListUnescapedSpecialCharactersInString_previous_char=!%~1:~%_ListUnescapedSpecialCharactersInString_previous_index%,1!"
set "_ListUnescapedSpecialCharactersInString_char=!%~1:~%_ListUnescapedSpecialCharactersInString_index%,1!"
set "_ListUnescapedSpecialCharactersInString_next_char=!%~1:~%_ListUnescapedSpecialCharactersInString_next_index%,1!"
set "_ListUnescapedSpecialCharactersInString_escaped=false"
set "_ListUnescapedSpecialCharactersInString_prev_type="
set "_ListUnescapedSpecialCharactersInString_next_type="
set "_ListUnescapedSpecialCharactersInString_current_type="

if !_ListUnescapedSpecialCharactersInString_previous_char!==%% ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=percentsign"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^" ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=doublequotes"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^& ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=ampersand"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^< ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=lessthan"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^> ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=greaterthan"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^^ ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=carret"
) else if !_ListUnescapedSpecialCharactersInString_previous_char!==^| ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=pipe"
) else ( 
	set "_ListUnescapedSpecialCharactersInString_prev_type=else"
)


if !_ListUnescapedSpecialCharactersInString_next_char!==%% ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=percentsign"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^" ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=doublequotes"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^& ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=ampersand"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^< ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=lessthan"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^> ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=greaterthan"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^^ ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=carret"
) else if !_ListUnescapedSpecialCharactersInString_next_char!==^| ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=pipe"
) else ( 
	set "_ListUnescapedSpecialCharactersInString_next_type=else"
)


if !_ListUnescapedSpecialCharactersInString_char!==%% ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=percentsign"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[percentsign]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[percentsign]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM Clusters of uneven numbers of percentsigns will look escaped to this logic
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character %% at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^" ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=doublequotes"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^" at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^& (
	set "_ListUnescapedSpecialCharactersInString_current_type=ampersand"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^& at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^< ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=lessthan"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^< at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^> ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=greaterthan"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^> at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^^ ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=carret"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[!_ListUnescapedSpecialCharactersInString_next_type!]" NEQ "[else]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^^ at index !_ListUnescapedSpecialCharactersInString_index! )
) else if !_ListUnescapedSpecialCharactersInString_char!==^| ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=pipe"
	if "[!_ListUnescapedSpecialCharactersInString_prev_type!]" EQU "[carret]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	REM if "[!_ListUnescapedSpecialCharactersInString_next_type!]" EQU "[]" set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" if "[!_ListUnescapedSpecialCharactersInString_escaped!]" NEQ "[true]" ( echo Unescaped character ^| at index !_ListUnescapedSpecialCharactersInString_index! )
) else ( 
	set "_ListUnescapedSpecialCharactersInString_current_type=else"
	set "_ListUnescapedSpecialCharactersInString_escaped=true"
	if "[%_ListUnescapedSpecialCharactersInString_silent%]" NEQ "[true]" echo Character does not need escaping !_ListUnescapedSpecialCharactersInString_char! index !_ListUnescapedSpecialCharactersInString_index!
)

if "[!_ListUnescapedSpecialCharactersInString_quote_state!]"=="[quoted]" if "[!_ListUnescapedSpecialCharactersInString_current_type!]" NEQ "[doublequotes]" set "_ListUnescapedSpecialCharactersInString_escaped=true"

REM this logic does not handle uneven numbers of double quotes or percentsigns	
REM in either case, WHERE to add extra percentsign and doublequotes ? Maybe just prefix with carrets ?
endlocal & set "_ListUnescapedSpecialCharactersInString_current_type=%_ListUnescapedSpecialCharactersInString_current_type%" & set "_ListUnescapedSpecialCharactersInString_escaped=%_ListUnescapedSpecialCharactersInString_escaped%" & set "_ListUnescapedSpecialCharactersInString_quote_state=%_ListUnescapedSpecialCharactersInString_quote_state%"
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" NEQ "[else]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set /a "_ListUnescapedSpecialCharactersInString_OutputArray.ubound+=1" 
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" NEQ "[else]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%]=%_ListUnescapedSpecialCharactersInString_index%" & set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%].type=%_ListUnescapedSpecialCharactersInString_current_type%"

if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" set /a "_ListUnescapedSpecialCharactersInString_quote_count+=1
REM TODO keep track of even/odd number of quotes
REM TODO only add array property if there's an odd number of quotes
REM Not counting escaped quotes (already done ?)
REM TODO Find "middle"  non-escaped doublequote and save as .middlequoteposition
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set /a "%_ListUnescapedSpecialCharactersInString_OutputArray%.quotecount=%_ListUnescapedSpecialCharactersInString_quote_count%"
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" if "[%_ListUnescapedSpecialCharactersInString_quote_state%]"=="[unquoted]" ( set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%].quoting=startquote" ) else ( set "%_ListUnescapedSpecialCharactersInString_OutputArray%[%_ListUnescapedSpecialCharactersInString_OutputArray.ubound%].quoting=endquote" )
if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" if "[%_ListUnescapedSpecialCharactersInString_quote_state%]"=="[unquoted]" ( set "_ListUnescapedSpecialCharactersInString_quote_state=quoted" ) else ( set "_ListUnescapedSpecialCharactersInString_quote_state=unquoted" )


set /a "_ListUnescapedSpecialCharactersInString_previous_index+=1"
set /a "_ListUnescapedSpecialCharactersInString_index+=1"
set /a "_ListUnescapedSpecialCharactersInString_next_index+=1"
setlocal enabledelayedexpansion
if "!%~1:~%_ListUnescapedSpecialCharactersInString_index%,1!" NEQ "" GoTo :ListUnescapedSpecialCharactersInString-loop
endlocal 

Call :SetArrayParameters "%_ListUnescapedSpecialCharactersInString_OutputArray%" _ListUnescapedSpecialCharactersInString_OutputArray
Call :ClearVariablesByPrefix _ListUnescapedSpecialCharactersInString
GoTo :EOF







::Usage Call :GetArrayParameters InputArray ParameterVariable optional Initialize optional StartIndex=0
:GetArrayParameters
call set _GetArrayParameters.lbound=%%%~1.lbound%%
call set _GetArrayParameters.ubound=%%%~1.ubound%%
call set _GetArrayParameters.count=%%%~1.count%%
call set _GetArrayParameters.index=%%%~1.index%%
if "[%~3]"=="[Initialize]" (
	if "[%_GetArrayParameters.lbound%]"=="[]" set /a _GetArrayParameters.lbound=0
	if "[%_GetArrayParameters.ubound%]"=="[]" set /a _GetArrayParameters.ubound=-1
	if "[%_GetArrayParameters.count%]"=="[]" set /a _GetArrayParameters.count=%_GetArrayParameters.ubound%-%_GetArrayParameters.lbound%+1  2>nul
	if "[%_GetArrayParameters.index%]"=="[]" if "[%~4]"=="[]" ( set /a "_GetArrayParameters.index=0" ) else ( set /a "_GetArrayParameters.index=%~4" 2>nul )
)
set _GetArrayParameters.name=%~1
set "%~2.lbound=%_GetArrayParameters.lbound%"
set "%~2.ubound=%_GetArrayParameters.ubound%"
set "%~2.count=%_GetArrayParameters.count%"
set "%~2.index=%_GetArrayParameters.index%"
if "[%_GetArrayParameters.name%]" NEQ "" set "%~2=%_GetArrayParameters.name%"
Call :ClearVariablesByPrefix _GetArrayParameters & if "[%_GetArrayParameters.ubound%]"=="[]" ( exit /b 1 ) else ( exit /b 0 )
GoTo :EOF
::GetArrayParameters-END


::Usage Call :SetArrayParameters OutputArray ParameterVariable optional lbound optional ubound optional index optional count
:SetArrayParameters
call set /a "_SetArrayParameters.lbound=%%%~2.lbound%%"  2>nul
call set /a "_SetArrayParameters.ubound=%%%~2.ubound%%" 2>nul
REM call set /a "_SetArrayParameters.count=%%%~2.count%%" 2>nul
call set /a "_SetArrayParameters.index=%%%~2.index%%" 2>nul
if not "[%~3]"=="[]" call :IsNumeric "%~3" || set /a "_SetArrayParameters.lbound=%~3" 2>nul
if not "[%~4]"=="[]" call :IsNumeric "%~4" || set /a "_SetArrayParameters.ubound=%~4" 2>nul
if not "[%~5]"=="[]" call :IsNumeric "%~5" || set /a "_SetArrayParameters.index=%~5" 2>nul
REM if not "[%~6]"=="[]" call :IsNumeric "%~6" || set /a "_SetArrayParameters.count=%~6" 2>nul
if "[%_SetArrayParameters.count%]"=="[]" if not "[%_SetArrayParameters.lbound%]"=="[]" if not "[%_SetArrayParameters.ubound%]"=="[]" set /a _SetArrayParameters.count=%_SetArrayParameters.ubound%-%_SetArrayParameters.lbound%+1  2>nul
if not "[%_SetArrayParameters.lbound%]"=="[]" Call :IsNumeric "%_SetArrayParameters.lbound%" || set /a "%~1.lbound=%_SetArrayParameters.lbound%" 2>nul
if not "[%_SetArrayParameters.ubound%]"=="[]" Call :IsNumeric "%_SetArrayParameters.ubound%" || set /a "%~1.ubound=%_SetArrayParameters.ubound%" 2>nul
if not "[%_SetArrayParameters.index%]"=="[]" Call :IsNumeric "%_SetArrayParameters.index%"  || set /a "%~1.index=%_SetArrayParameters.index%" 2>nul
if not "[%_SetArrayParameters.count%]"=="[]" Call :IsNumeric "%_SetArrayParameters.count%"  || set /a "%~1.count=%_SetArrayParameters.count%" 2>nul
Call :ClearVariablesByPrefix _SetArrayParameters & if not "[%_SetArrayParameters.ubound%]"=="[]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF

::Usage Call :IsNumeric "%Value%" optional Output
:IsNumeric
if "[%~1]"=="[]" exit /b 0
set "IsNumericInternal=-0123456789"
echo.%~1| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF


:: Usage Call :IsArrayDefinedBySet Variable OutputValue
:IsArrayDefinedBySet
set /a _IsArrayDefinedBySet.index=0
for /f "tokens=1* delims=" %%a in ('set %~1 2^>^&1') do ( call set _IsArrayDefinedBySet[%%_IsArrayDefinedBySet.index%%]=%%a & call set /a _IsArrayDefinedBySet.index+=1 )
if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:Environment variable=%]" ( 
	if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:not defined=%]" 	set "_IsArrayDefinedBySet.IsDefined=false" ) else ( set "_IsArrayDefinedBySet.IsDefined=true" )
if not "[%~2]"=="[]" set "%~2=%_IsArrayDefinedBySet.IsDefined%"
Call :ClearVariablesByPrefix _IsArrayDefinedBySet & if "[%_IsArrayDefinedBySet.IsDefined%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF








:IsArrayDefinedBySet-DEMO
set mytestvar=1
set mytestvar[0]=1
set mytestvar[0].test=1
set mytestvar[1]=1

Call :IsArrayDefinedBySet myteFFFFstvar && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[ && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[0] && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[1] && echo it is defined || echo it is not defined
Call :IsArrayDefinedBySet mytestvar[2] && echo it is defined || echo it is not defined

goto :eof


:GetArrayParameters-DEMO

set "mytestarray[0]=bla"
set "mytestarray[1]=bla"
set "mytestarray[2]=bla"
set /a mytestarray.lbound=0
set /a mytestarray.ubound=2
set /a mytestarray.count=3

echo.
echo testing with a declared array
echo.
Call :GetArrayParameters mytestarray _test1params && echo it was an array || echo it was not an array
echo. 
echo set mytestarray
set mytestarray
echo set _test1params
set _test1params
echo.

echo.
echo testing with a undeclared variable
echo.
Call :GetArrayParameters mynonarray _test2params && echo it was an array || echo it was not an array
echo. 
echo set mynonarray
set mynonarray
echo set _test2params
set _test2params
echo.

echo.
echo testing with a undeclared variable with Initialize
echo.
Call :GetArrayParameters mynonarray3 _test3params Initialize && echo it was an array || echo it was not an array
echo. 
echo set mynonarray3
set mynonarray3
echo set _test3params
set _test3params
echo.

echo.
echo testing with a undeclared variable with Initialize and specify an index of -1
echo.
Call :GetArrayParameters mynonarray4 _test4params Initialize -1 && echo it was an array || echo it was not an array
echo. 
echo set mynonarray4
set mynonarray4
echo set _test4params
set _test4params
echo.

GoTo :EOF




:ElseIF-DEMO

set "_mychar=a"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)

set "_mychar=b"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)

set "_mychar=c"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)

set "_mychar=%%"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)
GoTo :EOF






























::Usage Call :ListSpecialCharactersInString byref InputVariable byref optional OutputArray optional SILENT
:ListSpecialCharactersInString
set "_ListSpecialCharactersInString_char="
if "[%~2]" NEQ "[]" Call :GetArrayParameters %~2 _ListSpecialCharactersInString_OutputArray Initialize -1
REM if "[%~2]" NEQ "[]" echo _ListSpecialCharactersInString_OutputArray %~2 %_ListSpecialCharactersInString_OutputArray%
REM if "[%~2]" NEQ "[]" set _ListSpecialCharactersInString_OutputArray
if "[%~3]" EQU "[SILENT]" ( set "_ListSpecialCharactersInString_silent=true" ) else ( set "_ListSpecialCharactersInString_silent=false" )
set /a "_ListSpecialCharactersInString_index=0"
setlocal enabledelayedexpansion
:ListSpecialCharactersInString-loop
set "_ListSpecialCharactersInString_char=!%~1:~%_ListSpecialCharactersInString_index%,1!"

	if !_ListSpecialCharactersInString_char!==%% ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character %% at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=percentsign"
	) else if !_ListSpecialCharactersInString_char!==^" ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character " at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=doublequotes"
	) else if !_ListSpecialCharactersInString_char!==^& ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^& at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=ampersand"
	) else if !_ListSpecialCharactersInString_char!==^< ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^< at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=lessthan"
	) else if !_ListSpecialCharactersInString_char!==^> ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^> at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=greaterthan"
	) else if !_ListSpecialCharactersInString_char!==^^ ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^^ at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=carret"
	) else if !_ListSpecialCharactersInString_char!==^| ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Special character ^| at index !_ListSpecialCharactersInString_index!
		if "[%~2]" NEQ "[]" set "_ListSpecialCharactersInString_current_type=pipe"
	) else ( 
		if "[%_ListSpecialCharactersInString_silent%]" NEQ "[true]" echo Normal character else !_ListSpecialCharactersInString_char! at index !_ListSpecialCharactersInString_index!
	)

endlocal & set "_ListSpecialCharactersInString_current_type=%_ListSpecialCharactersInString_current_type%"
if "[%_ListSpecialCharactersInString_current_type%]" NEQ "[]" set /a "_ListSpecialCharactersInString_OutputArray.ubound+=1" 
if "[%_ListSpecialCharactersInString_current_type%]" NEQ "[]" set "%_ListSpecialCharactersInString_OutputArray%[%_ListSpecialCharactersInString_OutputArray.ubound%]=%_ListSpecialCharactersInString_index%" & set "%_ListSpecialCharactersInString_OutputArray%[%_ListSpecialCharactersInString_OutputArray.ubound%].type=%_ListSpecialCharactersInString_current_type%"
set "_ListSpecialCharactersInString_current_type="
set /a "_ListSpecialCharactersInString_index+=1"
setlocal enabledelayedexpansion
if "!%~1:~%_ListSpecialCharactersInString_index%,1!" NEQ "" GoTo :ListSpecialCharactersInString-loop
endlocal 

Call :SetArrayParameters "%_ListSpecialCharactersInString_OutputArray%" _ListSpecialCharactersInString_OutputArray
Call :ClearVariablesByPrefix _ListSpecialCharactersInString
GoTo :EOF

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