@echo off


REM Call :split-demo
REM GoTo :EOF


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

REM parameters of CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED

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


:split-demo

REM GoTo :split-demo-skip-max-lenght-test
REM GoTo :split-demo-skip-4.1

GoTo :split-demo-skip-1
echo.
echo Basic tests, byval input and byval delimiter
echo.
call :split-demo-helper "THIS,IS,A,TEST" "," _split_demo_array "classic comma separated, works"
call :split-demo-helper "THIS.IS.A.TEST" "." _split_demo_array "using dots instead, works"
call :split-demo-helper "THISZISZAZTEST" "Z" _split_demo_array "using a letter, Z, works"
call :split-demo-helper "THIS::IS::A::TEST" "::" _split_demo_array "using two character delimiter, double punctuation, works"
call :split-demo-helper "THIS123IS123A123TEST" "123" _split_demo_array "using three characters, numbers, works" 
call :split-demo-helper "THIS[COLUMN]IS[COLUMN]A[COLUMN]TEST" "[COLUMN]" _split_demo_array "using delimiter inside square brackets, works"
call :split-demo-helper "THIS^IS^A^TEST" "^" _split_demo_array "carret poison character, carrets get doubled in the call because "string byval" but works works"
call :split-demo-helper "THIS^^IS^^A^^TEST" "^^" _split_demo_array "carret poison character, carrets get doubled in the call because "string byval" but works works"
REM call :split-demo-helper "THIS%%IS%%A%%TEST" "%%" _split_demo_array "percent signs, strangely returns ubound=6 but empty elements"      I think this breaks the helper function to begin with
call :split-demo-helper "THIS|IS|A|TEST" "|" _split_demo_array  "pipe poison character, pipe, works"
REM call :split-demo-helper "THIS!IS!A!TEST" "!" _split_demo_array  "exclamation poison character, exclamation mark, breaks the test with infinite loop"
call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works"
:split-demo-skip-1

GoTo :split-demo-skip-2
echo.
echo Now using byref instead of byval
echo.
set "_split_demo_test=THIS,IS,A,TEST" & set "_split_demo_delim=," & set "_split_demo_comment=classic comma separated, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS.IS.A.TEST" & set "_split_demo_delim=." & set "_split_demo_comment=using dots instead, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THISZISZAZTEST" & set "_split_demo_delim=Z" & set "_split_demo_comment=using a letter, Z, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS::IS::A::TEST" & set "_split_demo_delim=::" & set "_split_demo_comment=using two character delimiter, double punctuation, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS123IS123A123TEST" & set "_split_demo_delim=123" & set "_split_demo_comment=using three characters, numbers, works" 
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS[COLUMN]IS[COLUMN]A[COLUMN]TEST" & set "_split_demo_delim=[COLUMN]" & set "_split_demo_comment=using delimiter inside square brackets, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS^IS^A^TEST" & set "_split_demo_delim=^" & set "_split_demo_comment=poison character, carret, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array  "%_split_demo_comment%"
set "_split_demo_test=THIS^^IS^^A^^TEST" & set "_split_demo_delim=^^" & set "_split_demo_comment=poison character, double carret, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS&IS&A&TEST" & set "_split_demo_delim=&" & set "_split_demo_comment=poison character, ampersands, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS%%IS%%A%%TEST" & set "_split_demo_delim=%%" & set "_split_demo_comment=percent signs, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
set "_split_demo_test=THIS|IS|A|TEST" & set "_split_demo_delim=|" & set "_split_demo_comment=poison character, pipe, works"
call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
REM set "_split_demo_test=THIS!IS!A!TEST" & set "_split_demo_delim=!" & set "_split_demo_comment=poison character, exclamation mark, breaks the test with infinite loop"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
REM set "_split_demo_test=THIS^!IS^!A^!TEST" & set "_split_demo_delim=^!" & set "_split_demo_comment=poison character, exclamation mark, breaks the test with infinite loop"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
:split-demo-skip-2

GoTo :split-demo-skip-3
echo.
echo more tests
echo.

REM call :split-demo-helper "," "," _split_demo_array "1 char string that contains only the delimiter, should return two empty array element BUT BREAKS TEST WITH INFINIT LOOP"
call :split-demo-helper "." "," _split_demo_array "1 char string that doesn't contains only the delimiter, should return one array element with input"
call :split-demo-helper "1234567890" "," _split_demo_array "10 char string that doesn't contains only the delimiter, should return one array element with input"
:split-demo-skip-3

GoTo :split-demo-skip-4
echo.
echo test with long input strings
echo.
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" "[]" _split_demo_array "1006 characters long input string"
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" "[]" _split_demo_array "2014 characters long input string"
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" "[]" _split_demo_array "4026 characters long input string"
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567892" "[]" _split_demo_array "8150 characters long input string"

REM GoTo :split-demo-skip-4
:split-demo-skip-max-lenght-test
echo test 8162 char length
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567892" "[]" _split_demo_array "8162 characters long input string"
GoTo :split-demo-skip-4
REM broken after this point
echo test 8163 char length, will break, limit is 8162
call :split-demo-helper "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678929" "[]" _split_demo_array "8163 characters long input string"
:split-demo-skip-4


:split-demo-skip-max-element-test
echo.
echo max element count test
call :split-demo-helper ".,.,.,.,.,.,.,.,.,." "," _split_demo_array "10 dot element"
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "100 dot element"
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "1000 dot element"
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "4000 dot element"
echo 4082 element split
call :split-demo-helper ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." "," _split_demo_array "4082 dot element"
:split-demo-skip-4.1





