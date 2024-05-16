@echo off
:setup
call :ClearLocalVariables
Call :GetTime FileTime StartDate StartTime
Call :GetCodePage InitialCodepage
Call :SetTitle "Control 'This PC' icon on the desktop" 
set debug=false
set verbose=100
set silent=false
set logfile=%tmp%\%filetime%
if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
call :SetMacroPrintTime

:main

cls

%PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
if "[%silent%]"=="[true]" echo Silent mode is enabled
if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more
call :GetAppxPackages
REM call :Text-File-Manipulation-DEMO
REM call :trim-DEMO
REM Call :LTrim-RTrim-DEMO
REM call :Join-DEMO
REM call :AddEscapeCharacters-AND-GetRandomString-DEMO
REM call :AddEscapeCharacters-DEMO
REM call :runps-DEMO
REM call :CharArray2String-DEMO
REM call :ArrayToFile-DEMO
REM call :EchoFile-DEMO
REM call :ListUnescapedSpecialCharactersInString-DEMO
REM call :PrintCharMap-DEMO
REM call :GetRandomString-DEMO
REM call :ReadyMadeLoop-DEMO
REM call :rnd-DEMO
REM call :len-DEMO
REM call :StringCompare-DEMO
REM call :GetCharMap-DEMO
REM Call :SetNonEmptyValueOnlyIfNotDefined-DEMO
REM Call :EchoArray-DEMO
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


:Text-File-Manipulation-DEMO

choose 5 static phrases
write 5 more static phrase and put them in an array
put in an array 5 more lines with poison characters
Put 10 random lines in a new files
Put 10 more random lines in an array
make 3 variables with random text

write array to a file

write 1 static phrase to that file at a line
write 3 static phrases to 3 places in one go

write content of a file, to the end of a file, to the begining of a file and in the middle of a file

search a file for a text

insert new text before the search text
insert new text after the search text
replace the line with search text, with new text
replace the search text only with the new text

search a file for a text that occurs multiple times
insert text before each search text occurance
insert text after each search text occurance
replace each occurance line that includes search text, with the new text
replace the search text only, with the new text

repeat but only the first occurence, only the last occurance, only the nth occurance, only the nth through mth occurance


write 


GoTo :EOF



:LTrim-RTrim-DEMO

set myvalue=

echo.
echo ltrim with various amounts of spaces and tabs before the word Hello.
Call :ltrim myvalue " Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "  Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "   Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "      Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "	Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "				Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "	 	 	 	 	  	 	 	 	 Hello."
echo output:%myvalue%^|

echo.
echo The same thing but ByRef instead of ByVal

set myinput= Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=  Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=   Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=      Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=	Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=				Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=	 	 	 	 	  	 	 	 	 Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|

echo.
echo rtrim with various amounts of spaces and tabs after the word Hello.
Call :rtrim myvalue "Hello. "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.  "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.   "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.      "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.	"
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.				"
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.	 	 	 	 	  	 	 	 	 "
echo output:%myvalue%^|

echo.
echo The same thing but ByRef instead of ByVal

set myinput=Hello. 
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.  
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.   
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.      
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.				
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.	 	 	 	 	  	 	 	 	 
Call :rtrim myvalue myinput
echo output:%myvalue%^|



GoTo :EOF

:Join-DEMO

set myvalue=

call :join myvalue "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

call :join myvalue joindelimiter " " "This" "is" "a" "sentence"
echo output %myvalue% & set myvalue=
echo.

call :join myvalue joindelimiter " " "This" "is" "a" "sentence. " joincleardelimiter "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

call :join myvalue joindelimiter "W" "This" "is" "a" "sentence. " joincleardelimiter "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

set myextravalue=THISISTHEEXTRAVALUE
call :join myvalue joindelimiter " " "This" "is" "myextravalue" "sentence. " joincleardelimiter "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

GoTo :EOF

:AddEscapeCharacters-AND-GetRandomString-DEMO

echo new attempt>>randomstring.txt

set "myteststring=" & set "myescapedstring="
call :GetRandomString 20 myteststring USESPECIALCHARS

Call :AddEscapeCharacters myteststring  myescapedstring

setlocal enabledelayedexpansion
echo E !myescapedstring!
echo E !myescapedstring!>>randomstring.txt
endlocal

setlocal enabledelayedexpansion
echo I !myteststring!
echo I !myteststring!>>randomstring.txt
endlocal
echo O %myescapedstring%
echo O %myescapedstring%>>randomstring.txt

goto :AddEscapeCharacters-AND-GetRandomString-DEMO

GoTo :EOF


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



:CharArray2String-DEMO

Call :ClearVariablesByPrefix testarray
set testarray[0]=t
set testarray[1]=e
set testarray[2]="
set testarray[3]=t
set testarray[4]=5
set testarray[5]="
set testarray[6]=5
set testarray[7]="
set testarray[8]=5
set testarray[9]=5
set testarray
Call :CharArray2String testarray _CharArray2String-DEMO

echo %_CharArray2String-DEMO%

GoTo :EOF


:ArrayToFile-DEMO


set testarray[0]=test1
set testarray[1]=test2
set testarray[2]=test3
set testarray[3]=test4
set testarray[4]=test5
set /a "testarray.lbound=0"
set /a "testarray.ubound=4"


del arrayoutputtest.txt
call :ArrayToFile testarray arrayoutputtest.txt
type arrayoutputtest.txt

GoTo :EOF

:EchoFile-DEMO

call :EchoFile testfile.txt
call :EchoFileToFile testfile.txt testfile2.txt
call :EchoFile testfile2.txt
GoTo :EOF

:PrintCharMap-DEMO
Call :PrintCharMap
Call :PrintCharMap FULLRANGE
GoTo :EOF

:GetRandomString-DEMO

call :GetRandomString 25 output NOSPECIALCHARS
REM echo %output%
set "output="
goto :eof
pause
call :GetRandomString 20 output NOSPECIALCHARS
echo %output%
set "output="
pause
call :GetRandomString 30 output NOSPECIALCHARS
echo %output%
set "output="
pause
GoTo :EOF
:EndOf_GetRandomString-DEMO
REM blabla

:StringCompare-DEMO

set "output="
set "mystring1=This is a string"
set "mystring2=This is a strinx"
set "mystring3=REM Call :StringCompare StringA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len"
set "mystring4=REM Call :StringCompare StrigA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len"

REM Call :StringCompare StringA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len
call :len "%mystring4%" output & call echo output %%output%%
echo output %output%
echo.
echo Running simple string compare
Call :StringCompare "%mystring1%" "%mystring2%" optional OutputPercentMarch


GoTo :EOF


:GetCharMap-DEMO

Call :ClearVariablesByPrefix CharMap

