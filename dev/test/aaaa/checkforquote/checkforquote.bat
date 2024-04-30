@echo off

set "myquote=""

set "mychar1=d"
set "mychar2=""


setlocal enabledelayedexpansion

set myinput=%mychar1%

REM echo if "!myinput!"==" echo this is a doublequotes
REM if "!myinput!"==" echo this is a doublequotes
REM echo if "!myinput!"==^" echo this is a doublequotes
REM if "!myinput!"==^" echo this is a doublequotes
echo if "!myinput!"==^"^"^" echo this is a doublequotes
if "!myinput!"==^"^"^" echo this is a doublequotes

set myinput=%mychar2%
echo if "!myinput!"==^" echo this is a doublequotes
if "!myinput!"==^" echo this is a doublequotes
if "!myinput!"==^"^"^" echo this is a doublequotes


endlocal

GoTo :EOF

