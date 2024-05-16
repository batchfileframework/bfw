@echo off

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


::Usage Call :split InputString Delimiter OutputArray optional limit optional comparemethod
:split 

exit /b %_split_count%

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

if %_GetSubstringIndex_index% EQU 0 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 0 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 0 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 0 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 0 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 1 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 1 Call :CreateRandomStringPS %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 1 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 1 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 1 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 2 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 2 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 2 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 2 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 2 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 3 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 3 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 3 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 3 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 3 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 4 ( set /a _GetSubstringIndex_index_lenght=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 4 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 4 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 4 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 4 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 5 ( set /a _GetSubstringIndex_index_lenght=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 5 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 5 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 5 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 5 GoTo :GetSubstringIndex-demo-start-loop


if %_GetSubstringIndex_index% EQU 6 ( set /a _GetSubstringIndex_index_lenght=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 6 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 6 set _GetSubstringIndex_testpattern=TEST
if %_GetSubstringIndex_index% EQU 6 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern,)
if %_GetSubstringIndex_index% EQU 6 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 6 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 7 echo  Repeat tests 1-6, but with auto generated alpha numeric testpattern of size variable between 10 and 20
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings="
set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100

if %_GetSubstringIndex_index% EQU 7 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 7 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 7 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 7 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 7 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 8 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 8 Call :CreateRandomStringPS %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 8 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 8 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 8 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 8 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 9 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 9 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 9 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 9 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 9 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 9 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 10 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 10 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 10 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 10 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 10 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 10 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 11 ( set /a _GetSubstringIndex_index_lenght=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 11 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 11 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 11 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 11 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 11 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 12 ( set /a _GetSubstringIndex_index_lenght=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 12 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 12 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 12 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 12 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 12 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 13 ( set /a _GetSubstringIndex_index_lenght=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 13 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 13 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 13 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 13 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern,)
if %_GetSubstringIndex_index% EQU 13 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 13 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 14 echo  Repeat tests 7-13, but with punctuation and space but no poison in the test pattern
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION NOPOISON SPACE"

if %_GetSubstringIndex_index% EQU 14 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 14 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 14 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 14 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 14 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 14 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 15 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 15 Call :CreateRandomStringPS %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 15 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 15 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 15 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 15 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 16 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 16 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 16 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 16 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 16 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 16 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 17 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 17 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 17 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 17 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 17 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 17 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 18 ( set /a _GetSubstringIndex_index_lenght=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 18 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 18 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 18 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 18 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 18 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 19 ( set /a _GetSubstringIndex_index_lenght=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 19 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 19 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 19 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 19 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 19 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 20 ( set /a _GetSubstringIndex_index_lenght=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 20 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 20 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 20 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 20 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, )
if %_GetSubstringIndex_index% EQU 20 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 20 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 21 echo  Repeat tests 14-20, but including poison in the test pattern 
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION SPACE"

if %_GetSubstringIndex_index% EQU 21 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 21 set _GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
if %_GetSubstringIndex_index% EQU 21 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 21 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 21 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 21 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 22 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 22 Call :CreateRandomStringPS %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 22 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 22 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 22 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 22 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 23 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 23 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 23 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 23 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 23 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 23 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 24 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 24 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 24 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 24 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 24 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 24 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 25 ( set /a _GetSubstringIndex_index_lenght=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 25 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 25 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 25 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 25 ( set /a _GetSubstringIndex_index_lenght=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 25 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 25 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 25 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 25 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 26 ( set /a _GetSubstringIndex_index_lenght=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 26 Call :CreateRandomStringPS PUNCTUATION NOPOISON SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 26 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 26 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 26 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, )
if %_GetSubstringIndex_index% EQU 26 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 26 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 27 echo  Repeat tests 21-26, but with poison characters in the test string too
set /a _GetSubstringIndex_testpattern_min=10 & set /a _GetSubstringIndex_testpattern_max=20 & set "_GetSubstringIndex_testpattern_settings=PUNCTUATION NOPOISON SPACE"

if %_GetSubstringIndex_index% EQU 27 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 27 set "_GetSubstringIndex_testvar=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)(%^&=<>|FFFF"FFFFFFFFF"
if %_GetSubstringIndex_index% EQU 27 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 27 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 27 ( echo.&echo %_GetSubstringIndex_index% All FFF string, 100 long, "%_GetSubstringIndex_testpattern%" is the search pattern, Test string is "%_GetSubstringIndex_testvar%")
if %_GetSubstringIndex_index% EQU 27 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 28 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 28 Call :CreateRandomStringPS PUNCTUATION %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 28 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 28 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 28 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 28 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 29 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 29 Call :CreateRandomStringPS PUNCTUATION SPACE %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 29 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 29 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 29 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 29 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 30 ( set /a _GetSubstringIndex_index_lenght=100 & set /a _GetSubstringIndex_index_count=100 )
if %_GetSubstringIndex_index% EQU 30 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 30 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 30 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 30 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 30 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 31 ( set /a _GetSubstringIndex_index_lenght=1000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 31 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 31 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 31 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 31 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 31 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 32 ( set /a _GetSubstringIndex_index_lenght=4000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 32 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 32 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 32 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 32 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, Test string is ::"%_GetSubstringIndex_testvar%"::)
if %_GetSubstringIndex_index% EQU 32 GoTo :GetSubstringIndex-demo-start-loop

if %_GetSubstringIndex_index% EQU 33 ( set /a _GetSubstringIndex_index_lenght=8000 & set /a _GetSubstringIndex_index_count=50 )
if %_GetSubstringIndex_index% EQU 33 Call :CreateRandomStringPS PUNCTUATION SPACE EXTENDED %_GetSubstringIndex_index_lenght% _GetSubstringIndex_testvar
if %_GetSubstringIndex_index% EQU 33 call :rnd _GetSubstringIndex_testpattern %_GetSubstringIndex_testpattern_min% %_GetSubstringIndex_testpattern_max%
if %_GetSubstringIndex_index% EQU 33 Call :CreateRandomStringPS %_GetSubstringIndex_testpattern_settings% %_GetSubstringIndex_testpattern% _GetSubstringIndex_testpattern
if %_GetSubstringIndex_index% EQU 33 ( echo.&echo %_GetSubstringIndex_index% Alphanumeric random string, with punctuation and space and nopoison %_GetSubstringIndex_index_lenght% long, %_GetSubstringIndex_index_count% count ::"%_GetSubstringIndex_testpattern%":: is the search pattern, )
if %_GetSubstringIndex_index% EQU 33 echo Test string is ::"%_GetSubstringIndex_testvar:~,8000%"{TRUNKATED AT 8000}::
if %_GetSubstringIndex_index% EQU 33 GoTo :GetSubstringIndex-demo-start-loop

:GetSubstringIndex-demo-start-loop
echo test
set /a _GetSubstringIndex_index_index=0
Call :ClearVariablesByPrefix _GetSubstringIndex_testarray 
echo.&echo Starting test %_GetSubstringIndex_index%, string lenght %_GetSubstringIndex_index_lenght%, loop  count %_GetSubstringIndex_index_count%&echo.
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

::Usage Call :GetSubstringIndex InputString SearchString StartIndex Optional OutputIndexVar ... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
:GetSubstringIndex
set "_GetSubstringIndex_prefix=_GSSI"
Call :ClearVariablesByPrefix _GSSI
set _GSSI_Input=%~1
set _GSSI_Search=%~2
set /a _GSSI_StartIndex=%~3 2>nul
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
:GetSubstringIndex-loop
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
endlocal & Call :ClearVariablesByPrefix %_GetSubstringIndex_prefix% _GetSubstringIndex_prefix & exit /b %_GSSI_StartIndex%

::Usage Call :CreateRandomStringPS [NONUMBERS] [NOUPPERCASE] [NOUPPERCASE] [SPACE] [PUNCTUATION] [NOPOISON] [POISON] [EXTENDED] [CONTROL] [RESET] StringLenght1 OutputVariable1 StringLenght2 OutputVariable2 ... StringLenghtN OutputVariableN
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