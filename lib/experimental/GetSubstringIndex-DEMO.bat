@echo off

Call :split-demo
GoTo :EOF


:setup
:macro
:main

REM detect if first argument is a existing function in this file
REM detect if first argument is a file in %bfw.root%\lib
REM demo should be case
for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~n0]" EQU "[bfw]" if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~n0]" EQU "[bfw]" if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end


GoTo :EOF





:GetSubstringIndex-demo

Call :ClearVariablesByPrefix _GetSubstringIndex

set _GetSubstringIndex_show_string=true

set /a _GetSubstringIndex_index=0
REM set /a _GetSubstringIndex_index=1
REM set /a _GetSubstringIndex_index=2
REM set /a _GetSubstringIndex_index=3
REM set /a _GetSubstringIndex_index=4
REM set /a _GetSubstringIndex_index=5
REM set /a _GetSubstringIndex_index=6
REM set /a _GetSubstringIndex_index=7
REM set /a _GetSubstringIndex_index=8
REM set /a _GetSubstringIndex_index=9
REM set /a _GetSubstringIndex_index=10
REM set /a _GetSubstringIndex_index=11
REM set /a _GetSubstringIndex_index=12
REM set /a _GetSubstringIndex_index=13
REM set /a _GetSubstringIndex_index=14
REM set /a _GetSubstringIndex_index=15
REM set /a _GetSubstringIndex_index=16
REM set /a _GetSubstringIndex_index=17
REM set /a _GetSubstringIndex_index=18
REM set /a _GetSubstringIndex_index=19
REM set /a _GetSubstringIndex_index=20
REM set /a _GetSubstringIndex_index=21
REM set /a _GetSubstringIndex_index=22
REM set /a _GetSubstringIndex_index=23
REM set /a _GetSubstringIndex_index=24
REM set /a _GetSubstringIndex_index=25
REM set /a _GetSubstringIndex_index=26
REM set /a _GetSubstringIndex_index=27
REM set /a _GetSubstringIndex_index=28
REM set /a _GetSubstringIndex_index=29
REM set /a _GetSubstringIndex_index=30
REM set /a _GetSubstringIndex_index=31
REM set /a _GetSubstringIndex_index=32
REM set /a _GetSubstringIndex_index=33
REM set /a _GetSubstringIndex_index=34
REM set /a _GetSubstringIndex_index=35
REM set /a _GetSubstringIndex_index=36

REM set /a _GetSubstringIndex_stop=0
REM set /a _GetSubstringIndex_stop=1
REM set /a _GetSubstringIndex_stop=2
REM set /a _GetSubstringIndex_stop=3
REM set /a _GetSubstringIndex_stop=4
REM set /a _GetSubstringIndex_stop=5
REM set /a _GetSubstringIndex_stop=7
REM set /a _GetSubstringIndex_stop=8
REM set /a _GetSubstringIndex_stop=9
REM set /a _GetSubstringIndex_stop=10
REM set /a _GetSubstringIndex_stop=11
REM set /a _GetSubstringIndex_stop=12
REM set /a _GetSubstringIndex_stop=13
REM set /a _GetSubstringIndex_stop=14
REM set /a _GetSubstringIndex_stop=15
REM set /a _GetSubstringIndex_stop=16
REM set /a _GetSubstringIndex_stop=17
REM set /a _GetSubstringIndex_stop=18
REM set /a _GetSubstringIndex_stop=19
REM set /a _GetSubstringIndex_stop=20
REM set /a _GetSubstringIndex_stop=21
REM set /a _GetSubstringIndex_stop=22
REM set /a _GetSubstringIndex_stop=23
REM set /a _GetSubstringIndex_stop=24
REM set /a _GetSubstringIndex_stop=25
REM set /a _GetSubstringIndex_stop=26
REM set /a _GetSubstringIndex_stop=27
REM set /a _GetSubstringIndex_stop=28
REM set /a _GetSubstringIndex_stop=29
REM set /a _GetSubstringIndex_stop=30
REM set /a _GetSubstringIndex_stop=31
REM set /a _GetSubstringIndex_stop=32
set /a _GetSubstringIndex_stop=33

:GetSubstringIndex-demo-loop