REM -----------
REM commands before the call
REM commands after the call 
REM pipe, ampersand, redirects before and after
REM percent sign expansions before and after the call
REM call before, after and both
REM double quotes before of after call
REM -----------

REM GoTo :split-demo-functioncalltest-skip

echo.
echo function call split test
echo.

set "_calltest[1]=call :test
set "_calltest[2]=call test.bat"
set "_calltest[3]=call %test%"
set "_calltest[4]=call %:test%"
set "_calltest[5]=call test"

set "_calltest[6]=call :test&echo test"
set "_calltest[7]=call test.bat&echo test"
set "_calltest[8]=call %test%&echo test"
set "_calltest[9]=call %:test%&echo test"
set "_calltest[10]=call test&echo test"

set "_calltest[11]=call :test &echo test"
set "_calltest[12]=call test.bat &echo test"
set "_calltest[13]=call %test% &echo test"
set "_calltest[14]=call %:test% &echo test"
set "_calltest[15]=call test &echo test"

set "_calltest[16]=call :test|echo test"
set "_calltest[17]=call test.bat|echo test"
set "_calltest[18]=call %test%|echo test"
set "_calltest[19]=call %:test%|echo test"
set "_calltest[30]1=call test|echo test"

set "_calltest[31]=call :test |echo test"
set "_calltest[32]=call test.bat |echo test"
set "_calltest[33]=call %test% |echo test"
set "_calltest[34]=call %:test% |echo test"
set "_calltest[35]=call test |echo test"

set "_calltest[36]=call :test>echo test"
set "_calltest[37]=call test.bat>echo test"
set "_calltest[38]=call %test%>echo test"
set "_calltest[39]=call %:test%>echo test"
set "_calltest[40]=call test>echo test"

set "_calltest[41]=call :test >echo test"
set "_calltest[42]=call test.bat >echo test"
set "_calltest[43]=call %test% >echo test"
set "_calltest[44]=call %:test% >echo test"
set "_calltest[45]=call test >echo test"

set "_calltest[46]=call :test<echo test"
set "_calltest[47]=call test.bat<echo test"
set "_calltest[48]=call %test%<echo test"
set "_calltest[49]=call %:test%<echo test"
set "_calltest[50]=call test<echo test"

set "_calltest[51]=call :test <echo test"
set "_calltest[52]=call test.bat <echo test"
set "_calltest[53]=call %test% <echo test"
set "_calltest[54]=call %:test% <echo test"
set "_calltest[55]=call test <echo test"

set "_calltest[56]=call :test argument1 argument2"
set "_calltest[57]=call test.bat argument1 argument2"
set "_calltest[58]=call %test% argument1 argument2"
set "_calltest[59]=call %:test% argument1 argument2"
set "_calltest[60]=call test argument1 argument2"

set "_calltest[61]=call :test argument1 argument2 &echo test"
set "_calltest[62]=call test.bat argument1 argument2 &echo test"
set "_calltest[63]=call %test% argument1 argument2 &echo test"
set "_calltest[64]=call %:test% argument1 argument2 &echo test"
set "_calltest[65]=call test argument1 argument2 &echo test"

set "_calltest[66]=call :test argument1 argument2&echo test"
set "_calltest[67]=call test.bat argument1 argument2&echo test"
set "_calltest[68]=call %test% argument1 argument2&echo test"
set "_calltest[69]=call %:test% argument1 argument2&echo test"
set "_calltest[70]=call test argument1 argument2&echo test"

set "_calltest[71]=call :test argument1 argument2 |echo test"
set "_calltest[72]=call test.bat argument1 argument2 |echo test"
set "_calltest[73]=call %test% argument1 argument2 |echo test"
set "_calltest[74]=call %:test% argument1 argument2 |echo test"
set "_calltest[75]=call test argument1 argument2 |echo test"

set "_calltest[76]=call :test argument1 argument2|echo test"
set "_calltest[77]=call test.bat argument1 argument2|echo test"
set "_calltest[78]=call %test% argument1 argument2|echo test"
set "_calltest[79]=call %:test% argument1 argument2|echo test"
set "_calltest[80]=call test argument1 argument2|echo test"

set "_calltest[81]=call :test argument1 argument2 >echo test"
set "_calltest[82]=call test.bat argument1 argument2 >echo test"
set "_calltest[83]=call %test% argument1 argument2 >echo test"
set "_calltest[84]=call %:test% argument1 argument2 >echo test"
set "_calltest[85]=call test argument1 argument2 >echo test"

set "_calltest[86]=call :test argument1 argument2>echo test"
set "_calltest[87]=call test.bat argument1 argument2>echo test"
set "_calltest[88]=call %test% argument1 argument2>echo test"
set "_calltest[89]=call %:test% argument1 argument2>echo test"
set "_calltest[90]=call test argument1 argument2>echo test"

set "_calltest[91]=call :test argument1 argument2 <echo test"
set "_calltest[92]=call test.bat argument1 argument2 <echo test"
set "_calltest[93]=call %test% argument1 argument2 <echo test"
set "_calltest[94]=call %:test% argument1 argument2 <echo test"
set "_calltest[95]=call test argument1 argument2 <echo test"

set "_calltest[96]=call :test argument1 argument2<echo test"
set "_calltest[97]=call test.bat argument1 argument2<echo test"
set "_calltest[98]=call %test% argument1 argument2<echo test"
set "_calltest[99]=call %:test% argument1 argument2<echo test"
set "_calltest[100]=call test argument1 argument2<echo test"

