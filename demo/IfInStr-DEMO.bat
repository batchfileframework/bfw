@echo off
:setup
:main
REM Call :GetConsoleAndPrintTitle-quick-DEMO
REM Call :GetConsoleAndPrintTitle-DEMO
REM Call :PrintWindowClientRectFromHWND-DEMO
REM call :PrintWindowRectangleFromHWND-DEMO
REM Call :IfInStr-DEMO
REM Call :SetEllipseWindow-DEMO
REM call :Concatenate-mini-DEMO
REM Call :Concatenate-DEMO
Call :IfInStr-DEMO

GoTo :EOF


:IfInStr-DEMO

echo Testing IfInStr

set "searchterm=123" & set "searchstring=123456"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=123" & set "searchstring=456123"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=123" & set "searchstring=4512367"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=dog" & set "searchstring=The fox lazy lazy browned quick dog jump dog dog"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% "%searchstring%" && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=jump" & set "searchstring=The fox lazy lazy browned quick dog jump dog dog"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% searchstring && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=" & set "searchstring=123456"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr "%searchterm%" %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%


set "searchterm=123" & set "searchstring=123456"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr searchterm searchstring && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=abcdef" & set "searchstring=123456"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=abc123" & set "searchstring=123456"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr %searchterm% %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%

set "searchterm=12 3" & set "searchstring=123456"
echo.&echo is %searchterm% in %searchstring% & Call :IfInStr searchterm %searchstring% && echo yes %searchterm% is in %searchstring% || echo no %searchterm% is not in %searchstring%


GoTo :EOF


::Usage Call :IfInStr SearchingTerm SearchedString
:IfInStr
:IfInString
if "[%~1]" EQU "[]" exit /b 0
if defined %~1 call set _IfInStr_SearchTerm=%%%~1%%
if defined %~2 call set _IfInStr_SearchedString=%%%~2%%
if not defined _IfInStr_SearchTerm set _IfInStr_SearchTerm=%~1
if not defined _IfInStr_SearchedString set _IfInStr_SearchedString=%~2
call set _IfInStr_buffer=%%_IfInStr_SearchedString:%_IfInStr_SearchTerm%=%%
set "_IfInStr_SearchTerm=" & set "_IfInStr_SearchedString=" & set "_IfInStr_buffer=" & if "[%_IfInStr_SearchedString%]" EQU "[%_IfInStr_buffer%]" ( exit /b 1 ) else ( exit /b 0 ) 