Call :GetCharMapString
set CharMap
Call :GetCharMapArray
set CharMap[
GoTo :EOF

::Usage Call :rnd Output optional Min optional Max
:: returns 0-100, based on tenth of a second of %time%
:: Unless optional min / max are specified
:rnd
if "[%~2]"=="[]" ( set /a "_rnd_min=0" ) else ( set /a "_rnd_min=%~2" )
if "[%~3]"=="[]" ( set /a "_rnd_max=100" ) else ( set /a "_rnd_max=%~3" )
set /a %~1=%RANDOM% * (%_rnd_max% - %_rnd_min% + 1) / 32768 + %_rnd_min%
GoTo :EOF


:rnd-DEMO
Call :ClearVariablesByPrefix _rnd
REM GoTo :rnd-DEMO-test1
REM GoTo :rnd-DEMO-test2
REM GoTo :rnd-DEMO-test3
REM GoTo :rnd-DEMO-test4
REM GoTo :rnd-DEMO-test5
GoTo :rnd-DEMO-test6

:rnd-DEMO-test1
Call :ClearVariablesByPrefix _rnd
set /a _rnd_DEMO.index=0
set /a _rnd_DEMO.start=0
set /a _rnd_DEMO.end=1000
echo. 
echo Running %_rnd_DEMO.end% plain rnd calls (about 2 minute for 1000 calls)
set "_rnd_starttime=%time%"
:rnd-DEMO-loop-perf-test
call :rnd _rnd_DEMO.blank
set /a "_rnd_DEMO.index+=1"
if %_rnd_DEMO.index% leq %_rnd_DEMO.end% GoTo :rnd-DEMO-loop-perf-test
set "_rnd_endtime=%time%"
echo starttime %_rnd_starttime% endtime %_rnd_endtime%

:rnd-DEMO-test2
Call :ClearVariablesByPrefix _rnd
set /a "_rnd_DEMO.index=0"
set /a "_rnd_DEMO.end=1000"
echo. 
echo. Running result distribution test
set "_rnd_starttime=%time%"
for /l %%a in (%_rnd_DEMO.index%,1,100) do set /a "_rnd_DEMO.result[%%a]=0"
:rnd-DEMO-loop-distribution-test
call :rnd _rnd_DEMO.result
set /a _rnd_DEMO.result[%_rnd_DEMO.result%]+=1
set /a "_rnd_DEMO.index+=1"
if %_rnd_DEMO.index% leq %_rnd_DEMO.end% GoTo :rnd-DEMO-loop-distribution-test
set "_rnd_endtime=%time%"
set _rnd_DEMO.result[
echo starttime %_rnd_starttime% endtime %_rnd_endtime%


REM Running result distribution test (20000)
REM _rnd_DEMO.result[0]=1840
REM _rnd_DEMO.result[10]=1775
REM _rnd_DEMO.result[1]=1752
REM _rnd_DEMO.result[2]=1797
REM _rnd_DEMO.result[3]=1801
REM _rnd_DEMO.result[4]=1892
REM _rnd_DEMO.result[5]=1823
REM _rnd_DEMO.result[6]=1903
REM _rnd_DEMO.result[7]=1835
REM _rnd_DEMO.result[8]=1775
REM _rnd_DEMO.result[9]=1808
REM starttime 22:29:57.79 endtime 23:10:53.25


:rnd-DEMO-test3
Call :ClearVariablesByPrefix _rnd
set /a "_rnd_DEMO.index=0"
set /a "_rnd_DEMO.end=5000"
set /a "_rnd_DEMO.min=0"
set /a "_rnd_DEMO.max=9"
echo. 
echo. Running result distribution test with min (%_rnd_DEMO.min%) and max (%_rnd_DEMO.max%) values  
set "_rnd_starttime=%time%"
for /l %%a in (%_rnd_DEMO.index%,1,%_rnd_DEMO.max%) do set /a "_rnd_DEMO.result[%%a]=0"
:rnd-DEMO-loop-distribution-min-max-test3
call :rnd _rnd_DEMO.result "%_rnd_DEMO.min%" "%_rnd_DEMO.max%"
set /a _rnd_DEMO.result[%_rnd_DEMO.result%]+=1
set /a "_rnd_DEMO.index+=1"
if %_rnd_DEMO.index% leq %_rnd_DEMO.end% GoTo :rnd-DEMO-loop-distribution-min-max-test3
set "_rnd_endtime=%time%"
set _rnd_DEMO.result[
echo starttime %_rnd_starttime% endtime %_rnd_endtime%

:rnd-DEMO-test4
Call :ClearVariablesByPrefix _rnd
set /a "_rnd_DEMO.index=0"
set /a "_rnd_DEMO.end=1000"
set /a "_rnd_DEMO.min=-20"
set /a "_rnd_DEMO.max=20"
echo. 
echo. Running result distribution test with min (%_rnd_DEMO.min%) and max (%_rnd_DEMO.max%) values  
set "_rnd_starttime=%time%"
for /l %%a in (%_rnd_DEMO.index%,1,%_rnd_DEMO.max%) do set _rnd_var=%%a & call set "_rnd_DEMO.result[%_rnd_var:-=U%]=0"
:rnd-DEMO-loop-distribution-min-max-test4
call :rnd _rnd_DEMO.result "%_rnd_DEMO.min%" "%_rnd_DEMO.max%"
set /a "_rnd_DEMO.result[%_rnd_DEMO.result:-=U%]+=1"
set /a "_rnd_DEMO.index+=1"
if %_rnd_DEMO.index% leq %_rnd_DEMO.end% GoTo :rnd-DEMO-loop-distribution-min-max-test4
set "_rnd_endtime=%time%"
set _rnd_DEMO.result[
echo starttime %_rnd_starttime% endtime %_rnd_endtime%

:rnd-DEMO-test5
Call :ClearVariablesByPrefix _rnd
set /a "_rnd_DEMO.index=0"
set /a "_rnd_DEMO.end=5000"
set /a "_rnd_DEMO.min=0"
set /a "_rnd_DEMO.max=255"
echo. 
echo. Running result distribution test with min (%_rnd_DEMO.min%) and max (%_rnd_DEMO.max%) values  
set "_rnd_starttime=%time%"
:rnd-DEMO-loop-distribution-min-max-test5
call :rnd _rnd_DEMO.result "%_rnd_DEMO.min%" "%_rnd_DEMO.max%"
set /a _rnd_DEMO.result[%_rnd_DEMO.result%]+=1
set /a "_rnd_DEMO.index+=1"
if %_rnd_DEMO.index% leq %_rnd_DEMO.end% GoTo :rnd-DEMO-loop-distribution-min-max-test5
set "_rnd_endtime=%time%"
set _rnd_DEMO.result[
echo starttime %_rnd_starttime% endtime %_rnd_endtime%

:rnd-DEMO-test6

Call :ClearVariablesByPrefix _rnd
set /a "_rnd_DEMO.index=0"
set /a "_rnd_DEMO.end=20"
set /a "_rnd_DEMO.min=32"
set /a "_rnd_DEMO.max=128"
echo. 
echo generating a string, 20 characters long, random characters using :rnd and :Asc2Char
set _rnd_DEMO.index=33
set _rnd_DEMO.end=126
:rnd-DEMO-test6-loop
call :rnd _rnd_DEMO.result "%_rnd_DEMO.min%" "%_rnd_DEMO.max%"
REM set _rnd_DEMO.result=62
set _rnd_DEMO.result=%_rnd_DEMO.index%
Call :Asc2Char %_rnd_DEMO.result% _rnd_DEMO.char
set "_rnd_DEMO.char.escaped=%_rnd_DEMO.char.escaped:^=^^%"
set "_rnd_DEMO.char=%_rnd_DEMO.char.escaped:<=^<%"
set "_rnd_DEMO.char=%_rnd_DEMO.char.escaped:>=^>%"
set "_rnd_DEMO.char=%_rnd_DEMO.char.escaped:&=^&%"
set "_rnd_DEMO.char=%_rnd_DEMO.char.escaped:|=^|%"
set "_rnd_DEMO.char=%_rnd_DEMO.char.escaped:"=""%"
set "_rnd_DEMO.string=%_rnd_DEMO.string%%_rnd_DEMO.char%"
set "_rnd_DEMO.string.escaped=%_rnd_DEMO.string%%_rnd_DEMO.char.escaped%"
if %_rnd_DEMO.result% gtr 99 ( set "_rnd_spacer= " ) else 
echo [rnd out] %_rnd_DEMO.result% [char] %_rnd_DEMO.char% [string] "%_rnd_DEMO.string%"
echo [rnd out] %_rnd_DEMO.result% [char] %_rnd_DEMO.char% [string] "%_rnd_DEMO.string%"
set /a "_rnd_DEMO.index+=1"
if %_rnd_DEMO.index% leq %_rnd_DEMO.end% GoTo :rnd-DEMO-test6-loop
echo 1
call :lenbyref _rnd_DEMO.string _rnd_lenout
echo lenbyref %_rnd_lenout% / %errorlevel% is %_rnd_DEMO.string%

call :lenUsingFileByRef _rnd_DEMO.string _rnd_lenout
echo lenUsingFileByRef %_rnd_lenout% / %errorlevel% is %_rnd_DEMO.string%

call :len "%_rnd_DEMO.string%" _rnd_lenout
echo len %_rnd_lenout% / %errorlevel% is %_rnd_DEMO.string%

call :lenUsingFile "%_rnd_DEMO.string%" _rnd_lenout
echo lenUsingFile %_rnd_lenout% / %errorlevel% is %_rnd_DEMO.string%

REM !""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
REM !^"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
REM !""#$%^&'()*+,-./0123456789:;^<=^>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^^_`abcdefghijklmnopqrstuvwxyz{^|}~
REM !""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
REM !""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

goto :eof

call echo Call :DecomposeText "%_rnd_DEMO.string%"
Call :DecomposeText "%_rnd_DEMO.string%"
echo end of DecomposeText
echo random generated string [begin]"%_rnd_DEMO.string%"[end]

GoTo :EOF
:EndOf_rnd-DEMO-test6 EndOf_rnd-DEMO-test28





:len-DEMO

echo test
set "o="
set "s="
set "index=0"
set "end=100"
REM set^ s=BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
REM set string=BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
REM call :lenfaster output string
REM echo AA%output%
REM set "output="
REM set s=EDDDDCCCCAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
REM call :len s o



set s=BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB

:len1-loop-start-test
set^ s=%s%A
call :len "%s%" o
REM call :len %s% o
REM call :len %s% o
REM call :lenFromVar s o

echo %o% %index%
REM call :l output s
REM echo output %output% %index% & rem %string%
set /a "index+=1"
if %index% leq %end% GoTo :len1-loop-start-test

GoTo :EOF


set /a "index=0" & set /a "end=191" & set "output=" & set "s=BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
set "len1starttime=%time%"
:len1-loop-start
echo 1
set^ s=%s%A
echo 2
call :l output s
echo output %output% %index% & rem %string%
set /a "index+=1"
if %index% leq %end% GoTo :len1-loop-start
set "len1endtime=%time%"

REM set /a "index=0" & set /a "end=167" & set "output=" & set "string=BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
REM set "len1starttime=%time%"
REM :len1-loop-start
REM set string=%string%A
REM call :lenfast string output
REM echo output %output% & rem %string%
REM set /a "index+=1"
REM if %index% leq %end% GoTo :len1-loop-start
REM set "len1endtime=%time%"

set /a "index=0" & set /a "end=167" & set "output=" & set "string=BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
set "len2starttime=%time%"
:len2-loop-start
set string=%string%A
call :len "%string%" output
echo output %output% & rem %string%
set /a "index+=1"
if %index% leq %end% GoTo :len2-loop-start
set "len2endtime=%time%"



echo start 1 %len1starttime% 2 %len2starttime% 
echo end   1 %len1endtime% 1 %len2endtime% 

GoTo :EOF

call :len 1 LenResult
echo 1 len %LenResult% & set "LenResult="
call :len 12 LenResult
echo 12 len %LenResult% & set "LenResult="
call :len 123 LenResult
echo 123 len %LenResult% & set "LenResult="
call :len "1 3 5"  LenResult
echo "1 3 5" len %LenResult% & set "LenResult="
call :len "a b c" LenResult
echo "a b c" len %LenResult% & set "LenResult="
call :len "" LenResult
echo "" len %LenResult% & set "LenResult="
REM call :len 1 LenResult
REM echo 1 len %LenResult% & set "LenResult="


GoTo :EOF

:IsSpecialChar-DEMO
set "forbiden.char[-1]=a"
set "forbiden.char[0]=>"
set "forbiden.char[1]=<"
set "forbiden.char[2]=&"
set "forbiden.char[3]=|"
set "forbiden.char[4]=%%"
set forbiden.char[5]="
set "forbiden.char[6]=^"
set forbiden.char[7]=~
set forbiden.char[8]=!
set forbiden.char[9]=@

set forbiden.char

echo.
echo checking forbiden.char[x] array for special characters
echo.

Call :IsSpecialChar forbiden.char[-1] && echo found special char in "%forbiden.char[-1]%" || echo didn't find special char in "%forbiden.char[-1]%"
Call :IsSpecialChar forbiden.char[0] && echo found special char in "%forbiden.char[0]%" || echo didn't find special char in "%forbiden.char[0]%"
Call :IsSpecialChar forbiden.char[1] && echo found special char in "%forbiden.char[1]%" || echo didn't find special char in "%forbiden.char[1]%"
Call :IsSpecialChar forbiden.char[2] && echo found special char in "%forbiden.char[2]%" || echo didn't find special char in "%forbiden.char[2]%"
Call :IsSpecialChar forbiden.char[3] && echo found special char in "%forbiden.char[3]%" || echo didn't find special char in "%forbiden.char[3]%"
Call :IsSpecialChar forbiden.char[4] && echo found special char in "%forbiden.char[4]%" || echo didn't find special char in "%forbiden.char[4]%"
Call :IsSpecialChar forbiden.char[5] && echo found special char in %forbiden.char[5]:"=""% || echo didn't find special char in %forbiden.char[5]:"=""%
Call :IsSpecialChar forbiden.char[6] && echo found special char in "%forbiden.char[6]%" || echo didn't find special char in "%forbiden.char[6]%"
Call :IsSpecialChar forbiden.char[7] && echo found special char in "%forbiden.char[7]%" || echo didn't find special char in "%forbiden.char[7]%"
Call :IsSpecialChar forbiden.char[8] && echo found special char in "%forbiden.char[8]%" || echo didn't find special char in "%forbiden.char[8]%"
Call :IsSpecialChar forbiden.char[9] && echo found special char in "%forbiden.char[9]%" || echo didn't find special char in "%forbiden.char[9]%"

echo.
echo checking forbiden.char[x] array for special characters, using for loop 
for /l %%a in (-1,1,9) do (Call :IsSpecialChar forbiden.char[%%a] && call echo found special char in forbiden.char[%%a] || call echo didn't find special char in forbiden.char[%%a])

echo.
echo checking for forbidden characters in a sentence

set "forbiden.char[-1]=This is a string"
set "forbiden.char[0]=This is > string"
set "forbiden.char[1]=This is < string"
set "forbiden.char[2]=This is & string"
set "forbiden.char[3]=This is | string"
set "forbiden.char[4]=This is %% string"
set forbiden.char[5]=This is "  string
set "forbiden.char[6]=This is ^ string"
set forbiden.char[7]=This is ~ string
set forbiden.char[8]=This is ! string
set forbiden.char[9]=This is @ string

Call :IsSpecialChar forbiden.char[-1] && echo found special char in "%forbiden.char[-1]%" || echo didn't find special char in "%forbiden.char[-1]%"
Call :IsSpecialChar forbiden.char[0] && echo found special char in "%forbiden.char[0]%" || echo didn't find special char in "%forbiden.char[0]%"
Call :IsSpecialChar forbiden.char[1] && echo found special char in "%forbiden.char[1]%" || echo didn't find special char in "%forbiden.char[1]%"
Call :IsSpecialChar forbiden.char[2] && echo found special char in "%forbiden.char[2]%" || echo didn't find special char in "%forbiden.char[2]%"
Call :IsSpecialChar forbiden.char[3] && echo found special char in "%forbiden.char[3]%" || echo didn't find special char in "%forbiden.char[3]%"
Call :IsSpecialChar forbiden.char[4] && echo found special char in "%forbiden.char[4]%" || echo didn't find special char in "%forbiden.char[4]%"
Call :IsSpecialChar forbiden.char[5] && echo found special char in %forbiden.char[5]:"=""% || echo didn't find special char in %forbiden.char[5]:"=""%
Call :IsSpecialChar forbiden.char[6] && echo found special char in "%forbiden.char[6]%" || echo didn't find special char in "%forbiden.char[6]%"
Call :IsSpecialChar forbiden.char[7] && echo found special char in "%forbiden.char[7]%" || echo didn't find special char in "%forbiden.char[7]%"
Call :IsSpecialChar forbiden.char[8] && echo found special char in "%forbiden.char[8]%" || echo didn't find special char in "%forbiden.char[8]%"
Call :IsSpecialChar forbiden.char[9] && echo found special char in "%forbiden.char[9]%" || echo didn't find special char in "%forbiden.char[9]%"

echo.
echo checking for forbidden characters in a sentence, using for loop 
for /l %%a in (-1,1,9) do (Call :IsSpecialChar forbiden.char[%%a] && call echo found special char in forbiden.char[%%a] || call echo didn't find special char in forbiden.char[%%a])

echo.
echo testing output variable of IsSpecialChar (does not work, value is sticky ?)
echo.
set "myoutput="
Call :IsSpecialChar forbiden.char[-1] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[-1]%"
Call :IsSpecialChar forbiden.char[0] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[0]%"
Call :IsSpecialChar forbiden.char[1] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[1]%"
Call :IsSpecialChar forbiden.char[2] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[2]%"
Call :IsSpecialChar forbiden.char[3] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[3]%"
Call :IsSpecialChar forbiden.char[4] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[4]%"
Call :IsSpecialChar forbiden.char[5] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[5]%"
Call :IsSpecialChar forbiden.char[6] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[6]%"
Call :IsSpecialChar forbiden.char[7] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[7]%"
Call :IsSpecialChar forbiden.char[8] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[8]%"
Call :IsSpecialChar forbiden.char[9] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[9]%"

echo.
echo checking for forbidden characters with output value, in a sentence, using for loop 
for /l %%a in (-1,1,9) do Call :IsSpecialChar forbiden.char[%%a] myoutput & call echo special char found is %%myoutput%% in "forbiden.char[%%a]"

GoTo :EOF



:Split-DEMO

REM set myteststring=abcdef12345

REM echo myteststring tt%myteststring:~0,0%tt

Call :ClearVariablesByPrefix _Split

call :split "This is a test string" SplitOutput
set SplitOutput
REM TO test, empty input variable and delimiter bigger than input
REM call :split "" SplitOutput

echo.

REM Call :ClearVariablesByPrefix SplitOutput


GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO

echo expected results
echo emptyvalue  / variable not set +                 SetNonEmptyValue = do nothing
echo emptyvalue  / variable     set +                 SetNonEmptyValue = do nothing
echo filledvalue / variable not set +                 SetNonEmptyValue = do it
echo filledvalue / variable     set +                 SetNonEmptyValue = do it
echo emptyvalue  / variable not set +                  SetIfNotDefined = do it
echo emptyvalue  / variable     set +                  SetIfNotDefined = do nothing
echo filledvalue / variable not set +                  SetIfNotDefined = do it
echo filledvalue / variable     set +                  SetIfNotDefined = do nothing
echo emptyvalue  / variable not set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo emptyvalue  / variable     set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo filledvalue / variable not set + SetNonEmptyValueOnlyIfNotDefined = do it
echo filledvalue / variable     set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo.

echo doing :SetNonEmptyValue-DEMO-start 
Call :SetNonEmptyValue-DEMO-start
echo.
echo doing :SetIfNotDefined-DEMO-start
Call :SetIfNotDefined-DEMO-start
echo.
echo doing :SetNonEmptyValueOnlyIfNotDefined-DEMO-start
Call :SetNonEmptyValueOnlyIfNotDefined-DEMO-start

Call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset
echo.
echo For all these functions you can perform multiple one the same line
echo example Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable "%AFilledValue%" ADefinedVariable
echo.
set AnUndefinedVariable
set ADefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable "%AFilledValue%" ADefinedVariable
set AnUndefinedVariable
set ADefinedVariable


GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO-reset
set "AFilledValue=fillercontent"
set "AnEmptyValue="
set "AnUndefinedVariable="
set "ADefinedVariable=Old value in ADefinedVariable"
GoTo :EOF

:SetNonEmptyValue-DEMO-start

echo.
echo Calling :SetNonEmptyValue with AnEmptyValue to AnUndefinedVariable
Call :SetNonEmptyValue "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AnEmptyValue to ADefinedVariable
Call :SetNonEmptyValue "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AFilledValue to AnUndefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AFilledValue to ADefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetIfNotDefined-DEMO-start

echo.
echo Calling :SetIfNotDefined with AnEmptyValue to AnUndefinedVariable
Call :SetIfNotDefined "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AnEmptyValue to ADefinedVariable
Call :SetIfNotDefined "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AFilledValue to AnUndefinedVariable
Call :SetIfNotDefined "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AFilledValue to ADefinedVariable
Call :SetIfNotDefined "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO-start

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AnEmptyValue to AnUndefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AnEmptyValue to ADefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AFilledValue to AnUndefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AFilledValue to ADefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF




:SetIfNotDefined-DEMO

Call :ClearVariablesByPrefix myoutputvar
Call :ClearVariablesByPrefix myvalue

set "myoutputvar1=Already defined 111"
set "myoutputvar2="
set "myoutputvar3=Already defined 333"
set "myoutputvar4="

set "myvalue1=a new 1 value"
set "myvalue2=a new 2 value"
set "myvalue3="
set "myvalue4=a new 4 value"

echo.
echo Calling SetIfNotDefined set a value to myoutputvar1, which is already defined
Call :SetIfNotDefined "%myvalue1%" myoutputvar1
set myoutputvar1

echo.
echo Calling SetIfNotDefined set a value with no content to myoutputvar2
Call :SetIfNotDefined "%myvalue3%" myoutputvar2
set myoutputvar2

echo.
echo clearing myoutputvar
Call :ClearVariablesByPrefix myoutputvar

echo.
echo Doing both previous actions, plus one more, but on a single line
Call :SetIfNotDefined "%myvalue1%" myoutputvar1 "%myvalue2%" myoutputvar2 "%myvalue4%" myoutputvar4
set myoutputvar1
set myoutputvar2
set myoutputvar4

Call :ClearVariablesByPrefix myoutputvar
Call :ClearVariablesByPrefix myvalue

GoTo :EOF

:EchoArray-DEMO

Call :ClearVariablesByPrefix testarray
set testarray[uhoh]=alb--uhoh
set testarray[-1]=alb
set testarray[0]=bla
set testarray[1]=bli
set testarray[2]=blo
set testarray[3]=blou
set testarray[4]=ble
set testarray[5]=bly
set testarray[6]=blu
set /a testarray.lbound=-1
set /a testarray.ubound=6
set /a testarray.count=%testarray.ubound%-%testarray.lbound%+1

echo.
echo plain echo array
Call :EchoArray testarray

echo.
echo echo array but array is undefined
Call :EchoArray wrongtestarray

echo.
echo echo array from element 3 
Call :EchoArray testarray 3

echo.
echo echo array to element 4
Call :EchoArray testarray "" 4

echo.
echo echo array from element 3 to 6
Call :EchoArray testarray 3 6

echo.
echo echo array from element -1 to -1
Call :EchoArray testarray -1 -1

set testarray[uhoh].pelican=albpelicanIuhoh
set testarray[-1].pelican=albpelicanI-1
set testarray[0].pelican=blapelicanI0
set testarray[1].pelican=blipelicanI1
set testarray[2].pelican=blopelicanI2
set testarray[3].pelican=bloupelicanI3
set testarray[4].pelican=blepelicanI4
set testarray[5].pelican=blypelicanI5
set testarray[6].pelican=blupelicanI6

echo.
echo echo array from element 3 to 6 but only with suffix .pelican
Call :EchoArray testarray 3 6 ".pelican"

GoTo :EOF


:ReadyMadeLoop-DEMO

Call :ClearVariablesByPrefix _ReadyMadeLoop

set _ReadyMadeLoop[0].pre=echo hello, this is pre
set _ReadyMadeLoop[0]=call echo hello, this is main %%_ReadyMadeLoop_start%%
set _ReadyMadeLoop[0].post=echo hello, this is post
Call :ReadyMadeLoop 0 10 1

pause

Call :ClearVariablesByPrefix _ReadyMadeLoop
set "_ReadyMadeLoop[0].pre=call echo _ReadyMadeLoop_start %%_ReadyMadeLoop_start%% _ReadyMadeLoop_end %%_ReadyMadeLoop_end%% _ReadyMadeLoop_increment %%_ReadyMadeLoop_increment%%"
set "_ReadyMadeLoop[1].pre=set /a "_ReadyMadeLoop_value=0" "
set "_ReadyMadeLoop[2].pre=set /a "_ReadyMadeLoop_value+=1" "
set "_ReadyMadeLoop[3].pre=set /a "_ReadyMadeLoop_value+=1""
set "_ReadyMadeLoop[10].pre=echo last function in the pre section"

set "_ReadyMadeLoop[0]=call echo in the loop _ReadyMadeLoop_start %%_ReadyMadeLoop_start%%"
set "_ReadyMadeLoop[1]=call echo in the loop _ReadyMadeLoop_value %%_ReadyMadeLoop_value%%"
set _ReadyMadeLoop[10]=if "[%_ReadyMadeLoop_start%]"=="[5]" echo We even have an if statement at index=5, but it doesn't work, 

set "_ReadyMadeLoop[0].post=echo this is a test"
set "_ReadyMadeLoop[10].post=echo the last function in post section"
Call :ReadyMadeLoop 0 10 1

GoTo :EOF

:FindValuesInArray-DEMO

Call :ClearVariablesByPrefix testarray
Call :ClearVariablesByPrefix OutputArray
set testarray[uhoh]=alb
set testarray[-1]=alb
set testarray[0]=bla
set testarray[1]=bli
set testarray[2]=blo
set testarray[3]=blou
set testarray[4]=ble
set testarray[5]=bly
set testarray[6]=blu
set /a testarray.lbound=-1
set /a testarray.ubound=6
set /a testarray.count=%testarray.ubound%-%testarray.lbound%+1

REM Call :FindValuesInArray InputArray OutputArray ".list .of .suffix" SearchList1 SearchList2 SearchListN

Call :FindValuesInArray testarray OutputArray "match=only,partial" blou fff
set OutputArray
GoTo :EOF

REM :GetSetArrayParameters-DEMO



:IsInString-DEMO

set "mytestvar=this is a cat"

set "mytestsearch=cat"
echo searching for "%mytestsearch%" in "%mytestvar%", it is in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set "mytestsearch=this is a cat"
echo searching for "%mytestsearch%" in "%mytestvar%", it is in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set "mytestsearch=this is a cat "
echo searching for "%mytestsearch%" in "%mytestvar%", it is not in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set mytestsearch=this
echo searching for "%mytestsearch%" in "%mytestvar%", it is in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set mytestsearch=Calculon
echo searching for "%mytestsearch%" in "%mytestvar%", it is not in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set "mytestsearch="
echo searching for "%mytestsearch%" in "%mytestvar%", it is in, I think
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

GoTo :EOF

:FindArrayBounds-DEMO

Call :ClearVariablesByPrefix testarray
set testarray[uhoh]=alb
set testarray[-1]=alb
set testarray[0]=bla
set testarray[1]=bli
set testarray[2]=blo
set testarray[3]=blou
set testarray[4]=ble
set testarray[5]=bly
set testarray[6]=blu
set /a testarray.lbound=-1
set /a testarray.ubound=6
set /a testarray.count=%testarray.ubound%-%testarray.lbound%+1

echo. setup a test array
set testarray


echo.
echo clearing array parameters
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
echo.
echo calling FindArrayBounds, result should be lbound -1 ubound 6 and count 8
echo.

call :FindArrayBounds testarray 
set testarray

echo.
echo clearing array parameters again
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
echo.
echo calling FindArrayBounds , result should be in testarray.parameters and lbound -1 ubound 6 and count 8
echo.

call :FindArrayBounds testarray testarray.parameters
echo set testarray.parameters
set testarray.parameters
echo.
echo set testarray
set testarray

echo.
echo clearing array parameters again
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
echo.
echo calling GetArrayParameters should return empty in testarray.parameters.again
echo.

Call :GetArrayParameters testarray testarray.parameters.again
echo.
echo set testarray.parameters.again
set testarray.parameters.again 

echo.
echo. running findarray then get array, should return in testarray.parameters.again lbound -1 ubound 6 and count 8
call :FindArrayBounds testarray
Call :GetArrayParameters testarray testarray.parameters.again
echo.
echo set testarray.parameters.again
set testarray.parameters.again 


echo.
echo running with initialize and should return lbound 0 ubound -1 count 1 in set testarray.parameters.again
Call :GetArrayParameters testarray testarray.parameters.again Initialize
echo.
echo set testarray.parameters.again
set testarray.parameters.again 

echo.
echo running FindArrayBounds, with fewer element, in particular, without a zero element
echo this should return lbound 2 ubound 6 count 5
echo.
set "testarray.lbound="
set "testarray.ubound="
set "testarray.count="
set testarray[-1]=
set testarray[0]=
set testarray[1]=

call :FindArrayBounds testarray

set testarray

echo.

Call :GetAppxPackages
call :FindArrayBounds AppxPackages _testarrayparameters
echo AppxPackages.lbound %AppxPackages.lbound%
echo AppxPackages.ubound %AppxPackages.ubound%
echo AppxPackages.count %AppxPackages.count%
echo.
echo. result of FindArrayBounds on AppxPackages in _testarrayparameters, should match values

set _testarrayparameters
echo.
echo running GetArrayParameters, should match array's direct values
Call :GetArrayParameters AppxPackages AppxPackages.arrayparameters 
echo.
echo set AppxPackages.arrayparameters
set AppxPackages.arrayparameters


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



:SimpleLoops-DEMO
call :SimpleLoop
call :SimpleNestedLoop
call :SimpleLoop 3 6
call :SimpleNestedLoop -2 2 27 32
call :SimpleDoubleNestedLoop
GoTo :EOF

:LeftRight-DEMO

set "myteststring1=this is a regular string"
set "myteststring2=  this is a regular string with two spaces in front"
set "myteststring3=  this is a regular string with two spaces in front and at the end  "
set "myteststring3=this is a regular string with two spaces at the end  "

echo. 
echo Test left function 
echo.

Call :Left "%myteststring1%" OutputVariable 1
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 2
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 12
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 24
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 25
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 26
echo %OutputVariable% (lenght longer than the variable is fine)

Call :Left "%myteststring2%" OutputVariable 1
echo "%OutputVariable%" echo will return echo off if you only give it spaces
Call :Left "%myteststring2%" OutputVariable 2
echo "%OutputVariable%"
Call :Left "%myteststring2%" OutputVariable 12
echo %OutputVariable%
Call :Left "%myteststring2%" OutputVariable 24
echo %OutputVariable%
Call :Left "%myteststring2%" OutputVariable 25
echo %OutputVariable%
Call :Left "%myteststring2%" OutputVariable 26
echo %OutputVariable%

Call :Left "%myteststring3%" OutputVariable 1
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 2
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 12
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 24
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 25
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 26
echo %OutputVariable%

echo. 
echo Test right function 
echo.

Call :Right "%myteststring1%" OutputVariable 1
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 2
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 12
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 24
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 25
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 26
echo %OutputVariable% (lenght longer than the variable is fine)

Call :Right "%myteststring2%" OutputVariable 1
echo %OutputVariable% 
Call :Right "%myteststring2%" OutputVariable 2
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 12
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 24
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 25
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 26
echo %OutputVariable%

Call :Right "%myteststring3%" OutputVariable 1
echo "%OutputVariable%" echo will return echo off if you only give it spaces
Call :Right "%myteststring3%" OutputVariable 2
echo "%OutputVariable%"
Call :Right "%myteststring3%" OutputVariable 12
echo %OutputVariable%
Call :Right "%myteststring3%" OutputVariable 24
echo %OutputVariable%
Call :Right "%myteststring3%" OutputVariable 25
echo %OutputVariable%
Call :Right "%myteststring3%" OutputVariable 26
echo %OutputVariable%

echo. 
echo Test mid function 
echo.

Call :Mid "%myteststring1%" OutputVariable 1
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 4
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 2 5
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 1 8
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 7 10
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 6 18
echo %OutputVariable%

echo. 
echo Test replace function 
echo.

Call :Replace "%myteststring1%" OutputVariable This That
echo %OutputVariable%
Call :Replace "%myteststring1%" OutputVariable is was
echo %OutputVariable% (it will match every instance of the search string)
Call :Replace "%myteststring1%" OutputVariable a TWO
echo %OutputVariable%
Call :Replace "%myteststring1%" OutputVariable REGULAR spécial
echo %OutputVariable% (this should be e-acute in UTF-8)
Call :Replace "%myteststring1%" OutputVariable STRing double
echo %OutputVariable%

echo. 
echo Test count function 
echo.

Call :Count "%myteststring1%" OutputVariable This
echo %OutputVariable% (should be 1)
Call :Count "%myteststring1%" OutputVariable is
echo %OutputVariable% (should be 2)
Call :Count "%myteststring1%" OutputVariable "This is"
echo %OutputVariable% (should be 1)
Call :Count "%myteststring1%" OutputVariable "i"
echo %OutputVariable% (should be 3)
Call :Count "%myteststring1%" OutputVariable " "
echo %OutputVariable% (should be 4)
Call :Count "%myteststring1%" OutputVariable "this is a regular string"
echo %OutputVariable% (should be 1)

GoTo :EOF

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

:IsCharDoubleQuote-DEMO
set _mydouble="
Call :IsCharDoubleQuote _mydouble && echo it is doublequotes || echo it is not doublequotes
set _mydouble=a
Call :IsCharDoubleQuote _mydouble && echo it is doublequotes || echo it is not doublequotes

goto :eof

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




:GetRandomString-DEMO

set OutputString=
echo call :GetRandomString 20 OutputString 
call :GetRandomString 20 OutputString 
echo %OutputString%
echo.
set OutputString=
echo call :GetRandomString 20 OutputString USESPECIALCHARS
call :GetRandomString 20 OutputString USESPECIALCHARS
echo %OutputString%
echo.
set OutputString=
echo call :GetRandomString 20 OutputString USESPECIALCHARS DONTESCAPE
call :GetRandomString 20 OutputString USESPECIALCHARS DONTESCAPE
echo %OutputString%
echo.
set OutputString=
echo call :GetRandomString 20 OutputString FULLRANGE
call :GetRandomString 20 OutputString FULLRANGE
echo %OutputString%
echo.
set OutputString=
echo call :GetRandomString 20 OutputString FULLRANGE USESPECIALCHARS DONTESCAPE
call :GetRandomString 20 OutputString FULLRANGE USESPECIALCHARS DONTESCAPE
echo %OutputString%

REM call :GetRandomString 20 OutputString 
REM echo %OutputString%
REM call :GetRandomString 20 OutputString 
REM echo %OutputString%

GoTo :EOF


:testfunc
echo %*
echo %1
echo %~1
goto :eof

:testfunc-DEMO
call :testfunc 1test"test
echo.
call :testfunc "1test"test"
echo.
call :testfunc 2test""test
echo.
call :testfunc "2test""test"
echo.
call :testfunc 3test"""test
echo.
call :testfunc "3test"""test"
echo.
call :testfunc 4test""""test
echo.
call :testfunc "4test""""test"
echo.
call :testfunc 5test"""""test
echo.
call :testfunc "5test"""""test"
echo.
call :testfunc 1test^"test
echo.
call :testfunc "1test^"test"
echo.
call :testfunc 2test^"^"test
echo.
call :testfunc "2test^"^"test"
echo.
call :testfunc 3test^"^"^"test
echo.
call :testfunc "3test^"^"^"test"
echo.
call :testfunc 4test^"^"^"^"test
echo.
call :testfunc "4test^"^"^"^"test"
echo.
call :testfunc 5test^"^"^"^"^"test
echo.
call :testfunc "5test^"^"^"^"^"test"

goto :eof

:Percentsign-test-DEMO

echo.
echo increasing number of percent signs, set without quotes, echo without quotes
echo.

set testvar=%
set testvar
echo 1 %testvar%

set testvar=%%
set testvar
echo 2 %testvar%

set testvar=%%%
set testvar
echo 3 %testvar%

set testvar=%%%%
set testvar
echo 4 %testvar%

set testvar=%%%%%
set testvar
echo 5 %testvar%

set testvar=%%%%%%
set testvar
echo 6 %testvar%

set testvar=%%%%%%%
set testvar
echo 7 %testvar%

set testvar=%%%%%%%%
set testvar
echo 8 %testvar%

echo observations : single percentsigns are discarded, double percentsigns are reduced to one
echo three percentsigns, two of them get reduced to one and the extra is discarded
echo four percentsigns gets reduced to two and so on

echo.
echo increasing number of percent signs, set with quote, echo without quote
echo.

set "testvar=%"
set testvar
echo 1 %testvar%

set "testvar=%%"
set testvar
echo 2 %testvar%

set "testvar=%%%"
set testvar
echo 3 %testvar%

set "testvar=%%%%"
set testvar
echo 4 %testvar%

set "testvar=%%%%%"
set testvar
echo 5 %testvar%

set "testvar=%%%%%%"
set testvar
echo 6 %testvar%

set "testvar=%%%%%%%"
set testvar
echo 7 %testvar%

set "testvar=%%%%%%%%"
set testvar
echo 8 %testvar%

echo observation, putting set variable in quotes had no effect on percentsigns parsing

echo.
echo increasing number of percent signs, set without quotes, echo with quotes
echo.

set testvar=%
set testvar
echo 1 "%testvar%"

set testvar=%%
set testvar
echo 2 "%testvar%"

set testvar=%%%
set testvar
echo 3 "%testvar%"

set testvar=%%%%
set testvar
echo 4 "%testvar%"

set testvar=%%%%%
set testvar
echo 5 "%testvar%"

set testvar=%%%%%%
set testvar
echo 6 "%testvar%"

set testvar=%%%%%%%
set testvar
echo 7 "%testvar%"

set testvar=%%%%%%%%
set testvar
echo 8 "%testvar%"

echo observation, putting echo variable in double quotes had no effect on percentsigns parsing

echo.
echo increasing number of percent signs, set with quote, echo with quote
echo.

set "testvar=%"
set testvar
echo 1 "%testvar%"

set "testvar=%%"
set testvar
echo 2 "%testvar%"

set "testvar=%%%"
set testvar
echo 3 "%testvar%"

set "testvar=%%%%"
set testvar
echo 4 "%testvar%"

set "testvar=%%%%%"
set testvar
echo 5 "%testvar%"

set "testvar=%%%%%%"
set testvar
echo 6 "%testvar%"

set "testvar=%%%%%%%"
set testvar
echo 7 "%testvar%"

set "testvar=%%%%%%%%"
set testvar
echo 8 "%testvar%"

echo observation, again doublequotes have had no effect on percent sign parsing

echo.
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter A or B alternating before and after every percentsign
echo.

set testvar=A%B
set testvar
echo 1 %testvar%

set testvar=A%B%A
set testvar
echo 2 %testvar%

set testvar=A%B%A%B
set testvar
echo 3 %testvar%

set testvar=A%B%A%B%A
set testvar
echo 4 %testvar%

set testvar=A%B%A%B%A%A
set testvar
echo 5 %testvar%

set testvar=A%B%A%B%A%B%A
set testvar
echo 6 %testvar%

set testvar=A%B%A%B%A%B%A%B
set testvar
echo 7 %testvar%

set testvar=A%B%A%B%A%B%A%B%A
set testvar
echo 8 %testvar%

echo observation, all characters enclosed between sets of percentsigns are expanded into variable
echo in this case, empty variables
echo.
echo increasing number of percent signs, set with quotes, echo without quotes
echo added letter A or B alternating before and after every percentsign
echo.

set "testvar=A%B"
set testvar
echo 1 %testvar%

set "testvar=A%B%A"
set testvar
echo 2 %testvar%

set "testvar=A%B%A%B"
set testvar
echo 3 %testvar%

set "testvar=A%B%A%B%A"
set testvar
echo 4 %testvar%

set "testvar=A%B%A%B%A%A"
set testvar
echo 5 %testvar%

set "testvar=A%B%A%B%A%B%A"
set testvar
echo 6 %testvar%

set "testvar=A%B%A%B%A%B%A%B"
set testvar
echo 7 %testvar%

set "testvar=A%B%A%B%A%B%A%B%A"
set testvar
echo 8 %testvar%

echo observation, set with quotes had no effect of percentsign parsing
echo.
echo increasing number of percent signs, set without quotes, echo with quotes
echo added letter A or B alternating before and after every percentsign
echo.

set testvar=A%B
set testvar
echo 1 "%testvar%"

set testvar=A%B%A
set testvar
echo 2 "%testvar%"

set testvar=A%B%A%B
set testvar
echo 3 "%testvar%"

set testvar=A%B%A%B%A
set testvar
echo 4 "%testvar%"

set testvar=A%B%A%B%A%A
set testvar
echo 5 "%testvar%"

set testvar=A%B%A%B%A%B%A
set testvar
echo 6 "%testvar%"

set testvar=A%B%A%B%A%B%A%B
set testvar
echo 7 "%testvar%"

set testvar=A%B%A%B%A%B%A%B%A
set testvar
echo 8 "%testvar%"

echo observation, echo with quotes had no effect of percentsign parsing

echo.
echo increasing number of percent signs, set with quotes, echo with quotes
echo added letter A or B alternating before and after every percentsign
echo.

set "testvar=A%B"
set testvar
echo 1 "%testvar%"

set "testvar=A%B%A"
set testvar
echo 2 "%testvar%"

set "testvar=A%B%A%B"
set testvar
echo 3 "%testvar%"

set "testvar=A%B%A%B%A"
set testvar
echo 4 "%testvar%"

set "testvar=A%B%A%B%A%A"
set testvar
echo 5 "%testvar%"

set "testvar=A%B%A%B%A%B%A"
set testvar
echo 6 "%testvar%"

set "testvar=A%B%A%B%A%B%A%B"
set testvar
echo 7 "%testvar%"

set "testvar=A%B%A%B%A%B%A%B%A"
set testvar
echo 8 "%testvar%"

echo observation, set and set with quotes had no effect of percentsign parsing

echo.
echo increasing number of percent signs, set with quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo.

set "testvar=AAA%BBB"
set testvar
echo 1 %testvar%

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 %testvar%

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 8 %testvar%

observation no change in pattern from single characters to triple characters

echo.
echo increasing number of percent signs, set without quotes, echo with quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo.

set testvar=AAA%BBB
set testvar
echo 1 "%testvar%"

set testvar=AAA%BBB%AAA
set testvar
echo 2 "%testvar%"

set testvar=AAA%BBB%AAA%BBB
set testvar
echo 3 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA
set testvar
echo 4 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%AAA
set testvar
echo 5 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB
set testvar
echo 7 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 "%testvar%"

observation no change in pattern from single characters to triple characters

echo.
echo increasing number of percent signs, set with quotes, echo with quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo.

set "testvar=AAA%BBB"
set testvar
echo 1 "%testvar%"

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 8 "%testvar%"

observation no change in pattern from single characters to triple characters

echo.
echo increasing number of percent signs
echo added letter AAA or BBB alternating before and after every percentsign
echo This one will have 8 percent signs with various locations to include doublequotes
echo.


set testvar=A"AA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 1 %testvar%

set testvar=AAA%B"BB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%BBB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=A"AA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 5 %testvar%

set testvar=AAA"%"BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 %testvar%

set testvar=A"A"A%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 7 %testvar%

set testvar=AAA%B"B"B%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 %testvar%

set testvar=AAA%BBB%AAA%"BBB"%AAA%BBB%AAA%BBB%AAA
set testvar
echo 9 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B"%AAA%BBB%AAA
set testvar
echo 1 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AA"A%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B%AA"A%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%A"A"A"%BBB%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A"%BBB%AAA
set testvar
echo 6 %testvar%


echo observation, no matter where the quotes are places, appears to have no impact on the percentsign parsing

echo.
echo same pattern as previous, this time with added carrets ^^ for escaping percent signs
echo Doublequotes are left in, expected to have no effects on percent sign parsing
echo.


set testvar=A"AA^%BBB^%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 1 %testvar%

set testvar=AAA%B"BB%^A^A^A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA^%BBB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^%BBB%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^%BBB^^%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^^%BBB^^%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^^%BBB^^%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 "%testvar%"

set "testvar=^AAA^^%BBB^^%AA"A%BBB%AA^A%BBB%A^^AA%BBB%A^^^AA"
set testvar
echo 3 "%testvar%"

echo observation, carrets appear to have no effect on  percentsign parsing
echo unquoted carrets are parsed and removed at both the set and the echo step unless they are inside of quotes

echo.
echo previous pattern of 
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo now with one added percent sign
echo.

set testvar=AAA%BBB
set testvar
echo 1 %testvar%

set testvar=AAA%%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%%BBB%AAA%BBB
set testvar
echo 3 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%BBB%AAA%BBB
set testvar
echo 7 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 %testvar%

echo observation, every variable expansion group is flipped

echo.
echo previous pattern of 
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo first percentsign pair is doubled
echo.

set testvar=AAA%%BBB
set testvar
echo 1 %testvar%

set testvar=AAA%%BBB%%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%%BBB%%AAA%BBB
set testvar
echo 3 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%BBB%AAA%BBB
set testvar
echo 7 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 %testvar%

echo.
echo previous pattern of 
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo every percentsign pair is doubled
echo.

set testvar=AAA%%BBB
set testvar
echo 1 %testvar%

set testvar=AAA%%BBB%%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB
set testvar
echo 3 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA
set testvar
echo 6 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA%%BBB
set testvar
echo 7 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA
set testvar
echo 8 %testvar%


echo observation,


set "testvar=AAA%BBB"
set testvar
echo 1 %testvar%

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 %testvar%

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 8 %testvar%


testvar=AAA%BBB
1 AAA%BBB
testvar=AAA%BBB%AAA
2 AAA%BBB%AAA
testvar=AAA%BBB%AAA%BBB
3 AAA%BBB%AAA%BBB
testvar=AAA%BBB%AAA%BBB%AAA
4 AAA%BBB%AAA%BBB%AAA
testvar=AAA%BBB%AAA%BBB%AAAAAA
5 AAA%BBB%AAA%BBB%AAAAAA
testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA
6 AAA%BBB%AAA%BBB%AAA%BBB%AAA
testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB
7 AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB
testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
8 AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA

set "testvar=AAA%BBB"
set testvar
echo 1 %testvar%

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 %testvar%

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"


REM set testvar=AAA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 4 %testvar%

REM set testvar=A"AA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 5 %testvar%

REM set testvar=AAA"%"BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 6 %testvar%

REM set testvar=A"A"A%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 7 %testvar%

REM set testvar=AAA%B"B"B%AAA%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 8 %testvar%

REM set testvar=AAA%BBB%AAA%"BBB"%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 9 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B"%AAA%BBB%AAA
REM set testvar
REM echo 1 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AA"A%BBB%AAA
REM set testvar
REM echo 2 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B%AA"A%BBB%AAA
REM set testvar
REM echo 3 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A%BBB%AAA
REM set testvar
REM echo 4 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%A"A"A"%BBB%AAA
REM set testvar
REM echo 5 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A"%BBB%AAA
REM set testvar
REM echo 6 %testvar%
goto :eof
REM Call :ClearVariablesByPrefix  OptionalFeatures
REM call :GetOptionalFeatures

REM set OptionalFeatures[
REM Set "_CopyValuesFromArray_SearchSuffix=.state"
REM Call :CopyValuesFromArray OptionalFeatures OptionalFeatures.disabled Disabled
REM set OptionalFeatures.disabled
REM Call :CopyValuesFromArray OptionalFeatures OptionalFeatures.enabled Enabled
REM set OptionalFeatures.enabled
REM set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.state"
REM Call :RemoveValuesFromArray OptionalFeatures Disabled Enabled

REM set OptionalFeatures[

REM Call :FindUniqueValues InputArray OutputArray .suffixName
REM set _SplitArrayByValue_PartialMatch=true
REM set SortingValues[X].value ' the value to be matched
REM set SortingValues[X].NewArrayName ' Array name where matching elements will be copied to, empty will just use the value (sanitized) as an arrayname 
REM set SortingValues[X].SuffixList ' list of only these suffixes to copy to new array, empty means all
REM Call :SplitArrayByValue InputArray SortingValues optional .suffixName

REM call :CopyValuesFromArray-DEMO
REM call :ArrayManipulation-DEMO
REM call :CreateTestArray-DEMO
REM GoTo :AddArrayElement-DEMO
REM GoTo :RemoveValuesFromArray-DEMO
REM Call :DereferenceArrayToArrayDEMO
REM GoTo :ShowAppxPackageInfoDEMOv3
REM GoTo :DeleteAppxPackagesDEMO
REM GoTo :ShowAppxPackageInfoDEMO
REM GoTo :GetNamedKeyDEMOv2
GoTo :END





REM Internal Functions 

:trim-DEMO
set "string[0]=a normal trim string"
set "string[1]= a string with a leading space"
set "string[2]=  a string with two leading spaces"
set "string[3]=a string with two trailing spaces  "
set "string[4]=              a string with too many leading spaces"
set "string[5]=a string with too many trailing spaces              "
set "string[6]=	a string with a leading tab"
set "string[7]=a string with a trailing tab	"
set "string[8]=              a string with too many leading and trailing spaces              "
set "string[9]=      	   	   a string with many mixed leading and trailing tabs spaces      	   	   "
set "string[10]=  
   	   	   a string with spaces tabs and a CR character on each side  
   	   	   "
set /a _trim_DEMO_index=0
:trim-DEMO-internal-loop
set "outputval="
call echo input FF%%string[%_trim_DEMO_index%]%%FF
call :trim "%%string[%_trim_DEMO_index%]%%" outputval
echo output %_trim_DEMO_index% UU%outputval%UU
set /a _trim_DEMO_index+=1
if %_trim_DEMO_index% LEQ 10 GoTo :trim-DEMO-internal-loop
GoTo :EOF


::Usage Call :trim "%inputstring%" outputstring
:trim
set "_trim_tab=	"
set "_trim_space= "
set "_trim_inputstring=%~1"
:trim-leading-char-loop
set "_trim_char=%_trim_inputstring:~0,1%"
set "_trim_this="
if "[%_trim_char%]"=="[%_trim_space%]" set "_trim_this=true"
if "[%_trim_char%]"=="[%_trim_tab%]" set "_trim_this=true"
if "[%_trim_this%]"=="[true]" set "_trim_inputstring=%_trim_inputstring:~1%"
if "[%_trim_this%]"=="[true]" GoTo :trim-leading-char-loop
:trim-trailing-char-loop
set "_trim_char=%_trim_inputstring:~-1%"
set "_trim_this="
if "[%_trim_char%]"=="[%_trim_space%]" set "_trim_this=true"
if "[%_trim_char%]"=="[%_trim_tab%]" set "_trim_this=true"
if "[%_trim_this%]"=="[true]" set "_trim_inputstring=%_trim_inputstring:~,-1%"
if "[%_trim_this%]"=="[true]" GoTo :trim-trailing-char-loop
set "%~2=%_trim_inputstring%"
Call :ClearVariablesByPrefix _trim
GoTo :EOF


:: Usage Call :GetOptionalFeatures optional FeaturesArrayName
:GetOptionalFeatures
Call :ClearVariablesByPrefix  _GetOptionalFeatures
set "_GetOptionalFeatures_FeaturesArrayName=%~1"
if "[%_GetOptionalFeatures_FeaturesArrayName%]"=="[]" set "_GetOptionalFeatures_FeaturesArrayName=OptionalFeatures"
call set "_GetOptionalFeatures_FeaturesArrayName.lbound=%%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%
call set "_GetOptionalFeatures_FeaturesArrayName.ubound=%%%_GetOptionalFeatures_FeaturesArrayName%.ubound%%
Call :IsNumeric "%_GetOptionalFeatures_FeaturesArrayName.lbound%" && set /a %_GetOptionalFeatures_FeaturesArrayName%.lbound=0
Call :IsNumeric "%_GetOptionalFeatures_FeaturesArrayName.ubound%" && set /a %_GetOptionalFeatures_FeaturesArrayName%.ubound=-1


set /a _GetOptionalFeatures_TempArray.index=-1
for /f "tokens=1* delims=:" %%a in ('dism /online /get-features') do (
call set /a _GetOptionalFeatures_TempArray.index+=1
REM call echo index %%_GetOptionalFeatures_TempArray.index%% %%a %%b
if not "[%%a]"=="[]" call set "_GetOptionalFeatures_TempArray[%%_GetOptionalFeatures_TempArray.index%%].1=%%a"
if not "[%%b]"=="[]" call set "_GetOptionalFeatures_TempArray[%%_GetOptionalFeatures_TempArray.index%%].2=%%b"
)
set /a _GetOptionalFeatures_TempArray.lbound=0
set /a "_GetOptionalFeatures_TempArray.ubound=%_GetOptionalFeatures_TempArray.index%"

REM set _GetOptionalFeatures_TempArray

set /a _GetOptionalFeatures_TempArray.index=0
:GetOptionalFeatures-temp-array-loop
call :trim "%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1%%" _GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1
call :trim "%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%" _GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2
set /a _GetOptionalFeatures_TempArray.index+=1
if %_GetOptionalFeatures_TempArray.index% LEQ %_GetOptionalFeatures_TempArray.ubound% GoTo :GetOptionalFeatures-temp-array-loop
set /a _GetOptionalFeatures_TempArray.index=0
:GetOptionalFeatures-temp-array-loop-2
REM call echo %_GetOptionalFeatures_TempArray.index% UU%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1%%UU FF%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%FF
set /a _GetOptionalFeatures_TempArray.index+=1
if %_GetOptionalFeatures_TempArray.index% LEQ %_GetOptionalFeatures_TempArray.ubound% GoTo :GetOptionalFeatures-temp-array-loop-2
set /a _GetOptionalFeatures_TempArray.index=-1
:GetOptionalFeatures-temp-array-loop-3
call set "_GetOptionalFeatures_TempArray.current.1=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1%%"
call set "_GetOptionalFeatures_TempArray.current.2=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
set "_GetOptionalFeatures.Property="
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Deployment Image Servicing and Management tool]" set "_GetOptionalFeatures.Property=ignore"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[The operation completed successfully.]" set "_GetOptionalFeatures.Property=ignore"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Version]" set "_GetOptionalFeatures.Property=dismversion"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Image Version]" set "_GetOptionalFeatures.Property=imageversion"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Features listing for package]" set "_GetOptionalFeatures.Property=packagename"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Feature Name]" set "_GetOptionalFeatures.Property=name"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[State]" set "_GetOptionalFeatures.Property=state"
if "[%_GetOptionalFeatures.Property%]"=="[]" echo unknown property found %_GetOptionalFeatures_TempArray.current.1%+++%_GetOptionalFeatures_TempArray.current.2%
if "[%_GetOptionalFeatures.Property%]"=="[dismversion]" call set %_GetOptionalFeatures_FeaturesArrayName%.dismversion=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
if "[%_GetOptionalFeatures.Property%]"=="[imageversion]" call set %_GetOptionalFeatures_FeaturesArrayName%.imageversion=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
if "[%_GetOptionalFeatures.Property%]"=="[packagename]" call set %_GetOptionalFeatures_FeaturesArrayName%.packagename=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
if "[%_GetOptionalFeatures.Property%]"=="[name]" set /a _GetOptionalFeatures_FeaturesArrayName.ubound+=1
if "[%_GetOptionalFeatures.Property%]"=="[name]" set "%_GetOptionalFeatures_FeaturesArrayName%[%_GetOptionalFeatures_FeaturesArrayName.ubound%].name=%_GetOptionalFeatures_TempArray.current.2%"
if "[%_GetOptionalFeatures.Property%]"=="[state]" set "%_GetOptionalFeatures_FeaturesArrayName%[%_GetOptionalFeatures_FeaturesArrayName.ubound%].state=%_GetOptionalFeatures_TempArray.current.2%"
REM set "_GetOptionalFeatures.LastProperty=%_GetOptionalFeatures.Property%"
set /a _GetOptionalFeatures_TempArray.index+=1
if %_GetOptionalFeatures_TempArray.index% LEQ %_GetOptionalFeatures_TempArray.ubound% GoTo :GetOptionalFeatures-temp-array-loop-3

REM call echo 1 set /a %_GetOptionalFeatures_FeaturesArrayName%.lbound=%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%
REM call set /a %_GetOptionalFeatures_FeaturesArrayName%.lbound=%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%
echo 2 set /a %_GetOptionalFeatures_FeaturesArrayName%.ubound=%_GetOptionalFeatures_FeaturesArrayName.ubound%
set /a %_GetOptionalFeatures_FeaturesArrayName%.ubound=%_GetOptionalFeatures_FeaturesArrayName.ubound%
call echo call set /a %_GetOptionalFeatures_FeaturesArrayName%.count=%%%_GetOptionalFeatures_FeaturesArrayName%.ubound%%-%%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%+1
call set /a %_GetOptionalFeatures_FeaturesArrayName%.count=%%%_GetOptionalFeatures_FeaturesArrayName%.ubound%%-%%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%+1
Call :ClearVariablesByPrefix  _GetOptionalFeatures_TempArray
Call :ClearVariablesByPrefix  _GetOptionalFeatures
GoTo :EOF



:ReadFileLineByLine :EchoFile
GoTo :EOF

:InsertTextToFile filename searchtext newtext writebefore/writeafter/writeevery/writeonce
GoTo :EOF

:FileDiff FileA FileB LinesInBoth LinesOnlyInA LinesOnlyInB
GoTo :EOF

REM output to array or to file
REM :ArrayToFile
:FileToArray
GoTo :EOF

:ConsoleToArray
GoTo :EOF

:ArrayToConsole
GoTo :EOF

:FindAllLabelsInAFunction
GoTo :EOF

:FindAllLabelsInAFunctionThatDon'tExistInTheFile
GoTo :EOF

:FindAllLabelsInAFunctionThatExistInTheFile
GoTo :EOF

:ListFunctions Read a batch file, return all labels or return a list of all functions or return a list of all or return a named function by its label
GoTo :EOF

:AddTemplateToFunction, when outputting a function from a batch works, output function plus full template including hashed signature
GoTo :EOF

:ReadLookupFunctionFromBatch read a named function outputs all named lookup inputs
GoTo :EOF

:ReadBatch Read a function to array, or to file
GoTo :EOF

:WriteBatch Write a function to end of file
GoTo :EOF

:ReadBatch Extract Lookup Values to array and to file
GoTo :EOF

:GetPowerCFG
GoTo :EOF

:SetPowerCFG
GoTo :EOF

:SimpleSelectorMenu ListOfChoices SelectedChoice optional Question Text optional TitleText optional FooterText optinal cornertime
GoTo :EOF

:DeleteElementsFromArray "list of array element indexes"
GoTo :EOF

:AddElementsFromArray  input array "list of element indexes" outputarray "list of element indexes"
GoTo :EOF

REM UI
::UI 
::long scrollable list
::long scrollable list of selectable items
::a message box with ok cancel retry
::a textbox with ok cancel buttons
::a multiple choice radio button
:: a frame with title and footing
::a two pane view
::a two pane view, list on left, extra option per item on right, bios style
:MessageBox
GoTo :EOF

:MessageBoxInputText
GoTo :EOF

:MessageBoxYesNo
GoTo :EOF

:MultipleChoiceSelect
GoTo :EOF

:GetConsoleDimensions
GoTo :EOF

:GetCursorPosition
GoTo :EOF

:SetCursorPosition
GoTo :EOF

:WriteTextAtCursor
GoTo :EOF

::Usage Call :CreateTestArray ArrayName Count Suffixes
:: Will create array ArrayName from element 0 to Count, with all listed suffixes
:: Each array value will contain the element number followed by the suffix name
:CreateTestArray
set "_CreateTestArray_ArrayName=%~1"
set /a _CreateTestArray_ArrayCount=%~2
if "[%~3]"=="[]" (
set /a _CreateTestArray_suffix.index=0
set /a _CreateTestArray_suffix.ubound=0
set "_CreateTestArray_suffix[0]=NOSUFFIX"
GoTo :CreateTestArray-arguments-to-suffix-loop-skip
)
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-arguments-to-suffix-loop
set "_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]=%~3"
set _CreateTestArray_suffix.ubound=%_CreateTestArray_suffix.index%
set /a _CreateTestArray_suffix.index+=1
shift
if not "[%~3]"=="[]" GoTo :CreateTestArray-arguments-to-suffix-loop
:CreateTestArray-arguments-to-suffix-loop-skip
set /a _CreateTestArray_ArrayIndex=0
:CreateTestArray-loop-start
set /a _CreateTestArray_suffix.index=0
:CreateTestArray-suffix-loop
set "_CreateTestArray_suffix.current="
call set "_CreateTestArray_suffix.current=%%_CreateTestArray_suffix[%_CreateTestArray_suffix.index%]%%"
if "[%_CreateTestArray_suffix.current%]"=="[NOSUFFIX]" set "_CreateTestArray_suffix.current="
set "_CreateTestArray_suffix.current.content="
if not "[%_CreateTestArray_suffix.current%]"=="[]" set "_CreateTestArray_suffix.current.content=-%_CreateTestArray_suffix.current%"
set %_CreateTestArray_ArrayName%[%_CreateTestArray_ArrayIndex%]%_CreateTestArray_suffix.current%=%_CreateTestArray_ArrayIndex%%_CreateTestArray_suffix.current.content%
set /a _CreateTestArray_suffix.index+=1
if %_CreateTestArray_suffix.index% LEQ %_CreateTestArray_suffix.ubound% Goto :CreateTestArray-suffix-loop
set /a _CreateTestArray_ArrayIndex+=1
if %_CreateTestArray_ArrayIndex% LEQ %_CreateTestArray_ArrayCount% Goto :CreateTestArray-loop-start
set /a %_CreateTestArray_ArrayName%.count=%_CreateTestArray_ArrayIndex%
set /a _CreateTestArray_ArrayIndex-=1
set /a %_CreateTestArray_ArrayName%.lbound=0
set /a %_CreateTestArray_ArrayName%.ubound=%_CreateTestArray_ArrayIndex%
Call :ClearVariablesByPrefix _CreateTestArray
GoTo :EOF


REM DereferenceArrayToArray and CopyMultipleArrayElements are almost identical, should be rewritten as a unique function that does it all

REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
REM This function takes elements numbers from ElementsArray
REM Then it retrieves those elements from the ReferenceArray (with suffix, if provided)
REM And outputs them to OutputArray
REM Elements are appended to OutputArray starting from OutputArray.ubound
REM Suffixes are defined with _DerefArrayReferenceSuffix, space separated for multiple elements
REM The suffixes will be used on the output array unless overriden by _DerefArrayOutputSuffix
REM The suffix NOSUFFIX has the special meaning of an empty suffix
::Usage Call :DereferenceArrayToArray ElementsArray ReferenceArray OutputArray
:DereferenceArrayToArray
if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
if "[%~3]"=="[]" GoTo :EOF
set "_DerefArrayElementsArray=%~1" & set "_DerefArrayReferenceArray=%~2" & set "_DerefArrayOutputArray=%~3"
REM call echo call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
if not "[%_DerefArrayReferenceSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayReferenceSuffix%" _DerefArrayReferenceSuffix
if not "[%_DerefArrayOutputSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayOutputSuffix%" _DerefArrayOutputSuffix
if "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" set /a _DerefArrayReferenceSuffix.ubound=0
REM Set _DerefArrayOutput's index to OutputArray's .ubound+1, if any, or else set to zero
set _DerefArrayOutput.index=%_DerefArrayOutputArray.ubound%
if not "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index+=1
if "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index=0
set /a _DerefArrayElements.index=0
:DereferenceArrayToArray-output-loop
set /a _DerefArraySuffix.index=0
:DereferenceArrayToArray-suffix-loop
REM if %_DerefArrayElements.index% LEQ 0 call  echo %_DerefArrayReferenceSuffix[0]% %_DerefArrayReferenceSuffix% %_DerefArraySuffix.index% 
call set "_DerefArrayReferenceSuffix=%%_DerefArrayReferenceSuffix[%_DerefArraySuffix.index%]%%"
call set "_DerefArrayOutputSuffix=%%_DerefArrayOutputSuffix[%_DerefArraySuffix.index%]%%"
if "[%_DerefArrayReferenceSuffix%]"=="[NOSUFFIX]" set _DerefArrayReferenceSuffix=
if "[%_DerefArrayOutputSuffix%]"=="[]" set "_DerefArrayOutputSuffix=%_DerefArrayReferenceSuffix%"
if "[%_DerefArrayOutputSuffix%]"=="[NOSUFFIX]" set _DerefArrayOutputSuffix=
REM if %_DerefArrayElements.index%==0 echo ref-suffix "%_DerefArrayReferenceSuffix%" out-suffix "%_DerefArrayOutputSuffix%"
REM call call echo %%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%% %_DerefArrayReferenceSuffix%
call call set %_DerefArrayOutputArray%[%_DerefArrayOutput.index%]%_DerefArrayOutputSuffix%=%%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%%
set %_DerefArrayOutputArray%.ubound=%_DerefArrayOutput.index%
set /a _DerefArraySuffix.index+=1
REM echo _DerefArrayReferenceSuffix.ubound is %_DerefArrayReferenceSuffix.ubound%
REM echo if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
REM if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% GoTo :DereferenceArrayToArray-suffix-loop
set /a _DerefArrayOutput.index+=1
set /a _DerefArrayElements.index+=1
if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
REM Call :ClearVariablesByPrefix _DerefArray
REM set _DerefArray
GoTo :EOF

:: NOSUFFIX in ApplicableSuffixes refers to copying the array element without a suffix
:: if ApplicableSuffixes is empty, then all variable inside array element will be copied
::Usage Call :CopyMultipleArrayElements InputArray InputElementList OutputArray ApplicableSuffixes
:CopyMultipleArrayElements 
set "_CopyMultipleArrayElements_InputArray=%~1"
set "_CopyMultipleArrayElements_InputElementList=%~2"
call set /a _CopyMultipleArrayElements_InputElementList.ubound=%_CopyMultipleArrayElements_InputElementList%.ubound
set "_CopyMultipleArrayElements_OutputArray=%~3"
call set _CopyMultipleArrayElements_OutputArray.lbound=%%%_CopyMultipleArrayElements_OutputArray%.lbound%%
call set _CopyMultipleArrayElements_OutputArray.ubound=%%%_CopyMultipleArrayElements_OutputArray%.ubound%%
if "[%_CopyMultipleArrayElements_OutputArray.ubound%]"=="[]" set _CopyMultipleArrayElements_OutputArray.ubound=-1
set "_CopyMultipleArrayElements_ApplicableSuffixes=%~4"
if "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" set /a _CopyMultipleArrayElements_ApplicableSuffixes.ubound=0
if not "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" echo calling :Deconcatenate " " "%_CopyMultipleArrayElements_ApplicableSuffixes%" _CopyMultipleArrayElements_ApplicableSuffixes
if not "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" Call :Deconcatenate " " "%_CopyMultipleArrayElements_ApplicableSuffixes%" _CopyMultipleArrayElements_ApplicableSuffixes
set /a _CopyMultipleArrayElements_InputElementList.index=0
:CopyMultipleArrayElements-loop-InputElementList
set /a _CopyMultipleArrayElements_ApplicableSuffixes.index=0
set /a _CopyMultipleArrayElements_OutputArray.ubound+=1
:CopyMultipleArrayElements-loop-ApplicableSuffixes
call set _CopyMultipleArrayElements_ApplicableSuffixes.current=%%_CopyMultipleArrayElements_ApplicableSuffixes[%_CopyMultipleArrayElements_ApplicableSuffixes.index%]%%
if "[%_CopyMultipleArrayElements_ApplicableSuffixes.current%]"=="[NOSUFFIX]" set "_CopyMultipleArrayElements_ApplicableSuffixes.current="
if "[%_CopyMultipleArrayElements_ApplicableSuffixes%]"=="[]" (
	Call :CopyElementAndSuffix %_CopyMultipleArrayElements_InputArray%[%_CopyMultipleArrayElements_InputElementList.index%] %_CopyMultipleArrayElements_OutputArray%[%_CopyMultipleArrayElements_OutputArray.ubound%]
) else (
	call call set %_CopyMultipleArrayElements_OutputArray%[%_CopyMultipleArrayElements_OutputArray.ubound%]%_CopyMultipleArrayElements_ApplicableSuffixes.current%=%%%%%_CopyMultipleArrayElements_InputArray%[%_CopyMultipleArrayElements_InputElementList.index%]%_CopyMultipleArrayElements_ApplicableSuffixes.current%%%%%
)
set /a _CopyMultipleArrayElements_ApplicableSuffixes.index+=1
if %_CopyMultipleArrayElements_ApplicableSuffixes.index% LEQ %_CopyMultipleArrayElements_ApplicableSuffixes.ubound% GoTo :CopyMultipleArrayElements-loop-ApplicableSuffixes
set /a _CopyMultipleArrayElements_InputElementList.index+=1
if %_CopyMultipleArrayElements_InputElementList.index% LEQ %_CopyMultipleArrayElements_InputElementList.ubound% GoTo :CopyMultipleArrayElements-loop-InputElementList
if "[%_CopyMultipleArrayElements_OutputArray.lbound%]"=="[]" set /a %_CopyMultipleArrayElements_OutputArray%.lbound=0
set /a %_CopyMultipleArrayElements_OutputArray%.ubound=%_CopyMultipleArrayElements_OutputArray.ubound%
set /a %_CopyMultipleArrayElements_OutputArray%.count=%_CopyMultipleArrayElements_OutputArray.ubound%-1
Call :ClearVariablesByPrefix _CopyMultipleArrayElements
GoTo :EOF

::Usage Call :AddArrayElement InputElement OutputArray OutputIndex
:AddArrayElement
Call :ClearVariablesByPrefix _AddArrayElement
set "_AddArrayElement_InputElement=%~1"
set "_AddArrayElement_OutputArray=%~2"
set "_AddArrayElement_OutputIndex=%~3"
call set /a "_AddArrayElement_OutputUbound=%%%_AddArrayElement_OutputArray%.ubound%%"
REM Start loop at OutputArray ubound and then work my way back until OutputIndex
call set /a _AddArrayElement_OutputArray.index=%%%_AddArrayElement_OutputArray%.ubound%%
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
set /a %_AddArrayElement_OutputArray%.ubound+=1
set /a %_AddArrayElement_OutputArray%.count+=1
if "[%_AddArrayElement_OutputIndex%]"=="[]" set /a _AddArrayElement_OutputIndex=%_AddArrayElement_OutputUbound% + 1
if %_AddArrayElement_OutputIndex% GEQ %_AddArrayElement_OutputUbound% GoTo :AddArrayElement-OutputArray-loop-skip
:AddArrayElement-OutputArray-loop
REM Move value to the next index, for every position in the array until OutputIndex
REM echo moving %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%] 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
)
set /a _AddArrayElement_OutputArray.index-=1
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
if %_AddArrayElement_OutputArray.index% GEQ %_AddArrayElement_OutputIndex% GoTo :AddArrayElement-OutputArray-loop
:AddArrayElement-OutputArray-loop-skip
REM Clear the destination index of the OutputArray
REM call echo Clearing %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] %%%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%].PackageFullName%%
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] 2^>NUL') do (
	set "%%a="
)
REM Copy InputElement into the destination index of the OutputArray
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_InputElement% 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_tokensubst%%]" && echo it was same || echo it was not same
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo %%_token%%=%%b
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
)
GoTo :EOF


