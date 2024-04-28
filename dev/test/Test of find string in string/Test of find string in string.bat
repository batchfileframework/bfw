@echo off

echo input string does contain search string
set inputstring=This is a #@LKG(G test string
set searchstring=#@LKG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string is in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was found

echo.

echo input string does not contain search string
set inputstring=This is a #@LK(G test string
set searchstring=#@LKG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string is not in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was not found

echo.

echo input string does contain search string WITH A SPACE
set inputstring=This is a #@L KG(G test string
set searchstring=#@L KG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string WITH A SPACE is in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was found

echo.

echo input string does not contain search string WITH A SPACE
set inputstring=This is a #@L K(G test string
set searchstring=#@L KG(G
Call :InStB "%inputstring%" "%searchstring%" resultbool
echo %resultbool%

echo.

echo running standalone test search string WITH A SPACE is not in
call set MYTestSTR=%%inputstring:%inputstring%=%%

echo input string %inputstring%
echo search string %searchstring%
echo test string %MYTestSTR%

if "%MYTestSTR%"=="%inputstring%" echo if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo not if ran payload
if not "%MYTestSTR%"=="%inputstring%" echo search string was found

GoTo :EOF
:: Call :InStB input search result
:InStB
set "InputSTR=%1"
set "SearchSTR=%2"
set %3=false
echo input string %InputSTR%
echo search string %SearchSTR%
echo third param %3
call set TestSTR=%%InputSTR:%SearchSTR:~1,-1%=%%
echo test string %InputSTR%
echo test string %TestSTR%
if %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( set %3=true )
GoTo :EOF