set /a _split_demo_functioncalltest_index=0
:split-demo-functioncalltest-loop

call :split _calltest[%_split_demo_functioncalltest_index%] "call" _split_demo_functioncalltest_split_result

call :split _split_demo_functioncalltest_split_result[1] 

set /a _split_demo_functioncalltest_index+=1
if %_split_demo_functioncalltest_index% GTR 100  GoTo :split-demo-functioncalltest-loop

:split-demo-functioncalltest-skip

echo.
echo experimental/debug tests
echo.

REM :GetFunctionDependencies batchfile outputvar optional functionnames ...
REM ::returns all dependencies of all or select functions
REM getfunctionrows
REM for each line of text from the function
REM find call statements
REM for each call statement, get functionname and type (internal, external, macro, command, program)

REM call :myfunction - internal call
REM call myfunction.bat - external call
REM call %:myfunction% - macro call
REM call echo - command call
REM call findstr - program call
REM call bfw function - BFW call

REM split line on "call ", there must always be a space or tab between call and function name (do we really check for tabs ?)














REM call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works now"


REM GoTo :split-demo-skip-5
REM call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works now"
:split-demo-skip-5
REM GoTo :split-demo-skip-6
REM set "_split_demo_test=THIS&IS&A&TEST" & set "_split_demo_delim=&" & set "_split_demo_comment=poison character, ampersands, works now"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
:split-demo-skip-6

Call :ClearVariablesByPrefix _split_demo

GoTo :EOF

:split-demo-helper

set "_SDH_input=%~1"
set "_SDH_delim=%~2"
set "_SDH_output=%~3"
setlocal enabledelayedexpansion
echo delimiter :!_SDH_delim!: input string :!_SDH_input!: comment : %~4
call :split "!_SDH_input!" "!_SDH_delim!" !_SDH_output!
call :echoarray !_SDH_output! LINENUMBERS VERTICALMODE
echo.
endlocal 
Call :ClearVariablesByPrefix %_SDH_output%
GoTo :EOF

:split-demo-2-helper

set "_SDH_input=%~1"
set "_SDH_delim=%~2"
set "_SDH_output=%~3"
setlocal enabledelayedexpansion
echo delimiter :!%_SDH_delim%!: input string :!%_SDH_input%!: comment %~4
call :split "!_SDH_input!" "!_SDH_delim!" !_SDH_output!
call :echoarray !_SDH_output! LINENUMBERS VERTICALMODE
echo.
endlocal 
Call :ClearVariablesByPrefix %_SDH_output%
GoTo :EOF


::Usage Call :IIF 0/1/true/false "%MacroIfTrue%" "%MacroIfFalse%" && echo Macro return value true/0 ||  echo Macro return value false/0
::Usage Call :Iterate InputArray "%Macro%" optional OutputArray
::Usage Call :IterateRange InputArray RangeArray "%Macro%" optional OutputArray


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



::Usage Call :IsNumeric Value optional Output
:IsNumeric
set "IsNumericInternal=0123456789"
echo.%1| findstr /r "[^0123456789]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

:IF-versus-FINDSTR
setlocal enabledelayedexpansion
Set "_IVF_Input=THIS IS a TEST"
Set "_IVF_Search=IS"
Set /a _IVF_count=10000
set "_IVF_callback_label=:IF-versus-FINDSTR-1"
GoTo :IF-versus-FINDSTR-loop-start
:IF-versus-FINDSTR-1
Set "_IVF_Input=THIS IS a TEST with many characters 012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689012345689"
Set "_IVF_Search=IS"
Set /a _IVF_count=10000
set "_IVF_callback_label=:IF-versus-FINDSTR-2"
GoTo :IF-versus-FINDSTR-loop-start
:IF-versus-FINDSTR-2
:IF-versus-FINDSTR-3
:IF-versus-FINDSTR-4
GoTo :EOF
:IF-versus-FINDSTR-loop-start
Set /a _IVF_index=1
echo start IF TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FINDSTR-loop
set "_IVF_buffer=!_IVF_Input:%_IVF_Search%=!
if !_IVF_Input! EQU !_IVF_buffer! ( set "_IVF_result=true" ) else ( set "_IVF_result=false" )
Set /a _IVF_index+=1
if %_IVF_index% LSS %_IVF_count% GoTo :IF-versus-FINDSTR-loop
echo end IF TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FIND-loop-loop-start
Set /a _IVF_index=1
echo start FIND TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FIND-loop-loop
echo.!_IVF_Input!| find "!_IVF_Search!" >nul && ( set "_IVF_result=true" ) || ( set "_IVF_result=false" )
Set /a _IVF_index+=1
if %_IVF_index% LSS %_IVF_count% GoTo :IF-versus-FIND-loop-loop
echo end FIND TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FINDSTR-loop-loop-loop-start
Set /a _IVF_index=1
echo start FINDSTR TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
:IF-versus-FINDSTR-loop-loop-loop
echo.!_IVF_Input!| findstr /c:"!_IVF_Search!" >nul && ( set "_IVF_result=true" ) || ( set "_IVF_result=false" )
Set /a _IVF_index+=1
if %_IVF_index% LSS %_IVF_count% GoTo :IF-versus-FINDSTR-loop-loop-loop
echo end FINDSTR TEST %time% count %_IVF_count% search %_IVF_Search% input %_IVF_Input%
GoTo %_IVF_callback_label%
endlocal
GoTo :EOF