REM Example usage inside a for loop
REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" && echo it was same || echo it was not
::Usage Call :FORIF your IF statement
:FORIF
REM echo just before forif %*
if %* (exit /b 0) ELSE (exit /b 1)
GoTo :EOF



::Usage Call :CopyElementAndSuffix InputElement OutputElement DontClearOutput
:CopyElementAndSuffix
set "_CopyElementAndSuffix_Input=%~1"
set "_CopyElementAndSuffix_Output=%~2"
set "_CopyElementAndSuffix_Directive=%~3"
if not "[%_CopyElementAndSuffix_Directive%]"=="[DontClearOutput]" (
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Output% 2^>NUL') do ( set "%%a=" )
)
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Input% 2^>NUL') do (
	call set "_token=%%a"
	call set "%%_token:%_CopyElementAndSuffix_Input%=%_CopyElementAndSuffix_Output%%%=%%b"
)
GoTo :EOF

::Usage Call :RemoveArrayElement ArrayToRemoveElementFrom ElementNumber
::This function will remove the Nth element from an array, including all suffixes, 
::and then pull back all values to fill in the empty index
:RemoveArrayElement
Call :ClearVariablesByPrefix _RemoveArrayElement
set "_RemoveArrayElement_array=%~1"
set "_RemoveArrayElement_index=%~2"
REM call echo Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
Call :IsNumeric %_RemoveArrayElement_index% _RemoveArrayElement_ElementIsNumeric
REM echo _RemoveArrayElement_ElementIsNumeric %_RemoveArrayElement_ElementIsNumeric%
set "_RemoveArrayElement_ElementDeleted=false"
REM This for loop deleted the specified array element
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
    set "_RemoveArrayElement_ElementDeleted=true"
	set "%%a="
)
if not "[%_RemoveArrayElement_ElementIsNumeric%]"=="[true]" GoTo :RemoveArrayElement-end
set /a "_RemoveArrayElement_next_index=%_RemoveArrayElement_index%"
REM If the specified element was numeric, move over the next value to empty index
:RemoveArrayElement-internal-loop
set /a _RemoveArrayElement_next_index+=1
set "_token=" & set "_RemoveArrayElement_ElementCopied=false"
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%] 2^>NUL') do (
	set "_RemoveArrayElement_ElementCopied=true"
	call set "_token=%%a"
	call set "%%_token:%_RemoveArrayElement_array%[%_RemoveArrayElement_next_index%]=%_RemoveArrayElement_array%[%_RemoveArrayElement_index%]%%=%%b"
)
REM Repeat for every array element until we find an empty index
if "[%_RemoveArrayElement_ElementCopied%]"=="[true]" set /a "_RemoveArrayElement_index=%_RemoveArrayElement_next_index%" & GoTo :RemoveArrayElement-internal-loop
REM Erase last index which is a duplicate of the second to last one
for /F "tokens=1* delims==" %%a in ('set %_RemoveArrayElement_array%[%_RemoveArrayElement_index%] 2^>NUL') do (
	set "%%a="
)
set /a _RemoveArrayElement_index-=1
set /a "%_RemoveArrayElement_array%.ubound-=1" 2>NUL
set /a "%_RemoveArrayElement_array%.count-=1" 2>NUL
:RemoveArrayElement-end
Call :ClearVariablesByPrefix _RemoveArrayElement
GoTo :EOF