REM _GetSubstringIndex_index_length
REM _GetSubstringIndex_index_count
REM _GetSubstringIndex_testvar
REM _GetSubstringIndex_testpattern
REM test explain string
REM _GetSubstringIndex_index
REM _GetSubstringIndex_stop

parameters of CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED

if %_GetSubstringIndex_index% EQU 0 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 0 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 0 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 0 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 0 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 1 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 1 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 1 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 1 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 1 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 2 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 2 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 2 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 2 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 2 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 3 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 3 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 3 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 3 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 3 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 4 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 4 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 4 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 4 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 4 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 5 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 5 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 5 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 5 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 5 GoTo :GetSubstringIndex-demo-start-loop


if %_GetSubstringIndex_index% EQU 6 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 6 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 6 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 6 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern,)
if %_GetSubstringIndex_index% EQU 6 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 6 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 7 echo  Repeat tests 1-6, but with auto generated alpha numeric testpattern of size variable between 10 and 20
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings="
set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100

if %_GetSubstringIndex_index% EQU 7 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 7 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 7 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 7 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 7 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 8 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 8 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 8 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 8 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 8 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 8 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 9 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 9 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 9 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 9 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 9 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 9 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 10 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 10 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 10 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 10 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 10 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 10 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 11 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 11 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 11 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 11 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 11 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 11 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 12 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 12 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 12 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 12 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 12 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 12 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 13 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 13 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 13 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 13 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 13 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern,)
if %_GetSubstringIndex_index% EQU 13 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 13 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 14 echo  Repeat tests 7-13, but with punctuation and space but no poison in the test pattern
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION NOPOISON SPACE"

if %_GetSubstringIndex_index% EQU 14 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 14 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 14 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 14 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 14 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 14 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 15 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 15 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 15 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 15 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 15 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 15 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 16 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 16 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 16 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 16 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 16 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 16 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 17 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 17 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 17 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 17 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 17 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 17 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 18 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 18 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 18 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 18 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 18 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 18 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 19 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 19 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 19 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 19 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 19 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 19 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 20 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 20 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 20 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 20 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 20 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, )
if %_GetSubstringIndex_index% EQU 20 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 20 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 21 echo  Repeat tests 14-20, but including poison in the test pattern 
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION SPACE"

if %_GetSubstringIndex_index% EQU 21 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 21 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 21 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 21 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 21 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 21 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 22 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 22 Call :CreateRandomStringPS %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 22 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 22 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 22 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 22 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 23 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 23 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 23 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 23 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 23 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 23 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 24 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 24 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 24 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 24 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 24 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 24 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 25 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 25 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 25 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 25 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 25 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 25 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 25 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 25 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 26 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 26 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 26 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 26 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 26 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, )
if %_GetSubstringIndex_index% EQU 26 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 26 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 27 echo  Repeat tests 21-26, but with poison characters in the test string too
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION NOPOISON SPACE"