::Usage Call :GetArgumentString OutputString [SHIFT [X] [/X] [X/]] [DOUBLEQUOTE [']] [DEDUPLICATECARRETS] [TOARRAY] [INCLUDECALLER] %*
:GetArgumentString
set "_GAS_prefix=_GAS"
set "_GAS_Output=%~1" & shift
setlocal enabledelayedexpansion
:GetArgumentString-args
set "_GAS_buffer=%~2"
if "[%~1]" EQU "[SHIFT]" ( echo.%~2| findstr /r "[^0123456789]" >nul && ( set /a "_GAS_Shift=%~2" & shift & shift & GoTo :GetArgumentString-args ) || ( set /a "_GAS_Shift=0" & shift & GoTo :GetArgumentString-args ) )
if "[%~1]" EQU "[DOUBLEQUOTE]" ( if "[%_GAS_buffer:~1,1%]" EQU "[]" ( Set "_GAS_QUOTE="" ) else ( Set "_GAS_QUOTE=%_GAS_buffer:~0,1%" ) & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[DEDUPLICATECARRETS]" ( set "_GAS_DEDUPLICATE_CARRETS=true" & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[TOARRAY]" ( set "_GAS_ToArray=true" & shift & GoTo :GetArgumentString-args )
if "[%~1]" EQU "[EXCLUDE]" ( if not defined _GAS_Exclude_ubound ( set /a _GAS_Exclude_ubound=0 ) else ( set /a _GAS_Exclude_ubound+=1 ) 
if "[%~1]" EQU "[EXCLUDE]" ( set "_GAS_Exclude[%_GAS_Exclude_ubound%]=%_GAS_buffer%" & shift & shift & GoTo :GetArgumentString-args )
if defined _GAS_ToArray if defined %_GAS_Output%.ubound call set /a _GAS_Output_ubound=%%%_GAS_Output%.ubound%%
if defined _GAS_ToArray if not defined _GAS_Output_ubound set /a _GAS_Output_ubound=-1
if not defined _GAS_Shift GoTo :GetArgumentString-loop
set /a _GAS_shift_index=0
:GetArgumentString-shift-loop
shift
if %_GAS_shift_index% LSS %_GAS_Shift% GoTo :GetArgumentString-shift-loop 
:GetArgumentString-loop
if defined _GAS_Exclude.ubound if %_GAS_Exclude_index% LEQ %_GAS_Exclude_ubound% ( if "[!_GAS_Exclude[%_GAS_Exclude_index%]!]" EQU "[%~1]" ( shift & set /a _GAS_Exclude_index=0 & GoTo :GetArgumentString-loop ) else ( set /a _GAS_Exclude_index+=1 & GoTo :GetArgumentString-loop ) )
if defined _GAS_ToArray if defined _GAS_Output_ubound set /a _GAS_Output_ubound+=1
if defined _GAS_ToArray set "%_GAS_Output%[%_GAS_Output_ubound%]=%~1"
set "_GAS_output_buffer=!_GAS_output_buffer! !_GAS_QUOTE!%~2!_GAS_QUOTE!"
if defined _GAS_ToArray set /a _GAS_Exclude_index=0
if "[%2]" NEQ "[]" GoTo :GetArgumentString-loop
if defined _GAS_ToArray set /a %_GAS_Output%.ubound=%_GAS_Output_ubound%
set /a "%_GAS_Output%=!_GAS_output_buffer!"
for /F "delims=" %%a in ('set %_GAS_Output%') do (
	endlocal
	set "%%a"
	)
GoTo :EOF


REM _SPLT_count is not being counted, number of total elements added to output
REM Features to add [TRIM] TRIMLEFT TRIMRIGHT [TRIM] [TRIMLEFT:[-],'"] TRIMRIGHT:ABC TRUNKATE:25 NOEMPTY 1D 2D 3D XD ESCAPE:& INCLUDEDELIMITERS REGEX: IGNOREQUOTE:[] RUNMACRO TUPLE OVERLAP
REM [LIMIT] [STARTINDEX] [RANGE] [Nth]
REM arguments should be [CASESENSITIVE] [etc.] inputstring outputarray delimiter1 delimiter2 ... delimiterN
REM this will need a startindex probably, to start at a certain position in the string
::Usage Call :split InputString Delimiter OutputArray optional limit [CASESENSITIVE]
:Split
set "_Split_prefix=_SPLT"
set "_SPLT_CaseSensitivity=/i"
if "[%~1]" EQU "[CASESENSITIVE]" ( set "_SPLT_CaseSensitivity=" & shift )
set "_SPLT_Input=%~1"
set "_SPLT_Delimiter=%~2"
set "_SPLT_Output=%~3"
shift & shift & shift
echo.%~1| findstr /r "[^0123456789]" >nul && ( set /a _SPLT_Limit=%~1 & shift )
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
Call :len "%_SPLT_Input_Pointer%" _SPLT_Input_len
Call :len "%_SPLT_Delimiter_Pointer%" _SPLT_Delimiter_len
REM if not defined !_SPLT_Delimiter!.ubound GoTo :Split-get-delimiter-len-skip
REM :Split-get-delimiter-len-loop
REM FOR EACH DELIMITER, FIND DELIMITER.LEN
REM :Split-get-delimiter-len-skip
REM if defined _SPLT_Delimiter_ubound set /a _SPLT_Delimiter_index=0
REM :Split-delimiter-loop ?
set /a _SPLT_StartIndex=0
set /a _SPLT_Index=0
set "_SPLT_Search=!%_SPLT_Delimiter_Pointer%!"
:Split-loop
set /a _SPLT_remaining_input_len=%_SPLT_Input_len%-%_SPLT_Index%
if %_SPLT_remaining_input_len% LSS 64 ( set /a _SPLT_Search_Window_len=%_SPLT_remaining_input_len% ) else ( set /a _SPLT_Search_Window_len=64 )
:Split-substring-pre-loop
set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
set _SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!
set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
if %_SPLT_CaseSensitivity% !_SPLT_CurrentWindow! EQU !_SPLT_CurrentWindowResult! ( if %_SPLT_Search_Window_len% GEQ %_SPLT_remaining_input_len% ( set /a _SPLT_Index=%_SPLT_Input_len% & GoTo :Split-substring-end ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len%-1 & set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%*2 & GoTo :Split-substring-pre-loop ) )
set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2
:Split-substring-loop
set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
set _SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!
set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
REM set _SPLT
if %_SPLT_CaseSensitivity% !_SPLT_CurrentWindow! NEQ !_SPLT_CurrentWindowResult! ( if %_SPLT_Search_Window_len% EQU 1 ( GoTo :Split-substring-end ) else ( set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2 ) ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len% )
GoTo :Split-substring-loop 
:Split-substring-end
if %_SPLT_Index% EQU -1 ( set /a _SPLT_Len=%_SPLT_Input_len%-%_SPLT_Index% ) else ( set /a _SPLT_Len=%_SPLT_Index%-%_SPLT_StartIndex% )
set /a _SPLT_Output_ubound+=1
REM echo set "%_SPLT_Output%[%_SPLT_Output_ubound%]=^!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%^!"
set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%!"
REM if %_SPLT_Delimiter_index% LEQ %_SPLT_Delimiter_ubound% GoTo :Split-delimiter-loop
set /a _SPLT_StartIndex=%_SPLT_Index%+%_SPLT_Delimiter_len%
set /a _SPLT_Index=%_SPLT_StartIndex%
if %_SPLT_Index% LSS %_SPLT_Input_len% GoTo :Split-loop
set /a %_SPLT_Output%.ubound=%_SPLT_Output_ubound%
for /F "delims=" %%a in ('set %_SPLT_Output%') do (
	endlocal
	set "%%a"
	)
if defined _SPLT_localscope endlocal
Call :ClearVariablesByPrefix %_Split_prefix% _Split_prefix  & exit /b %_SPLT_count%
REM thanks to https://stackoverflow.com/questions/49041934/how-to-return-an-array-of-values-across-endlocal https://stackoverflow.com/a/49042678


























REM [NODEREFERENCE] to disable byref
::Usage Call :GetSubstringIndex [CASESENSITIVE] InputString optional StartIndex optional [OUTPUT OutputIndexVar] Delimiter1 Delimiter2 ... DelimiterN ??... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
::Usage Call :GetSubstringIndex InputString SearchString optional StartIndex OutputIndexVar ... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
:GetSubstringIndex
set "_GetSubstringIndex_prefix=_GSSI"
setlocal enabledelayedexpansion
set "_GSSI_CaseSensitivity=/i"
:GetSubstringIndex-args
if "[%~1]" EQU "[CASESENSITIVE]" ( set "_GSSI_CaseSensitivity=" & shift & GoTo :GetSubstringIndex-args )
if "[%~1]" EQU "[OUTPUT]" ( set "_GSSI_Output=%~2" & shift & shift & GoTo :GetSubstringIndex-args )
if not defined _GSSI_Input ( set "_GSSI_Input=%~1" & shift & GoTo :GetSubstringIndex-args )
echo.%~1| findstr /r "[^0123456789]" >nul && ( set /a _GSSI_StartIndex=%~1 & shift )
set /a _GSSI_Delimiter.ubound=-1
:GetSubstringIndex-delimiters-args
set "_GSSI_Buffer=%~1"
REM if defined _GSSI_Buffer if "[%_GSSI_Buffer:~1,3%]" EQU "[DIM]" if "[%_GSSI_Buffer%]" EQU "[]" ( set /a _GSSI_Delimiter_Dimension=%_GSSI_Buffer:~0,1% )
REM if defined _GSSI_Buffer if "[%_GSSI_Buffer:~4,1%]" EQU "[]" ( set /a _GSSI_Delimiter_Dimension=%_GSSI_Buffer:~0,1% 2>nul )
if defined %~1.ubound ( set "_GSSI_Delimiter_is_array=true" )
set /a _GSSI_Delimiter.index=0
if defined %~1.ubound ( set /a _GSSI_Delimiter_input_array_ubound=!%~1.ubound! 2>nul ) else ( set /a _GSSI_Delimiter_input_array_ubound=-1 )
:GetSubstringIndex-delimiters-loop-args
if "[%~1]" NEQ "[]" set /a _GSSI_Delimiter.ubound+=1
if "[%~1]" NEQ "[]" if defined _GSSI_Delimiter_is_array set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=%~1"
if "[%~1]" NEQ "[]" if defined _GSSI_Delimiter_is_array echo _GSSI_Delimiter_is_array is defined 
if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=!%~1[%_GSSI_Delimiter.index%]!"
if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array echo _GSSI_Delimiter_is_array is not defined
if defined _GSSI_Delimiter_is_array set /a _GSSI_Delimiter.index+=1
if defined _GSSI_Delimiter_is_array if %_GSSI_Delimiter.index% LEQ %_GSSI_Delimiter_input_array_ubound% ( GoTo :GetSubstringIndex-delimiters-loop-args )
set "_GSSI_Delimiter.index=" & set "_GSSI_Delimiter_is_array=" & if "[%~2]" NEQ "[]" ( shift & GoTo :GetSubstringIndex-delimiters-args )
set /a _GSSI_Delimiter.index=0
set "_GSSI_Input_Pointer=_GSSI_Input" & if defined !_GSSI_Input! ( set "_GSSI_Input_Pointer=!_GSSI_Input!" )
Call :len "%_GSSI_Input_Pointer%" _GSSI_Input_len
if not defined _GSSI_StartIndex set /a _GSSI_StartIndex=0
set _GSSI_
:GetSubstringIndex-loop
set /a _GSSI_Index=%_GSSI_StartIndex%
set "_GSSI_Delimiter_Pointer=!_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]!" 
if defined !%_GSSI_Delimiter_Pointer%! ( set "_GSSI_Delimiter_Pointer=!%_GSSI_Delimiter_Pointer%!" )
Call :len "%_GSSI_Delimiter_Pointer%" _GSSI_Delimiter_len
set "_GSSI_Search=!%_GSSI_Delimiter_Pointer%!"
set /a _GSSI_remaining_input_len=%_GSSI_Input_len%-%_GSSI_Index%
if %_GSSI_remaining_input_len% LSS 64 ( set /a _GSSI_Search_Window_len=%_GSSI_remaining_input_len% ) else ( set /a _GSSI_Search_Window_len=64 )
:GetSubstringIndex-substring-pre-loop
set /a _GSSI_Actual_Search_Window_len=%_GSSI_Search_Window_len%+%_GSSI_Delimiter_len%-1
set _GSSI_CurrentWindow=!%_GSSI_Input_Pointer%:~%_GSSI_Index%,%_GSSI_Actual_Search_Window_len%!
set "_GSSI_CurrentWindowResult=!_GSSI_CurrentWindow:%_GSSI_Search%=!"
if %_GSSI_CaseSensitivity% "!_GSSI_CurrentWindow!" EQU "!_GSSI_CurrentWindowResult!" ( if %_GSSI_Search_Window_len% GEQ %_GSSI_remaining_input_len% ( set /a _GSSI_Index=%_GSSI_Input_len% & GoTo :GetSubstringIndex-substring-end ) else ( set /a _GSSI_Index=%_GSSI_Index%+%_GSSI_Search_Window_len%-1 & set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%*2 & GoTo :GetSubstringIndex-substring-pre-loop ) )
set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%/2
:GetSubstringIndex-substring-loop
set /a _GSSI_Actual_Search_Window_len=%_GSSI_Search_Window_len%+%_GSSI_Delimiter_len%-1
set _GSSI_CurrentWindow=!%_GSSI_Input_Pointer%:~%_GSSI_Index%,%_GSSI_Actual_Search_Window_len%!
set "_GSSI_CurrentWindowResult=!_GSSI_CurrentWindow:%_GSSI_Search%=!"
if %_GSSI_CaseSensitivity% !_GSSI_CurrentWindow! NEQ !_GSSI_CurrentWindowResult! ( if %_GSSI_Search_Window_len% EQU 1 ( GoTo :GetSubstringIndex-substring-end ) else ( set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%/2 ) ) else ( set /a _GSSI_Index=%_GSSI_Index%+%_GSSI_Search_Window_len% )
GoTo :GetSubstringIndex-substring-loop 
:GetSubstringIndex-substring-end
:GetSubstringIndex-end
if not defined _GSSI_Result ( set /a _GSSI_Result=%_GSSI_Index% ) else ( if %_GSSI_Index% LSS %_GSSI_Result% set /a _GSSI_Result=%_GSSI_Index% )
set /a _GSSI_Delimiter.index+=1
IF %_GSSI_Delimiter.index% LEQ %_GSSI_Delimiter.ubound% GoTo :GetSubstringIndex-loop

REM if "[%~7]" NEQ "[]" ( shift & shift & shift & shift & shift & GoTo :GetSubstringIndex )
endlocal & set /a _GSSI_Index=%_GSSI_Index% & if defined _GSSI_Output set /a %_GSSI_Output%=%_GSSI_Index%
Call :ClearVariablesByPrefix %_GetSubstringIndex_prefix% _GetSubstringIndex_prefix & exit /b %_GSSI_Index% 


REM old but working GetSubstringIndex
REM ::Usage Call :GetSubstringIndex InputString SearchString StartIndex Optional OutputIndexVar ... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
REM :GetSubstringIndex
REM set "_GetSubstringIndex_prefix=_GSSI"
REM set _GSSI_Input=%~1
REM set _GSSI_Search=%~2
REM set /a _GSSI_StartIndex=%~3 2>nul
REM set "_GSSI_Output=%~4"
REM if not defined _GSSI_StartIndex set /a _GSSI_StartIndex=0
REM setlocal enabledelayedexpansion
REM if defined %_GSSI_Search% set _GSSI_Search=!%_GSSI_Search%!
REM set "_GSSI_Input_Pointer=_GSSI_Input"
REM if defined !_GSSI_Input! (
 REM set "_GSSI_Input_Pointer=%_GSSI_Input%" 
 REM )
REM Call :len "%_GSSI_Input_Pointer%" _GSSI_Input_len
REM if defined "%_GSSI_Search%" Call :len "%_GSSI_Search%" _GSSI_Search_len
REM if not defined "%_GSSI_Search%" Call :len _GSSI_Search _GSSI_Search_len
REM set /a _GSSI_Input_len-=1
REM set /a _GSSI_min_search=(%_GSSI_Search_len%*2)

REM REM Start checking from 0 to 5 (times _GSSI_Search_len)
REM REM then double search len until found, or end of string reached
REM REM on each doubling, more startindex to end of region known not to contain search term
REM REM on first found
REM REM check first half, if not found second half
REM REM next check half of found then second half of found 
REM REM until you reach min search len then go to stage 3

REM :GetSubstringIndex-loop

REM REM start searching 64 char of input len, go up if not found, doubling until the rest of the input is searched 
REM REM probably use findstr instead of string substitution for finding match, at least in stage 1
REM REM once match is found, narrow down by splitting search in half

REM set /a _GSSI_HalfInputLen=%_GSSI_Search_len%+(%_GSSI_Input_len%/2)
REM if %_GSSI_HalfInputLen% LEQ %_GSSI_min_search% ( 
	REM set /a _GSSI_max_search=%_GSSI_StartIndex%+%_GSSI_min_search%+1 & GoTo :GetSubstringIndex-loop2 
	REM )
REM set /a _GSSI_Middle=%_GSSI_StartIndex%+%_GSSI_HalfInputLen%
REM set /a _GSSI_HalfInputLenPLUSSearchLenMINUSOne=%_GSSI_HalfInputLen%+%_GSSI_Search_len%-1
REM set _GSSI_FirstHalf=!%_GSSI_Input_Pointer%:~%_GSSI_StartIndex%,%_GSSI_HalfInputLenPLUSSearchLenMINUSOne%!
REM set _GSSI_SecondHalf=!%_GSSI_Input_Pointer%:~%_GSSI_Middle%,%_GSSI_HalfInputLen%!
REM set _GSSI_FirstResult=!_GSSI_FirstHalf:%_GSSI_Search%=!
REM set _GSSI_SecondResult=!_GSSI_SecondHalf:%_GSSI_Search%=!
REM if !_GSSI_FirstHalf! NEQ !_GSSI_FirstResult! ( set /a _GSSI_Input_len=%_GSSI_HalfInputLen% & GoTo :GetSubstringIndex-loop )
REM if !_GSSI_SecondHalf! NEQ !_GSSI_SecondResult! ( set /a _GSSI_StartIndex=%_GSSI_Middle% & GoTo :GetSubstringIndex-loop )
REM set /a _GSSI_StartIndex=-1 & GoTo :GetSubstringIndex-end
REM :GetSubstringIndex-loop2
REM set _GSSI_FinalSearch=!%_GSSI_Input_Pointer%:~%_GSSI_StartIndex%,%_GSSI_Search_len%!
REM if !_GSSI_FinalSearch! EQU !_GSSI_Search! GoTo :GetSubstringIndex-end
REM set /a _GSSI_StartIndex+=1
REM if %_GSSI_StartIndex% LEQ %_GSSI_max_search% GoTo :GetSubstringIndex-loop2
REM set /a _GSSI_StartIndex=-1 & GoTo :GetSubstringIndex-end
REM :GetSubstringIndex-end
REM if "[%~7]" NEQ "[]" ( shift & shift & shift & shift & shift & GoTo :GetSubstringIndex )
REM endlocal & set _GSSI_StartIndex=%_GSSI_StartIndex% & if defined _GSSI_Output set /a %_GSSI_Output%=%_GSSI_StartIndex%
REM Call :ClearVariablesByPrefix %_GetSubstringIndex_prefix% _GetSubstringIndex_prefix & exit /b %_GSSI_StartIndex% 

::Usage Call :CreateRandomStringPS [NONUMBERS] [NOUPPERCASE] [NOUPPERCASE] [SPACE] [PUNCTUATION] [NOPOISON] [POISON] [EXTENDED] [CONTROL] [RESET] Stringlength1 OutputVariable1 Stringlength2 OutputVariable2 ... StringlengthN OutputVariableN
::You can your CLEAR in front of the switches to clear them
:CreateRandomStringPS
set "_CreateRandomStringPS_prefix=_CRS"
set "_CRS_SetList=NONUMBERS NOUPPERCASE NOLOWERCASE SPACE PUNCTUATION NOPOISON EXTENDED CONTROL NOPOISON POISON OVERRIDE"
if "[%~1]" EQU "[RESET]" ( for %%a in (%_CRS_SetList%) do ( set "_CRS_%%a=" ) & shift & GoTo :CreateRandomStringPS )
if "[%~1]" EQU "[OVERRIDE]" ( set "_CRS_%%a=%~2" & shift & shift & GoTo :CreateRandomStringPS )
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
if defined _CRS_OVERRIDE set "_CRS_CurrentSet=%_CRS_OVERRIDE%"
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


REM finished ?
::Usage Call :GetIndexArray OutputIndexArray ListOfIndex1 ListOfIndex2 ... ListOfIndexN
::Lists of index are appended to the OutputIndexArray, Lists of index can contain
::single elements "18" 
::comma or space separated elements "10,14,23" "10 14 23"
::single ranges "2-9"
::multiple ranges "45-47,48-94" "45-47 48-94"
::ranges can be in descending order "33-66 66-33"
::ranges can includes more than two end stops "33-67-66-99" 
::or a mix of all the above
::not implemented keywords like start middle quarter third twothird threequarter  "start-45,middle-end,third-twothird,start-end,1-end"
::not implemented percentages 10% 20% 33% 100%  "10%-20%,0%-100%,start-100%"
::not implemented features would require knowing the starting and ending index of the reference array
:GetIndexArray
set "_GetIndexArray_prefix=_GIA"
set "_GIA_output=%~1"
if "[%_GIA_output%]" EQU "[]" GoTo :EOF
if "[%_GIA_output%]" NEQ "[%_GIA_output:[]=%]" set "_GIA_output_suffix=%_GIA_output:*]=%" & set "_GIA_output=%_GIA_output:*[=%"
call set "_GIA_output_lbound=%%%~1.lbound%%"
call set "_GIA_output_ubound=%%%~1.ubound%%"
if "[%_GIA_output_lbound%]" EQU "[]" set /a "_GIA_output_lbound=0"
if "[%_GIA_output_ubound%]" EQU "[]" set /a "_GIA_output_ubound=%_GIA_output_lbound%-1"
shift
:GetIndexArray-arguments
if "[%~1]" EQU "[]" GoTo :EOF
Call :ClearVariablesByPrefix _GIA_current_list
set "_GIA_current_list=%~1"
set /a "_GIA_current_list_index=0"
for /f %%a in ('set %_GIA_current_list%[ 2^>nul') do GoTo :GetIndexArray-isarray-arguments
for %%a in (%_GIA_current_list:,= %) do ( call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1" )
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
REM set _GIA_current_list
GoTo :GetIndexArray-loop
:GetIndexArray-isarray-arguments
call set /a "_GIA_current_list_array_index=%%%_GIA_current_list%.lbound%%" 2>nul
if not defined _GIA_current_list_array_index set /a "_GIA_current_list_array_index=0"
call set /a "_GIA_current_list_array_ubound=%%%_GIA_current_list%.ubound%%" 2>nul
:GetIndexArray-isarray-arguments-loop
call set _GIA_current_list_array_element=%%%_GIA_current_list%[%_GIA_current_list_array_index%]%%
for %%a in (%_GIA_current_list_array_element:,= %) do call set "_GIA_current_list[%%_GIA_current_list_index%%]=%%a" & call set /a "_GIA_current_list_index+=1"
set /a "_GIA_current_list_array_index+=1"
if %_GIA_current_list_array_index% LEQ %_GIA_current_list_array_ubound% GoTo :GetIndexArray-isarray-arguments-loop
set /a "_GIA_current_list_ubound=%_GIA_current_list_index%-1" & set /a "_GIA_current_list_index=0"
:GetIndexArray-loop
REM set _GIA_current_list
call set "_GIA_current_list_element=%%_GIA_current_list[%_GIA_current_list_index%]%%
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" GoTo :GetIndexArray-range-skip
set /a "_GIA_current_list_element_index=0"
REM echo for %%a in (%_GIA_current_list_element:-= %)
for %%a in (%_GIA_current_list_element:-= %) do ( call set "_GIA_current_list_element[%%_GIA_current_list_element_index%%]=%%a" & call set /a "_GIA_current_list_element_index+=1" )
REM set _GIA_current_list_element
set /a "_GIA_current_list_element_ubound=%_GIA_current_list_element_index%-1" & set /a "_GIA_current_list_element_index=0"
call set /a "_GIA_current_list_element_start=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
:GetIndexArray-range-loop
call set /a "_GIA_current_list_element_end=%%_GIA_current_list_element[%_GIA_current_list_element_index%]%%
if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element_start%" & GoTo :GetIndexArray-range-next)
REM if %_GIA_current_list_element_start% EQU %_GIA_current_list_element_end% echo TEST II %_GIA_current_list_element_start% II& GoTo :GetIndexArray-range-next
if %_GIA_current_list_element_start% GTR %_GIA_current_list_element_end% ( set "_GIA_current_list_element_direction=-" ) else ( set "_GIA_current_list_element_direction=+" )
set /a "_GIA_current_list_element_start%_GIA_current_list_element_direction%=1"
REM for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( echo TEST II %%a II )
for /l %%a in (%_GIA_current_list_element_start%,%_GIA_current_list_element_direction%1,%_GIA_current_list_element_end%) do ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%%a" )
:GetIndexArray-range-next
set /a "_GIA_current_list_element_start=%_GIA_current_list_element_end%"
set /a "_GIA_current_list_element_index+=1"
if %_GIA_current_list_element_index% LEQ %_GIA_current_list_element_ubound% GoTo :GetIndexArray-range-loop
:GetIndexArray-range-skip
REM if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" echo TEST JJ %_GIA_current_list_element% JJ
if "[%_GIA_current_list_element%]" EQU "[%_GIA_current_list_element:-=%]" ( call set /a "_GIA_output_ubound+=1" & call set "%_GIA_output%[%%_GIA_output_ubound%%]=%_GIA_current_list_element%" )
:GetIndexArray-loop-end
Call :ClearVariablesByPrefix _GIA_current_list_element
set /a "_GIA_current_list_index+=1"
if %_GIA_current_list_index% LEQ %_GIA_current_list_ubound% GoTo :GetIndexArray-loop
shift 
if "[%~1]" NEQ "[]" GoTo :GetIndexArray-arguments
set /a "%_GIA_output%.ubound=%_GIA_output_ubound%"
Call :ClearVariablesByPrefix %_GetIndexArray_prefix% _GetIndexArray
GoTo :EOF