REM _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
::Usage Call :RemoveValuesFromArray ArrayToRemoveFrom DeleteList1 DeleteList2
:: DeleteLists consist of an array with a series of values to delete from ArrayToModify
:RemoveValuesFromArray
REM Call :ClearVariablesByPrefix _RemoveValuesFromArray REM this would wipe out _RemoveValuesFromArray_ArrayToRemoveFrom.suffix
set "_RemoveValuesFromArray_ArrayToRemoveFrom=%~1"
call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
:RemoveValuesFromArray-Next-DeleteList-loop
set "_RemoveValuesFromArray_DeleteList=%~2"
Call :IsNumeric %%%_RemoveValuesFromArray_DeleteList%.ubound%% _RemoveValuesFromArray_DeleteList.IsArray
if not "[%_RemoveValuesFromArray_DeleteList.IsArray%]"=="[true]" (
	set "_RemoveValuesFromArray_DeleteList.value=%~2"
	set /a _RemoveValuesFromArray_DeleteList.ubound=0
	set /a _RemoveValuesFromArray_ArrayToRemoveFrom.index=0
	GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
)
call set /a _RemoveValuesFromArray_DeleteList.ubound=%%%_RemoveValuesFromArray_DeleteList%.ubound%%
set /a _RemoveValuesFromArray_DeleteList.index=0
:RemoveValuesFromArray-DeleteList-loop
call set "_RemoveValuesFromArray_DeleteList.value=%%%_RemoveValuesFromArray_DeleteList%[%_RemoveValuesFromArray_DeleteList.index%]%%"
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index=0"
:RemoveValuesFromArray-ArrayToRemoveFrom-loop
call set "_RemoveValuesFromArray_ArrayToRemoveFrom.value=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%[%_RemoveValuesFromArray_ArrayToRemoveFrom.index%]%_RemoveValuesFromArray_ArrayToRemoveFrom.suffix%%%"
if "[%_RemoveValuesFromArray_ArrayToRemoveFrom.value%]"=="[%_RemoveValuesFromArray_DeleteList.value%]" (
	Call :RemoveArrayElement %_RemoveValuesFromArray_ArrayToRemoveFrom% %_RemoveValuesFromArray_ArrayToRemoveFrom.index%
	call set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.ubound=%%%_RemoveValuesFromArray_ArrayToRemoveFrom%.ubound%%"
)
set /a "_RemoveValuesFromArray_ArrayToRemoveFrom.index+=1"
if %_RemoveValuesFromArray_ArrayToRemoveFrom.index% LEQ %_RemoveValuesFromArray_ArrayToRemoveFrom.ubound% GoTo :RemoveValuesFromArray-ArrayToRemoveFrom-loop
set /a _RemoveValuesFromArray_DeleteList.index+=1
if %_RemoveValuesFromArray_DeleteList.index% LEQ %_RemoveValuesFromArray_DeleteList.ubound% GoTo :RemoveValuesFromArray-DeleteList-loop
shift
set "_RemoveValuesFromArray_DeleteList.IsArray="
if not "[%~2]"=="[]" GoTo :RemoveValuesFromArray-Next-DeleteList-loop
Call :ClearVariablesByPrefix _RemoveValuesFromArray
GoTo :EOF

:Left1
:Lefta
:LeftA
:left-a
:Left-1a
Additional Test Patterns
Labels with Other Special Characters:
:Left?parameter
:Left!variable
:Left@home
:Left#section
:Left$
:Left%percent
:Left^caret
:Left*star
:Left)Close
:Left{Brace
:Left}EndBrace
:Left[Bracket
:Left]EndBracket
Spaces and Tabs After Label:
REM :Left (followed by a single space)
REM :Left          (multiple spaces)
REM :Left	(tab after the label)
Mixed Cases and Use of Colon:
REM :left test (lowercase)
REM :LEFT TEST (uppercase)
REM :Left:MoreLabels
REM :Left:left
REM :Left :MoreLabels
REM :Left :left
REM End of Line Scenarios:
REM :Left (with nothing following it, at the end of a line)
Embedded in Text or Comments:
REM This is a comment :Left should not match
ECHO :Left is a part of this line
Complex Combinations:
:Left-argument1-argument2
:Left_parameter_value
:Left/command

::Usage Call :Left "%InputVariable%" OutputVariable lenght
:Left
set "_Left_input=%~1"
call set "%~2=%%_Left_input:~0,%~3%%"
set "_Left_input="
GoTo :EOF

::Usage Call :Right "%InputVariable%" OutputVariable lenght
:Right
set "_Right_input=%~1"
call set "%~2=%%_Right_input:~-%~3%%"
set "_Right_input="
GoTo :EOF

::Usage Call :Mid  "%InputVariable%" OutputVariable lenght optional start=0
:Mid
if "[%~4]"=="[]" ( set /a _Mid_start=0 ) else ( set "_Mid_start=%~4" )
set "_Mid_input=%~1"
call set "%~2=%%_Mid_input:~%_Mid_start%,%~3%%"
set "_Mid_input="
GoTo :EOF

::Usage Call :LeftCut "%InputVariable%" OutputVariable lenght
:LeftCut
set "LeftCut_input=%~1"
call set "%~2=%%LeftCut_input:~%~3%%"
set "LeftCut_input="
GoTo :EOF

::Usage Call :RightCut "%InputVariable%" OutputVariable lenght
:RightCut
set "_RightCut_input=%~1"
call set "%~2=%%_RightCut_input:~,-%~3%%"
set "_RightCut_input="
GoTo :EOF

::Usage Call :MidCut  "%InputVariable%" OutputVariable lenght optional start=0
:MidCut
if "[%~4]"=="[]" ( set /a _MidCut_start=0 ) else ( set "_MidCut_start=%~4" )
set "_MidCut_input=%~1"
set /a _MidCut_end=%_MidCut_start%+%~3
call set "%~2=%%_MidCut_input:~0,%_MidCut_start%%%%%_MidCut_input:~%_MidCut_end%%%"
set "_MidCut_input=" & set "_MidCut_end="
GoTo :EOF

::Usage Call :Replace "%InputVariable%" OutputVariable "%SearchWord%" "%ReplaceWord%"
:Replace
set "_Replace_InputVariable=%~1"
set "_Replace_SearchWord=%~3"
set "_Replace_ReplaceWord=%~4"
call set "%~2=%%_Replace_InputVariable:%_Replace_SearchWord%=%_Replace_ReplaceWord%%%"
GoTo :EOF

::Usage Call :Count "%InputVariable%" OutputVariable "%SearchWord%"
:Count
set "_Count_InputVariable=%~1"
set "_Count_SearchWord=%~3"
Call :len _Count_InputVariable _Count_InputVariable.len 
Call :len _Count_SearchWord _Count_SearchWord.len 
REM echo len %_Count_InputVariable.len% %_Count_SearchWord.len%
set /a _Count_match=0
set /a _Count_index=0
:Count-loop
call set "_Count_CompareWindow=%%_Count_InputVariable:~%_Count_index%,%_Count_SearchWord.len%%%"
call set "_Count_Compare=%%_Count_CompareWindow:%_Count_SearchWord%=%%"
REM echo 1%_Count_InputVariable%1 2%_Count_CompareWindow%2 3%_Count_Compare%3 4%_Count_SearchWord%4
if not "[%_Count_CompareWindow%]"=="[%_Count_Compare%]" set /a _Count_match+=1
set /a _Count_index+=1
if %_Count_index% LSS %_Count_InputVariable.len% GoTo :Count-loop
set /a "%~2=%_Count_match%"
GoTo :EOF

:ucase
:lcase
REM :split
GoTo :EOF

::Usage Call :join OutputString InputString1 InputString2 InputString3 InputStringN
:join
setlocal enabledelayedexpansion
set _join_output=%~1
set _join_intermediate=!%~1!
:join-setup
if "[%~2]"=="[joindelimiter]" ( set "_join_delimiter=%~3" & shift & shift & GoTo :join-setup )
if "[%~2]"=="[joincleardelimiter]" ( set "_join_delimiter=" & shift & GoTo :join-setup )
if defined %~2 ( 
		set _join_string=!%~2!
	) else ( 
		set _join_string=%~2
	)
if "[!_join_intermediate!]"=="[]" (
	set _join_intermediate=!_join_string!
) else (
	set _join_intermediate=!_join_intermediate!!_join_delimiter!!_join_string!
)
if "[%~3]" NEQ "[]" shift & GoTo :join-setup
endlocal & set %_join_output%=%_join_intermediate%
GoTo :EOF

::Usage Call :joinarray OutputArray InputArray1 InputArray2 InputArrayN
:joinarray
GoTo :EOF

:startwith
GoTo :EOF

:endwith
GoTo :EOF


::Usage Call :ltrim OutputVariable Input
:ltrim
setlocal enabledelayedexpansion
set "TAB=	"
set "_ltrim_output=%~1"
set "_ltrim_input=%~2"
if defined %~2 ( set "_ltrim_input=!%~2!" ) 
set /a "_ltrim_index=0"
:ltrim-loop
set "_ltrim_char=!_ltrim_input:~%_ltrim_index%,1!
if "[!_ltrim_char!]" EQU "[%TAB%]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
if "[!_ltrim_char!]" EQU "[ ]" ( set /a "_ltrim_index+=1" & GoTo :ltrim-loop )
set _ltrim_intermediate=!_ltrim_input:~%_ltrim_index%!
endlocal & set %_ltrim_output%=%_ltrim_intermediate%
GoTo :EOF


::Usage Call :rtrim OutputVariable Input
:rtrim
setlocal enabledelayedexpansion
set "TAB=	"
set "_rtrim_output=%~1"
set "_rtrim_input=%~2"
if defined %~2 ( set "_rtrim_input=!%~2!" ) 
set /a "_rtrim_index=1"
:rtrim-loop
set "_rtrim_char=!_rtrim_input:~-%_rtrim_index%,1!"
if "[!_rtrim_char!]" EQU "[%TAB%]" ( set /a "_rtrim_index+=1" & GoTo :rtrim-loop )
if "[!_rtrim_char!]" EQU "[ ]" ( set /a "_rtrim_index+=1" & GoTo :rtrim-loop )
set /a "_rtrim_index-=1"
set _rtrim_intermediate=!_rtrim_input:~,-%_rtrim_index%!
endlocal & set %_rtrim_output%=%_rtrim_intermediate%
GoTo :EOF

:format
GoTo :EOF

:isalpha
GoTo :EOF

:isdigit
GoTo :EOF

:isalnum
GoTo :EOF

:isspace
GoTo :EOF

:char2code
GoTo :EOF

:code2char
GoTo :EOF

:regex
GoTo :EOF

:encode-decode
GoTo :EOF

:escapesequences (print with color and display formatting)
GoTo :EOF

:printunicode in console ?
GoTo :EOF

:encryption & hashes
GoTo :EOF

::Usage Call :IsTrue InputBool OutputBool
:IsTrue
if not "[%~2]"=="[]" if "[%~1]"=="[true]" set "%~2=true"
if "[%~1]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)

::Usage Call :IsFalse InputBool OutputBool
:IsFalse
if not "[%~1]"=="[true]" ( exit /b 1 ) else ( exit /b 0 )
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)

::Usage Call :IsFalseStrict InputBool OutputBool
:IsFalseStrict
if "[%~1]"=="[false]" ( exit /b 0 ) else ( exit /b 1 )

::Usage Call :IsArray InputArray

::Usage Call :countarray InputArray OutputValue

:: Usage Call :IsArrayDefinedBySet Variable OutputValue
:IsArrayDefinedBySet
set /a _IsArrayDefinedBySet.index=0
for /f "tokens=1* delims=" %%a in ('set %~1 2^>^&1') do ( call set _IsArrayDefinedBySet[%%_IsArrayDefinedBySet.index%%]=%%a & call set /a _IsArrayDefinedBySet.index+=1 )
if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:Environment variable=%]" ( 
	if not "[%_IsArrayDefinedBySet[0]%]"=="[%_IsArrayDefinedBySet[0]:not defined=%]" 	set "_IsArrayDefinedBySet.IsDefined=false" ) else ( set "_IsArrayDefinedBySet.IsDefined=true" )
if not "[%~2]"=="[]" set "%~2=%_IsArrayDefinedBySet.IsDefined%"
Call :ClearVariablesByPrefix _IsArrayDefinedBySet & if "[%_IsArrayDefinedBySet.IsDefined%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )
GoTo :EOF



::Usage Call :SimpleLoop lbound ubound
:SimpleLoop
set "_SimpleLoop.lbound=%~1"
set "_SimpleLoop.ubound=%~2"
if "[%_SimpleLoop.lbound%]"=="[]" set /a "_SimpleLoop.lbound=0"
if "[%_SimpleLoop.ubound%]"=="[]" set /a "_SimpleLoop.ubound=15"
set /a "_SimpleLoop.index=%_SimpleLoop.lbound%"
:SimpleLoop-loop-1
echo loop 1 index %_SimpleLoop.index%
set /a "_SimpleLoop.index+=1"
if %_SimpleLoop.index% leq %_SimpleLoop.ubound% GoTo :SimpleLoop-loop-1
GoTo :EOF

::Usage Call :SimpleNestedLoop lbound ubound lbound2 ubound2
:SimpleNestedLoop
set "_SimpleNestedLoop.lbound=%~1"
set "_SimpleNestedLoop.ubound=%~2"
set "_SimpleNestedLoop2.lbound=%~3"
set "_SimpleNestedLoop2.ubound=%~4"

if "[%_SimpleNestedLoop.lbound%]"=="[]" set /a "_SimpleNestedLoop.lbound=0"
if "[%_SimpleNestedLoop.ubound%]"=="[]" set /a "_SimpleNestedLoop.ubound=15"
if "[%_SimpleNestedLoop2.lbound%]"=="[]" set /a "_SimpleNestedLoop2.lbound=-5"
if "[%_SimpleNestedLoop2.ubound%]"=="[]" set /a "_SimpleNestedLoop2.ubound=5"

set /a "_SimpleNestedLoop.index=%_SimpleNestedLoop.lbound%"
:SimpleNestedLoop-loop-1
set /a "_SimpleNestedLoop2.index=%_SimpleNestedLoop2.lbound%"
:SimpleNestedLoop-loop-2
echo loop 1 index %_SimpleNestedLoop.index% loop 2 index %_SimpleNestedLoop2.index%

set /a "_SimpleNestedLoop2.index+=1"
if %_SimpleNestedLoop2.index% leq %_SimpleNestedLoop2.ubound% GoTo :SimpleNestedLoop-loop-2
set /a "_SimpleNestedLoop.index+=1"
if %_SimpleNestedLoop.index% leq %_SimpleNestedLoop.ubound% GoTo :SimpleNestedLoop-loop-1

GoTo :EOF

::Usage Call :SimpleDoubleNestedLoop lbound ubound lbound2 ubound2 lbound3 ubound3
:SimpleDoubleNestedLoop
set "_SimpleDoubleNestedLoop.lbound=%~1"
set "_SimpleDoubleNestedLoop.ubound=%~2"
set "_SimpleDoubleNestedLoop2.lbound=%~3"
set "_SimpleDoubleNestedLoop2.ubound=%~4"
set "_SimpleDoubleNestedLoop3.lbound=%~5"
set "_SimpleDoubleNestedLoop3.ubound=%~6"

if "[%_SimpleDoubleNestedLoop.lbound%]"=="[]" set /a "_SimpleDoubleNestedLoop.lbound=0"
if "[%_SimpleDoubleNestedLoop.ubound%]"=="[]" set /a "_SimpleDoubleNestedLoop.ubound=15"
if "[%_SimpleDoubleNestedLoop2.lbound%]"=="[]" set /a "_SimpleDoubleNestedLoop2.lbound=-5"
if "[%_SimpleDoubleNestedLoop2.ubound%]"=="[]" set /a "_SimpleDoubleNestedLoop2.ubound=5"
if "[%_SimpleDoubleNestedLoop3.lbound%]"=="[]" set /a "_SimpleDoubleNestedLoop3.lbound=-10"
if "[%_SimpleDoubleNestedLoop3.ubound%]"=="[]" set /a "_SimpleDoubleNestedLoop3.ubound=-8"

set /a "_SimpleDoubleNestedLoop.index=%_SimpleDoubleNestedLoop.lbound%"
:SimpleDoubleNestedLoop-loop-1
set /a "_SimpleDoubleNestedLoop2.index=%_SimpleDoubleNestedLoop2.lbound%"
:SimpleDoubleNestedLoop-loop-2
set /a "_SimpleDoubleNestedLoop3.index=%_SimpleDoubleNestedLoop3.lbound%"
:SimpleDoubleNestedLoop-loop-3
echo loop 1 index %_SimpleDoubleNestedLoop.index% loop 2 index %_SimpleDoubleNestedLoop2.index% loop 3 index %_SimpleDoubleNestedLoop3.index%

set /a "_SimpleDoubleNestedLoop3.index+=1"
if %_SimpleDoubleNestedLoop3.index% leq %_SimpleDoubleNestedLoop3.ubound% GoTo :SimpleDoubleNestedLoop-loop-3
set /a "_SimpleDoubleNestedLoop2.index+=1"
if %_SimpleDoubleNestedLoop2.index% leq %_SimpleDoubleNestedLoop2.ubound% GoTo :SimpleDoubleNestedLoop-loop-2
set /a "_SimpleDoubleNestedLoop.index+=1"
if %_SimpleDoubleNestedLoop.index% leq %_SimpleDoubleNestedLoop.ubound% GoTo :SimpleDoubleNestedLoop-loop-1

GoTo :EOF


::Usage Call :FindArrayBounds InputArray OutputValue
::Usage Call :lbound InputArray OutputValue
::Usage Call :ubound InputArray OutputValue
:FindArrayBounds
:lbound
:ubound
set /a FindArrayBounds.index=0
for /f "tokens=1,2 delims=[]=" %%a in ('set %~1[ 2^>nul') do ( call set "FindArrayBounds[%%FindArrayBounds.index%%]=%%b" & call set /a FindArrayBounds.index+=1 )
Call :IsArrayDefinedBySet "%~1[0]" && set "FindArrayBounds.IsZeroDefined=true" || set "FindArrayBounds.IsZeroDefined=false"
set /a "FindArrayBounds.ubound=%FindArrayBounds.index%-1"
REM Actually going to have to split that becuase 3 is greater than -2147483644 and 2 is greater than -2147483645 and 0 is greater than -2147483647 are the limits
REM change algorith to work beyond these values, maybe ?
set /a "FindArrayBounds.lowestvalue=1147483647"
set /a "FindArrayBounds.highestvalue=-1147483647"
set /a FindArrayBounds.index=0
:FindArrayBounds-loop
REM call echo 11 call set /a "FindArrayBounds.current=%%FindArrayBounds[%FindArrayBounds.index%]%%"
call set /a "FindArrayBounds.current=%%FindArrayBounds[%FindArrayBounds.index%]%%" 2>nul
if %FindArrayBounds.current% EQU 0 if "[%FindArrayBounds.IsZeroDefined%]"=="[false]" GoTo :FindArrayBounds-loop-next-iteration
if %FindArrayBounds.current% lss %FindArrayBounds.lowestvalue% set /a "FindArrayBounds.lowestvalue=%FindArrayBounds.current%"
if %FindArrayBounds.current% gtr %FindArrayBounds.highestvalue% set /a "FindArrayBounds.highestvalue=%FindArrayBounds.current%"
REM echo lowest %FindArrayBounds.lowestvalue% highest %FindArrayBounds.highestvalue%
:FindArrayBounds-loop-next-iteration
set /a FindArrayBounds.index+=1
if %FindArrayBounds.index% leq %FindArrayBounds.ubound% GoTo :FindArrayBounds-loop

if "[%~2]"=="[]" (
	set /a "%~1.lbound=%FindArrayBounds.lowestvalue%"
	set /a "%~1.ubound=%FindArrayBounds.highestvalue%"
	set /a "%~1.count=%FindArrayBounds.highestvalue%-%FindArrayBounds.lowestvalue%+1"
) else (
	set /a "%~2.lbound=%FindArrayBounds.lowestvalue%"
	set /a "%~2.ubound=%FindArrayBounds.highestvalue%"
	set /a "%~2.count=%FindArrayBounds.highestvalue%-%FindArrayBounds.lowestvalue%+1"
)
Call :ClearVariablesByPrefix FindArrayBounds
GoTo :EOF
:EndOf_FindArrayBounds EndOf_lbound EndOf_ubound

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
	if "[%_GetArrayParameters.index%]"=="[]" if "[%~4]"=="[]" set /a "_GetArrayParameters.index=0"
) else (
	if "[%_GetArrayParameters.lbound%]"=="[]" set "_GetArrayParameters_bounds_incomplete=true" & set "_GetArrayParameters_lbound_empty=true"
	if "[%_GetArrayParameters.ubound%]"=="[]" set "_GetArrayParameters_bounds_incomplete=true" & set "_GetArrayParameters_ubound_empty=true"
	if "[%_GetArrayParameters_bounds_incomplete%]"=="[true]" Call :FindArrayBounds %%%~1%% _GetArrayParameters_bounds_incomplete
	if "[%_GetArrayParameters_lbound_empty%]"=="[true]" set "_GetArrayParameters.lbound=%_GetArrayParameters_bounds_incomplete.lbound%"
	if "[%_GetArrayParameters_ubound_empty%]"=="[true]" set "_GetArrayParameters.ubound=%_GetArrayParameters_bounds_incomplete.ubound%"
	if "[%_GetArrayParameters.count%]"=="[]" set /a _GetArrayParameters.count=%_GetArrayParameters.ubound%-%_GetArrayParameters.lbound%+1  2>nul
)
if "[%~4]" NEQ "[]" ( set /a "_GetArrayParameters.index=%~4" 2>nul )
set _GetArrayParameters.name=%~1
set "%~2.lbound=%_GetArrayParameters.lbound%"
set "%~2.ubound=%_GetArrayParameters.ubound%"
set "%~2.count=%_GetArrayParameters.count%"
set "%~2.index=%_GetArrayParameters.index%"
if "[%_GetArrayParameters.name%]" NEQ "" set "%~2=%_GetArrayParameters.name%"
Call :ClearVariablesByPrefix _GetArrayParameters & if "[%_GetArrayParameters.ubound%]"=="[]" ( exit /b 1 ) else ( exit /b 0 )
GoTo :EOF
::GetArrayParameters-END

:: specify suffix 
:: Usage Call :AppendArrayToArray InputArray OutputArray .suffixIfAny
:: Will copy every element of InputArray to the end of Output array, using the specified suffix
:AppendArrayToArray
Call :GetArrayParameters %~1 _AppendArrayToArray_InputArray 
Call :GetArrayParameters %~2 _AppendArrayToArray_OutputArray
set /a _AppendArrayToArray_InputArray.index=%_AppendArrayToArray_InputArray.lbound%
:AppendArrayToArray-loop
set /a _AppendArrayToArray_OutputArray.ubound+=1
call set %_AppendArrayToArray_OutputArray%[%_AppendArrayToArray_OutputArray.ubound%]=%%%_AppendArrayToArray_InputArray%[%_AppendArrayToArray_InputArray.index%]%%
set /a _AppendArrayToArray_InputArray.index+=1
if %_AppendArrayToArray_InputArray.index% leq %_AppendArrayToArray_InputArray.ubound% GoTo :AppendArrayToArray-loop
set /a %_AppendArrayToArray_OutputArray%.ubound=%_AppendArrayToArray_OutputArray.ubound%
set /a %_AppendArrayToArray_OutputArray%.count=%_AppendArrayToArray_OutputArray.ubound%-%_AppendArrayToArray_OutputArray.lbound%+1
GoTo :EOF

::Usage Call :AddValuesToArray OutputArray Value/Values[x] Value2/Values2[x] ValueN/ValuesN[x]
:AddValuesToArray 
Call :GetArrayParameters %~1 _AddValuesToArray_OutputArray Initialize -1
Call :SetArrayParameters _FindValuesInArray_AddArray nil 0 -1 0 
:AddValuesToArray-next-values
Call :GetArrayParameters %~2 _AddValuesToArray_InputArray && set _FindValuesInArray_AddArray.ubound+=1 & set "_FindValuesInArray_AddArray[%_FindValuesInArray_AddArray.ubound%]=%~2" & GoTo :AddValuesToArray-skip-copy
Call :AppendArrayToArray %_AddValuesToArray_InputArray% _FindValuesInArray_AddArray
:AddValuesToArray-skip-copy
shift 
if not "[%~2]"=="[]" GoTo :AddValuesToArray-next-values
Call :AppendArrayToArray _FindValuesInArray_AddArray %_AddValuesToArray_OutputArray%
GoTo :EOF


::Usage Call :StringCompare StringA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len
:StringCompare
Call :SetIfNotDefined "%~1" _StringCompare_StringA "%~2" _StringCompare_StringB
Call :Len "%_StringCompare_StringA%" _StringCompare_StringA.len
echo A %_StringCompare_StringA.len% B %_StringCompare_StringB.len%
Call :SetArrayParameters _StringCompare_StringA ParameterVariable 0 %_StringCompare_StringA.len% 0
Call :Len "%_StringCompare_StringB%" _StringCompare_StringB.len
echo A %_StringCompare_StringA.len% B %_StringCompare_StringB.len%
Call :SetArrayParameters _StringCompare_StringB ParameterVariable 0 %_StringCompare_StringB.len% 0
set /a _StringCompare.MatchingChars=0