if %_GetSubstringIndex_index% EQU 27 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 27 set "_GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)(%^&=<>|FFFF"FFFFFFFFF"
if %_GetSubstringIndex_index% EQU 27 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 27 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 27 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 27 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 28 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 28 Call :CreateRandomStringPS PUNCTUATION %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 28 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 28 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 28 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 28 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 29 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 29 Call :CreateRandomStringPS PUNCTUATION SPACE %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 29 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 29 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 29 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 29 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 30 ( set /a _GetSubstringIndex_index_length=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 30 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 30 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 30 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 30 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 30 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 31 ( set /a _GetSubstringIndex_index_length=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 31 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 31 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 31 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 31 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 31 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 32 ( set /a _GetSubstringIndex_index_length=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 32 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 32 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 32 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 32 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 32 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 33 ( set /a _GetSubstringIndex_index_length=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 33 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_length% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 33 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 33 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 33 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_length% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, )
if %_GetSubstringIndex_index% EQU 33 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 33 GoTo :GetSubstringIndex-demo-start-loop

:GetSubstringIndex-demo-start-loop
echo test
set /a _GetSubstringIndex_index_index=0
Call :ClearVariablesByPrefix _GetSubstringIndex_testarray 
echo.&echo Starting test %_GetSubstringIndex_index%, string length %_GetSubstringIndex_index_length%, loop  count %_GetSubstringIndex_index_count%&echo.
:GetSubstringIndex-demo-run-loop
Call :ReplaceString "%_GetSubstringIndex_testvar%" "%_GetSubstringIndex_testpattern%" _GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%] %_GetSubstringIndex_index_index% ""
set /a _GetSubstringIndex_index_index+=1
if %_GetSubstringIndex_index_index% LEQ %_GetSubstringIndex_index_count% GoTo :GetSubstringIndex-demo-run-loop
echo.&echo _GetSubstringIndex_testarray[] values inserted with test pattern ::"%_GetSubstringIndex_testpattern%":: & set /a _GetSubstringIndex_index_index=0
echo.&echo GetSubstringIndex is called byref&echo.
:GetSubstringIndex-demo-run-loop-loop
Call :GetSubstringIndex "_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]" "%_GetSubstringIndex_testpattern%" "" 
if defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel%  ::"%%_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]:~,8000%%"::
if not defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel% 
set /a _GetSubstringIndex_index_index+=1
if %_GetSubstringIndex_index_index% LEQ %_GetSubstringIndex_index_count% GoTo :GetSubstringIndex-demo-run-loop-loop
echo.&echo GetSubstringIndex is called byval&echo.& set /a _GetSubstringIndex_index_index=0
:GetSubstringIndex-demo-run-loop-loop-loop
Call :GetSubstringIndex "%%_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]%%" "%_GetSubstringIndex_testpattern%" "" 
if defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel%  ::"%%_GetSubstringIndex_testarray[%_GetSubstringIndex_index_index%]:~,8000%%"::
if not defined _GetSubstringIndex_show_string call echo Index %_GetSubstringIndex_index_index% : result %errorlevel%
set /a _GetSubstringIndex_index_index+=1
if %_GetSubstringIndex_index_index% LEQ %_GetSubstringIndex_index_count% GoTo :GetSubstringIndex-demo-run-loop-loop-loop
set /a _GetSubstringIndex_index+=1
if %_GetSubstringIndex_index% LSS %_GetSubstringIndex_stop% GoTo :GetSubstringIndex-demo-loop

Call :ClearVariablesByPrefix _GetSubstringIndex
GoTo :EOF

::Usage Call :ReplaceString InputString ReplaceString optional OutputString optional StartIndex optional len
:ReplaceString
set "_ReplaceString_prefix=_RS"
Call :ClearVariablesByPrefix _RS_byref
setlocal enabledelayedexpansion
if defined %~1 set "_RS_byref_input=true"
if defined %~2 set "_RS_byref_replace=true"
set _RS_Input=%~1
set _RS_Replace=%~2
set _RS_Output=%~3
if not defined _RS_Output set _RS_Output=%_RS_Input%
set /a _RS_StartIndex=%~4 2>nul
if not defined _RS_StartIndex set /a _RS_StartIndex=0
set /a _RS_len=%~5 2>nul
if not defined _RS_len call :len _RS_Replace _RS_len
set /a _RS_RemainIndex=%_RS_StartIndex%+%_RS_len%
if defined _RS_byref_input if defined _RS_byref_replace GoTo :ReplaceString-both-byref-skip
if defined _RS_byref_input if not defined _RS_byref_replace GoTo :ReplaceString-input-byref-skip
if defined not _RS_byref_input if defined _RS_byref_replace GoTo :ReplaceString-replace-byref-skip
set _RS_Intermetiate=!_RS_Input:~,%_RS_StartIndex%!!_RS_Replace!!_RS_Input:~%_RS_RemainIndex%!
GoTo :ReplaceString-end
:ReplaceString-both-byref-skip
set _RS_Intermetiate=!%_RS_Input%:~,%_RS_StartIndex%!!%_RS_Replace%!!%_RS_Input%:~%_RS_RemainIndex%!
GoTo :ReplaceString-end
:ReplaceString-replace-byref-skip
set _RS_Intermetiate=!_RS_Input:~,%_RS_StartIndex%!!%_RS_Replace%!!_RS_Input:~%_RS_RemainIndex%!
GoTo :ReplaceString-end
:ReplaceString-input-byref-skip
if not defined _RS_byref_replace set _RS_Replace=%~2
set _RS_Intermetiate=!%_RS_Input%:~,%_RS_StartIndex%!!_RS_Replace!!%_RS_Input%:~%_RS_RemainIndex%!
:ReplaceString-end
if "[%~6]" NEQ "[]" (shift & shift & shift & shift & shift & GoTo :ReplaceString)
for /f "tokens=1* delims=" %%a in ('echo.!_RS_Intermetiate!') do endlocal & set %_RS_Output%=%%a
Call :ClearVariablesByPrefix %_ReplaceString_prefix% _ReplaceString_prefix & GoTo :EOF

::Usage Call :split InputString Delimiter OutputArray optional limit optional comparemethod
REM :split 
REM set "_split_prefix=_splt"
REM if defined %~1
REM set "_splt_input=%~1"
REM set "_splt_output=%~3"
REM Call :ClearVariablesByPrefix %_split_prefix% _split_prefix  & exit /b %_split_count%
REM delimiter could be array of multiple delimiter (if defined %~2  or if defined %~2.ubound)
REM inputstring can be byval or byref
REM output array appends to the end if existing
REM forget limit and compare method for now
::which results to return could be specified with a range
:: it should be possible to get just one result instead of the array
:: InputString could by byref (default byval)

:split-demo

set "_split_demo_test1=THIS,IS,A,TEST"
set "_split_demo_test1_delim=,"
call :split _split_demo_test1 _split_demo_test1_delim _split_demo_test1_array
call :echoarray _split_demo_test1_array VERTICALMODE
echo.
call :echoarray _split_demo_test1_array
Call :ClearVariablesByPrefix _split_demo

GoTo :EOF

:split-demo-helper

set "_SDH_input=%~1"
set "_SDH_delim=%~2"
set "_SDH_output=%~3"



GoTo :EOF

REM if defined %_GSSI_Search% set _GSSI_Search=!%_GSSI_Search%!
REM set "_GSSI_Input_Pointer=_GSSI_Input"
REM if defined !_GSSI_Input! (
 REM set "_GSSI_Input_Pointer=%_GSSI_Input%" 
 REM )
REM set /a _GSSI_StartIndex=%~3 2>nul
REM if not defined _GSSI_StartIndex set /a _GSSI_StartIndex=0

::Usage Call :IIF 0/1/true/false "%MacroIfTrue%" "%MacroIfFalse%" && echo Macro return value true/0 ||  echo Macro return value false/0
::Usage Call :Iterate InputArray "%Macro%" optional OutputArray
::Usage Call :IterateRange InputArray RangeArray "%Macro%" optional OutputArray

::Usage Call :split InputString Delimiter OutputArray optional limit optional comparemethod
:Split
set "_Split_prefix=_SPLT"
set "_SPLT_CaseSensitivity=/i"
set "_SPLT_Input=%~1"
set "_SPLT_Delimiter=%~2"
set "_SPLT_Output=%~3"
setlocal enabledelayedexpansion
set "_SPLT_localscope=true"
set "_SPLT_Input_Pointer=_SPLT_Input" 
set "_SPLT_Delimiter_Pointer=_SPLT_Delimiter"
if defined !_SPLT_Input! ( set "_SPLT_Input_Pointer=!_SPLT_Input!" )
if defined !_SPLT_Delimiter! ( set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter!" )
REM if defined !_SPLT_Delimiter!.ubound set /a _SPLT_Delimiter_ubound=!%_SPLT_Delimiter%.ubound!
REM if defined !_SPLT_Delimiter!.ubound set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter![!%_SPLT_Delimiter%.lbound!]"
if defined %_SPLT_Output%.ubound set /a _SPLT_Output_ubound=!%_SPLT_Output%.ubound!
if not defined _SPLT_Output_ubound set /a _SPLT_Output_ubound=-1
REM if numeric %~4 set "_SPLT_Limit=%~4"
REM if %~4 or %~5 is CASESENSITIVE (literal) set _SPLT_CaseSensitivity=
Call :len "%_SPLT_Input_Pointer%" _SPLT_Input_len
Call :len "%_SPLT_Delimiter_Pointer%" _SPLT_Delimiter_len
REM if not defined !_SPLT_Delimiter!.ubound GoTo :Split-get-delimiter-len-skip
REM :Split-get-delimiter-len-loop
REM FOR EACH DELIMITER, FIND DELIMITER.LEN
REM :Split-get-delimiter-len-skip
REM if defined _SPLT_Delimiter_ubound set /a _SPLT_Delimiter_index=0
set /a _SPLT_Index=0
set /a _SPLT_Elements_ubound=-1
:Split-loop
REM :Split-delimiter-loop
Call :GetSubstringIndex "%_SPLT_Input_Pointer%" "%_SPLT_Delimiter_Pointer%" %_SPLT_Index% _SPLT_end

REM Set search window len = 64
REM Search window for search term
REM if not found, move start index to end of current window, double window lenght, search again
REM if window len greater than input len and still not found, return only the current element
REM when search them is first found
REM search first half of this window, if found, half again and so on until reach "min search window len"
REM if not found in first half, search second half, if found, move startindex, half this part and so on until reach "min search window len"


REM ------------- ALL OF THIS SHOULD BE PART OF THE MAIN LOOP MAYBE
if %_SPLT_end% EQU -1 set /a _SPLT_end=%_SPLT_Input_len%
set /a _SPLT_Elements_ubound+=1
set /a _SPLT_Elements[%_SPLT_Elements_ubound%].start=%_SPLT_Index%
set /a _SPLT_Elements[%_SPLT_Elements_ubound%].len=%_SPLT_end%-%_SPLT_Index%
REM if %_SPLT_Delimiter_index% LEQ %_SPLT_Delimiter_ubound% GoTo :Split-delimiter-loop
set /a _SPLT_Index=%_SPLT_end%+%_SPLT_Delimiter_len%
if %_SPLT_end% NEQ %_SPLT_Input_len% GoTo :Split-loop
set /a _SPLT_Elements_index=0
:Split-copy-loop
set /a _SPLT_buffer_start=!_SPLT_Elements[%_SPLT_Elements_index%].start!
set /a _SPLT_buffer_count=!_SPLT_Elements[%_SPLT_Elements_index%].len!
set /a _SPLT_Output_ubound+=1
set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_buffer_start%,%_SPLT_buffer_count%!"
set /a _SPLT_Elements_index+=1

REM ------------- ALL OF THIS SHOULD BE PART OF THE MAIN LOOP MAYBE


if %_SPLT_Elements_index% LEQ %_SPLT_Elements_ubound% GoTo :Split-copy-loop
set /a %_SPLT_Output%.ubound=%_SPLT_Output_ubound%
for /F "delims=" %%a in ('set %_SPLT_Output%') do (
	endlocal
	set "%%a"
	)

Call :ClearVariablesByPrefix %_Split_prefix% _Split_prefix  & exit /b %_SPLT_count%
REM thanks to https://stackoverflow.com/questions/49041934/how-to-return-an-array-of-values-across-endlocal https://stackoverflow.com/a/49042678





---
first stage will need to determine all starts/ends of the elements
then go through the list of elements 
and write to output the elements

All this should happen within one enableddelayedexpansion
---
prepare
find substring, store start+end, repeat from end
for each stored start+end tuple, write output element

---
prepare all the variables
input is defined or not
delimiter is value, defined or array

pour chaque delimiter, start to substring, next start is substring+first matching delimiter


---

:AltSubString byref StartIndex InputString SearchString InputString.len SearchString
_ASS_StartIndex
_ASS_Input_len
_ASS_Search
_ASS_Search_len
_ASS_min_search
:AltSubString-loop
set /a _ASS_HalfInputLen=%_ASS_Search_len%+(%_ASS_Input_len%/2)
if %_ASS_HalfInputLen% LEQ %_ASS_min_search% ( 
	set /a _ASS_max_search=%_ASS_StartIndex%+%_ASS_min_search%+1 & GoTo :AltSubString-loop2 
	)
set /a _ASS_Middle=%_ASS_StartIndex%+%_ASS_HalfInputLen%
set /a _ASS_HalfInputLenPLUSSearchLenMINUSOne=%_ASS_HalfInputLen%+%_ASS_Search_len%-1
set _ASS_FirstHalf=!%_ASS_Input_Pointer%:~%_ASS_StartIndex%,%_ASS_HalfInputLenPLUSSearchLenMINUSOne%!
set _ASS_SecondHalf=!%_ASS_Input_Pointer%:~%_ASS_Middle%,%_ASS_HalfInputLen%!
set _ASS_FirstResult=!_ASS_FirstHalf:%_ASS_Search%=!
set _ASS_SecondResult=!_ASS_SecondHalf:%_ASS_Search%=!
if !_ASS_FirstHalf! NEQ !_ASS_FirstResult! ( set /a _ASS_Input_len=%_ASS_HalfInputLen% & GoTo :AltSubString-loop )
if !_ASS_SecondHalf! NEQ !_ASS_SecondResult! ( set /a _ASS_StartIndex=%_ASS_Middle% & GoTo :AltSubString-loop )
set /a _ASS_StartIndex=-1 & GoTo :AltSubString-end
:AltSubString-loop2
set _ASS_FinalSearch=!%_ASS_Input_Pointer%:~%_ASS_StartIndex%,%_ASS_Search_len%!
if !_ASS_FinalSearch! EQU !_ASS_Search! GoTo :AltSubString-end
set /a _ASS_StartIndex+=1
if %_ASS_StartIndex% LEQ %_ASS_max_search% GoTo :AltSubString-loop2
set /a _ASS_StartIndex=-1 & GoTo :AltSubString-end
endlocal & Call :ClearVariablesByPrefix _ASS

::Usage Call :GetSubstringIndex InputString SearchString StartIndex Optional OutputIndexVar ... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
:GetSubstringIndex
set "_GetSubstringIndex_prefix=_GSSI"
set _GSSI_Input=%~1
set _GSSI_Search=%~2
set /a _GSSI_StartIndex=%~3 2>nul
set "_GSSI_Output=%~4"
if not defined _GSSI_StartIndex set /a _GSSI_StartIndex=0
setlocal enabledelayedexpansion
if defined %_GSSI_Search% set _GSSI_Search=!%_GSSI_Search%!
set "_GSSI_Input_Pointer=_GSSI_Input"
if defined !_GSSI_Input! (
 set "_GSSI_Input_Pointer=%_GSSI_Input%" 
 )
Call :len "%_GSSI_Input_Pointer%" _GSSI_Input_len
if defined "%_GSSI_Search%" Call :len "%_GSSI_Search%" _GSSI_Search_len
if not defined "%_GSSI_Search%" Call :len _GSSI_Search _GSSI_Search_len
set /a _GSSI_Input_len-=1
set /a _GSSI_min_search=(%_GSSI_Search_len%*2)

REM Start checking from 0 to 5 (times _GSSI_Search_len)
REM then double search len until found, or end of string reached
REM on each doubling, more startindex to end of region known not to contain search term
REM on first found
REM check first half, if not found second half
REM next check half of found then second half of found 
REM until you reach min search len then go to stage 3

:GetSubstringIndex-loop

REM start searching 64 char of input len, go up if not found, doubling until the rest of the input is searched 
REM probably use findstr instead of string substitution for finding match, at least in stage 1
REM once match is found, narrow down by splitting search in half

set /a _GSSI_HalfInputLen=%_GSSI_Search_len%+(%_GSSI_Input_len%/2)
if %_GSSI_HalfInputLen% LEQ %_GSSI_min_search% ( 
	set /a _GSSI_max_search=%_GSSI_StartIndex%+%_GSSI_min_search%+1 & GoTo :GetSubstringIndex-loop2 
	)
set /a _GSSI_Middle=%_GSSI_StartIndex%+%_GSSI_HalfInputLen%
set /a _GSSI_HalfInputLenPLUSSearchLenMINUSOne=%_GSSI_HalfInputLen%+%_GSSI_Search_len%-1
set _GSSI_FirstHalf=!%_GSSI_Input_Pointer%:~%_GSSI_StartIndex%,%_GSSI_HalfInputLenPLUSSearchLenMINUSOne%!
set _GSSI_SecondHalf=!%_GSSI_Input_Pointer%:~%_GSSI_Middle%,%_GSSI_HalfInputLen%!
set _GSSI_FirstResult=!_GSSI_FirstHalf:%_GSSI_Search%=!
set _GSSI_SecondResult=!_GSSI_SecondHalf:%_GSSI_Search%=!
if !_GSSI_FirstHalf! NEQ !_GSSI_FirstResult! ( set /a _GSSI_Input_len=%_GSSI_HalfInputLen% & GoTo :GetSubstringIndex-loop )
if !_GSSI_SecondHalf! NEQ !_GSSI_SecondResult! ( set /a _GSSI_StartIndex=%_GSSI_Middle% & GoTo :GetSubstringIndex-loop )
set /a _GSSI_StartIndex=-1 & GoTo :GetSubstringIndex-end
:GetSubstringIndex-loop2
set _GSSI_FinalSearch=!%_GSSI_Input_Pointer%:~%_GSSI_StartIndex%,%_GSSI_Search_len%!
if !_GSSI_FinalSearch! EQU !_GSSI_Search! GoTo :GetSubstringIndex-end
set /a _GSSI_StartIndex+=1
if %_GSSI_StartIndex% LEQ %_GSSI_max_search% GoTo :GetSubstringIndex-loop2
set /a _GSSI_StartIndex=-1 & GoTo :GetSubstringIndex-end
:GetSubstringIndex-end
if "[%~7]" NEQ "[]" ( shift & shift & shift & shift & shift & GoTo :GetSubstringIndex )
endlocal & set _GSSI_StartIndex=%_GSSI_StartIndex% & if defined _GSSI_Output set /a %_GSSI_Output%=%_GSSI_StartIndex%
Call :ClearVariablesByPrefix %_GetSubstringIndex_prefix% _GetSubstringIndex_prefix & exit /b %_GSSI_StartIndex% 

::Usage Call :CreateRandomStringPS [NONUMBERS] [NOUPPERCASE] [NOUPPERCASE] [SPACE] [PUNCTUATION] [NOPOISON] [POISON] [EXTENDED] [CONTROL] [RESET] Stringlength1 OutputVariable1 Stringlength2 OutputVariable2 ... StringlengthN OutputVariableN
::You can your CLEAR in front of the switches to clear them
:CreateRandomStringPS
set "_CreateRandomStringPS_prefix=_CRS"
set "_CRS_SetList=NONUMBERS NOUPPERCASE NOLOWERCASE SPACE PUNCTUATION NOPOISON EXTENDED CONTROL NOPOISON POISON"
if "[%~1]" EQU "[RESET]" ( for %%a in (%_CRS_SetList%) do ( set "_CRS_%%a=" ) & shift & GoTo :CreateRandomStringPS )
for %%a in (%_CRS_SetList%) do if "[%%a]" EQU "[%~1]" ( set "_CRS_%%a=true" & shift & GoTo :CreateRandomStringPS ) else ( if "[CLEAR%%a]" EQU "[CLEAR%~1]" ( set "_CRS_%%a=" & shift & GoTo :CreateRandomStringPS ) )
set /a _CRS_Len=%~1
set "_CRS_Output=%~2"
set "_CRS_CurrentSet="
if not defined _CRS_NONUMBERS set "_CRS_CurrentSet=%_CRS_CurrentSet% + 48..57"
if not defined _CRS_NOUPPERCASE set "_CRS_CurrentSet=%_CRS_CurrentSet% + 65..90"
if not defined _CRS_NOLOWERCASE set "_CRS_CurrentSet=%_CRS_CurrentSet% + 97..122"
if defined _CRS_SPACE set "_CRS_CurrentSet=%_CRS_CurrentSet% + 32"
if defined _CRS_PUNCTUATION if not defined _CRS_NOPOISON ( set "_CRS_CurrentSet=%_CRS_CurrentSet% + 33..47 + 58..64 + 91..96 + 123..126" ) else ( set "_CRS_CurrentSet=%_CRS_CurrentSet%+ 35..36 + 39 + 42..47 + 58..59 + 61 + 63..64 + 91..93 + 95..96 + 123 + 125 + 126" )
if defined _CRS_POISON if not defined _CRS_PUNCTUATION  set "_CRS_CurrentSet=%_CRS_CurrentSet% + 33 + 34 + 37 + 38 + 40 + 41 + 60 + 62 + 94 + 124"
if defined _CRS_EXTENDED set "_CRS_CurrentSet=%_CRS_CurrentSet% + 128..255"
if defined _CRS_CONTROL set "_CRS_CurrentSet=%_CRS_CurrentSet% + 0..31 + 127"
for /f "tokens=1* delims=" %%a in ('powershell -command "-join (1..%_CRS_Len% | ForEach-Object { %_CRS_CurrentSet:~3% | Get-Random } | ForEach-Object { [char]$_ })" 2^>nul') do set %_CRS_Output%=%%a
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" ( shift & shift & GoTo :CreateRandomStringPS )
Call :ClearVariablesByPrefix %_CreateRandomStringPS_prefix% _CreateRandomStringPS_prefix & GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF


:len <resultVar> <stringVar>
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

::Usage Call :EchoWithoutNewline text to be printed without a newline
:EchoWithoutNewline
echo|set /p="%*"
GoTo :EOF

::Usage Call :rnd Output optional Min optional Max
:: returns 0-100, based on tenth of a second of %time%
:: Unless optional min / max are specified
:rnd
if "[%~2]"=="[]" ( set /a "_rnd_min=0" ) else ( set /a "_rnd_min=%~2" )
if "[%~3]"=="[]" ( set /a "_rnd_max=100" ) else ( set /a "_rnd_max=%~3" )
set /a %~1=%RANDOM% * (%_rnd_max% - %_rnd_min% + 1) / 32768 + %_rnd_min%
GoTo :EOF

REM functional
REM add echo array "verticalmode" (no LF between array elements)
::Usage Call :EchoArray InputArray optional LINENUMBERS optional SHOWVARNAME optional .Suffix optional IndexRange
:EchoArray
set "_EchoArray_input=%~1"
call set /a "_EchoArray_lbound=%%%~1.lbound%%" 2>nul
if "[%_EchoArray_lbound%]" EQU "[]" set /a "_EchoArray_lbound=0"
call set /a "_EchoArray_ubound=%%%~1.ubound%%"
set /a "_EchoArray_index=%_EchoArray_lbound%"
shift
:EchoArray-arguments
set "_EchoArray_buffer=%~1"
if not defined _EchoArray_buffer GoTo :EchoArray-arguments-end
if "[%_EchoArray_buffer:~,1%]" EQU "[.]" ( set "_EchoArray_suffix=%_EchoArray_buffer%" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[LINENUMBERS]" ( set "_EchoArray_showlinenumbers=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[SHOWVARNAME]" ( set "_EchoArray_showvariablename=true" & shift & GoTo :EchoArray-arguments )
if "[%_EchoArray_buffer%]" EQU "[VERTICALMODE]" ( set "_EchoArray_verticalmode=true" & shift & GoTo :EchoArray-arguments )
if "[%~1]" NEQ "[]" if not defined _EchoArray_IndexList.lbound set /a "_EchoArray_IndexList.lbound=1"
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _EchoArray_IndexList "%~1" & shift & GoTo :EchoArray-arguments )
:EchoArray-arguments-end
if defined _EchoArray_IndexList.ubound set /a "_EchoArray_ubound=%_EchoArray_IndexList.ubound%"
setlocal enabledelayedexpansion
:EchoArray-loop
if not defined _EchoArray_IndexList.ubound ( set "_EchoArray_index_actual=%_EchoArray_index%" ) else ( set "_EchoArray_index_actual=!_EchoArray_IndexList[%_EchoArray_index%]!" )
if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:
if defined _EchoArray_showvariablename set _EchoArray_prefix=%_EchoArray_input%[%_EchoArray_index_actual%]:
if defined _EchoArray_showvariablename if defined _EchoArray_showlinenumbers set _EchoArray_prefix=%_EchoArray_index%:%_EchoArray_input%[%_EchoArray_index_actual%]:
if not defined _EchoArray_verticalmode GoTo :EchoArray-normalmode-loop-next
<nul set /p =%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%! 
GoTo :EchoArray-loop-next
:EchoArray-normalmode-loop-next
REM echo(%_EchoArray_prefix%%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%
echo(%_EchoArray_prefix%!%_EchoArray_input%[%_EchoArray_index_actual%]%_EchoArray_suffix%!
:EchoArray-loop-next
set /a "_EchoArray_index+=1"
if %_EchoArray_index% LEQ %_EchoArray_ubound% GoTo :EchoArray-loop
:EchoArray-loop-end
endlocal
Call :ClearVariablesByPrefix _EchoArray
GoTo :EOF

