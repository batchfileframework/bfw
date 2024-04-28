
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