:StringCompare-loop
call set "_StringCompare_StringA.CurrentChar=%%_StringCompare_StringA:~%_StringCompare_StringA.index%,1%%"
call set "_StringCompare_StringB.CurrentChar=%%_StringCompare_StringB:~%_StringCompare_StringB.index%,1%%"
if "[%_StringCompare_StringA.CurrentChar%]"=="[%_StringCompare_StringB.CurrentChar%]" set /a _StringCompare.MatchingChars+=1
set /a _StringCompare_StringA.index+=1
if %_StringCompare_StringA.index% leq %_StringCompare_StringA.ubound% GoTo :StringCompare-loop
echo set /a _StringCompare.MatchingPercent=%_StringCompare.MatchingChars%/%_StringCompare_StringA.len%
set /a _StringCompare.MatchingPercent=%_StringCompare.MatchingChars%/%_StringCompare_StringA.len%
Call :SetIfNamedVariable "%_StringCompare.MatchingPercent%" "%~3" "%_StringCompare.MatchingChars%" "%~4" "%_StringCompare_StringA.len%" "%~5" "%_StringCompare_StringB.len%" "%~6"
exit /b %_StringCompare.MatchingPercent%

::Usage Call :ReadyMadeLoop start end increment
:: set _ReadyMadeLop[0 to 10] with your commands to be executed inside the loop
:: set _ReadyMadeLop[0 to 10].pre and .post for commands outside the loop 
:ReadyMadeLoop
call :SetNonEmptyValue "%~1" _ReadyMadeLoop_start "%~2" _ReadyMadeLoop_end "%~3" _ReadyMadeLoop_increment
if %_ReadyMadeLoop_end% lss %_ReadyMadeLoop_start% ( set "_ReadyMadeLoop_direction=geq" ) else ( set "_ReadyMadeLoop_direction=leq" )
%_ReadyMadeLoop[0].pre%
%_ReadyMadeLoop[1].pre%
%_ReadyMadeLoop[2].pre%
%_ReadyMadeLoop[3].pre%
%_ReadyMadeLoop[4].pre%
%_ReadyMadeLoop[5].pre%
%_ReadyMadeLoop[6].pre%
%_ReadyMadeLoop[7].pre%
%_ReadyMadeLoop[8].pre%
%_ReadyMadeLoop[9].pre%
%_ReadyMadeLoop[10].pre%

:ReadyMadeLoop-loop

%_ReadyMadeLoop[0]%
%_ReadyMadeLoop[1]%
%_ReadyMadeLoop[2]%
%_ReadyMadeLoop[3]%
%_ReadyMadeLoop[4]%
%_ReadyMadeLoop[5]%
%_ReadyMadeLoop[6]%
%_ReadyMadeLoop[7]%
%_ReadyMadeLoop[8]%
%_ReadyMadeLoop[9]%
%_ReadyMadeLoop[10]%

set /a "_ReadyMadeLoop_start+=%_ReadyMadeLoop_increment%"

if %_ReadyMadeLoop_start% %_ReadyMadeLoop_direction% %_ReadyMadeLoop_end% GoTo :ReadyMadeLoop-loop

%_ReadyMadeLoop[0].post%
%_ReadyMadeLoop[1].post%
%_ReadyMadeLoop[2].post%
%_ReadyMadeLoop[3].post%
%_ReadyMadeLoop[4].post%
%_ReadyMadeLoop[5].post%
%_ReadyMadeLoop[6].post%
%_ReadyMadeLoop[7].post%
%_ReadyMadeLoop[8].post%
%_ReadyMadeLoop[9].post%
%_ReadyMadeLoop[10].post%

GoTo :EOF


::Usage Call :IsInString "%InputString%" SearchString optional OutputBool
:IsInString 
set "_IsInString_input=%~1"
set "_IsInString_search=%~2"
if not "[%_IsInString_search%]"=="[]" call set "_IsInString_compare=%%_IsInString_input:%_IsInString_search%=%%"
REM echo input %_IsInString_input% search %_IsInString_search% compare %_IsInString_compare%
if not "[%_IsInString_input%]"=="[%_IsInString_compare%]" set _IsInString_search=true
if not "[%~3]"=="[]" if "[%_IsInString_search%]"=="[true]" ( set "%~3=true" ) else ( set "%~3=false" )
Call :ClearVariablesByPrefix _IsInString & if "[%_IsInString_search%]"=="[true]" ( exit /b 0 ) else ( exit /b 1 )


::Usage Call :AppendArrayToArray InputArray OutputArray
:: Will add all elements from InputArray to the end of OutputArray, copying all suffixes
REM get array InputArray
REM get array InputArray

::Usage Call :IsMatch FirstVariable SecondVariable
:IsMatch
echo if "[%~1]"=="[%~2]" ( exit /b 0 ) else ( exit /b 1 )
if "[%~1]"=="[%~2]" ( exit /b 0 ) else ( exit /b 1 )

::Usage Call :FindValuesInArray InputArray OutputArray "suffix=.suffix" "match=only,except,partial,exact" SearchList1 SearchList2 SearchListN
:FindValuesInArray

Call :ClearVariablesByPrefix _FindValuesInArray
Call :GetArrayParameters %~1 _FindValuesInArray_InputArray
Call :GetArrayParameters %~2 _FindValuesInArray_OutputArray || Call :SetArrayParameters _FindValuesInArray_OutputArray nil 0 -1 0 
REM echo 1 %~1 2 %~2 3 %~3 4 %~4
REM set _FindValuesInArray

REM echo %~3 list of suffix
REM echo %~4 behavious only|except
REM if "[%~3]"=="[except]" set "_FindValuesInArray_SearchBehaviour=not"

Call :SetArrayParameters _FindValuesInArray_SearchTerms nil 0 -1 0 
:FindValuesInArray-SearchTermsFillArray-loop
echo number3 is %~3 %~4 %~5
SET "mytestvvv="
REM set mytestvvv=allo123456
REM set mytestvvv=%mytestvvv:~0,5%
REM set mytestvvv=%~3:~0,5
REM set mytestvvv=%~3:~0,5%
REM set mytestvvv=%%~3:~0,5%
REM set mytestvvv=%%~3:~0,5%%
REM call set mytestvvv=%%~3:~0,5%%


call :left "%~3" _FindValuesInArray_argumentleft5 6 & Call :IsMatch "%%_FindValuesInArray_argumentleft5%%" "match=" & Call :LeftCut "%~3" _FindValuesInArray_MatchBehaviour 6 & call echo %%_FindValuesInArray_MatchBehaviour%%
set _FindValuesInArray_MatchBehaviour
REM echo mytestvvv %mytestvvv%
REM Call :IsMatch "%%~3:~0,5%%" "match=" && echo yes || echo no
goto :eof
if "[%~3]"=="[match=]" set "_FindValuesInArray_SearchBehaviour=not"
Call :AddValuesToArray _FindValuesInArray_SearchTerms "%~3"
:FindValuesInArray-SearchTermsFillArray-skip
shift
if not "[%~4]"=="[]" GoTo :FindValuesInArray-SearchTermsFillArray-loop

set /a _FindValuesInArray_InputArray.index=%_FindValuesInArray_InputArray.lbound%
:FindValuesInArray-main-loop
set /a _FindValuesInArray_SearchTerms.index=%_FindValuesInArray_SearchTerms.lbound%
:FindValuesInArray-SearchTerms-loop
call set _FindValuesInArray_SearchTerms.current=%%_FindValuesInArray_SearchTerms[%_FindValuesInArray_SearchTerms.index%]%%
call set _FindValuesInArray_InputArray.current=%%_FindValuesInArray_InputArray[%_FindValuesInArray_InputArray.index%]%%
call set _FindValuesInArray_InputArray.current.compare=%%_FindValuesInArray_InputArray.current:%_FindValuesInArray_SearchTerms.current%=%%
if %_FindValuesInArray_SearchBehaviour% "[%_FindValuesInArray_SearchTerms.current%]"=="[%_FindValuesInArray_InputArray.current.compare%]" set %_FindValuesInArray_InputArray%[%_FindValuesInArray_InputArray.ubound%]

set /a _FindValuesInArray_SearchTerms.index+=1
if %_FindValuesInArray_SearchTerms.index% leq %_FindValuesInArray_SearchTerms.ubound% GoTo :FindValuesInArray-SearchTerms-loop
set /a _FindValuesInArray_InputArray.index+=1
if %_FindValuesInArray_InputArray.index% leq %_FindValuesInArray_InputArray.ubound% GoTo :FindValuesInArray-main-loop
REM getarray %~1
REM getarray OutputArray

REM build searchlist
REM if array, add searchlistarray to searchlistarray
REM deconcatenate SuffixList


REM loop through InputArray
REM loop through searchlist
REM loop through suffixlist
REM if there's a match add index as element of OutputArray
Call :ClearVariablesByPrefix _FindValuesInArray
GoTo :EOF

:: Set _CopyValuesFromArray_PartialMatch=true if you want to allow partial matches
:: Set _CopyValuesFromArray_SearchSuffix 'the suffix that will be searched into
:: Maybe support for _CopyValuesFromArray_OutputSuffix=NOSUFFIX ?
::Usage Call :CopyValuesFromArray InputArray OutputArray SearchList1 SearchList2 SearchListN
:CopyValuesFromArray
REM @echo on
set "_CopyValuesFromArray_InputArray=%~1"
call set "_CopyValuesFromArray_InputArray.lbound=%%%~1.lbound%%"
call set "_CopyValuesFromArray_InputArray.ubound=%%%~1.ubound%%"
set "_CopyValuesFromArray_OutputArray=%~2"
call set "_CopyValuesFromArray_OutputArray.lbound=%%%~2.lbound%%"
call set "_CopyValuesFromArray_OutputArray.ubound=%%%~2.ubound%%"
if "[%_CopyValuesFromArray_OutputArray.lbound%]"=="[]" set /a "%_CopyValuesFromArray_OutputArray%.lbound=0"
if "[%_CopyValuesFromArray_OutputArray.ubound%]"=="[]" set /a "%_CopyValuesFromArray_OutputArray%.ubound=-1"
if "[%_CopyValuesFromArray_SearchSuffix%]"=="[]" set "_CopyValuesFromArray_SearchSuffix=NOSUFFIX"
if not "[%_CopyValuesFromArray_SearchSuffix%]"=="[]" Call :Deconcatenate " " "%_CopyValuesFromArray_SearchSuffix%" _CopyValuesFromArray_SearchSuffix
set /a _CopyValuesFromArray_SearchList.lbound=0
set /a _CopyValuesFromArray_SearchList.ubound=-1
:CopyValuesFromArray-InputArray-SearchList-loop
set "_CopyValuesFromArray_NewSearchList=%~3"
call set _CopyValuesFromArray_NewSearchList.lbound=%%%_CopyValuesFromArray_NewSearchList%.lbound%%
call set _CopyValuesFromArray_NewSearchList.ubound=%%%_CopyValuesFromArray_NewSearchList%.ubound%%
call :IsNumeric %_CopyValuesFromArray_NewSearchList.lbound% && set "_CopyValuesFromArray_NewSearchList.lbound="
call :IsNumeric %_CopyValuesFromArray_NewSearchList.ubound% && set "_CopyValuesFromArray_NewSearchList.ubound="
if "[%_CopyValuesFromArray_NewSearchList.ubound%]"=="[]" set /a _CopyValuesFromArray_SearchList.ubound+=1
if "[%_CopyValuesFromArray_NewSearchList.ubound%]"=="[]" (
	set "_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.ubound%]=%_CopyValuesFromArray_NewSearchList%"
	GoTo :CopyValuesFromArray-InputArray-SearchList-subloop-skip
)
set _CopyValuesFromArray_NewSearchList.index=%_CopyValuesFromArray_NewSearchList.lbound%
:CopyValuesFromArray-InputArray-SearchList-subloop
set /a _CopyValuesFromArray_SearchList.ubound+=1
call set "_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.ubound%]=%%%_CopyValuesFromArray_NewSearchList%[%_CopyValuesFromArray_NewSearchList.index%]%%
set /a _CopyValuesFromArray_NewSearchList.index+=1
if %_CopyValuesFromArray_NewSearchList.index% LEQ %_CopyValuesFromArray_NewSearchList.ubound% GoTo :CopyValuesFromArray-InputArray-SearchList-subloop
:CopyValuesFromArray-InputArray-SearchList-subloop-skip
shift
if not "[%~3]"=="[]" GoTo :CopyValuesFromArray-InputArray-SearchList-loop
REM Main loop starts here
REM set _CopyValuesFromArray
set /a _CopyValuesFromArray_InputArray.index=%_CopyValuesFromArray_InputArray.lbound%
:CopyValuesFromArray-InputArray-loop
set /a _CopyValuesFromArray_SearchList.index=%_CopyValuesFromArray_SearchList.lbound%
:CopyValuesFromArray-InputArray-searchterms-loop
REM call echo searchlist call set "_CopyValuesFromArray_SearchList.current=%%_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]%%" _CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]
call set "_CopyValuesFromArray_SearchList.current=%%_CopyValuesFromArray_SearchList[%_CopyValuesFromArray_SearchList.index%]%%"
set /a _CopyValuesFromArray_SearchSuffix.index=%_CopyValuesFromArray_SearchSuffix.lbound%
:CopyValuesFromArray-InputArray-suffix-loop
REM call echo suffixlist call set "_CopyValuesFromArray_SearchSuffix.current=%%_CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]%%" _CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]
call set "_CopyValuesFromArray_SearchSuffix.current=%%_CopyValuesFromArray_SearchSuffix[%_CopyValuesFromArray_SearchSuffix.index%]%%"
if "[%_CopyValuesFromArray_SearchSuffix.current%]"=="[NOSUFFIX]" set "_CopyValuesFromArray_SearchSuffix.current=
call set "_CopyValuesFromArray_InputArray.current=%%%_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%]%_CopyValuesFromArray_SearchSuffix.current%%%"
REM echo InputArray %_CopyValuesFromArray_InputArray.index% SearchList %_CopyValuesFromArray_SearchList.index% SearchSuffix %_CopyValuesFromArray_SearchSuffix.index% compare "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_SearchList.current%]"
if "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_SearchList.current%]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-matchfound
if not "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-nomatch
set "_CopyValuesFromArray_PartialMatch.current="
if "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" call set "_CopyValuesFromArray_PartialMatch.current=%%_CopyValuesFromArray_InputArray.current:%_CopyValuesFromArray_SearchList.current%=%%" 
if "[%_CopyValuesFromArray_PartialMatch%]"=="[true]" if not "[%_CopyValuesFromArray_InputArray.current%]"=="[%_CopyValuesFromArray_PartialMatch.current%]" GoTo :CopyValuesFromArray-InputArray-suffix-loop-matchfound
GoTo :CopyValuesFromArray-InputArray-suffix-loop-nomatch
:CopyValuesFromArray-InputArray-suffix-loop-matchfound
REM echo match found
REM echo set /a %_CopyValuesFromArray_OutputArray%.ubound+=1
set /a %_CopyValuesFromArray_OutputArray%.ubound+=1
REM echo *_CopyValuesFromArray_OutputArray*.ubound %_CopyValuesFromArray_OutputArray%.ubound
REM call echo ***_CopyValuesFromArray_OutputArray**.ubound** %%%_CopyValuesFromArray_OutputArray%.ubound%%
REM call echo Call :CopyElementAndSuffix %_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%] %_CopyValuesFromArray_OutputArray%[%%%_CopyValuesFromArray_OutputArray%.ubound%%]
Call :CopyElementAndSuffix %_CopyValuesFromArray_InputArray%[%_CopyValuesFromArray_InputArray.index%] %_CopyValuesFromArray_OutputArray%[%%%_CopyValuesFromArray_OutputArray%.ubound%%]
set /a _CopyValuesFromArray_InputArray.index+=1
if %_CopyValuesFromArray_InputArray.index% LEQ %_CopyValuesFromArray_InputArray.ubound% ( GoTo :CopyValuesFromArray-InputArray-loop ) else ( GoTo :CopyValuesFromArray-end)
:CopyValuesFromArray-InputArray-suffix-loop-nomatch

set /a _CopyValuesFromArray_SearchSuffix.index+=1
if %_CopyValuesFromArray_SearchSuffix.index% LEQ %_CopyValuesFromArray_SearchSuffix.ubound% GoTo :CopyValuesFromArray-InputArray-suffix-loop
set /a _CopyValuesFromArray_SearchList.index+=1
if %_CopyValuesFromArray_SearchList.index% LEQ %_CopyValuesFromArray_SearchList.ubound% GoTo :CopyValuesFromArray-InputArray-searchterms-loop
set /a _CopyValuesFromArray_InputArray.index+=1
if %_CopyValuesFromArray_InputArray.index% LEQ %_CopyValuesFromArray_InputArray.ubound% GoTo :CopyValuesFromArray-InputArray-loop
:CopyValuesFromArray-end
Call :ClearVariablesByPrefix _CopyValuesFromArray
GoTo :EOF


REM superfluous ?
::CopyValuesFromArray_CopyValuesToArray.suffix
::CopyValuesFromArray_CopyValuesToArray.index ' the starting index for copying TO, if missing, append to end of array
::Usage Call :CopyValuesFromArray _CopyValuesFromArray _CopyValuesToArray ValuesToCopyList1 ValuesToCopyList2 ValuesToCopyListn
REM :CopyValuesFromArray
REM if ValuesToCopyListn has no ubound
REM loop through _CopyValuesFromArray, for every matching value (in suffix), copy array element FROM/TO (no suffix control yet)
REM then shift to next ValuesToCopyListn, if present and start over
REM ValuesToCopyListn.isarray then goto 
REM Call :AddArrayElement source.array source.index destination.array destination.index
REM GoTo :EOF

::Usage Call :ListAppxPackagesByInstallStatus optional ArrayName
:: Will print a list of installed packages
:: Or instead return an array of the packages if optional ArrayName is supplied
:ListAppxPackagesByInstallStatus
Call :GetAppxPackages
GoTo :EOF




::Usage Call :InstallAppxPackages PackageList
:InstallAppxPackages
REM if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -Package '%~1'"
echo powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
REM call echo %%%~1.ubound%% REM weird \Program Files\WindowsApps\Microsoft.Winget.Source_2023.515.1421.333_neutral__8wekyb3d8bbwe.ubound
call set "_InstallAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_InstallAppxPackages_PackageList_ubound=%]"=="[]" GoTo :EOF
set /a _InstallAppxPackages_index=0
:InstallAppxPackages-internal-loop
call echo call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
set /a _InstallAppxPackages_index+=1
if %_InstallAppxPackages_index% LEQ %_InstallAppxPackages_PackageList_ubound% GoTo :InstallAppxPackages-internal-loop
GoTo :EOF

::Usage Call :DeleteAppxPackages PackageList
:DeleteAppxPackages
if not "[%~1]"=="[]" powershell -Command "Remove-AppxPackage -Package '%~1'"
call echo %%%~1.ubound%%
call set "_DeleteAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_DeleteAppxPackages_PackageList_ubound=%]"="[]" GoTo :EOF
set /a _DeleteAppxPackages_index=0
:DeleteAppxPackages-internal-loop
call echo call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
set /a _DeleteAppxPackages_index+=1
if %_DeleteAppxPackages_index% LEQ %_DeleteAppxPackages_PackageList_ubound% GoTo :DeleteAppxPackages-internal-loop
GoTo :EOF

:ShowAppxForceUpdate
Call :ClearVariablesByPrefix AppxPackages
GoTo :EOF


::Usage Call :FindAppxPackages MatchingPackages optional SearchTerms optional only|except optional SearchProperties
:: SearchTerms contains the search terms, can be an array, if it is an array lbound must be 0 and ubound must be set
:: only|except : ("only" is default behaviour) whether to return only matching results or, all results except matching
:: SearchProperties : List of properties to search for SearchTerm, separated by backslash
:: SearchProperties : If not specified, will use FullName property only
:FindAppxPackages
call :IsAdmin || echo This command requires admin privileges
Call :ClearVariablesByPrefix _FindAppxPackages
REM Obtain ubound from output array, if there's one, so we can just append to it
call set "_FindAppxPackages_MatchingPackages.ubound=%%%~1.ubound%%"
REM Obtain individual search term
set "_FindAppxPackages_SearchTerms[0]=%~2"
REM Obtain ubound, if there's a search terms array
REM call echo call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
REM echo _FindAppxPackages_SearchTerms %_FindAppxPackages_SearchTerms%
REM In case there's a path in %~2, we check IsNumeric and wipe the value if not
Call :IsNumeric %_FindAppxPackages_SearchTerms.ubound% && set "_FindAppxPackages_SearchTerms.ubound="
REM If there is no search terms array provided, we skip filling local search terms array
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" echo Case where there is no SearchTerms array
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" GoTo :FindAppxPackages-fill-in-SearchTerms-skip
REM We are filling local search terms array, starting at 0
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-fill-in-SearchTerms-loop
REM We have a search terms array provided, copying to local variable and updating local ubound on each loop
REM call echo Case where SearchTerms array exists, running call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
REM echo _FindAppxPackages_SearchTerms[0] %_FindAppxPackages_SearchTerms[0]%
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-fill-in-SearchTerms-loop
:FindAppxPackages-fill-in-SearchTerms-skip
REM If there's a search terms array, it has overwritten the erroneous "individual search term" 
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" echo Case where no SearchTerms array, but one SearchTerms exists
REM If no search terms array was provided but there is a search term, then set local search terms array ubound to zero
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" set /a "_FindAppxPackages_SearchTerms.ubound=0"
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if "[%~2]"=="[]" echo No search terms, no array, no action needed
REM We are setting the matching behaviour from the third argument, only returning matching result is the default
set "_FindAppxPackages_MatchingBehaviour=only"
if not "[%~3]"=="[]" set "_FindAppxPackages_MatchingBehaviour=%~3"
REM The way this works, there is on main IF for the comparator, and we use MatchingBehaviour as a macro to boolean flip by writing "not" in it
if "[%_FindAppxPackages_MatchingBehaviour%]"=="[only]" ( set "_FindAppxPackages_MatchingBehaviour=not" ) else ( set "_FindAppxPackages_MatchingBehaviour=" )
REM This is a splitting function, it splits the fourth parameter, delimited with backslash into an array
if not "[%~4]"=="[]" ( Call :Deconcatenate \ %~4 _FindAppxPackages_SearchProperties ) else ( set "_FindAppxPackages_SearchProperties[0]=.PackageFullName" & set /a "_FindAppxPackages_SearchProperties.ubound=0")
REM Time to fill the main database of all AppxPackages
REM Fill array AppxPackages if ubound is not set, clearing the ubound is how to for a refresh
if "[%AppxPackages.ubound%]"=="[]" Call :GetAppxPackages
REM We will now loop through each AppxPackage, we will look for all provided Search terms in each of the specified Properties
set /a "_FindAppxPackages.index=0"
:FindAppxPackages-loop-through-AppxPackages
set /a "_FindAppxPackages_SearchProperties.index=0"
:FindAppxPackages-loop-through-SearchProperties
REM echo _FindAppxPackages.index %_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index %_FindAppxPackages_SearchProperties.index%
REM echo AppxPackages[%_FindAppxPackages.index%] _FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]
REM call echo AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%
REM call call echo call echo %%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%
REM call call echo call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
REM echo CURRENT PROPERTY:%_FindAppxPackages_CurrentSearchProperty%
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-loop-through-SearchTerms
REM call echo call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
if "[%_FindAppxPackages_CurrentSearchTerm%]"=="[]" GoTo :FindAppxPackages-match-found
REM echo looping through _FindAppxPackages.index=%_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index=%_FindAppxPackages_SearchProperties.index% _FindAppxPackages_SearchTerms.index=%_FindAppxPackages_SearchTerms.index%
REM call echo call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
REM call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
call set "_FindAppxPackages_CurrentSearchPropertyCompare=%%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%%"
REM echo _FindAppxPackages_CurrentSearchProperty=%_FindAppxPackages_CurrentSearchProperty% 
REM echo _FindAppxPackages_CurrentSearchTerm=%_FindAppxPackages_CurrentSearchTerm% 
REM echo _FindAppxPackages_CurrentSearchPropertyCompare %_FindAppxPackages_CurrentSearchPropertyCompare%
REM echo MAIN COMPARATOR if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]"
REM if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( echo comparator says yes ) else ( echo comparator says no)
if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( GoTo :FindAppxPackages-match-found ) else ( GoTo :FindAppxPackages-no-match-found )
:FindAppxPackages-match-found
if not "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound+=1
if "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound=0
REM echo MATCH FOUND ADDING %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
set /a %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
REM echo we made it here ? 5
GoTo :FindAppxPackages-go-to-next-AppxPackages-index
:FindAppxPackages-no-match-found
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-loop-through-SearchTerms
set /a "_FindAppxPackages_SearchProperties.index+=1"
if %_FindAppxPackages_SearchProperties.index% LEQ %_FindAppxPackages_SearchProperties.ubound% GoTo :FindAppxPackages-loop-through-SearchProperties
:FindAppxPackages-go-to-next-AppxPackages-index
REM echo we made it here ? 6
set /a "_FindAppxPackages.index+=1"
REM echo if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
call set /a %%%~1.ubound=%_FindAppxPackages_MatchingPackages.ubound%
set /a _FindAppxPackages_MatchingPackages.ubound+=1
call set /a %%%~1.count=%_FindAppxPackages_MatchingPackages.ubound%
Call :ClearVariablesByPrefix _FindAppxPackages
GoTo :EOF
REM https://stackoverflow.com/questions/8481558/windows-batch-goto-within-if-block-behaves-very-strangely
REM https://stackoverflow.com/users/1012053/dbenham
REM https://stackoverflow.com/questions/47280217/was-unexpected-at-this-time-generated-from-batch-script-line-if-exist-file/47280406#47280406


::Usage Call :GetAppxPackages
:GetAppxPackages
Call :ClearVariablesByPrefix AppxPackages
set /a "AppxPackages.lbound=0"
set /a "AppxPackages.ubound=0"
set /a "AppxPackages.count=0"
for /f "tokens=1-24 delims=|" %%a in ('powershell -Command "$i = 0; Get-AppxPackage -AllUsers | ForEach-Object { (&{ if ($_.GetHashCode().ToString()) { $_.GetHashCode().ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.GetType()) { $_.GetType() } else { 'NoValue' } }) + '|' + (&{ if ($_.ToString()) { $_.ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.Architecture) { $_.Architecture } else { 'NoValue' } }) + '|' + (&{ if ($_.Dependencies) { $_.Dependencies } else { 'NoDependencies' } }) + '|' + (&{ if ($_.InstallLocation) { $_.InstallLocation } else { 'NoValue' } }) + '|' + (&{ if ($_.IsBundle) { $_.IsBundle } else { 'NoValue' } }) + '|' + (&{ if ($_.IsDevelopmentMode) { $_.IsDevelopmentMode } else { 'NoValue' } }) + '|' + (&{ if ($_.IsFramework) { $_.IsFramework } else { 'NoValue' } }) + '|' + (&{ if ($_.IsPartiallyStaged) { $_.IsPartiallyStaged } else { 'NoValue' } }) + '|' + (&{ if ($_.IsResourcePackage) { $_.IsResourcePackage } else { 'NoValue' } }) + '|' + (&{ if ($_.Name) { $_.Name } else { 'NoValue' } }) + '|' + (&{ if ($_.NonRemovable) { $_.NonRemovable } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFamilyName) { $_.PackageFamilyName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFullName) { $_.PackageFullName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageUserInformation) { $_.PackageUserInformation } else { 'NoValue' } }) + '|' + (&{ if ($_.Publisher) { $_.Publisher } else { 'NoValue' } }) + '|' + (&{ if ($_.PublisherId) { $_.PublisherId } else { 'NoValue' } }) + '|' + (&{ if ($_.ResourceId) { $_.ResourceId } else { 'NoValue' } }) + '|' + (&{ if ($_.SignatureKind) { $_.SignatureKind } else { 'NoValue' } }) + '|' + (&{ if ($_.Status) { $_.Status } else { 'NoValue' } }) + '|' + (&{ if ($_.Version) { $_.Version } else { 'NoValue' } }) + '|' + $i++ }"') do (
set "AppxPackages[%%w].GetHashCode=%%a"
set "AppxPackages[%%w].GetType=%%b"
set "AppxPackages[%%w].ToString=%%c"
set "AppxPackages[%%w].Architecture=%%d"
set "AppxPackages[%%w].Dependencies=%%e"
set "AppxPackages[%%w].InstallLocation=%%f"
set "AppxPackages[%%w].IsBundle=%%g"
set "AppxPackages[%%w].IsDevelopmentMode=%%h"
set "AppxPackages[%%w].IsFramework=%%i"
set "AppxPackages[%%w].IsPartiallyStaged=%%j"
set "AppxPackages[%%w].IsResourcePackage=%%k"
set "AppxPackages[%%w].Name=%%l"
set "AppxPackages[%%w].NonRemovable=%%m"
set "AppxPackages[%%w].PackageFamilyName=%%n"
set "AppxPackages[%%w].PackageFullName=%%o"
set "AppxPackages[%%w].PackageUserInformation=%%p"
set "AppxPackages[%%w].Publisher=%%q"
set "AppxPackages[%%w].PublisherId=%%r"
set "AppxPackages[%%w].ResourceId=%%s"
set "AppxPackages[%%w].SignatureKind=%%t"
set "AppxPackages[%%w].Status=%%u"
set "AppxPackages[%%w].Version=%%v"
set "AppxPackages.ubound=%%w"
)
set /a "AppxPackages.count=%AppxPackages.ubound%+1"
GoTo :EOF

::Usage Call :DisplayNameKey NamedKey
:DisplayNamedKey
echo.
Call :GetNamedKey %~1 _DisplayNameKeyOutput
echo Named key : %~1
call echo Current value : %%%~1.Value%% Current named value : %_DisplayNameKeyOutput%
for /f "tokens=1-26 delims=[]=" %%a in ('set %~1.NamedValues[ 2^>nul') do (
REM in other words, find the last two defined token variables
if "[%%z]"=="[]" if not "[%%y]"=="[]" if not "[%%x]"=="[]" echo Named value %%x means %%y 
if "[%%y]"=="[]" if not "[%%x]"=="[]" if not "[%%w]"=="[]" echo Named value %%w means %%x
if "[%%x]"=="[]" if not "[%%w]"=="[]" if not "[%%v]"=="[]" echo Named value %%v means %%w
if "[%%w]"=="[]" if not "[%%v]"=="[]" if not "[%%u]"=="[]" echo Named value %%u means %%v
if "[%%v]"=="[]" if not "[%%u]"=="[]" if not "[%%t]"=="[]" echo Named value %%t means %%u
if "[%%u]"=="[]" if not "[%%t]"=="[]" if not "[%%s]"=="[]" echo Named value %%s means %%t
if "[%%t]"=="[]" if not "[%%s]"=="[]" if not "[%%r]"=="[]" echo Named value %%r means %%s
if "[%%s]"=="[]" if not "[%%r]"=="[]" if not "[%%q]"=="[]" echo Named value %%q means %%r
if "[%%r]"=="[]" if not "[%%q]"=="[]" if not "[%%p]"=="[]" echo Named value %%p means %%q
if "[%%q]"=="[]" if not "[%%p]"=="[]" if not "[%%o]"=="[]" echo Named value %%o means %%p
if "[%%p]"=="[]" if not "[%%o]"=="[]" if not "[%%n]"=="[]" echo Named value %%n means %%o
if "[%%o]"=="[]" if not "[%%n]"=="[]" if not "[%%m]"=="[]" echo Named value %%m means %%n
if "[%%n]"=="[]" if not "[%%m]"=="[]" if not "[%%l]"=="[]" echo Named value %%l means %%m
if "[%%m]"=="[]" if not "[%%l]"=="[]" if not "[%%k]"=="[]" echo Named value %%k means %%l
if "[%%l]"=="[]" if not "[%%k]"=="[]" if not "[%%j]"=="[]" echo Named value %%j means %%k
if "[%%k]"=="[]" if not "[%%j]"=="[]" if not "[%%i]"=="[]" echo Named value %%i means %%j
if "[%%j]"=="[]" if not "[%%i]"=="[]" if not "[%%h]"=="[]" echo Named value %%h means %%i
if "[%%i]"=="[]" if not "[%%h]"=="[]" if not "[%%g]"=="[]" echo Named value %%g means %%h
if "[%%h]"=="[]" if not "[%%g]"=="[]" if not "[%%f]"=="[]" echo Named value %%f means %%g
if "[%%g]"=="[]" if not "[%%f]"=="[]" if not "[%%e]"=="[]" echo Named value %%e means %%f
if "[%%f]"=="[]" if not "[%%e]"=="[]" if not "[%%d]"=="[]" echo Named value %%d means %%e
if "[%%e]"=="[]" if not "[%%d]"=="[]" if not "[%%c]"=="[]" echo Named value %%c means %%d
if "[%%d]"=="[]" if not "[%%c]"=="[]" if not "[%%b]"=="[]" echo Named value %%b means %%c
if "[%%c]"=="[]" if not "[%%b]"=="[]" if not "[%%a]"=="[]" echo Named value %%a means %%b
REM :DisplayNamedKey-for-next-iteration
)
call echo Registery path : %%%~1.key%%
set "_DisplayNameKeyOutput="
GoTo :EOF

::Usage Call :GetNamedKey NamedKey optional NamedValue
:GetNamedKey
call set "_bufferKey=%%%~1.Key%%"
if "[%_bufferKey%]"=="[]" call :GetNamedKeyLookup %~1 
call set "_bufferKeyType=%%%~1.Type%%"
REM Obtain registry value with GetRegistryValue
REM call echo Call :GetRegistryValue "%%%~1.Key%%" %~1.Value
Call :GetRegistryValue "%%%~1.Key%%" %~1.Value
if "[%_bufferKeyType%]"=="[DWORD]" Call :HexPrefixStripper "%%%~1.Value%%" "%~1.Value"
REM Put all values and named values in array _bufferNamedValues[x]
Call set "_bufferCurrentValue=%%%~1.Value%%"
Call set "_bufferNamedValues=%%%~1.NamedValues%%"
if "[%_bufferNamedValues%]"=="[]" GoTo :GetNamedKey-internal-loop-skip
REM call echo Call :Deconcatenate \ "%%%~1.NamedValues%%" _bufferNamedValues
Call :Deconcatenate \ "%%%~1.NamedValues%%" _bufferNamedValues
REM Loop through array _bufferNamedValues[x], save lookup in %~1.NamedValues[x]
set /a _index=0 & set _bufferline=
:GetNamedKey-internal-loop
call set _bufferline=%%_bufferNamedValues[%_index%]%%
for /f "tokens=1,2 delims==" %%a in ("%_bufferline%") do ( 
  set "%~1.NamedValues[%%a]=%%b"
  if "[%_bufferCurrentValue%]"=="[%%a]" set "%~1.CurrentNamedValue=%%b"
)
set /a _index+=1
if %_index% LEQ %_bufferNamedValues.ubound% GoTo :GetNamedKey-internal-loop
:GetNamedKey-internal-loop-skip
REM return optional value and cleanup temporary variables
if not "[%~2]"=="[]" call set "%~2=%%%~1.CurrentNamedValue%%"
set "_bufferCurrentValue=" & set "_bufferKeyType=" & set "_bufferline=" & set "_bufferNamedValues="
Call :ClearVariablesByPrefix _bufferNamedValues
GoTo :EOF




REM HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden
REM HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds\ShellFeedsTaskbarViewMode 2





::Usage Call :GetNamedKeyLookup NamedKey
:GetNamedKeyLookup
if "[%~1]"=="[User'sFilesIcon[NewStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'New Start Menu' for current user only" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[User'sFilesIcon[NewStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'New Start Menu' for all users" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[User'sFilesIcon[ClassicStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'Classic Start Menu' for current user only" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[User'sFilesIcon[ClassicStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'Classic Start Menu' for all users" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[ThisPCicon[NewStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'New Start Menu' for current user only" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[ThisPCicon[NewStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'New Start Menu' for all users" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[ThisPCicon[ClassicStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'Classic Start Menu' for current user only" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[ThisPCicon[ClassicStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'Classic Start Menu' for all users" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[LockScreen]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or Disable the Lock Screen for all users" & set "%~1.NamedValues=0=Enable Lock Screen\1=Disable Lock Screen" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen"
if "[%~1]"=="[NoLockScreenCamera]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or Disable the Lock Screen Camera" & set "%~1.NamedValues=0=Disable Lock Screen Camera\1=Enable Lock Screen Camera" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoLockScreenCamera"
if "[%~1]"=="[BackgroundColor]" set "%~1.Type=STRING" & set "%~1.Description=Set Start Background Color for all users" & set "%~1.NamedValues=Black=000000\White=FFFFFF\Red=FF0000\Green=00FF00\Blue=0000FF" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\PersonalColors_Background"
if "[%~1]"=="[AccentColor]" set "%~1.Type=STRING" & set "%~1.Description=Set Accent Color for all users" & set "%~1.NamedValues=Black=000000\White=FFFFFF\Red=FF0000\Green=00FF00\Blue=0000FF" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\PersonalColors_Accent"
if "[%~1]"=="[LockScreenImage]" set "%~1.Type=STRING" & set "%~1.Description=Set Lock Screen Image for all users" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\LockScreenImage"
if "[%~1]"=="[LockScreenOverlaysDisabled]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or Disable Fun Facts, Tips, Tricks, and More on Lock Screen for all users" & set "%~1.NamedValues=0=Enable Overlays\1=Disable Overlays" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\LockScreenOverlaysDisabled"
if "[%~1]"=="[ForceStartBackground]" set "%~1.Type=DWORD" & set "%~1.Description=Force a specific Start Background (1-20) for all users, users cannot change it" & set "%~1.NamedValues=0=Default Background\1=Background 1\2=Background 2\3=Background 3\4=Background 4\5=Background 5\6=Background 6\7=Background 7\8=Background 8\9=Background 9\10=Background 10\11=Background 11\12=Background 12\13=Background 13\14=Background 14\15=Background 15\16=Background 16\17=Background 17\18=Background 18\19=Background 19\20=Background 20" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\ForceStartBackground"
if "[%~1]"=="[NoChangingLockScreen]" set "%~1.Type=DWORD" & set "%~1.Description=Prevent changing lock screen and logon image for all users" & set "%~1.NamedValues=0=Allow Change\1=Prevent Change" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoChangingLockScreen"
if "[%~1]"=="[NoChangingStartMenuBackground]" set "%~1.Type=DWORD" & set "%~1.Description=Prevent changing start menu background for all users" & set "%~1.NamedValues=0=Allow Change\1=Prevent Change" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoChangingStartMenuBackground"
if "[%~1]"=="[NoLockScreenSlideshow]" set "%~1.Type=DWORD" & set "%~1.Description=Prevent enabling lock screen slide show for all users" & set "%~1.NamedValues=0=Allow Slide Show\1=Prevent Slide Show" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoLockScreenSlideshow"
if "[%~1]"=="[TurnOffAutomaticTextLearning]" set "%~1.Type=DWORD" & set "%~1.Description=Turn off automatic learning for handwriting recognition personalization" &  set "%~1.NamedValues=0=Allow Automatic Learning\1=Prevent Automatic Learning" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization\RestrictImplicitTextCollection" 
if "[%~1]"=="[TurnOffAutomaticInkLearning]" set "%~1.Type=DWORD" & set "%~1.Description=Turn off automatic learning for handwriting recognition personalization" &  set "%~1.NamedValues=0=Allow Automatic Learning\1=Prevent Automatic Learning" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization\RestrictImplicitInkCollection"
if "[%~1]"=="[AllowOnlineSpeechRecognition]" set "%~1.Type=DWORD" &  set "%~1.Description=Allow users to enable online speech recognition services" &  set "%~1.NamedValues=0=Disable Speech Services\1=Enable Speech Services" &  set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\InputPersonalization\AllowInputPersonalization"
if "[%~1]"=="[BlockCleanupOfUnusedLangPacks]" set "%~1.Type=DWORD" &  set "%~1.Description=Block clean-up of unused language packs" &  set "%~1.NamedValues=0=Allow Cleanup\1=Block Cleanup" &  set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Control Panel\International\BlockCleanupOfUnusedPreinstalledLangPacks"
if "[%~1]"=="[ForceSelectedUILanguage]" set "%~1.Type=DWORD" & set "%~1.Description=Force selected system UI language to overwrite the user UI language" & set "%~1.NamedValues=0=No Restriction\1=Force Selected Language" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MUI\Settings\MachineUILock"
if "[%~1]"=="[RestrictLanguagePackAndFeatureInstall]" set "%~1.Type=DWORD" & set "%~1.Description=Restrict Language Pack and Language Feature Installation" & set "%~1.NamedValues=0=No Restriction\1=Restrict Installation" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Control Panel\International\RestrictLanguagePacksAndFeaturesInstall"
if "[%~1]"=="[RestrictUILanguageForAllUsers]" set "%~1.Type=STRING" &  set "%~1.Description=Restricts the Windows UI language for all users." &  set "%~1.NamedValues=en-US=English\ja-JP=Japanese\ko-KR=Korean\de-DE=German\zh-CN=Simplified Chinese\zh-TW=Traditional Chinese (Taiwan)\fr-FR=French\es-ES=Spanish\it-IT=Italian\sv-SE=Swedish\nl-NL=Dutch\pt-BR=Portuguese (Brazil)\fi-FI=Finnish\nb-NO=Norwegian\da-DK=Danish\hu-HU=Hungarian\pl-PL=Polish\ru-RU=Russian\cs-CZ=Czech\el-GR=Greek\pt-PT=Portuguese (Portugal)\tr-TR=Turkish\ar-SA=Arabic\he-IL=Hebrew\sk-SK=Slovak\sl-SI=Slovenian\ro-RO=Romanian\hr-HR=Croatian\bg-BG=Bulgarian\et-EE=Estonian\lt-LT=Lithuanian\lv-LV=Latvian\th-TH=Thai\zh-HK=Traditional Chinese (Hong Kong)\sr-Latn-CS=Serbian (Latin)\uk-UA=Ukrainian" &  set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MUI\Settings\PreferredUILanguages"
if "[%~1]"=="[AllowInsecureGuestAuth]" set "%~1.Type=DWORD" &  set "%~1.Description=Allows insecure guest logons from the network" &  set "%~1.NamedValues=0=Disable Insecure Guest Logons\1=Enable Insecure Guest Logons" &  set "%~1.Key=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\AllowInsecureGuestAuth"
if "[%~1]"=="[HideFileExt]" set "%~1.Type=DWORD" &  set "%~1.Description=Hide file extensions for known file types" & set "%~1.NamedValues=0=Show extensions\1=Hide extensions" &  set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt"
if "[%~1]"=="[AllowOnlineTips]" set "%~1.Type=DWORD" & set "%~1.Description=Allow online tips" & set "%~1.NamedValues=0=Disallow online tips\1=Allow online tips" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\AllowOnlineTips"
if "[%~1]"=="[SettingsPageVisibility]" set "%~1.Type=STRING" & set "%~1.Description=Specify settings pages visibility" & set "%~1.NamedValues=hide:about;bluetooth=Hide about and bluetooth page settings page\showonly:about;bluetooth=Show only about and bluetooth settings page" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\SettingsPageVisibility"
if "[%~1]"=="[UserSettingsPageVisibility]" set "%~1.Type=STRING" & set "%~1.Description=Specify settings pages visibility for current user" & set "%~1.NamedValues=hide:about;bluetooth=Hide about and bluetooth page settings page\showonly:about;bluetooth=Show only about and bluetooth settings page" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\SettingsPageVisibility"
if "[%~1]"=="[UseDefaultTile]" set "%~1.Type=DWORD" & set "%~1.Description=Use the default Start Menu tile layout" & set "%~1.NamedValues=0=Use custom layout\1=Use default layout" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\UseDefaultTile"
if "[%~1]"=="[AllowPrelaunch]" set "%~1.Type=DWORD" & set "%~1.Description=Allow Microsoft Edge to start and load the Start and New Tab page at Windows startup and each time Microsoft Edge is closed" & set "%~1.NamedValues=0=Disallow prelaunch\1=Allow prelaunch" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main\AllowPrelaunch"
if "[%~1]"=="[IntelShowTrayIcon]" set "%~1.Type=DWORD" & set "%~1.Description=Show Intel Graphics Tray Icon" & set "%~1.NamedValues=0=Hide Icon\1=Show Icon" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Intel\Display\igfxcui\igfxtray\TrayIcon\ShowTrayIcon"
if "[%~1]"=="[IntelHotKeysEnable]" set "%~1.Type=DWORD" & set "%~1.Description=Enable HotKeys for Intel Graphics" & set "%~1.NamedValues=0=Disable HotKeys\1=Enable HotKeys" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Intel\Display\igfxcui\HotKeys\Enable"
if "[%~1]"=="[DevicePasswordLessBuildVersion]" set "%~1.Type=DWORD" & set "%~1.Description=Controls the version of the password-less framework" & set "%~1.NamedValues=0=Password Less Build Version" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device\DevicePasswordLessBuildVersion"
if "[%~1]"=="[DefaultUserName]" set "%~1.Type=STRING" & set "%~1.Description=Default username for automatic logon" & set "%~1.NamedValues=user=user username" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultUserName"
if "[%~1]"=="[DefaultPassword]" set "%~1.Type=STRING" & set "%~1.Description=Default password for automatic logon" & set "%~1.NamedValues=password=password password" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultPassword"
if "[%~1]"=="[AutoAdminLogon]" set "%~1.Type=DWORD" & set "%~1.Description=Enables or disables automatic logon" & set "%~1.NamedValues=0=Disabled\1=Enabled" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon"
if "[%~1]"=="[AppsUseLightTheme]" set "%~1.Type=DWORD" & set "%~1.Description=Enables or disables light theme for apps" & set "%~1.NamedValues=0=Dark\1=Light" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme"
if "[%~1]"=="[SystemUsesLightTheme]" set "%~1.Type=DWORD" & set "%~1.Description=Enables or disables light theme for system" & set "%~1.NamedValues=0=Dark\1=Light" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\SystemUsesLightTheme"
if "[%~1]"=="[ShowCortanaButton]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide Cortana button on taskbar" & set "%~1.NamedValues=0=Hide\1=Show" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowCortanaButton"
if "[%~1]"=="[SearchboxTaskbarMode]" set "%~1.Type=DWORD" & set "%~1.Description=Controls the display mode of the search box on the taskbar" & set "%~1.NamedValues=0=Hidden\1=Collapsed\2=Visible" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\SearchboxTaskbarMode"
if "[%~1]"=="[ShowTaskViewButton]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide Task View button on taskbar" & set "%~1.NamedValues=0=Hide\1=Show" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowTaskViewButton"
if "[%~1]"=="[WallPaper]" set "%~1.Type=STRING" & set "%~1.Description=Path of the wallpaper image" & set "%~1.NamedValues=Path to the image file" & set "%~1.Key=HKEY_CURRENT_USER\Control Panel\Desktop\WallPaper"
if "[%~1]"=="[Background]" set "%~1.Type=STRING" & set "%~1.Description=Background color in RGB format" & set "%~1.NamedValues=RGB color value" & set "%~1.Key=HKEY_CURRENT_USER\Control Panel\Colors\Background"
if "[%~1]"=="[RealtekShowTrayIcon]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide Realtek Audio Manager Tray Icon" & set "%~1.NamedValues=0=Hide\1=Show" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Realtek\RAVCpl64\General\ShowTrayIcon"
if "[%~1]"=="[EnableAutoTray]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or disable automatic hiding of system tray icons" & set "%~1.NamedValues=0=Disable\1=Enable" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\EnableAutoTray"
if "[%~1]"=="[AllowTelemetry]" set "%~1.Type=DWORD" & set "%~1.Description=Allow or prevent sending of telemetry data" & set "%~1.NamedValues=0=Prevent\1=Allow basic\2=Allow enhanced\3=Allow full" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowTelemetry"
if "[%~1]"=="[NoAutoUpdate]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or disable automatic updates" & set "%~1.NamedValues=0=Enable\1=Disable" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate"
if "[%~1]"=="[HideSCAMeetNow[CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide 'Meet Now' icon in the taskbar" & set "%~1.NamedValues=0=Show\1=Hide" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\HideSCAMeetNow"
if "[%~1]"=="[HideSCAMeetNow[AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide 'Meet Now' icon in the taskbar" & set "%~1.NamedValues=0=Show\1=Hide" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\HideSCAMeetNow"
GoTo :EOF

:AddRegistryString
set "_REGTYPE=REG_SZ" & GoTo :AddRegistryValue
:AddRegistryDWORD
set "_REGTYPE=REG_DWORD" & GoTo :AddRegistryValue
:AddRegistryStringExpand
set "_REGTYPE=REG_EXPAND_SZ" & GoTo :AddRegistryValue
:AddRegistryStringMulti
set "_REGTYPE=REG_MULTI_SZ" & GoTo :AddRegistryValue
:AddRegistryQWORD
set "_REGTYPE=REG_QWORD" & GoTo :AddRegistryValue
:AddRegistryBinary
set "_REGTYPE=REG_BINARY" & GoTo :AddRegistryValue
:AddRegistryValue
set _AddRegistryKeyPath=%1
if "[%_REGTYPE%]"=="[]" Call :AddRegistryDetermineREGTYPE %~1 %~2 _REGTYPE
Call :GetLastElement \ %_AddRegistryKeyPath% _AddRegistryKeyName
Call :TrimQuotes %_AddRegistryKeyName% _AddRegistryKeyName
Call set _AddRegistryKeyPath=%%_AddRegistryKeyPath:%_AddRegistryKeyName%=%%
Call :TrimTrailingBackslash %_AddRegistryKeyPath% _AddRegistryKeyPath
REG ADD "%_AddRegistryKeyPath%" /v "%_AddRegistryKeyName%" /t REG_DWORD /d "%~2" /f 2>&1>nul
set "_AddRegistryKeyPath=" & set "_AddRegistryKeyName=" & set "_REGTYPE="
GoTo :EOF
:AddRegistryDetermineREGTYPE
REM It's always a string for now, TODO
set %3=REG_SZ
GoTo :EOF
REM https://learn.microsoft.com/en-us/windows/win32/sysinfo/registry-value-types

::Usage Call :GetRegistryValue RegistryKey Output
:GetRegistryValue
set "_GetRegistryValue="
Set "_GetRegistryKey=%~1"
Call :GetLastElement \ %_GetRegistryKey% _GetRegistryKeyName
Call :TrimQuotes %_GetRegistryKeyName% _GetRegistryKeyName
Call :Replace "%_GetRegistryKey%" "\%_GetRegistryKeyName%" _GetRegistryPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "%_GetRegistryPath%" 2^>nul') do if "[%%a]"=="[%_GetRegistryKeyName%]" set _GetRegistryValue=%%c
set "%~2=%_GetRegistryValue%"
if "[%_GetRegistryValue%]"=="[]" set "%~2=NOT SET"
set "_GetRegistryValue="
GoTo :EOF

REM Macro definitions
:SetMacroPrintTime
set PrintTime=& Call :PrintTime
GoTo :EOF

REM Function library


REM example function structure, with usage and signature
:FunctionNameHELP
echo Name and usage
echo dependencies
echo Date and URL
echo by YourName
echo examples 
echo examples 
echo examples 
echo credit 
:GoTo :EOF
:FunctionName
::End Functionname SHA256:1234567890 SignDate:

REM -- console functions --

::Usage Call SetTitle MyTitle
:SetTitle 
title %*
GoTo:EOF

:: Perform self-elevation, passing all arguments through.
:ElevateAndWait
set _ElevateAndWait=-Wait
:Elevate
  if defined args set args=%args:^=^^%
  if defined args set args=%args:<=^<%
  if defined args set args=%args:>=^>%
  if defined args set args=%args:&=^&%
  if defined args set args=%args:|=^|%
  if defined args set "args=%args:"=\"\"%"
  :: Note:  
  ::  * To keep the elevated session open until explicitly exited by the user,
  ::    use /k instead of /c
  powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    " Start-Process %_ElevateAndWait% -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD% \"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
goto :EOF
REM https://stackoverflow.com/questions/76040676/batch-file-auto-elevation-using-powershell-and-not-mangling-the-arguments-but-pr/76055486?noredirect=1#comment134178642_76055486

:: Test if this session is elevated.
:: `net session` only succeeds and therefore reports exit code 0 
:: in an elevated session.
:IsAdmin
if not "[%1]"=="[]" set %1=false
  net session >NUL 2>&1
  if %ERRORLEVEL% == 0 if not "[%1]"=="[]" set %1=true
  net session >NUL 2>&1
goto :EOF

:: Usage Call :ClearLocalVariables
:ClearLocalVariables
for /f "tokens=1,2 delims==" %%a in ('set _ 2^>nul') do set %%a=
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
if "[%~1]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF

:GoToFolderOfBatchFile
pushd %1
GoTo :EOF

:ReturnToInitialFolder
popd
GoTo :EOF

::Usage Call :ShowCodepage 
:ShowCodepage
chcp
GoTo :EOF

::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF

::Usage Call :SetCodePage NewCodePage
:SetCodePage
chcp %~1
GoTo :EOF

REM -- time functions --

::Usage Call :PrintTime
:PrintTime
echo %date% %time%
GoTo :EOF

::Usage Call :GetTime
:GetTime
set _GetDate=%date% & set _GetTime=%time%
set _GetTime=%_GetTime: 0=00%
set _GetTime=%_GetTime:~0,2%h%_GetTime:~3,2%m%_GetTime:~6,2%s%_GetTime:~9,2%
set "%~1=%_GetDate% %_GetTime%" & set "%~2=%_GetDate%" & set "%~3=%_GetTime%"
set "_GetDate=" & set "_GetTime="
GoTo :EOF

:: Usage Call :Sleep 5 ' Sleep time in seconds
:Sleep
timeout /t %~1
GoTo :EOF

REM -- string manipulation --

REM ::Usage Call :Replace Input Search Output
REM :Replace
REM set ReplaceInput=%~1
REM set ReplaceSearch=%~2
REM call set %3=%%ReplaceInput:%ReplaceSearch%=%%
REM GoTo :EOF

::Usage Call :TrimQuotes %variable% variable
:TrimQuotes
set TrimQuotes=%~1
set %2=%TrimQuotes%
GoTo :EOF

::Usage Call :TrimTrailingBackslash %Input% Output 
:TrimTrailingBackslash
set TrimTrailingBackslashInput=%1
if "%TrimTrailingBackslashInput:~-1%"=="\" ( 
  set %2=%TrimTrailingBackslashInput:~0,-1%
  ) else (
  set %2=%TrimTrailingBackslashInput%
  )
GoTo :EOF


REM Untested
::Usage Call :deasterisk Input Output
:deasterisk
FOR /f "tokens=1* delims=*" %%i IN ("%~1") DO (
   SET _deasterisk=%%j
   IF DEFINED _deasterisk (
      SET _deasterisk=%%i%%j
      GOTO :deasterisk
   ) ELSE (
      SET _deasterisk=%%i
   )
)
set %2=%_deasterisk%
GoTo :EOF
REM https://stackoverflow.com/questions/15441422/replace-character-of-string-in-batch-script

::Usage Call :EchoValue myValue
:EchoValue
call echo %1=%%%1%%
GoTo :EOF
REM echo 1 %1 
REM echo 2 %1% 
REM echo 3 %%1 
REM echo 4 %%1%
REM echo 5 %%%1
REM echo 6 %%%1%
REM echo 7 %%%%1
REM echo 8 %%%%1%
REM echo 9 %%%%%1
REM echo 0 %%%%%1%
REM echo 1 %%%%%%1
REM echo 2 %%%%%%1%
REM echo 3 %1%%
REM echo 4 %%1%%
REM echo 5 %%%1%%
REM echo 6 %%%%1%%
REM echo 7 %%%%%1%%
REM echo 8 %%%%%%1%%
REM echo 9 %1%%%
REM echo 0 %%1%%%
REM echo 1 %%%1%%%
REM echo 2 %%%%1%%%
REM echo 3 %%%%%1%%%
REM echo 4 %%%%%%1%%%
REM echo 5 %%1% 
REM echo 6 %1% 
REM echo 7 %%%1%% 
REM echo 8 %%%1%%% 
REM echo 9 %%%%1%%%
REM echo call
REM call echo 1 %1 
REM call echo 2 %1% 
REM call echo 3 %%1 
REM call echo 4 %%1%
REM call echo 5 %%%1
REM call echo 6 %%%1%
REM call echo 7 %%%%1
REM call echo 8 %%%%1%
REM call echo 9 %%%%%1
REM call echo 0 %%%%%1%
REM call echo 1 %%%%%%1
REM call echo 2 %%%%%%1%
REM call echo 3 %1%%
REM call echo 4 %%1%%
REM call echo x5 %%%1%%
REM call echo 6 %%%%1%%
REM call echo 7 %%%%%1%%
REM call echo 8 %%%%%%1%%
REM call echo 9 %1%%%
REM call echo 0 %%1%%%
REM call echo x1 %%%1%%%
REM call echo 2 %%%%1%%%
REM call echo 3 %%%%%1%%%
REM call echo 4 %%%%%%1%%%
REM call echo 5 %%1% 
REM call echo 6 %1% 
REM call echo x7 %%%1%% 
REM call echo x8 %%%1%%% 
REM call echo 9 %%%%1%%%
GoTo :EOF

REM -- Array manipulation



REM option to not return input string in case of nomatch (useful?)
::Usage Call :Split InputString OutputArray optional Delimiter=(default is a space)
:Split

Call :ClearVariablesByPrefix _Split
set "_Split_Input=%~1"
call set "_Split_OutputArray.oldubound=%%%~2.ubound%%"
Call :GetArrayParameters %~2 _Split_OutputArray "" Initialize

if "[%~3]"=="[]" set "_Split_Delimiter= "
call :len _Split_Input _Split_Input.len
call :len _Split_Delimiter _Split_Delimiter.len
Call :SetArrayParameters _Split_Input "" 0 %_Split_Input.len% 0 
set /a _Split_Input.start=0
set /a _Split_Input.end=0
set _Split
Call :DecomposeText "%_Split_Input%"
:Split-main-loop
REM echo index %_Split_Input.index%
REM echo call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
REM call echo echo call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
call set "_Split_Input.CompareWindow=%%_Split_Input:~%_Split_Input.index%,%_Split_Delimiter.len%%%"
REM echo window %_Split_Input.CompareWindow% FFGG if "[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]" (
if "[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]" (
	echo match found I"[%_Split_Input.CompareWindow%]"=="[%_Split_Delimiter%]"I %_Split_Input.start% %_Split_Input.end%
	set /a _Split_OutputArray.ubound+=1 
	call set "%_Split_OutputArray%[%_Split_OutputArray.ubound%]=%%_Split_Input:~%_Split_Input.start%,%_Split_Input.end%%%"
	REM echo set /a _Split_Input.index+=%_Split_Delimiter.len%
	set /a _Split_Input.index+=%_Split_Delimiter.len%
	REM call echo call set /a _Split_Input.start=%%_Split_Input.index%%
	call set /a _Split_Input.start=%%_Split_Input.index%%
)

echo set /a _Split_Input.end=%_Split_Input.index%
set /a _Split_Input.end=%_Split_Input.index%
set /a _Split_Input.index+=1
if %_Split_Input.index% leq %_Split_Input.ubound% GoTo :Split-main-loop

REM if %_Split_OutputArray.ubound% equ -1 set "_Split_nomatch=true" & set /a "_Split_OutputArray.ubound=0" & set "%_Split_OutputArray%[0]=_Split_Input" echo NO MATCH FOUND, set output.ubound=0 COPY Input to [0]
Call :SetArrayParameters "%_Split_OutputArray%" _Split_OutputArray


REM this should exit 0 only if there's at least one match
GoTo :EOF


::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:deconcatenate
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:deconcatenate_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:deconcatenate_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :deconcatenate_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo writing set %~3[%_token%] = %_buffer% 
if "[%_IsDelimiter%]"=="[true]" call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :deconcatenate_input_loop
if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
GoTo :EOF

::Usage Call :DeconcatenateFast Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:DeconcatenateFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set /a index=0
set /a %3.lbound=%index%
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%~3[%%index%%]=%%w"
	set /a "index+=1"
)
set /a "index-=1"
set %3.ubound=%index%
GoTo :EOF

:: Requires :len (maybe support %ReturnEmpty% for special cases ?)
::Usage Call :GetLastElement Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=%_input.len%-1 & set "_char=" & set "_buffer="
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetLastElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor-=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetLastElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_char%%_buffer%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetLastElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" echo is a delimiter and buffer not empty %_buffer% 
if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" set "%~3=%_buffer%" & GoTo :EOF
if %_cursor% LSS %_input.len% goto :GetLastElement_input_loop
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%3=%%~w"
)
GoTo :EOF

::Usage Call :GetNthElement Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
::set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetNthElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetNthElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetNthElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo if %_token% EQU %4 
if "[%_IsDelimiter%]"=="[true]" if %_token% EQU %4 set "%~3=%_buffer%" & GoTo :EOF 
if "[%_IsDelimiter%]"=="[true]" set "_buffer=" && set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :GetNthElement_input_loop
::if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
if %_token% EQU %4 set "%~3=%_buffer%"
GoTo :EOF

::Usage Call :GetNthElementFast Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set "_buffer="
set /a index=0
call set _input="%%_input:%_delimiter%=" "%%"
setlocal enableDelayedExpansion
for %%w in (%_input%) do (
	REM echo %%w
	call set "_buffer=%%~w"
	if !index! EQU %4 GoTo :GetNthElementFast_ExitFor
	set /a "index+=1"
)
REM clearing buffer, index did not reach count
 set "_buffer="
:GetNthElementFast_ExitFor
endlocal & set "%3=%_buffer%"
GoTo :EOF

REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
:: Set _EchoArrayElementFromListPrefix to insert text 
:: Usage Call :EchoArrayElementFromList ElementList ArrayForOutput optional Suffix1 Suffix2 ... SuffixN'both array must have .ubound set
:EchoArrayElementFromList
set "_EchoArrayElementFromList_ElementList=%~1"
set "_EchoArrayElementFromList_ArrayForOutput=%~2"
set /a _EchoArrayElementFromList_SuffixList.index=-1
if "[%~3]"=="[]" GoTo :EchoArrayElementFromList-fill-suffix-list-skip
:EchoArrayElementFromList-fill-suffix-list
set /a _EchoArrayElementFromList_SuffixList.index+=1
if not "[%~3]"=="[]" set "_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]=%~3"
shift
if not "[%~3]"=="[]" GoTo :EchoArrayElementFromList-fill-suffix-list
set /a _EchoArrayElementFromList_SuffixList.ubound=%_EchoArrayElementFromList_SuffixList.index%
:EchoArrayElementFromList-fill-suffix-list-skip
call set /a _EchoArrayElementFromList.ElementList.ubound=%%%_EchoArrayElementFromList_ElementList%.ubound%%
set /a _EchoArrayElementFromList.index=0
:EchoArrayElementFromList-ElementList-loop
set /a _EchoArrayElementFromList_SuffixList.index=0
:EchoArrayElementFromList-SuffixList-loop
REM call call echo %%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%
REM echo %_EchoArrayElementFromListPrefix%%%%%%_EchoArrayElementFromList_ArrayForOutput%[%%%_EchoArrayElementFromList_ElementList%[%_EchoArrayElementFromList.index%]%%]%%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%%%%%
call call echo %_EchoArrayElementFromListPrefix%%%%%%_EchoArrayElementFromList_ArrayForOutput%[%%%_EchoArrayElementFromList_ElementList%[%_EchoArrayElementFromList.index%]%%]%%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%%%%%
set /a _EchoArrayElementFromList_SuffixList.index+=1
if "[%_EchoArrayElementFromList_SuffixList.ubound%]"=="[]" GoTo :EchoArrayElementFromList-SuffixList-loop-skip
if %_EchoArrayElementFromList_SuffixList.index% LEQ %_EchoArrayElementFromList_SuffixList.ubound% GoTo :EchoArrayElementFromList-SuffixList-loop
:EchoArrayElementFromList-SuffixList-loop-skip
set /a _EchoArrayElementFromList.index+=1
if %_EchoArrayElementFromList.index% LEQ %_EchoArrayElementFromList.ElementList.ubound% GoTo :EchoArrayElementFromList-ElementList-loop
Call :ClearVariablesByPrefix _EchoArrayElementFromList
GoTo :EOF


::Usage Call :SetIfNamedVariable "%val1%" var1 "%val2%" var2 "%val3%" var3 "%val4%" var4 continue "%val5%" var5 "%val6%" var6 "%val7%" var7 "%val8%" var8 continue "%valN%" varN
:SetIfNamedVariable
if not "[%~2]"=="[]" set "%~2=%~1" & set "_SetIfNamedVariable.onefound=true"
if not "[%~4]"=="[]" set "%~4=%~3" & set "_SetIfNamedVariable.onefound=true"
if not "[%~6]"=="[]" set "%~6=%~5" & set "_SetIfNamedVariable.onefound=true"
if not "[%~8]"=="[]" set "%~8=%~7" & set "_SetIfNamedVariable.onefound=true"
if not "[%~9]"=="[]" set "_SetIfNamedVariable.onefound=true"
if "[%_SetIfNamedVariable.onefound%]"=="[true]" shift & shift & shift & shift & shift & shift & shift & shift & shift
if "[%_SetIfNamedVariable.onefound%]"=="[true]" set "_SetIfNamedVariable.onefound=" & GoTo :SetIfNamedVariable
GoTo :EOF

::Usage Call :SetNonEmptyValueOnlyIfNotDefined "%InputValue%" OutputVariable optional "%InputValue2%" OutputVariable2 optional "%InputValueN%" OutputVariableN
:SetNonEmptyValueOnlyIfNotDefined
set "_SetNonEmptyValueOnlyIfNotDefined_Output=%~2"
if not "[%~1]"=="[]" if not defined %_SetNonEmptyValueOnlyIfNotDefined_Output% set "%_SetNonEmptyValueOnlyIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetNonEmptyValueOnlyIfNotDefined
set "_SetNonEmptyValueOnlyIfNotDefined_Output="
GoTo :EOF

::Usage Call :SetNonEmptyValue "%InputValue%" OutputVariable optional "%InputValue2%" OutputVariable2 optional "%InputValueN%" OutputVariableN
:SetNonEmptyValue
set "_SetNonEmptyValue_Output=%~2"
if not "[%~1]"=="[]" set "%_SetNonEmptyValue_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetNonEmptyValue
set "_SetNonEmptyValue_Output="
GoTo :EOF

::Usage Call :SetIfNotDefined "%ValueIfUnset%" OutputVariable optional VariableName2 "%ValueIfUnset2%" optional optional VariableNameN "%ValueIfUnsetN%"
:SetIfNotDefined
set "_SetIfNotDefined_Output=%~2"
if not defined %_SetIfNotDefined_Output% set "%_SetIfNotDefined_Output%=%~1"
if not "[%~4]"=="[]" shift & shift & GoTo :SetIfNotDefined
set "_SetIfNotDefined_Output="
GoTo :EOF

::Usage Call :EchoArray InputArray optional Start optional End optional Suffix
:EchoArray
set "_EchoArray_input=%~1"
Call :IsArrayDefinedBySet "%_EchoArray_input%" || GoTo :EchoArray-end
call :SetNonEmptyValue "%~2" _EchoArray_start "%~3" _EchoArray_end "%~4" _EchoArray_suffix
Call :GetArrayParameters %_EchoArray_input% _EchoArray_input 
REM if "[%_EchoArray_start%]"=="[]" set /a "_EchoArray_start=%_EchoArray_input.lbound%"
REM if "[%_EchoArray_end%]"=="[]" set /a "_EchoArray_end=%_EchoArray_input.ubound%"
Call :SetIfNotDefined "%_EchoArray_input.lbound%" _EchoArray_start
Call :SetIfNotDefined "%_EchoArray_input.ubound%" _EchoArray_end
set /a _EchoArray_input.index+=%_EchoArray_start%
REM set _EchoArray
:EchoArray-loop
call echo %%%_EchoArray_input%[%_EchoArray_input.index%]%_EchoArray_suffix%%%
set /a _EchoArray_input.index+=1
if %_EchoArray_input.index% leq %_EchoArray_end% GoTo :EchoArray-loop
:EchoArray-end
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF

REM old function, retired
REM REM Prefix/suffix variable should be unique and start with _
REM REM TODO clean up variables, maybe use set instead ?
REM :: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
REM :: Example set EchoArrayPrefix=InputArray[%%index%%]=
REM :: EchoArray InputArray optional start optional end
REM :EchoArray
REM set /a index=0 
REM set /a limit=2147483647
REM if not ["%~2"]==[""] set /a index=%~2
REM if not ["%~3"]==[""] set /a limit=%~3
REM call set "lbound=%%%~1.lbound%%" 
REM call set "ubound=%%%~1.ubound%%"
REM call set "count=%%%~1.count%%"
REM call set "next=%%%~1.next%%"
REM call set "previous=%%%~1.previous%%"
REM if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
REM if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
REM if not ["%count%"]==[""] call echo %~1.count %%%~1.count%%
REM if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
REM if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
REM :EchoArray-internal-loop
REM if not defined %1[%index%] GoTo :EOF
REM call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
REM set /a index+=1
REM if %index% GTR %limit% goto :EOF
REM GoTo :EchoArray-internal-loop


REM Obsoleted
REM ::Usage Call :Ubound InputArray UboundOutput ' make this better, search "set" for the real ubound
REM :ubound
REM set %2=%~1.ubound
REM GoTo :EOF

REM Obsoleted
REM ::Usage Call :Lbound InputArray LboundOutput' make this better, search "set" for the real ubound
REM :lbound
REM set %2=%~1.lbound
REM GoTo :EOF

:: ClearArray InputArray optional start optional end
:ClearArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
if not ["%~1.lbound"]==[""] set %~1.lbound=
if not ["%~1.ubound"]==[""] set %~1.ubound=
if not ["%~1.count"]==[""] set %~1.count=
if not ["%~1.next"]==[""] set %~1.next=
if not ["%~1.previous"]==[""] set %~1.previous=
:ClearArray-internal-loop
if not defined %~1[%index%] GoTo :ClearArray-end
call set %%%~1[%index%]%=
set /a index+=1
if %index% GTR %limit% goto :ClearArray-end
GoTo :ClearArray-internal-loop
:ClearArray-end
set index=
set limit=
GoTo :EOF


REM -- misc --

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
REM The minus sign in the wrong place will still return numeric
REM Call :IsNumeric "%var%" && echo it is not numeric || echo it is numeric
REM echo isnumeric with a number
REM call :isnumeric "1" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a letter
REM call :isnumeric "a" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with a double quote empty
REM call :isnumeric "" && echo is was not numeric || ( echo it was numeric & echo also you smell )
REM echo isnumeric with no input 
REM call :isnumeric && echo is was not numeric || ( echo it was numeric & echo also you smell )
::IsNumeric-END

::Usage Call :HexPrefixStripper InputHex OutputDecimal ' This just strips leading "0x" if present
:HexPrefixStripper
if "[%~1]"=="[]" GoTo :EOF
set "_HexPrefixStripper_buffer=%~1"
set "%~2=%~1"
if "[%_HexPrefixStripper_buffer:~0,2%]"=="[0x]" call set "%~2=%_HexPrefixStripper_buffer:~2%"
set "_HexPrefixStripper_buffer="
GoTo :EOF

REM incomplete
:: Call :InStB input search result
REM :InStB
REM set "InputSTR=%1"
REM set "SearchSTR=%2"
REM set %3=false
REM echo input string %InputSTR%
REM echo search string %SearchSTR%
REM echo third param %3
REM call set TestSTR=%%InputSTR:%SearchSTR:~1,-1%=%%
REM echo test string %InputSTR%
REM echo test string %TestSTR%
REM if %TestSTR%==%InputSTR% ( echo if ran payload )
REM if not %TestSTR%==%InputSTR% ( echo if ran payload )
REM if not %TestSTR%==%InputSTR% ( set %3=true )
REM GoTo :EOF
REM Add example if test || && etc..

REM same as the other, but input output instead of output input
REM :len <stringVar> <resultVar>
REM (   
    REM setlocal EnableDelayedExpansion
    REM (set^ tmp=!%~2!)
    REM if defined tmp (
        REM set "len=1"
        REM for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            REM if "!tmp:~%%P,1!" NEQ "" ( 
                REM set /a "len+=%%P"
                REM set "tmp=!tmp:~%%P!"
            REM )
        REM )
    REM ) ELSE (
        REM set len=0
    REM )
REM )
REM ( 
    REM endlocal
    REM set "%~1=%len%"
    REM exit /b
REM )
REM https://stackoverflow.com/a/5841587

:ArrayToFile byref InputArray OutputFile
Call :GetArrayParameters %~1 _ArrayToFile_input "" 0
set _ArrayToFile_input 
:ArrayToFile-loop
call echo %%%_ArrayToFile_input%[%_ArrayToFile_input.index%]%%>>%~2
set /a _ArrayToFile_input.index+=1
if %_ArrayToFile_input.index% leq %_ArrayToFile_input.ubound% GoTo :ArrayToFile-loop
GoTo :EOF

::Usage Call :EchoFile InputFile
:EchoFile
for /F "delims=" %%i in (%~1) do ( echo %%i )
GoTo :EOF

::Usage Call :EchoFileToFile InputFile OutputFile
:EchoFileToFile
del %~2
for /F "delims=" %%i in (%~1) do ( echo %%i>>%~2 )
GoTo :EOF

:: Usage Call :String2CharArray InputString OutputArray optional Step=1
:String2CharArray
set "_String2CharArray_Input=%~1"
set "_String2CharArray_Output=%~2"
set "_String2CharArray_Step=%~3"
if "[%_String2CharArray_Step%]"=="[]" set /a "_String2CharArray_Step=1"
call :len "%_String2CharArray_Input%" _String2CharArray_Input.len
Call :SetArrayParameters _String2CharArray_Output "" 0 %_String2CharArray_Input.len% 0
:String2CharArray-loop
call set %_String2CharArray_Output%[%_String2CharArray_Output%.index]=%%_String2CharArray_Input:~%_String2CharArray_Output.index%,%_String2CharArray_Step%%%
set /a "_String2CharArray_Output.index+=%_String2CharArray_Step%"
if %_String2CharArray_Output.index% leq %_String2CharArray_Output.ubound% GoTo :String2CharArray-loop
Call :ClearVariablesByPrefix _String2CharArray
GoTo :EOF

::Usage Call :CharArray2String CharArray OutputString
:CharArray2String
Call :ClearVariablesByPrefix _CharArray2String
Call :GetArrayParameters %~1 _CharArray2String_InputArray "" 0
set _CharArray2String_InputArray
setlocal enableDelayedExpansion
:CharArray2String-loop
call set "_CharArray2String_OutputString=!_CharArray2String_OutputString!%%!_CharArray2String_InputArray![!_CharArray2String_InputArray.index!]%%"
echo !_CharArray2String_OutputString!
set /a "_CharArray2String_InputArray.index+=1"
if !_CharArray2String_InputArray.index! leq %_CharArray2String_InputArray.ubound% GoTo :CharArray2String-loop
endlocal & set "%2=%_CharArray2String_OutputString%"
Call :ClearVariablesByPrefix _CharArray2String
GoTo :EOF

::Usage Call :GetTempFile OutputFilename optional ext optional prefix optional suffix 
:GetTempFile
set "_GetTempFile.time=%date%.%time:~0,2%h%time:~3,2%m%time:~6,2%s%time:~9,2%"
set "_GetTempFile.time=%_GetTempFile.time: =0%
if "[%~2]"=="[]" ( set "_GetTempFile.ext=.tmp" ) else ( set "_GetTempFile.ext=%~2" )
set "_GetTempFile=%temp%\%~3%random%.%_GetTempFile.time%%~4%_GetTempFile.ext%"
if exist "%_GetTempFile%" goto :GetTempFile
set "%~1=%_GetTempFile%"
set "_GetTempFile=" & set "_GetTempFile.time="
GoTo :EOF

::Usage Call :DecomposeText InputString optional Step
:DecomposeTextByRef
::Usage Call :DecomposeText InputString optional Step
:DecomposeText
set "_DecomposeText_Input=%~1"
set _DecomposeText
set "_DecomposeText_Input=%_DecomposeText_Input:^^=^%"
set _DecomposeText
echo [begin]"%_DecomposeText_Input%"[end]
if "[%~2]"=="[]" ( set /a "_DecomposeText_Step=1" ) else ( set /a "_DecomposeText_Step=%~2" )
Call :len "%_DecomposeText_Input%" _DecomposeText.len
Call :SetArrayParameters _DecomposeText_Input "" 0 %_DecomposeText.len%-1 0
echo [begin]"%_DecomposeText_Input%"[end] %_DecomposeText.len%
set _DecomposeText
:DecomposeText-loop
REM echo echo %%_DecomposeText.index%% %%_DecomposeText_Input:~%_DecomposeText_Input.index%,%_DecomposeText_Step%%%
call set "_DecomposeText_Input.char=%%_DecomposeText_Input:~%_DecomposeText_Input.index%,%_DecomposeText_Step%%%"
echo %_DecomposeText_Input.index% "%_DecomposeText_Input.char%"
set /a "_DecomposeText_Input.index+=%_DecomposeText_Step%"
if %_DecomposeText_Input.index% leq %_DecomposeText_Input.ubound% GoTo :DecomposeText-loop
Call :ClearVariablesByPrefix _DecomposeText
GoTo :EOF


::Usage Call :Asc2Char InputAsciiCode OutputChar Optional SubstitutionChar
:Asc2Char
REM set "_Asc2Char_input=%~1"
REM cmd /c exit %_Asc2Char_input%
cmd /c exit %~1
set "%2=%=exitcodeascii%"
exit /b 0 & set "_Asc2Char_needescape=" & set "_Asc2Char_input="
exit /b %_Asc2Char_success% & set "_Asc2Char_needescape=" & set "_Asc2Char_input="

::Usage Call :Char2Asc InputChar OutputAsciiCode
:Char2AscFast
if "[%CharMap%]"=="[]" call :GetCharMapStringFast
:Char2Asc
Call :SetIfNotDefined "%~1" _Char2Asc_input "%~2" _Char2Asc_output
if "[%CharMap%]"=="[]" call :GetCharMapString
if "[%Charmap.len%]"=="[]" call :len %CharMap% Charmap.len
Call :SetArrayParameters _Char2Asc "" 0 %Charmap.len% 0
:Char2Asc-loop
call set _Char2Asc.currentChar=%%CharMap[%_Char2Asc.index%]%%
if "[%_Char2Asc.currentChar%]"=="[%_Char2Asc_input%]" set "%_Char2Asc_output%=%_Char2Asc.index%" & GoTo :Char2Asc-end
set /a _Char2Asc.index+=1
if %_Char2Asc.index% leq %_Char2Asc.ubound% GoTo :Char2Asc-loop
:Char2Asc-end
if "[%_Char2Asc_input%]"=="[ ]" set "%_Char2Asc_output%=32"
if "[%_Char2Asc_input%]"=="[ ]" set "%_Char2Asc.index%=32"
exit /b %_Char2Asc.index%

::Usage Call :GetCharMapArray optional OutputArray
:GetCharMapArray
if "[%~1]"=="[]" ( set "_GetCharMapArray_Output=CharMap" ) else ( set "_GetCharMapArray_Output=%~1" )
Call :SetArrayParameters _GetCharMapArray_Output "" 0 255 0
:GetCharMapArray-loop
cmd /c exit %_GetCharMapArray_Output.index%
set "%_GetCharMapArray_Output%[%_GetCharMapArray_Output.index%]=%=exitcodeascii%"
set "%_GetCharMapArray_Output%.reverse[%=exitcodeascii%]=%_GetCharMapArray_Output.index%"
set /a _GetCharMapArray_Output.index+=1
if %_GetCharMapArray_Output.index% leq %_GetCharMapArray_Output.ubound% GoTo :GetCharMapArray-loop
Call :ClearVariablesByPrefix _GetCharMapArray
GoTo :EOF
REM https://stackoverflow.com/questions/38282267/return-character-from-ascii-code-in-windows-batch
REM https://blog.itproxy.uk/exitcodeascii/

::Usage Call :GetCharMapStringFast Optional OutputString
:GetCharMapStringFast
if "[%~1]"=="[]" ( set "_GetCharMapString_Output=CharMap" ) else ( set "_GetCharMapString_Output=%~1" )
set "%_GetCharMapString_Output%=                                 !^"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~                                                                                                                                "
set "%_GetCharMapString_Output%.len=256"
GoTo :EOF

::Usage Call :GetCharMapString optional OutputString
:GetCharMapString
if "[%~1]"=="[]" ( set "_GetCharMapString_Output=CharMap" ) else ( set "_GetCharMapString_Output=%~1" )
Call :SetArrayParameters _GetCharMapString_Output "" 0 255 0
:GetCharMapString-loop
cmd /c exit %_GetCharMapString_Output.index%
set _GetCharMapString_Output.value=%_GetCharMapString_Output.value%%=exitcodeascii%
set /a _GetCharMapString_Output.index+=1
if %_GetCharMapString_Output.index% leq %_GetCharMapString_Output.ubound% GoTo :GetCharMapString-loop
set %_GetCharMapString_Output%=%_GetCharMapString_Output.value%
Call :ClearVariablesByPrefix _GetCharMapString
GoTo :EOF


REM ::Usage Call :len InputString OutputResult
REM :: 10X slower for 100 strings
REM :len 
REM set "_len_input=%~1"
REM if not defined _len_input ( set /a "_len=0" GoTo :len-end ) else ( set /a "_len=1" & set /a "_len.index=4096" )
REM :len-loop
REM call set "_len.sample=%%_len_input:~%_len.index%,1%%"
REM if not "[%_len.sample%]"=="[]" set /a "_len+=%_len.index%" & call set "_len_input=%%_len_input:~%_len.index%%%
REM set /a "_len.index/=2"
REM if %_len.index% GTR 0 GoTo :len-loop
REM :len-end
REM set /a "%~2=%_len%"
REM exit /b %_len% & Call :ClearVariablesByPrefix _len

REM ::Usage Call :len "%InputString%" OutputResult
REM :: 5% slower for 100 strings
REM :len
REM set^ _len_input=%~1
REM if not defined _len_input set /a "_len=0" GoTo :len-end
REM set /a "_len=1"
REM if "%_len_input:~4096,1%" NEQ "" ( set /a "_len+=4096" & set "_len_input=%_len_input:~4096%" )
REM if "%_len_input:~2048,1%" NEQ "" ( set /a "_len+=2048" & set "_len_input=%_len_input:~2048%" )
REM if "%_len_input:~1024,1%" NEQ "" ( set /a "_len+=1024" & set "_len_input=%_len_input:~1024%" )
REM if "%_len_input:~512,1%" NEQ "" ( set /a "_len+=512" & set "_len_input=%_len_input:~512%" )
REM if "%_len_input:~256,1%" NEQ "" ( set /a "_len+=256" & set "_len_input=%_len_input:~256%" )
REM if "%_len_input:~128,1%" NEQ "" ( set /a "_len+=128" & set "_len_input=%_len_input:~128%" )
REM if "%_len_input:~64,1%" NEQ "" ( set /a "_len+=64" & set "_len_input=%_len_input:~64%" )
REM if "%_len_input:~32,1%" NEQ "" ( set /a "_len+=32" & set "_len_input=%_len_input:~32%" )
REM if "%_len_input:~16,1%" NEQ "" ( set /a "_len+=16" & set "_len_input=%_len_input:~16%" )
REM if "%_len_input:~8,1%" NEQ "" ( set /a "_len+=8" & set "_len_input=%_len_input:~8%" )
REM if "%_len_input:~4,1%" NEQ "" ( set /a "_len+=4" & set "_len_input=%_len_input:~4%" )
REM if "%_len_input:~2,1%" NEQ "" ( set /a "_len+=2" & set "_len_input=%_len_input:~2%" )
REM if "%_len_input:~1,1%" NEQ "" ( set /a "_len+=1" & set "_len_input=%_len_input:~1%" )
REM :len-end
REM set /a "%~2=%_len%"
REM exit /b %_len% & Call :ClearVariablesByPrefix _len

::Usage Call :Asc2String Output 26 45 45 57 
:Asc2String
run cmd %~2
append  exitascii from %~2 to output string
if %~3 not empty shift and gogo
set output string to output
GoTo :EOF

::Usage Call :DoesStringContainSpecialCharacters
:DoesStringContainSpecialCharacters
setlocal enabledelayedexpansion
echo !%~1! | findstr /C:"%%"
endlocal
GoTo :EOF


::Usage Call :IsCharDoubleQuote byref InputVariable
:IsCharDoubleQuote 
setlocal enabledelayedexpansion
if !%~1!==^" ( set errorlevel=0 ) else ( set errorlevel=1 )
endlocal & exit /b %errorlevel%

::Usage Call :AddEscapeCharacters byref InputString optional OutputString
:AddEscapeCharacters
Call :ClearVariablesByPrefix _AddEscapeCharacters
Call :SetIfNotDefined "%~1" _AddEscapeCharacters_input "%~2" _AddEscapeCharacters_output
Call :SetIfNotDefined "%_AddEscapeCharacters_input%" _AddEscapeCharacters_output
setlocal enabledelayedexpansion
set /a "_AddEscapeCharacters_input.index=0"
set "_AddEscapeCharacters_input.quoted=false"
:AddEscapeCharacters-loop
set "_AddEscapeCharacters_input_char=!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!"
if !_AddEscapeCharacters_input_char!==^" if "[%_AddEscapeCharacters_input.quoted%]"=="[false]" ( set "_AddEscapeCharacters_input.quoted=true" ) else ( set "_AddEscapeCharacters_input.quoted=false" ) 
if !_AddEscapeCharacters_input_char!==%% set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!%%" & GoTo :AddEscapeCharacters-loop-next
for %%a in (^& ^< ^> ^^ ^| ^" ) do ( if ^!_AddEscapeCharacters_input_char!==%%a ( set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^^^^" ) )
set _AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!!_AddEscapeCharacters_input_char!
:AddEscapeCharacters-loop-next
REM echo !_AddEscapeCharacters_intermediate!
set /a "_AddEscapeCharacters_input.index+=1"
if "!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
set "_AddEscapeCharacters_last_char=!_AddEscapeCharacters_intermediate:~-1!"
for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_AddEscapeCharacters_last_char!]"=="[%%a]" set _AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate:~,-1!^%%a )
endlocal & set %_AddEscapeCharacters_output%=%_AddEscapeCharacters_intermediate%
Call :ClearVariablesByPrefix _AddEscapeCharacters
GoTo :EOF


REM ::Usage Call :AddEscapeCharacters byref InputString optional OutputString
REM :AddEscapeCharacters
REM Call :ClearVariablesByPrefix _AddEscapeCharacters
REM Call :SetIfNotDefined "%~1" _AddEscapeCharacters_input "%~2" _AddEscapeCharacters_output
REM Call :SetIfNotDefined "%_AddEscapeCharacters_input%" _AddEscapeCharacters_output
REM setlocal enabledelayedexpansion
REM set /a "_AddEscapeCharacters_input.index=0"
REM set "_AddEscapeCharacters_input.quoted=false"
REM :AddEscapeCharacters-loop
REM set "_AddEscapeCharacters_input_char=!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!"
REM if !_AddEscapeCharacters_input_char!==^" if "[%_AddEscapeCharacters_input.quoted%]"=="[false]" ( set "_AddEscapeCharacters_input.quoted=true" ) else ( set "_AddEscapeCharacters_input.quoted=false" ) 
REM REM set _AddEscapeCharacters
REM if "[!_AddEscapeCharacters_input.quoted!]"=="[false]" (
	REM if !_AddEscapeCharacters_input_char!==%% set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!%%" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^& set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^&" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^< set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^<" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^> set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^>" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^^ set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^^" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^| set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^|" & GoTo :AddEscapeCharacters-loop-next
REM ) else (
	REM if !_AddEscapeCharacters_input_char!==%% set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!%%" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^& set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^&" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^< set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^<" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^> set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^>" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^^ set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^^" & GoTo :AddEscapeCharacters-loop-next
	REM if !_AddEscapeCharacters_input_char!==^| set "_AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!^^^|" & GoTo :AddEscapeCharacters-loop-next
REM )
REM set _AddEscapeCharacters_intermediate=!_AddEscapeCharacters_intermediate!!_AddEscapeCharacters_input_char!
REM :AddEscapeCharacters-loop-next
REM REM echo !_AddEscapeCharacters_intermediate!
REM set /a "_AddEscapeCharacters_input.index+=1"
REM if "!%_AddEscapeCharacters_input%:~%_AddEscapeCharacters_input.index%,1!" NEQ "" GoTo :AddEscapeCharacters-loop
REM endlocal & set "%_AddEscapeCharacters_output%=%_AddEscapeCharacters_intermediate%"
REM Call :ClearVariablesByPrefix _AddEscapeCharacters
REM GoTo :EOF

REM set pos=0
REM :NextChar
    REM echo Char %pos% is '!mytext:~%pos%,1!'
    REM set /a pos=pos+1
    REM if "!mytext:~%pos%,1!" NEQ "" goto NextChar

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

if "[%_ListUnescapedSpecialCharactersInString_current_type%]" EQU "[doublequotes]" if "[%_ListUnescapedSpecialCharactersInString_escaped%]" NEQ "[true]" set /a "_ListUnescapedSpecialCharactersInString_quote_count+=1
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

REM NON WORKING
::Usage Call :InsertEscapeCharacters byref InputVariable
:InsertEscapeCharacters
setlocal enabledelayedexpansion
set "_InsertEscapeCharacters_char="
set /a "_InsertEscapeCharacters_index=0"
:InsertEscapeCharacters-loop
set "_InsertEscapeCharacters_char=!%~1:~%_InsertEscapeCharacters_index%,1!"

	if !_InsertEscapeCharacters_char!==a ( 
		echo it was a index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^" ( 
		echo it was " index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^& ( 
		echo it was ^& index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^< ( 
		echo it was ^< index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^> ( 
		echo it was ^> index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^^ ( 
		echo it was ^^ index !_InsertEscapeCharacters_index!
		) else if !_InsertEscapeCharacters_char!==^| ( 
		echo it was ^| index !_InsertEscapeCharacters_index!
		) else ( 
		echo it was else !_InsertEscapeCharacters_char! index !_InsertEscapeCharacters_index!
		)

set /a "_InsertEscapeCharacters_index+=1"
if "!%~1:~%_InsertEscapeCharacters_index%,1!" NEQ "" GoTo :InsertEscapeCharacters-loop
endlocal
GoTo :EOF

::Usage Call :PrintCharMap FULLRANGE
:PrintCharMap
set /a "_PrintCharMap_index=32" & set /a "_PrintCharMap_count=126"
if "[%~1]"=="[FULLRANGE]" set /a "_PrintCharMap_index=0" & set /a "_PrintCharMap_count=255"
:PrintCharMap-loop
cmd /c exit %_PrintCharMap_index%
setlocal enabledelayedexpansion
echo %_PrintCharMap_index% !=exitcodeascii!
endlocal
set /a "_PrintCharMap_index+=1"
if %_PrintCharMap_index% LEQ %_PrintCharMap_count% GoTo :PrintCharMap-loop
GoTo :EOF



::Usage Call :GetRandomString CharacterCount OutputString USESPECIALCHARS DONTESCAPE FULLRANGE
:GetRandomString
Call :ClearVariablesByPrefix _GetRandomString
set /a "_GetRandomString_count=%~1"
set "_GetRandomString_output=%~2"
:GetRandomString-arguments
if "[%~3]" EQU "[USESPECIALCHARS]" set "_GetRandomString_usespecialchar=true"
if "[%~3]" EQU "[DONTESCAPE]" set "_GetRandomString_dontescape=true"
if "[%~3]" EQU "[FULLRANGE]" set "_GetRandomString_fullrange=true"
if "[%~4]" NEQ "[]" ( shift & GoTo :GetRandomString-arguments )
set /a "_GetRandomString_index=0"
set /a "_GetRandomString_quoted=true"
setlocal enabledelayedexpansion
:GetRandomString-loop
set "_GetRandomString_escapechar="
set "_GetRandomString_isspecialchar="
if "[%_GetRandomString_fullrange%]" EQU "[true]" ( set /a "_GetRandomString_next_ascii=%RANDOM% * (255 - 0 + 1) / 32768 + 0" ) else ( set /a "_GetRandomString_next_ascii=%RANDOM% * (126 - 32 + 1) / 32768 + 32" ) 
if "[%_GetRandomString_usespecialchar%]" NEQ "[true]" for %%a in (34 37 38 60 62 94 124) do ( if "[!_GetRandomString_next_ascii!]"=="[%%a]" GoTo :GetRandomString-loop )
for %%a in (34 37 38 60 62 94 124) do ( if "[!_GetRandomString_next_ascii!]"=="[%%a]" set "_GetRandomString_isspecialchar=true" )
if "[!_GetRandomString_isspecialchar!]"=="[true]" if "[!_GetRandomString_quoted!]"=="[true]" ( set "_GetRandomString_escapechar=^" ) else ( set "_GetRandomString_escapechar=^" )
REM if "[!_GetRandomString_next_ascii!]"=="[34]" ( set "_GetRandomString_escapechar=^" & set "_GetRandomString_lastquote=!_GetRandomString_index!" & if "[!_GetRandomString_previouschar!]" NEQ "[34]" ( if "[!_GetRandomString_quoted!]"=="[true]" ( set "_GetRandomString_quoted=false" ) else ( set "_GetRandomString_quoted=true" ) ) )
if "[!_GetRandomString_next_ascii!]"=="[34]" set "_GetRandomString_lastquote=!_GetRandomString_index!" & if "[!_GetRandomString_quoted!]"=="[true]" ( set "_GetRandomString_quoted=false" ) else ( set "_GetRandomString_quoted=true" ) 
if "[!_GetRandomString_next_ascii!]"=="[37]" set "_GetRandomString_escapechar=%"
set "_GetRandomString_previouschar=!_GetRandomString_next_ascii!"
cmd /c exit !_GetRandomString_next_ascii!
REM echo S!_GetRandomString_string! E!_GetRandomString_escapechar! X!=exitcodeascii! SC!_GetRandomString_isspecialchar!
set _GetRandomString_string=!_GetRandomString_string!!_GetRandomString_escapechar!!=exitcodeascii!
set /a "_GetRandomString_index+=1"
if !_GetRandomString_index! LSS !_GetRandomString_count! GoTo :GetRandomString-loop
REM echo randomstring=!_GetRandomString_string!
set "_GetRandomString_last_char=!_GetRandomString_string:~-1!"
REM echo lastchar !_GetRandomString_last_char!
for %%a in (0 1 2 3 4 5 6 7 8 9) do ( if "[!_GetRandomString_last_char!]"=="[%%a]" set _GetRandomString_string=!_GetRandomString_string:~,-1!^%%a )
echo R !_GetRandomString_string!>>randomstring.txt
endlocal & set %_GetRandomString_output%=%_GetRandomString_string%
Call :ClearVariablesByPrefix _GetRandomString
goto :eof


set "_outputfile=851-2.txt"
set /a _index=0
REM set special=^
set "special=^"
echo special is "%special%" X%special%X
del 851-2.txt
REM set "special=^^"
:GetRandomString-test
cmd /c exit %_index%
REM echo %_index% "%=exitcodeascii%"
REM if %_index% equ 37 echo.%special%%=exitcodeascii%>>851-2.txt & goto :GetRandomString-test-skip
REM if "%=exitcodeascii%" EQU "%%" echo %_index% was %%
setlocal enabledelayedexpansion 
if "!=exitcodeascii!"=="%%" echo %_index% was %%
if "!=exitcodeascii!"==""" echo %_index% was doublequotes
if "!=exitcodeascii!"=="&" echo %_index% was ^&
if "!=exitcodeascii!"=="<" echo %_index% was ^<
if "!=exitcodeascii!"==">" echo %_index% was ^>
if "!=exitcodeascii!"=="^" echo %_index% was ^^
if "!=exitcodeascii!"=="|" echo %_index% was ^|
endlocal

if %_index% equ 34 echo.%special%%=exitcodeascii%>>%_outputfile%& goto :GetRandomString-test-skip
if %_index% equ 38 echo.%special%%=exitcodeascii%>>%_outputfile%& goto :GetRandomString-test-skip
if %_index% equ 60 echo.%special%%=exitcodeascii%>>%_outputfile%& goto :GetRandomString-test-skip
if %_index% equ 62 echo.%special%%=exitcodeascii%>>%_outputfile%& goto :GetRandomString-test-skip
if %_index% equ 94 echo.%special%%=exitcodeascii%>>%_outputfile%& goto :GetRandomString-test-skip
if %_index% equ 124 echo.%special%%=exitcodeascii%>>%_outputfile%& goto :GetRandomString-test-skip
echo.%=exitcodeascii%>>%_outputfile%
REM echo."%=exitcodeascii%">>851-2.txt
REM echo.%special%%=exitcodeascii%^>>851-2.txt
REM type 851-2.txt
REM :GetRandomString-test-skip
FOR %%? IN ("%_outputfile%") DO echo %_index% "%=exitcodeascii%" size %%~z?
set /a _index+=1
if %_index% leq 255 goto :GetRandomString-test

goto :eof
cmd /c exit %~1
set "%2=%=exitcodeascii%"

set "_GetRandomString_charlimit=%~1"
if "[%~3]"=="NOSPECIALCHARS" set "_GetRandomString_nospecialchar=true"
set _GetRandomString_charmap=!"#$%%^&'()*+,-./0123456789:;^<=^>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^^_`abcdefghijklmnopqrstuvwxyz{^|}~
echo _GetRandomString_charmap "%_GetRandomString_charmap%"
for /l %%a in (0,1,95) do (call echo _GetRandomString_charmap "%%_GetRandomString_charmap:~%%a,1%%")

set /a _GetRandomString_charcount=0
echo hello
REM :GetRandomString-loop
REM echo set /a _GetRandomString_nextchar=%RANDOM% * (0 - 128 + 1) / 32768 + 0
set /a _GetRandomString_nextchar=%RANDOM% * (32 - 128 + 1) / 32768 + 32
REM echo _GetRandomString_nextchar %_GetRandomString_nextchar%
REM if "[%_GetRandomString_nospecialchar%]"=="[true]" for %%a in (2 3 6 7 29 31) do ( if "[%%a]"=="[%_GetRandomString_nextchar%]" GoTo :GetRandomString-loop)
call set "_GetRandomString_output=%_GetRandomString_output%%%_GetRandomString_charmap:~%_GetRandomString_nextchar%,1%%
set /a _GetRandomString_charcount+=1
if %_GetRandomString_charcount% leq %_GetRandomString_charlimit% GoTo :GetRandomString-loop
GoTo :EOF

::Usage Call :IsSpecialChar byref InputString
:IsSpecialChar
setlocal EnableDelayedExpansion
	(set^ tmp=!%~1!)
	REM for %%a in (^^ ^> ^< ^& ^| %% ^") do ( echo %%a )
	for %%a in (^^ ^> ^< ^& ^| %% ^") do ( if "!tmp:%%a=!" NEQ "!tmp!" ( set "_IsSpecialChar_found=true" ) )
endlocal & set _IsSpecialChar_found=%_IsSpecialChar_found%
if not "[%~2]"=="[]" if "[%_IsSpecialChar_found%]"=="[true]" ( set "%~2=true" ) else ( set "%~2=false" )
if "[%_IsSpecialChar_found%]"=="[true]" ( set /a "_IsSpecialChar_found=0" ) else ( set "_IsSpecialChar_found=1" )
set "_IsSpecialChar_found=" & exit /b %_IsSpecialChar_found%


::Usage Call :lenUsingFile VariableName OutputResult
:lenUsingFileByRef
call set "_lenUsingFile=%%%1%%" 
echo lenUsingFileByRef %_lenUsingFile%
GoTo :lenUsingFile-skip-preamble
::Usage Call :lenUsingFile "%InputString%" OutputResult
:lenUsingFile

set "_lenUsingFile=%~1"
set "_lenUsingFile=%_lenUsingFile:^^=^%"
set "_lenUsingFile=%_lenUsingFile:""="%"
echo lenUsingFile %_lenUsingFile%
:lenUsingFile-skip-preamble 
echo at :lenUsingFile-skip-preamble 
echo lenUsingFile-skip-preamble %_lenUsingFile%
Call :GetTempFile _lenUsingFile.tempfile

set "_lenUsingFile=%_lenUsingFile:^=^^%"
set "_lenUsingFile=%_lenUsingFile:<=^<%"
set "_lenUsingFile=%_lenUsingFile:>=^>%"
set "_lenUsingFile=%_lenUsingFile:&=^&%"
set "_lenUsingFile=%_lenUsingFile:|=^|%"
REM set "_lenUsingFile=%_lenUsingFile:"=""%"
@echo on
ECHO."%_lenUsingFile%">"%_lenUsingFile.tempfile%"
FOR %%? IN ("%_lenUsingFile.tempfile%") DO SET /A _lenUsingFile.len=%%~z?-4 & DEL "%_lenUsingFile.tempfle%"
set /a "%~2=%_lenUsingFile.len%"
set "_lenUsingFile=" & set "_lenUsingFile.tempfile=" & set "_lenUsingFile.len=" & exit /b %_lenUsingFile.len%
REM https://stackoverflow.com/a/8566001


::Usage Call :lenByRef OutputResult %VariableName%
rem doesn't work ?
REM :lenByVal
REM setlocal enabledelayedexpansion
REM set _len=%~2
REM GoTo :len
::Usage Call :len OutputResult VariableName
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175) WRONG
REM :len
REM (   
    REM setlocal EnableDelayedExpansion
    REM (set^ _ln=!%~2!)
    REM if defined _ln (
        REM set "len=1"
        REM for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            REM if "!_ln:~%%P,1!" NEQ "" ( 
                REM set /a "len+=%%P"
                REM set "_ln=!_ln:~%%P!"
            REM )
        REM )
    REM ) ELSE (
        REM set len=0
    REM )
REM )
REM ( 
    REM endlocal
    REM set "%~1=%len%"
    REM exit /b %len%
REM )
rem find stackoverflow link for this
rem return value should equal len
rem lenbyval should work


REM This LEN sucks !

::Usage Call :lenFromVar VariableName OutputResult
:: 8172 max lenght, breaks batch file if len=8173
:lenByRef
REM setlocal enableDelayedExpansion
REM endlocal & set "_len=!%1!" & GoTo :len-skip-preamble
call set "_len=%%%1%%" 
echo lenByRef %_len%
GoTo :len-skip-preamble
::Usage Call :len "%InputString%" OutputResult
:: 5% slower for 100 strings, maximum lenght = 8174 (will break at 8175)
:len
set "_len=%~1"
set "_len=%_len:^^=^%"
set "_len=%_len:""="%"
echo len %_len%
:len-skip-preamble
if not defined _len set /a "_len.count=0" GoTo :len-end
set /a "_len.count=1"
if "%_len:~4096,1%" NEQ "" ( set /a "_len.count+=4096" & set "_len=%_len:~4096%" )
if "%_len:~2048,1%" NEQ "" ( set /a "_len.count+=2048" & set "_len=%_len:~2048%" )
if "%_len:~1024,1%" NEQ "" ( set /a "_len.count+=1024" & set "_len=%_len:~1024%" )
if "%_len:~512,1%" NEQ "" ( set /a "_len.count+=512" & set "_len=%_len:~512%" )
if "%_len:~256,1%" NEQ "" ( set /a "_len.count+=256" & set "_len=%_len:~256%" )
if "%_len:~128,1%" NEQ "" ( set /a "_len.count+=128" & set "_len=%_len:~128%" )
if "%_len:~64,1%" NEQ "" ( set /a "_len.count+=64" & set "_len=%_len:~64%" )
if "%_len:~32,1%" NEQ "" ( set /a "_len.count+=32" & set "_len=%_len:~32%" )
if "%_len:~16,1%" NEQ "" ( set /a "_len.count+=16" & set "_len=%_len:~16%" )
if "%_len:~8,1%" NEQ "" ( set /a "_len.count+=8" & set "_len=%_len:~8%" )
if "%_len:~4,1%" NEQ "" ( set /a "_len.count+=4" & set "_len=%_len:~4%" )
if "%_len:~2,1%" NEQ "" ( set /a "_len.count+=2" & set "_len=%_len:~2%" )
if "%_len:~1,1%" NEQ "" ( set /a "_len.count+=1" & set "_len=%_len:~1%" )
:len-end
set /a "%~2=%_len.count%"
set "_len.count=" & set "_len=" & exit /b %_len.count%

::Usage Call :len InputVariable OutputResult
:lenfast
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~1!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~2=%len%"
    exit /b
)
REM https://stackoverflow.com/a/5841587

::Usage Call :len InputVariable OutputResult
:lenfast2
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~2!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)

::Usage Call :True ReturnValue 'Always returns true, both return value and errorlevel
:true 
if not "[%1]"=="[]" set %1=true
exit /b 0
REM Call :True ReturnValue && echo it is always true (errorlevel 0) || echo it is never false (errorlevel not 0)
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)


::Usage Call :false ReturnValue 'Always returns false, both return value and errorlevel
:false 
if not "[%1]"=="[]" set %1=false
exit /b 1
::Call :false ReturnValue && echo it is never true (errorlevel 0) || echo it is always false (errorlevel not 0)
REM thanks https://www.tutorialspoint.com/batch_script/
REM call :true && echo is true (this runs) || echo is false & echo always runs (was :true)
REM call :false && echo is true || echo is false (this runs) & echo always runs (was :false)

:BFWFunctionSwitcher-text
@echo off

:setup

REM set "_IFLE_ExclusionList=main setup macro end loop loop2 loop3 loop4 skip skip1 skip2 skip2 skip3 skip4 test test1 test2 test3 cleanup argument params args next prev iteration pre post 0 1 2 3 4 5 6 7 8 9 subloop matchfound nomatch found index list arguments preamble test4 test5 test6 start reset"

:main

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end

REM set "_IFLE_ExclusionList="

GoTo :EOF
:EndOF_BFWFunctionSwitcher-text
