@echo off

call :split-demo 
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

REM GoTo :GetSubstringIndex-demo-skip

REM GoTo :GetSubstringIndex-1-skip

call :GetSubstringTestHelper OutputArray 100 "All F base array, all G delimiter"                                                                                               "OVERRIDE 70" 100                           Delimiter "OVERRIDE 71" 10
call :GetSubstringTestHelper OutputArray 100 "All F base array, alphanumeric delimiter"                                                                                        "OVERRIDE 70" 100                           Delimiter "" 10
call :GetSubstringTestHelper OutputArray 100 "All F base array, with punctuation and space"                                                                                    "OVERRIDE 70" 100                           Delimiter "PUNCTUATION NOPOISON SPACE" 10
call :GetSubstringTestHelper OutputArray 100 "All F base array, with punctuation and space and extended"                                                                       "OVERRIDE 70" 100                           Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10
call :GetSubstringTestHelper OutputArray 100 "All F base array, with punctuation and space and extended and poison"                                                            "OVERRIDE 70" 100                           Delimiter "PUNCTUATION SPACE EXTENDED" 10

call :GetSubstringTestHelper OutputArray 100 "Alphanumeric base array, all G delimiter"                                                                                        "" 100                                      Delimiter "OVERRIDE 71" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric base array, alphanumeric delimiter"                                                                                 "" 100                                      Delimiter "" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric base array, with punctuation and space"                                                                             "" 100                                      Delimiter "PUNCTUATION NOPOISON SPACE" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric base array, with punctuation and space and extended"                                                                "" 100                                      Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric base array, with punctuation and space and extended and poison"                                                     "" 100                                      Delimiter "PUNCTUATION SPACE EXTENDED" 10

call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space base array, all G delimiter"                                                             "PUNCTUATION NOPOISON SPACE" 100            Delimiter "OVERRIDE 71" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space base array, alphanumeric delimiter"                                                      "PUNCTUATION NOPOISON SPACE" 100            Delimiter "" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space base array, with punctuation and space"                                                  "PUNCTUATION NOPOISON SPACE" 100            Delimiter "PUNCTUATION NOPOISON SPACE" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space base array, with punctuation and space and extended"                                     "PUNCTUATION NOPOISON SPACE" 100            Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space base array, with punctuation and space and extended and poison"                          "PUNCTUATION NOPOISON SPACE" 100            Delimiter "PUNCTUATION SPACE EXTENDED" 10
REM :GetSubstringIndex-demo-skip
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended base array, all G delimiter"                                                "PUNCTUATION NOPOISON SPACE EXTENDED" 100   Delimiter "OVERRIDE 71" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended base array, alphanumeric delimiter"                                         "PUNCTUATION NOPOISON SPACE EXTENDED" 100   Delimiter "" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space"                                     "PUNCTUATION NOPOISON SPACE EXTENDED" 100   Delimiter "PUNCTUATION NOPOISON SPACE" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended"                        "PUNCTUATION NOPOISON SPACE EXTENDED" 100   Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10

call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended and poison base array, all G delimiter"                                     "PUNCTUATION SPACE EXTENDED" 100            Delimiter "OVERRIDE 71" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended and poison base array, alphanumeric delimiter"                              "PUNCTUATION SPACE EXTENDED" 100            Delimiter "" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space"                          "PUNCTUATION SPACE EXTENDED" 100            Delimiter "PUNCTUATION NOPOISON SPACE" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended"             "PUNCTUATION SPACE EXTENDED" 100            Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10

call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended and poison"             "PUNCTUATION NOPOISON SPACE EXTENDED" 100   Delimiter "PUNCTUATION SPACE EXTENDED" 10
call :GetSubstringTestHelper OutputArray 100 "Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended and poison"  "PUNCTUATION SPACE EXTENDED" 100            Delimiter "PUNCTUATION SPACE EXTENDED" 10

:GetSubstringIndex-1-skip
REM GoTo :GetSubstringIndex-2-skip

call :GetSubstringTestHelper OutputArray 100 "1 All F base array, all G delimiter"                                                                                               "OVERRIDE 70" 100                            Delimiter "OVERRIDE 71" 10                               Delimiter INVERTPOSITION "OVERRIDE 80" 10
call :GetSubstringTestHelper OutputArray 100 "2 All F base array, alphanumeric delimiter"                                                                                        "OVERRIDE 70" 100                            Delimiter "" 10                                          Delimiter INVERTPOSITION "OVERRIDE 80" 10
call :GetSubstringTestHelper OutputArray 100 "3 All F base array, with punctuation and space"                                                                                    "OVERRIDE 70" 100                            Delimiter "PUNCTUATION NOPOISON SPACE" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10  
call :GetSubstringTestHelper OutputArray 100 "4 All F base array, with punctuation and space and extended"                                                                       "OVERRIDE 70" 100                            Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10       Delimiter INVERTPOSITION "OVERRIDE 80" 10  
call :GetSubstringTestHelper OutputArray 100 "5 All F base array, with punctuation and space and extended and poison"                                                            "OVERRIDE 70" 100                            Delimiter "PUNCTUATION SPACE EXTENDED" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 

call :GetSubstringTestHelper OutputArray 100 "6 Alphanumeric  base array, all G delimiter"                                                                                       "" 100                                       Delimiter "OVERRIDE 71" 10                               Delimiter INVERTPOSITION "OVERRIDE 80" 10  
call :GetSubstringTestHelper OutputArray 100 "7 Alphanumeric  base array, alphanumeric delimiter"                                                                                "" 100                                       Delimiter "" 10                                          Delimiter INVERTPOSITION "OVERRIDE 80" 10  
call :GetSubstringTestHelper OutputArray 100 "8 Alphanumeric  base array, with punctuation and space"                                                                            "" 100                                       Delimiter "PUNCTUATION NOPOISON SPACE" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10  
call :GetSubstringTestHelper OutputArray 100 "9 Alphanumeric  base array, with punctuation and space and extended"                                                               "" 100                                       Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10       Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "10 Alphanumeric  base array, with punctuation and space and extended and poison"                                                    "" 100                                       Delimiter "PUNCTUATION SPACE EXTENDED" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 

call :GetSubstringTestHelper OutputArray 100 "11 Alphanumeric with punctuation and space base array, all G delimiter"                                                             "PUNCTUATION NOPOISON SPACE" 100             Delimiter "OVERRIDE 71" 10                               Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "12 Alphanumeric with punctuation and space base array, alphanumeric delimiter"                                                      "PUNCTUATION NOPOISON SPACE" 100             Delimiter "" 10                                          Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "13 Alphanumeric with punctuation and space base array, with punctuation and space"                                                  "PUNCTUATION NOPOISON SPACE" 100             Delimiter "PUNCTUATION NOPOISON SPACE" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "14 Alphanumeric with punctuation and space base array, with punctuation and space and extended"                                     "PUNCTUATION NOPOISON SPACE" 100             Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10       Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "15 Alphanumeric with punctuation and space base array, with punctuation and space and extended and poison"                          "PUNCTUATION NOPOISON SPACE" 100             Delimiter "PUNCTUATION SPACE EXTENDED" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10  

call :GetSubstringTestHelper OutputArray 100 "16 Alphanumeric with punctuation and space and extended base array, all G delimiter"                                                "PUNCTUATION NOPOISON SPACE EXTENDED" 100    Delimiter "OVERRIDE 71" 10                               Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "17 Alphanumeric with punctuation and space and extended base array, alphanumeric delimiter"                                         "PUNCTUATION NOPOISON SPACE EXTENDED" 100    Delimiter "" 10                                          Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "18 Alphanumeric with punctuation and space and extended base array, with punctuation and space"                                     "PUNCTUATION NOPOISON SPACE EXTENDED" 100    Delimiter "PUNCTUATION NOPOISON SPACE" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "19 Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended"                        "PUNCTUATION NOPOISON SPACE EXTENDED" 100    Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10       Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "20 Alphanumeric with punctuation and space and extended base array, with punctuation and space and extended and poison"             "PUNCTUATION NOPOISON SPACE EXTENDED" 100    Delimiter "PUNCTUATION SPACE EXTENDED" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 

REM PROBLEM BELOW
call :GetSubstringTestHelper OutputArray 100 "21 Alphanumeric with punctuation and space and extended and poison base array, all G delimiter"                                     "PUNCTUATION SPACE EXTENDED" 100             Delimiter "OVERRIDE 71" 10                               Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "22 Alphanumeric with punctuation and space and extended and poison base array, alphanumeric delimiter"                              "PUNCTUATION SPACE EXTENDED" 100             Delimiter "" 10                                          Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "23 Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space"                          "PUNCTUATION SPACE EXTENDED" 100             Delimiter "PUNCTUATION NOPOISON SPACE" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "24 Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended"             "PUNCTUATION SPACE EXTENDED" 100             Delimiter "PUNCTUATION NOPOISON SPACE EXTENDED" 10       Delimiter INVERTPOSITION "OVERRIDE 80" 10 
call :GetSubstringTestHelper OutputArray 100 "25 Alphanumeric with punctuation and space and extended and poison base array, with punctuation and space and extended and poison"  "PUNCTUATION SPACE EXTENDED" 100             Delimiter "PUNCTUATION SPACE EXTENDED" 10                Delimiter INVERTPOSITION "OVERRIDE 80" 10 
REM PROBLEM BELOW

:GetSubstringIndex-2-skip
REM GoTo :GetSubstringIndex-3-skip
call :GetSubstringTestHelper OutputArray 100 "26 All F base array, multiple delimiters with invertposition and negative indexoffset"                                              "OVERRIDE 70" 100                            Delimiter "OVERRIDE 71" 10                               Delimiter INVERTPOSITION "OVERRIDE 80" 10    Delimiter INVERTPOSITION INDEXOFFSET -15 "OVERRIDE 81" 10        Delimiter INVERTPOSITION INDEXOFFSET -30 "OVERRIDE 82" 10
call :GetSubstringTestHelper OutputArray 100 "27 All F base array, all G delimiter repeat 3 times"                                                                                "OVERRIDE 70" 100                            Delimiter REPEAT 3 "OVERRIDE 71" 10
call :GetSubstringTestHelper OutputArray 100 "28 All F base array, all G delimiter repeat 5 times"                                                                                "OVERRIDE 70" 100                            Delimiter REPEAT 5 "OVERRIDE 71" 3                       Delimiter INVERTPOSITION "OVERRIDE 80" 3
call :GetSubstringTestHelper OutputArray 100 "29 All F base array, all G delimiter, repeat 3 times element offset is 3"                                                           "OVERRIDE 70" 100                            Delimiter REPEAT "3,3" "OVERRIDE 71" 4
call :GetSubstringTestHelper OutputArray 100 "30 All F base array, all G delimiter repeated 5 times then all P delimiter, inverted"                                               "OVERRIDE 70" 100                            Delimiter REPEAT "5,3" "OVERRIDE 71" 4                   Delimiter INVERTPOSITION "OVERRIDE 80" 3
REM :GetSubstringIndex-3-skip
GoTo :EOF


::Usage Call :GetSubstringTestHelper [GetSubstringTestHelper arguments]
:GetSubstringTestHelper
set "_GetSubstringTestHelper_prefix=_GSTH"
setlocal enabledelayedexpansion
set "_GSTH_Space=                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "
call :len _GSTH_Space _GSTH_Space_len
echo _GSTH_Space_len%_GSTH_Space_len%
set "_GSTH_OutputArray=%~1" & shift
for /f "tokens=1,2 delims=-" %%a in ("%~1") do ( set /a _GSTH_Min=%%a & set /a _GSTH_Max=%%b 2>nul ) & shift
if not defined _GSTH_Max ( set /a _GSTH_ActualCount=%_GSTH_Min% ) else ( call :rnd _GSTH_ActualCount %_GSTH_Min% %_GSTH_Max% )
set "%_GSTH_OutputArray%.comment=%~1" & shift
set /a _GSTH_Base.ubound=0 & set /a _GSTH_Delimiters.ubound=-1
GoTo :GetSubstringTestHelper-base-args
:GetSubstringTestHelper-args
if /i "[%~1]" EQU "[BASE]" ( set /a _GSTH_Base.ubound+=1 & shift & GoTo :GetSubstringTestHelper-base-args )
if /i "[%~1]" EQU "[DELIMITER]" ( set /a _GSTH_Delimiters.ubound+=1 & set /a _GSTH_Delimiters[!_GSTH_Delimiters.ubound!].IndexOffset=0 & set /a _GSTH_Delimiters[!_GSTH_Delimiters.ubound!].Repeat=0 & shift & GoTo :GetSubstringTestHelper-delimiter-args )
GoTo :GetSubstringTestHelper-args-skip
:GetSubstringTestHelper-base-args
if defined %~1 ( set "_GSTH_Base[%_GSTH_Base.ubound%]=%~1" & Call :len _GSTH_Base[%_GSTH_Base%] _GSTH_Base[%_GSTH_Base%].len & shift & GoTo :GetSubstringTestHelper-args )
if /i "[%~1]" EQU "[LITERAL]" ( set "_GSTH_Base[%_GSTH_Base.ubound%]=%~2" & shift & shift & GoTo :GetSubstringTestHelper-args )
for /f "tokens=1,2 delims=-" %%a in ("%~2") do ( set /a _GSTH_Min=%%a & set /a _GSTH_Max=%%b 2>nul )
if not defined _GSTH_Max ( set /a _GSTH_Base[%_GSTH_Base.ubound%].len=%_GSTH_Min% ) else ( call :rnd _GSTH_Base[%_GSTH_Base.ubound%].len %_GSTH_Min% %_GSTH_Max% )
Call :CreateRandomStringPS %~1 !_GSTH_Base[%_GSTH_Base.ubound%].len! _GSTH_Base[%_GSTH_Base.ubound%] & shift & shift 
if "[%~1]" NEQ "[]" ( GoTo :GetSubstringTestHelper-args ) else ( GoTo :GetSubstringTestHelper-args-skip )
:GetSubstringTestHelper-delimiter-args
if /i "[%~1]" EQU "[INVERTPOSITION]" ( set "_GSTH_Delimiters[%_GSTH_Delimiters.ubound%].InvertPosition=true" & shift & GoTo :GetSubstringTestHelper-delimiter-args )
if /i "[%~1]" EQU "[INDEXOFFSET]" ( set /a "_GSTH_Delimiters[%_GSTH_Delimiters.ubound%].IndexOffset=%~2" & shift & shift & GoTo :GetSubstringTestHelper-delimiter-args )
if /i "[%~1]" EQU "[REPEAT]" ( set "_GSTH_Delimiters[%_GSTH_Delimiters.ubound%].Repeat=%~2" & shift & shift & GoTo :GetSubstringTestHelper-delimiter-args )
if /i "[%~1]" EQU "[LITERAL]" ( set "_GSTH_Delimiters[%_GSTH_Delimiters.ubound%]=%~2" & shift & shift & GoTo :GetSubstringTestHelper-args )
if defined %~1 ( set "_GSTH_Delimiters[%_GSTH_Delimiters.ubound%]=!%~1!" & Call :len _GSTH_Delimiters[%_GSTH_Delimiters_ubound%] _GSTH_Delimiters[%_GSTH_Delimiters.ubound%].len & shift & GoTo :GetSubstringTestHelper-args)
if "[!%~1.ubound!]" EQU "[]" GoTo :GetSubstringTestHelper-delimiter-array-skip
if defined %~1.ubound ( set /a _GSTH_Delimiters.ubound-=1 & for /l %%a in (0,1,!%~1.ubound!) do ( set /a _GSTH_Delimiters.ubound+=1 & Call :CopyObject %~1[%%a] _GSTH_Delimiters[%_GSTH_Delimiters.ubound%] ) )
shift & GoTo :GetSubstringTestHelper-args 
:GetSubstringTestHelper-delimiter-array-skip
for /f "tokens=1,2 delims=-" %%a in ("%~2") do ( set /a _GSTH_Min=%%a & set /a _GSTH_Max=%%b 2>nul )
if not defined _GSTH_Max ( set /a _GSTH_Delimiters[%_GSTH_Delimiters.ubound%].len=%_GSTH_Min% ) else ( call :rnd _GSTH_Delimiters[%_GSTH_Delimiters.ubound%].len %_GSTH_Min% %_GSTH_Max% )
set "_GSTH_Delimiters[%_GSTH_Delimiters.ubound%].setting=%~1"
Call :CreateRandomStringPS !_GSTH_Delimiters[%_GSTH_Delimiters.ubound%].setting! !_GSTH_Delimiters[%_GSTH_Delimiters.ubound%].len! _GSTH_Delimiters[%_GSTH_Delimiters.ubound%] & shift & shift 
if "[%~1]" NEQ "[]" GoTo :GetSubstringTestHelper-args
:GetSubstringTestHelper-args-skip
set /a _GSTH_index=0
:GetSubstringTestHelper-loop
set /a _GSTH_Base.index=0
:GetSubstringTestHelper-base-loop
set /a _GSTH_Delimiters.index=0
set "_GSTH_CurrentInputPointer=_GSTH_Base[%_GSTH_Base.index%]"
:GetSubstringTestHelper-delimiter-loop
if defined _GSTH_Delimiters[%_GSTH_Delimiters.index%].InvertPosition ( set /a _GSTH_Delimiter_Position=%_GSTH_ActualCount%-%_GSTH_index%+!_GSTH_Delimiters[%_GSTH_Delimiters.index%].IndexOffset!-1 ) else ( set /a _GSTH_Delimiter_Position=%_GSTH_index%+!_GSTH_Delimiters[%_GSTH_Delimiters.index%].IndexOffset! )
if %_GSTH_Delimiter_Position% LSS 0 GoTo :GetSubstringTestHelper-delimiter-loop-skip
Call :ReplaceString %_GSTH_CurrentInputPointer% %_GSTH_OutputArray%[%_GSTH_index%] REPEAT "!_GSTH_Delimiters[%_GSTH_Delimiters.index%].Repeat!" LEN !_GSTH_Delimiters[%_GSTH_Delimiters.index%].len! %_GSTH_Delimiter_Position% _GSTH_Delimiters[%_GSTH_Delimiters.index%]
echo.%_GSTH_OutputArray%[%_GSTH_index%]=!%_GSTH_OutputArray%[%_GSTH_index%]!
Call :GetSubstringIndex OUTPUT _GSTH_Substring_Result %_GSTH_OutputArray%[%_GSTH_index%] _GSTH_Delimiters[%_GSTH_Delimiters.index%] "" 
echo.%_GSTH_OutputArray%[%_GSTH_index%]=!_GSTH_Space:~0,%_GSTH_Substring_Result%!!_GSTH_Delimiters[%_GSTH_Delimiters.index%]!
:GetSubstringTestHelper-delimiter-loop-skip
set "_GSTH_CurrentInputPointer=%_GSTH_OutputArray%[%_GSTH_index%]" & set /a _GSTH_Delimiters.index+=1
if %_GSTH_Delimiters.index% LEQ %_GSTH_Delimiters.ubound% GoTo :GetSubstringTestHelper-delimiter-loop
set /a _GSTH_index+=1
if %_GSTH_Base.index% LEQ %_GSTH_Base.ubound% ( set /a "_GSTH_Base.index+=1" ) else ( set /a "_GSTH_Base.index=0" )
if %_GSTH_index% LSS %_GSTH_ActualCount% GoTo :GetSubstringTestHelper-loop
set /a %_GSTH_OutputArray%.ubound=%_GSTH_ActualCount%
set /a _GSTH_index=0
:GetSubstringTestHelper-test-loop
set /a _GSTH_index+=1
if %_GSTH_index% LSS !%_GSTH_OutputArray%.ubound! GoTo :GetSubstringTestHelper-test-loop
for /F "delims=" %%a in ('set %_GSTH_OutputArray%') do (
	endlocal
	set "%%a"
	)
Call :ClearVariablesByPrefix %_GetSubstringTestHelper_prefix% _GetSubstringTestHelper
GoTo :EOF


::Usage Call :CreateTestArray OutputArray Comment BaseArraySetting
:CreateTestArray
set "_CreateTestArray_prefix=_CTA"
setlocal enabledelayedexpansion
set "_CTA_OutputArray=%~1" & shift
for /f "tokens=1,2 delims=-" %%a in ("%~1") do ( set /a _CTA_Min=%%a & set /a _CTA_Max=%%b 2>nul ) & shift
if not defined _CTA_Max ( set /a _CTA_ActualCount=%_CTA_Min% ) else ( call :rnd _CTA_ActualCount %_CTA_Min% %_CTA_Max% )
set "%_CTA_OutputArray%.comment=%~1" & shift
set /a _CTA_Base.ubound=0 & set /a _CTA_Delimiters.ubound=-1
GoTo :CreateTestArray-base-args
:CreateTestArray-args
if /i "[%~1]" EQU "[BASE]" ( set /a _CTA_Base.ubound+=1 & shift & GoTo :CreateTestArray-base-args )
if /i "[%~1]" EQU "[DELIMITER]" ( set /a _CTA_Delimiters.ubound+=1 & set /a _CTA_Delimiters[!_CTA_Delimiters.ubound!].IndexOffset=0 & set /a _CTA_Delimiters[!_CTA_Delimiters.ubound!].Repeat=0 & shift & GoTo :CreateTestArray-delimiter-args )
GoTo :CreateTestArray-args-skip
:CreateTestArray-base-args
if defined %~1 ( set "_CTA_Base[%_CTA_Base.ubound%]=%~1" & Call :len _CTA_Base[%_CTA_Base%] _CTA_Base[%_CTA_Base%].len & shift & GoTo :CreateTestArray-args )
if /i "[%~1]" EQU "[LITERAL]" ( set "_CTA_Base[%_CTA_Base.ubound%]=%~2" & shift & shift & GoTo :CreateTestArray-args )
for /f "tokens=1,2 delims=-" %%a in ("%~2") do ( set /a _CTA_Min=%%a & set /a _CTA_Max=%%b 2>nul )
if not defined _CTA_Max ( set /a _CTA_Base[%_CTA_Base.ubound%].len=%_CTA_Min% ) else ( call :rnd _CTA_Base[%_CTA_Base.ubound%].len %_CTA_Min% %_CTA_Max% )
Call :CreateRandomStringPS %~1 !_CTA_Base[%_CTA_Base.ubound%].len! _CTA_Base[%_CTA_Base.ubound%] & shift & shift 
if "[%~1]" NEQ "[]" ( GoTo :CreateTestArray-args ) else ( GoTo :CreateTestArray-args-skip )
:CreateTestArray-delimiter-args
if /i "[%~1]" EQU "[INVERTPOSITION]" ( set "_CTA_Delimiters[%_CTA_Delimiters.ubound%].InvertPosition=true" & shift & GoTo :CreateTestArray-delimiter-args )
if /i "[%~1]" EQU "[INDEXOFFSET]" ( set /a "_CTA_Delimiters[%_CTA_Delimiters.ubound%].IndexOffset=%~2" & shift & shift & GoTo :CreateTestArray-delimiter-args )
if /i "[%~1]" EQU "[REPEAT]" ( set "_CTA_Delimiters[%_CTA_Delimiters.ubound%].Repeat=%~2" & shift & shift & GoTo :CreateTestArray-delimiter-args )
if /i "[%~1]" EQU "[LITERAL]" ( set "_CTA_Delimiters[%_CTA_Delimiters.ubound%]=%~2" & shift & shift & GoTo :CreateTestArray-args )
if defined %~1 ( set "_CTA_Delimiters[%_CTA_Delimiters.ubound%]=!%~1!" & Call :len _CTA_Delimiters[%_CTA_Delimiters_ubound%] _CTA_Delimiters[%_CTA_Delimiters.ubound%].len & shift & GoTo :CreateTestArray-args)
if "[!%~1.ubound!]" EQU "[]" GoTo :CreateTestArray-delimiter-array-skip
if defined %~1.ubound ( set /a _CTA_Delimiters.ubound-=1 & for /l %%a in (0,1,!%~1.ubound!) do ( set /a _CTA_Delimiters.ubound+=1 & Call :CopyObject %~1[%%a] _CTA_Delimiters[%_CTA_Delimiters.ubound%] ) )
shift & GoTo :CreateTestArray-args 
:CreateTestArray-delimiter-array-skip
for /f "tokens=1,2 delims=-" %%a in ("%~2") do ( set /a _CTA_Min=%%a & set /a _CTA_Max=%%b 2>nul )
if not defined _CTA_Max ( set /a _CTA_Delimiters[%_CTA_Delimiters.ubound%].len=%_CTA_Min% ) else ( call :rnd _CTA_Delimiters[%_CTA_Delimiters.ubound%].len %_CTA_Min% %_CTA_Max% )
set "_CTA_Delimiters[%_CTA_Delimiters.ubound%].setting=%~1"
Call :CreateRandomStringPS !_CTA_Delimiters[%_CTA_Delimiters.ubound%].setting! !_CTA_Delimiters[%_CTA_Delimiters.ubound%].len! _CTA_Delimiters[%_CTA_Delimiters.ubound%] & shift & shift 
if "[%~1]" NEQ "[]" GoTo :CreateTestArray-args
:CreateTestArray-args-skip
set /a _CTA_index=0
:CreateTestArray-loop
set /a _CTA_Base.index=0
:CreateTestArray-base-loop
set /a _CTA_Delimiters.index=0
set "_CTA_CurrentInputPointer=_CTA_Base[%_CTA_Base.index%]"
:CreateTestArray-delimiter-loop
if defined _CTA_Delimiters[%_CTA_Delimiters.index%].InvertPosition ( set /a _CTA_Delimiter_Position=%_CTA_ActualCount%-%_CTA_index%+!_CTA_Delimiters[%_CTA_Delimiters.index%].IndexOffset!-1 ) else ( set /a _CTA_Delimiter_Position=%_CTA_index%+!_CTA_Delimiters[%_CTA_Delimiters.index%].IndexOffset! )
if %_CTA_Delimiter_Position% LSS 0 GoTo :CreateTestArray-delimiter-loop-skip
Call :ReplaceString %_CTA_CurrentInputPointer% %_CTA_OutputArray%[%_CTA_index%] REPEAT "!_CTA_Delimiters[%_CTA_Delimiters.index%].Repeat!" LEN !_CTA_Delimiters[%_CTA_Delimiters.index%].len! %_CTA_Delimiter_Position% _CTA_Delimiters[%_CTA_Delimiters.index%] 
:CreateTestArray-delimiter-loop-skip
set "_CTA_CurrentInputPointer=%_CTA_OutputArray%[%_CTA_index%]" & set /a _CTA_Delimiters.index+=1
if %_CTA_Delimiters.index% LEQ %_CTA_Delimiters.ubound% GoTo :CreateTestArray-delimiter-loop
set /a _CTA_index+=1
if %_CTA_Base.index% LEQ %_CTA_Base.ubound% ( set /a "_CTA_Base.index+=1" ) else ( set /a "_CTA_Base.index=0" )
if %_CTA_index% LSS %_CTA_ActualCount% GoTo :CreateTestArray-loop
set /a %_CTA_OutputArray%.ubound=%_CTA_ActualCount%
echo !%_CTA_OutputArray%.comment!
Call :EchoArray %_CTA_OutputArray%
for /F "delims=" %%a in ('set %_CTA_OutputArray%') do (
	endlocal
	set "%%a"
	)
Call :ClearVariablesByPrefix %_CreateTestArray_prefix% _CreateTestArray
GoTo :EOF


::Usage Call :DeleteString InputString OutputString [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndex1 InsertString1  ... [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndexN InsertStringN
:DeleteString
set "_IS_ReplaceMode=true"
set "_IS_DeleteMode=true"
GoTo :InsertString
::Usage Call :ReplaceString InputString OutputString [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndex1 InsertString1  ... [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndexN InsertStringN
:ReplaceString
set "_IS_ReplaceMode=true"
::Usage Call :InsertString InputString OutputString [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndex1 InsertString1  ... [REPEAT Count]|[ALL][APPEND][OVERSPLIT][LEN DelimiterLen][RESET] InsertIndexN InsertStringN
:InsertString
set "_InsertString_prefix=_IS"
setlocal enabledelayedexpansion
if "[%~1]" EQU "[APPEND]" ( set "_IS_AppendMode=true" & shift)
set "_IS_LocalScope=true"
set "_IS_InputString=%~1"
set "_IS_OutputString=%~2"
if defined _IS_AppendMode if defined !_IS_OutputString! set "_IS_ResidualOutput=!_IS_OutputString!"
set /a _IS_InsertCountIndex=0
set /a _IS_InsertCount=-1
:InsertString-args
if "[%~3]" EQU "[REPEAT]" ( for /f "tokens=1,2 delims=," %%a in ("%~4") do ( set /a _IS_InsertCount=%%a & set /a _IS_InsertSkip=%%b 2>nul ) & shift & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[ALL]" ( set "_IS_AllTheString=true" & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[OVERSPLIT]" ( set "_IS_Oversplit=true" & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[LEN]" ( set /a _IS_InsertString_Pointer_len=%~4 & shift & shift & GoTo :InsertString-args )
if "[%~3]" EQU "[RESET]" ( set "_IS_Oversplit=" & set "_IS_InsertString_Pointer_len=" & set "_IS_Oversplit=" & set "_IS_InsertCount=" & set "_IS_InsertSkip=" & shift & GoTo :InsertString-args )
if defined _IS_AllTheString set "_IS_Oversplit="
set /a _IS_InsertIndex=%~3
set "_IS_InsertString=%~4"
shift & shift
set "_IS_InputString_Pointer=_IS_InputString" & if defined !_IS_InputString! set "_IS_InputString_Pointer=!_IS_InputString!"
set "_IS_InsertString_Pointer=_IS_InsertString" & if defined !_IS_InsertString! set "_IS_InsertString_Pointer=!_IS_InsertString!"
if defined _IS_DeleteMode set "_IS_InsertString_Pointer=_IS_Blank"
if not defined _IS_InsertString_Pointer_len ( set /a _IS_InsertString_Pointer_len=0 & if defined _IS_ReplaceMode call :len !_IS_InsertString_Pointer! _IS_InsertString_Pointer_len )
if defined _IS_DeleteMode set /a _IS_InsertString_Pointer_len=%_IS_InsertString%
set /a _IS_StartIndex=0
set /a _IS_NextIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
:InsertString-count-loop
if not defined _IS_Oversplit if "[!%_IS_InputString_Pointer%:~%_IS_NextIndex%!]" EQU "[]" GoTo :InsertString-count-end
set "_IS_NewOutput=!_IS_NewOutput!!%_IS_InputString_Pointer%:~%_IS_StartIndex%,%_IS_InsertIndex%!!%_IS_InsertString_Pointer%!"
set /a _IS_StartIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
if defined _IS_InsertSkip set /a _IS_InsertIndex=%_IS_InsertSkip%
set /a _IS_NextIndex=%_IS_StartIndex%+%_IS_InsertIndex%+%_IS_InsertString_Pointer_len%
if %_IS_InsertCountIndex% LSS %_IS_InsertCount% (  set /a _IS_InsertCountIndex+=1 & GoTo :InsertString-count-loop )
if defined _IS_AllTheString GoTo :InsertString-count-loop
:InsertString-count-end
set "_IS_NewOutput=!_IS_ResidualOutput!!_IS_NewOutput!!%_IS_InputString_Pointer%:~%_IS_StartIndex%!" & set "_IS_ResidualOutput="
if "[%~3]" NEQ "[]" ( set "_IS_InputString=!_IS_NewOutput!" & set "_IS_NewOutput=" & set "_IS_Oversplit=" & set "_IS_InsertString_Pointer_len=" & set "_IS_Oversplit=" & set "_IS_InsertCount=" & set "_IS_InsertSkip=" & GoTo :InsertString-args )
for /f "tokens=1* delims=" %%a in ("!_IS_NewOutput!") do ( endlocal & set %_IS_OutputString%=%%a )
if defined _IS_LocalScope endlocal
Call :ClearVariablesByPrefix %_InsertString_prefix% _InsertString_prefix & GoTo :EOF



:split-demo

GoTo :split-demo-skip-7
REM GoTo :split-demo-skip-max-lenght-test
REM GoTo :split-demo-skip-4.1

REM GoTo :split-demo-skip-1
echo.
echo Basic tests, byval input and byval delimiter
echo.
call :split-demo-helper "classic comma separated, works" "THIS,IS,A,TEST" _split_demo_array "," 
call :split-demo-helper "using dots instead, works" "THIS.IS.A.TEST" _split_demo_array "."
call :split-demo-helper "using a letter, Z, works" "THISZISZAZTEST" _split_demo_array "Z"  
call :split-demo-helper "using two character delimiter, double punctuation, works" "THIS::IS::A::TEST" _split_demo_array "::"  
call :split-demo-helper "using three characters, numbers, works" "THIS123IS123A123TEST" _split_demo_array "123"
call :split-demo-helper "using delimiter inside square brackets, works" "THIS[COLUMN]IS[COLUMN]A[COLUMN]TEST" _split_demo_array "[COLUMN]"
REM next one ends in infinite loop, maybe because of empty delimiter ?
REM call :split-demo-helper "carret poison character, carrets get doubled in the call because 'string byval' but works"  "THIS^IS^A^TEST" _split_demo_array "^"  
call :split-demo-helper "carret poison character, carrets get doubled in the call because 'string byval' but works" "THIS^^IS^^A^^TEST" _split_demo_array "^^"  
REM call :split-demo-helper "THIS%%IS%%A%%TEST" "%%" _split_demo_array "percent signs, strangely returns ubound=6 but empty elements"      I think this breaks the helper function to begin with
REM this test doesn't work
REM call :split-demo-helper "pipe poison character, pipe, works" "THIS|IS|A|TEST" _split_demo_array "|"   
call :split-demo-helper "THIS!IS!A!TEST" "!" _split_demo_array  "exclamation poison character, exclamation mark, breaks the test with infinite loop"
REM ampersand causes infinite loop
REM call :split-demo-helper "poison character, ampersands, works" "THIS&IS&A&TEST" _split_demo_array "&"  
:split-demo-skip-1

REM GoTo :split-demo-skip-2 
echo.
echo Now using byref instead of byval
echo.
set "_split_demo_test=THIS,IS,A,TEST" & set "_split_demo_delim=," & set "_split_demo_comment=classic comma separated, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS.IS.A.TEST" & set "_split_demo_delim=." & set "_split_demo_comment=using dots instead, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THISZISZAZTEST" & set "_split_demo_delim=Z" & set "_split_demo_comment=using a letter, Z, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS::IS::A::TEST" & set "_split_demo_delim=::" & set "_split_demo_comment=using two character delimiter, double punctuation, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS123IS123A123TEST" & set "_split_demo_delim=123" & set "_split_demo_comment=using three characters, numbers, works" 
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS[COLUMN]IS[COLUMN]A[COLUMN]TEST" & set "_split_demo_delim=[COLUMN]" & set "_split_demo_comment=using delimiter inside square brackets, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS^IS^A^TEST" & set "_split_demo_delim=^" & set "_split_demo_comment=poison character, carret, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS^^IS^^A^^TEST" & set "_split_demo_delim=^^" & set "_split_demo_comment=poison character, double carret, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS&IS&A&TEST" & set "_split_demo_delim=&" & set "_split_demo_comment=poison character, ampersands, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS%%IS%%A%%TEST" & set "_split_demo_delim=%%" & set "_split_demo_comment=percent signs, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
set "_split_demo_test=THIS|IS|A|TEST" & set "_split_demo_delim=|" & set "_split_demo_comment=poison character, pipe, works"
call :split-demo-helper "%_split_demo_comment%" _split_demo_test _split_demo_array _split_demo_delim
REM set "_split_demo_test=THIS!IS!A!TEST" & set "_split_demo_delim=!" & set "_split_demo_comment=poison character, exclamation mark, breaks the test with infinite loop"
REM call :split-demo-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
REM set "_split_demo_test=THIS^!IS^!A^!TEST" & set "_split_demo_delim=^!" & set "_split_demo_comment=poison character, exclamation mark, breaks the test with infinite loop"
REM call :split-demo-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
:split-demo-skip-2

REM GoTo :split-demo-skip-3
echo.
echo more tests
echo.

REM call :split-demo-helper "," "," _split_demo_array "1 char string that contains only the delimiter, should return two empty array element BUT BREAKS TEST WITH INFINIT LOOP"
call :split-demo-helper "1 char string that doesn't contains only the delimiter, should return one array element with input" "." _split_demo_array ","
call :split-demo-helper "10 char string that doesn't contains only the delimiter, should return one array element with input" "1234567890" _split_demo_array ","
:split-demo-skip-3

REM GoTo :split-demo-skip-4
echo.
echo test with long input strings
echo.
call :split-demo-helper "1006 characters long input string" "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" _split_demo_array "[]"
REM 2014 shouldn't break ??
call :split-demo-helper "2014 characters long input string" "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" _split_demo_array "[]"
REM 4026 breaks ?
REM call :split-demo-helper "4026 characters long input string" "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890" _split_demo_array "[]" 
GoTo :split-demo-skip-4
REM 8150 breaks
REM call :split-demo-helper "8150 characters long input string" "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567892" _split_demo_array  "[]"

REM these also break
GoTo :split-demo-skip-4
:split-demo-skip-max-lenght-test
echo test 8162 char length
call :split-demo-helper "8162 characters long input string" "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567892" _split_demo_array "[]"
GoTo :split-demo-skip-4
REM broken after this point
echo test 8163 char length, will break, limit is 8162
call :split-demo-helper "8163 characters long input string" "1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678901234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]1234567890[]12345678929" _split_demo_array "[]"
:split-demo-skip-4


:split-demo-skip-max-element-test
echo.
echo max element count test

call :split-demo-helper "10 dot element" ".,.,.,.,.,.,.,.,.,."       _split_demo_array "," 
call :split-demo-helper "10 dot element" "a,b,c,d,e,f,g,h,i,j"       _split_demo_array ","
call :split-demo-helper "10 dot element" ".,,,,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",.,,,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,.,,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,.,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,.,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,.,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,.,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,.,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,.,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,,."                _split_demo_array "," 
call :split-demo-helper "10 dot element" ".,,,,,,,,.,"               _split_demo_array ","
call :split-demo-helper "10 dot element" "a,,,,,,,,,"                _split_demo_array ","  
call :split-demo-helper "10 dot element" ",b,,,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,c,,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,d,,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,e,,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,f,,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,g,,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,h,,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,i,"                _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,,j"                _split_demo_array ","
call :split-demo-helper "10 dot element" "aa,,,,,,,,,"               _split_demo_array ","  
call :split-demo-helper "10 dot element" ",bb,,,,,,,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,cc,,,,,,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,dd,,,,,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,ee,,,,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,ff,,,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,gg,,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,hh,,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,ii,"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,,jj"               _split_demo_array ","
call :split-demo-helper "10 dot element" ",,,,,,,,,"                 _split_demo_array ","
call :split-demo-helper "10 dot element" " , , , , , , , , , "       _split_demo_array ","

call :split-demo-helper "10 dot element" ".,.,.,.,.,.,.,.,.,."                               _split_demo_array "," 
call :split-demo-helper "10 double dot element" "..,..,..,..,..,..,..,..,..,.."              _split_demo_array ","
call :split-demo-helper "10 triple dot element" "...,...,...,...,...,...,...,...,...,..."    _split_demo_array ","
call :split-demo-helper "10 multiple dot element" ".,..,...,....,.....,......,....,...,..,." _split_demo_array ","
call :split-demo-helper "10 dot with exclamation marks element" "!.,.!.,.!..,.!...,.!..!..,.!....!.,.!!...,.!.!.,.!.,.!" _split_demo_array ","

call :split-demo-helper "100 dot element" ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." _split_demo_array ","
REM 1000 works but commmented out because it's very long
REM call :split-demo-helper "1000 dot element" ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." _split_demo_array ","
REM 4000 works but commmented out because it's very long
GoTo :split-demo-skip-4.1
REM call :split-demo-helper "4000 dot element" ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." _split_demo_array ","
REM call :split-demo-helper "4082 element split" ".,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,." _split_demo_array ","
:split-demo-skip-4.1

REM GoTo :EOF



REM GoTo :split-demo-skip-6
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

set "_calltest[0]=call :test
set "_calltest[1]=call :test
set "_calltest[2]=call test.bat"
set "_calltest[3]=call %%test%%"
set "_calltest[4]=call %%:test%%"
set "_calltest[5]=call test"

set "_calltest[6]=call :test&echo test"
set "_calltest[7]=call test.bat&echo test"
set "_calltest[8]=call %%test%%&echo test"
set "_calltest[9]=call %%:test%%&echo test"
set "_calltest[10]=call test&echo test"

set "_calltest[11]=call :test &echo test"
set "_calltest[12]=call test.bat &echo test"
set "_calltest[13]=call %%test%% &echo test"
set "_calltest[14]=call %%:test%% &echo test"
set "_calltest[15]=call test &echo test"

set "_calltest[16]=call :test|echo test"
set "_calltest[17]=call test.bat|echo test"
set "_calltest[18]=call %%test%%|echo test"
set "_calltest[19]=call %%:test%%|echo test"

set "_calltest[20]=call %%:test%%|echo test"
set "_calltest[21]=call %%:test%%|echo test"
set "_calltest[22]=call %%:test%%|echo test"
set "_calltest[23]=call %%:test%%|echo test"
set "_calltest[24]=call %%:test%%|echo test"
set "_calltest[25]=call %%:test%%|echo test"
set "_calltest[26]=call %%:test%%|echo test"
set "_calltest[27]=call %%:test%%|echo test"
set "_calltest[28]=call %%:test%%|echo test"
set "_calltest[29]=call %%:test%%|echo test"

set "_calltest[30]1=call test|echo test"
set "_calltest[31]=call :test |echo test"
set "_calltest[32]=call test.bat |echo test"
set "_calltest[33]=call %%test%% |echo test"
set "_calltest[34]=call %%:test%% |echo test"
set "_calltest[35]=call test |echo test"

set "_calltest[36]=call :test>echo test"
set "_calltest[37]=call test.bat>echo test"
set "_calltest[38]=call %%test%%>echo test"
set "_calltest[39]=call %%:test%%>echo test"
set "_calltest[40]=call test>echo test"

set "_calltest[41]=call :test >echo test"
set "_calltest[42]=call test.bat >echo test"
set "_calltest[43]=call %%test%% >echo test"
set "_calltest[44]=call %%:test%% >echo test"
set "_calltest[45]=call test >echo test"

set "_calltest[46]=call :test<echo test"
set "_calltest[47]=call test.bat<echo test"
set "_calltest[48]=call %%test%%<echo test"
set "_calltest[49]=call %%:test%%<echo test"
set "_calltest[50]=call test<echo test"

set "_calltest[51]=call :test <echo test"
set "_calltest[52]=call test.bat <echo test"
set "_calltest[53]=call %%test%% <echo test"
set "_calltest[54]=call %%:test%% <echo test"
set "_calltest[55]=call test <echo test"

set "_calltest[56]=call :test argument1 argument2"
set "_calltest[57]=call test.bat argument1 argument2"
set "_calltest[58]=call %%test%% argument1 argument2"
set "_calltest[59]=call %%:test%% argument1 argument2"
set "_calltest[60]=call test argument1 argument2"

set "_calltest[61]=call :test argument1 argument2 &echo test"
set "_calltest[62]=call test.bat argument1 argument2 &echo test"
set "_calltest[63]=call %%test%% argument1 argument2 &echo test"
set "_calltest[64]=call %%:test%% argument1 argument2 &echo test"
set "_calltest[65]=call test argument1 argument2 &echo test"

set "_calltest[66]=call :test argument1 argument2&echo test"
set "_calltest[67]=call test.bat argument1 argument2&echo test"
set "_calltest[68]=call %%test%% argument1 argument2&echo test"
set "_calltest[69]=call %%:test%% argument1 argument2&echo test"
set "_calltest[70]=call test argument1 argument2&echo test"

set "_calltest[71]=call :test argument1 argument2 |echo test"
set "_calltest[72]=call test.bat argument1 argument2 |echo test"
set "_calltest[73]=call %%test%% argument1 argument2 |echo test"
set "_calltest[74]=call %%:test%% argument1 argument2 |echo test"
set "_calltest[75]=call test argument1 argument2 |echo test"

set "_calltest[76]=call :test argument1 argument2|echo test"
set "_calltest[77]=call test.bat argument1 argument2|echo test"
set "_calltest[78]=call %%test%% argument1 argument2|echo test"
set "_calltest[79]=call %%:test%% argument1 argument2|echo test"
set "_calltest[80]=call test argument1 argument2|echo test"

set "_calltest[81]=call :test argument1 argument2 >echo test"
set "_calltest[82]=call test.bat argument1 argument2 >echo test"
set "_calltest[83]=call %%test%% argument1 argument2 >echo test"
set "_calltest[84]=call %%:test%% argument1 argument2 >echo test"
set "_calltest[85]=call test argument1 argument2 >echo test"

set "_calltest[86]=call :test argument1 argument2>echo test"
set "_calltest[87]=call test.bat argument1 argument2>echo test"
set "_calltest[88]=call %%test%% argument1 argument2>echo test"
set "_calltest[89]=call %%:test%% argument1 argument2>echo test"
set "_calltest[90]=call test argument1 argument2>echo test"

set "_calltest[91]=call :test argument1 argument2 <echo test"
set "_calltest[92]=call test.bat argument1 argument2 <echo test"
set "_calltest[93]=call %%test%% argument1 argument2 <echo test"
set "_calltest[94]=call %%:test%% argument1 argument2 <echo test"
set "_calltest[95]=call test argument1 argument2 <echo test"

set "_calltest[96]=call :test argument1 argument2<echo test"
set "_calltest[97]=call test.bat argument1 argument2<echo test"
set "_calltest[98]=call %%test%% argument1 argument2<echo test"
set "_calltest[99]=call %%:test%% argument1 argument2<echo test"
set "_calltest[100]=call test argument1 argument2<echo test"

set /a _split_demo_functioncalltest_index=0
:split-demo-functioncalltest-loop

call :split-demo-helper "testing call function" _calltest[%_split_demo_functioncalltest_index%] _split_demo_functioncalltest_split_result "call" 


set /a _split_demo_functioncalltest_index+=1
if %_split_demo_functioncalltest_index% LEQ 100  GoTo :split-demo-functioncalltest-loop

:split-demo-functioncalltest-skip

echo.
echo experimental/debug tests
echo.
:split-demo-skip-5
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
REM call "%bfw.root%\lib\XXX\YYY.bat" = bfw lib call

REM split line on "call ", there must always be a space or tab between call and function name (do we really check for tabs ?)

REM call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works now"

REM GoTo :split-demo-skip-5
REM call :split-demo-helper "THIS&IS&A&TEST" "&" _split_demo_array "poison character, ampersands, works now"
:split-demo-skip-6
REM GoTo :split-demo-skip-6
REM set "_split_demo_test=THIS&IS&A&TEST" & set "_split_demo_delim=&" & set "_split_demo_comment=poison character, ampersands, works now"
REM call :split-demo-2-helper _split_demo_test _split_demo_delim _split_demo_array "%_split_demo_comment%"
:split-demo-skip-7

REM call :split-demo-helper "Simple split, dual delimiter" ",bb,,,,,,,,"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAA"                            _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXX"                         _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAA"                         _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAA"                      _split_demo_array "XXX" "YYY"

call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXX"                      _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXX"                      _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAA"                      _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXX"                         _split_demo_array "XXX" "YYY"

call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAAXXXAAA"          _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAAXXX"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAAXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXXXXAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAAXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXXXX"                      _split_demo_array "XXX" "YYY"

call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAAXXXAAA"          _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAAYYYAAA"          _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAYYYAAAXXXAAA"          _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYAAAXXXAAAXXXAAA"          _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAAXXX"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXAAAYYY"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAYYYAAAXXX"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYAAAXXXAAAXXX"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXYYYAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAYYYXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYAAAXXXXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAAYYYAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXYYYAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYXXXAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAAYYYAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAYYYAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYAAAXXXAAAXXXAAA"             _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAXXXYYY"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXAAAYYYXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYAAAXXXXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXYYYAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXYYYXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYXXXXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAAXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAAYYYAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXYYYAAAXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYXXXAAAXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXAAAYYY"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAYYYAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYAAAXXXAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXAAAYYY"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXYYYAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYXXXAAAXXX"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXYYYAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAYYYXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYAAAXXXXXXAAA"                _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXXXXAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXYYYAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXYYYXXXAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYXXXXXXAAA"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAAXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXAAAYYY"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXYYYAAAXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYXXXAAAXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAXXXYYY"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXAAAYYYXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYAAAXXXXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXXXXYYY"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAXXXYYYXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "AAAYYYXXXXXX"                   _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXXXX"                      _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXXXXYYY"                      _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "XXXYYYXXX"                      _split_demo_array "XXX" "YYY"
call :split-demo-helper "Simple split, dual delimiter" "YYYXXXXXX"                      _split_demo_array "XXX" "YYY"






Call :ClearVariablesByPrefix _split_demo

GoTo :EOF

:split-demo-helper
set "_SDH_prefix=_SDH"
set "_SDH_comment=%~1"
set "_SDH_input=%~2"
set "_SDH_output=%~3"
shift & shift & shift
setlocal enabledelayedexpansion
:split-demo-helper-args
set "_SDH_remaining_args=!_SDH_remaining_args! %1"
if "[%~1]" NEQ "[]" ( shift & GoTo :split-demo-helper-args )


REM echo call :split "!_SDH_input!" !_SDH_output! !_SDH_remaining_args!
call :split "!_SDH_input!" !_SDH_output! !_SDH_remaining_args!
REM echo array ubound !%_SDH_output%.ubound!
if defined !_SDH_remaining_args! set "_SDH_remaining_args=!%_SDH_remaining_args%!"
if defined !_SDH_input! set "_SDH_input=!%_SDH_input%!"
if defined !_SDH_comment! set "_SDH_comment=!%_SDH_comment%!"
echo delimiter :!_SDH_remaining_args!: input string :!_SDH_input!: comment : !_SDH_comment!
call :echoarray !_SDH_output! LINENUMBERS VERTICALMODE
echo.& echo.
endlocal 
Call :ClearVariablesByPrefix %_SDH_prefix% _SDH_prefix
GoTo :EOF


::Usage Call :IIF 0/1/true/false "%MacroIfTrue%" "%MacroIfFalse%" && echo Macro return value true/0 ||  echo Macro return value false/0
::Usage Call :Iterate InputArray "%Macro%" optional OutputArray
::Usage Call :IterateRange InputArray RangeArray "%Macro%" optional OutputArray



REM add trim function
REM import delimiters from array
REM import inputs from array
REM make inputs an array
REM make LEN work better
REM specify startindex position
REM specify which single element to return
REM specify a range of elements to return


REM _SPLT_count is not being counted, number of total elements added to output
REM Features to add [TRIM] TRIMLEFT TRIMRIGHT [TRIM] [TRIMLEFT:[-],'"] TRIMRIGHT:ABC TRUNKATE:25 NOEMPTY 1D 2D 3D XD ESCAPE:& INCLUDEDELIMITERS REGEX: IGNOREQUOTE:[] RUNMACRO TUPLE OVERLAP
REM [LIMIT] [STARTINDEX] [RANGE] [Nth]
REM arguments should be [CASESENSITIVE] [etc.] inputstring outputarray delimiter1 delimiter2 ... delimiterN
REM this will need a startindex probably, to start at a certain position in the string
::Usage Call :split [CASESENSITIVE] [START Index] [Limit ElementCount] InputString OutputArray Delimiter [LEN X]
:Split
REM echo args:%*
set "_Split_prefix=_SPLT"
setlocal enabledelayedexpansion
set "_SPLT_localscope=true"
set "_SPLT_CaseSensitivity=/i"
set "_SPLT_Output=%~1" & shift
REM read the input parameters

REM then for each delimiters, get inputs parameters, get len if available

:Split-input-args
set "_SPLT_Input=%~1"


:Split-args
if "[%~1]" EQU "[CASESENSITIVE]" ( set "_SPLT_CaseSensitivity=" & shift & GoTo :Split-args )
if "[%~1]" EQU "[LIMIT]" ( set /a _SPLT_StartIndex=%~2 & shift & shift & GoTo :Split-args )
if "[%~1]" EQU "[START]" ( set /a _SPLT_Limit=%~2 & shift & shift & GoTo :Split-args )
if "[%~1]" EQU "[TRIM]" ( echo NOT IMPLEMENTED & shift & GoTo :Split-args )
if "[%~1]" EQU "[TRUNKATE]" ( echo NOT IMPLEMENTED & shift & GoTo :Split-args )
if "[%~1]" EQU "[NODELIMITERS]" ( set "_SPLT_NoDelimiters=true" & shift & GoTo :Split-args )



shift & shift

set /a _SPLT_Delimiter.ubound=-1
:Split-delimiters-args

if "[!%~1.ubound!]" NEQ "[]" ( set "_SPLT_Delimiter_is_array=true" )
REM set "_SPLT_Buffer=%~1"
REM if defined _SPLT_Buffer if "[%_SPLT_Buffer:~1,3%]" EQU "[DIM]" if "[%_SPLT_Buffer%]" EQU "[]" ( set /a _SPLT_Delimiter_Dimension=%_SPLT_Buffer:~0,1% )
REM if defined _SPLT_Buffer if "[%_SPLT_Buffer:~4,1%]" EQU "[]" ( set /a _SPLT_Delimiter_Dimension=%_SPLT_Buffer:~0,1% 2>nul )
set /a _SPLT_Delimiter.index=0
if "[!%~1.ubound!]" NEQ "[]" set /a _SPLT_Delimiter_input_array_ubound=!%~1.ubound! 2>nul

REM FOr each delimiter 
REM copyobjects if array
REM get len if available
REM trim
REM trunkate
REM dimensions of delimiters

REM if "[!%~1.ubound!]" EQU "[]" GoTo :CreateTestArray-delimiter-array-skip
REM if defined %~1.ubound ( set /a _CTA_Delimiters.ubound-=1 & for /l %%a in (0,1,!%~1.ubound!) do ( set /a _CTA_Delimiters.ubound+=1 & Call :CopyObject %~1[%%a] _CTA_Delimiters[%_CTA_Delimiters.ubound%] ) )
REM shift & GoTo :CreateTestArray-args 
REM :CreateTestArray-delimiter-array-skip


REM input loop before delimiter loop

:Split-delimiters-loop-args
if "[%~1]" EQU "[LEN]" ( set /a _SPLT_Delimiter[%_SPLT_Delimiter.ubound%].len=%~2 & shift & shift & GoTo :Split-delimiters-loop-args )
if "[%~1]" NEQ "[]" set /a _SPLT_Delimiter.ubound+=1
if "[%~1]" NEQ "[]" if defined _SPLT_Delimiter_is_array set "_SPLT_Delimiter[%_SPLT_Delimiter.ubound%]=!%~1[%_SPLT_Delimiter.index%]!"
REM if "[%~1]" NEQ "[]" if defined _SPLT_Delimiter_is_array echo _SPLT_Delimiter_is_array is defined 
REM if "[%~1]" NEQ "[]" if not defined _SPLT_Delimiter_is_array echo set "_SPLT_Delimiter[%_SPLT_Delimiter.ubound%]=%~1"
if "[%~1]" NEQ "[]" if not defined _SPLT_Delimiter_is_array set "_SPLT_Delimiter[%_SPLT_Delimiter.ubound%]=%~1"
REM if "[%~1]" NEQ "[]" if not defined _SPLT_Delimiter_is_array echo _SPLT_Delimiter_is_array is not defined
if defined _SPLT_Delimiter_is_array set /a _SPLT_Delimiter.index+=1
if defined _SPLT_Delimiter_is_array if %_SPLT_Delimiter.index% LEQ %_SPLT_Delimiter_input_array_ubound% ( GoTo :Split-delimiters-loop-args )
set "_SPLT_Delimiter.index=" & set "_SPLT_Delimiter_is_array=" & if "[%~2]" NEQ "[]" ( shift & GoTo :Split-delimiters-args )
set /a _SPLT_Delimiter.index=0

REM REBUILD delimiter setup, include LEN check 



REM set "_SPLT_Input_Pointer=_SPLT_Input" 
REM set "_SPLT_Delimiter_Pointer=_SPLT_Delimiter"
REM if defined !_SPLT_Input! ( set "_SPLT_Input_Pointer=!_SPLT_Input!" )
REM if defined !_SPLT_Delimiter! ( set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter!" )
if defined %_SPLT_Output%.ubound set /a _SPLT_Output_ubound=!%_SPLT_Output%.ubound!
if not defined _SPLT_Output_ubound set /a _SPLT_Output_ubound=-1
set "_SPLT_Input_Pointer=_SPLT_Input" & if defined !_SPLT_Input! ( set "_SPLT_Input_Pointer=!_SPLT_Input!" )
Call :len "%_SPLT_Input_Pointer%" _SPLT_Input_len
if not defined _SPLT_StartIndex set /a _SPLT_StartIndex=0

set /a _SPLT_Delimiter.index=0
:Split-loop
set _SPLT
echo :Split-loop _SPLT_Delimiter.index %_SPLT_Delimiter.index%
set /a _SPLT_Index=%_SPLT_StartIndex%
REM IF _SPLT_Index goes over _SPLT_Result, exit loop for this delimiter, make sure to clear _SPLT_Result at the right time
set "_SPLT_Delimiter_Pointer=_SPLT_Delimiter[%_SPLT_Delimiter.index%]" 
if defined !%_SPLT_Delimiter_Pointer%! ( set "_SPLT_Delimiter_Pointer=!%_SPLT_Delimiter_Pointer%!" )
set "_SPLT_Delimiter_len=!_SPLT_Delimiter[%_SPLT_Delimiter.index%].len!"
if not defined _SPLT_Delimiter_len Call :len %_SPLT_Delimiter_Pointer% _SPLT_Delimiter_len
set "_SPLT_Search=!%_SPLT_Delimiter_Pointer%!"
set /a _SPLT_remaining_input_len=%_SPLT_Input_len%-%_SPLT_Index%
if %_SPLT_remaining_input_len% LSS 64 ( set /a _SPLT_Search_Window_len=%_SPLT_remaining_input_len% ) else ( set /a _SPLT_Search_Window_len=64 )
:Split-substring-pre-loop
REM echo :Split-substring-pre-loop
set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" EQU "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% GEQ %_SPLT_remaining_input_len% ( set /a _SPLT_Index=%_SPLT_Input_len% & GoTo :Split-substring-end ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len%-1 & set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%*2 & GoTo :Split-substring-pre-loop ) )
set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2
:Split-substring-loop
set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
if defined _SPLT_CurrentWindow ( set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!" ) else ( GoTo :Split-substring-end )
if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" NEQ "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% EQU 1 ( GoTo :Split-substring-end ) else ( set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2 ) ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len% )
GoTo :Split-substring-loop 
:Split-substring-end
:Split-end
REM echo :Split-end
REM save .len of each element
REM increment ubound if last element position was end of string
REM save index of each element  .index .delim .len

echo _SPLT_Result before %_SPLT_Result%
if not defined _SPLT_Result ( set /a _SPLT_Result=%_SPLT_Index% & set "_SPLT_LastDelimiter=!_SPLT_Search!" & set "_SPLT_LastDelimiterLen=%_SPLT_Delimiter_len%" ) else ( if !_SPLT_Index! LSS !_SPLT_Result! ( set /a _SPLT_Result=%_SPLT_Index% & set "_SPLT_LastDelimiter=%_SPLT_Search%" & set "_SPLT_LastDelimiterLen=%_SPLT_Delimiter_len%" ) )
echo _SPLT_Result after %_SPLT_Result%
set /a _SPLT_Delimiter.index+=1
REM echo a2 _SPLT_Delimiter.index %_SPLT_Delimiter.index% _SPLT_Delimiter.ubound %_SPLT_Delimiter.ubound%
IF %_SPLT_Delimiter.index% LEQ %_SPLT_Delimiter.ubound% GoTo :Split-loop
set /a _SPLT_Index=%_SPLT_Result%


set /a _SPLT_Output_ubound+=1
set /a _SPLT_Len=%_SPLT_Index%-%_SPLT_StartIndex%

echo _SPLT_Result %_SPLT_Result% cut %_SPLT_StartIndex%,%_SPLT_Len%

REM echo a3 %_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%
REM echo set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%!"
set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%!"
if not defined _SPLT_NoDelimiters set "%_SPLT_Output%[%_SPLT_Output_ubound%].delimiter=!_SPLT_Search!"
set "%_SPLT_Output%[%_SPLT_Output_ubound%].len=%_SPLT_LastDelimiterLen%"
set "%_SPLT_Output%[%_SPLT_Output_ubound%].index=%_SPLT_Index%"
echo set /a _SPLT_StartIndex=%_SPLT_Index%+%_SPLT_Delimiter_len%

REM DOn't add delimiter len if no delimiter found (end of line ? , does it really matter ?)
set /a _SPLT_StartIndex=%_SPLT_Index%+%_SPLT_Delimiter_len%


REM echo a5 _SPLT_Index %_SPLT_Index% _SPLT_Input_len %_SPLT_Input_len%

set /a _SPLT_Delimiter.index=0
echo if %_SPLT_Index% LSS %_SPLT_Input_len% GoTo :Split-loop  AND _SPLT_StartIndex %_SPLT_StartIndex%
if %_SPLT_Index% LSS %_SPLT_Input_len% GoTo :Split-loop

REM echo finished _SPLT_Output_ubound %_SPLT_Output_ubound%
set /a %_SPLT_Output%.ubound=%_SPLT_Output_ubound%
for /F "delims=" %%a in ('set %_SPLT_Output%') do (
	endlocal
	set "%%a"
	)
if defined _SPLT_localscope endlocal
Call :ClearVariablesByPrefix %_Split_prefix% _Split_prefix  & exit /b %_SPLT_count%
REM thanks to https://stackoverflow.com/questions/49041934/how-to-return-an-array-of-values-across-endlocal https://stackoverflow.com/a/49042678




REM REM [NODEREFERENCE] to disable byref
REM ::Usage Call :GetSubstringIndex [CASESENSITIVE] InputString optional StartIndex optional [OUTPUT OutputIndexVar] Delimiter1 Delimiter2 ... DelimiterN ??... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
REM ::Usage Call :GetSubstringIndex InputString SearchString optional StartIndex OutputIndexVar ... InputStringN SearchStringN StartIndexN Optional OutputIndexVar
REM :GetSubstringIndex
REM set "_GetSubstringIndex_prefix=_GSSI"
REM setlocal enabledelayedexpansion
REM set "_GSSI_CaseSensitivity=/i"
REM :GetSubstringIndex-args







REM REM _SPLT_count is not being counted, number of total elements added to output
REM REM Features to add [TRIM] TRIMLEFT TRIMRIGHT [TRIM] [TRIMLEFT:[-],'"] TRIMRIGHT:ABC TRUNKATE:25 NOEMPTY 1D 2D 3D XD ESCAPE:& INCLUDEDELIMITERS REGEX: IGNOREQUOTE:[] RUNMACRO TUPLE OVERLAP
REM REM [LIMIT] [STARTINDEX] [RANGE] [Nth]
REM REM arguments should be [CASESENSITIVE] [etc.] inputstring outputarray delimiter1 delimiter2 ... delimiterN
REM REM this will need a startindex probably, to start at a certain position in the string
REM ::Usage Call :split InputString Delimiter OutputArray optional limit [CASESENSITIVE]
REM :Split
REM set "_Split_prefix=_SPLT"
REM set "_SPLT_CaseSensitivity=/i"
REM if "[%~1]" EQU "[CASESENSITIVE]" ( set "_SPLT_CaseSensitivity=" & shift )
REM set "_SPLT_Input=%~1"
REM set "_SPLT_Delimiter=%~2"
REM set "_SPLT_Output=%~3"
REM shift & shift & shift
REM echo.%~1| findstr /r "[^0123456789]" >nul || ( set /a _SPLT_Limit=%~1 & shift )
REM setlocal enabledelayedexpansion
REM set "_SPLT_localscope=true"
REM set "_SPLT_Input_Pointer=_SPLT_Input" 
REM set "_SPLT_Delimiter_Pointer=_SPLT_Delimiter"
REM if defined !_SPLT_Input! ( set "_SPLT_Input_Pointer=!_SPLT_Input!" )
REM if defined !_SPLT_Delimiter! ( set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter!" )
REM REM if defined !_SPLT_Delimiter!.ubound set /a _SPLT_Delimiter_ubound=!%_SPLT_Delimiter%.ubound!
REM REM if defined !_SPLT_Delimiter!.ubound set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter![!%_SPLT_Delimiter%.lbound!]"
REM if defined %_SPLT_Output%.ubound set /a _SPLT_Output_ubound=!%_SPLT_Output%.ubound!
REM if not defined _SPLT_Output_ubound set /a _SPLT_Output_ubound=-1
REM Call :len "%_SPLT_Input_Pointer%" _SPLT_Input_len
REM Call :len "%_SPLT_Delimiter_Pointer%" _SPLT_Delimiter_len
REM REM if not defined !_SPLT_Delimiter!.ubound GoTo :Split-get-delimiter-len-skip
REM REM :Split-get-delimiter-len-loop
REM REM FOR EACH DELIMITER, FIND DELIMITER.LEN
REM REM :Split-get-delimiter-len-skip
REM REM if defined _SPLT_Delimiter_ubound set /a _SPLT_Delimiter_index=0
REM REM :Split-delimiter-loop ?
REM set /a _SPLT_StartIndex=0
REM set /a _SPLT_Index=0
REM set "_SPLT_Search=!%_SPLT_Delimiter_Pointer%!"
REM :Split-loop
REM set /a _SPLT_remaining_input_len=%_SPLT_Input_len%-%_SPLT_Index%
REM if %_SPLT_remaining_input_len% LSS 64 ( set /a _SPLT_Search_Window_len=%_SPLT_remaining_input_len% ) else ( set /a _SPLT_Search_Window_len=64 )
REM :Split-substring-pre-loop
REM set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
REM set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
REM set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
REM if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" EQU "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% GEQ %_SPLT_remaining_input_len% ( set /a _SPLT_Index=%_SPLT_Input_len% & GoTo :Split-substring-end ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len%-1 & set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%*2 & GoTo :Split-substring-pre-loop ) )
REM set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2
REM :Split-substring-loop
REM set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
REM set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
REM set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
REM REM set _SPLT
REM if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" NEQ "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% EQU 1 ( GoTo :Split-substring-end ) else ( set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2 ) ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len% )
REM GoTo :Split-substring-loop 
REM :Split-substring-end
REM if %_SPLT_Index% EQU -1 ( set /a _SPLT_Len=%_SPLT_Input_len%-%_SPLT_Index% ) else ( set /a _SPLT_Len=%_SPLT_Index%-%_SPLT_StartIndex% )
REM set /a _SPLT_Output_ubound+=1
REM REM echo set "%_SPLT_Output%[%_SPLT_Output_ubound%]=^!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%^!"
REM set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%!"
REM REM if %_SPLT_Delimiter_index% LEQ %_SPLT_Delimiter_ubound% GoTo :Split-delimiter-loop
REM set /a _SPLT_StartIndex=%_SPLT_Index%+%_SPLT_Delimiter_len%
REM set /a _SPLT_Index=%_SPLT_StartIndex%
REM if %_SPLT_Index% LSS %_SPLT_Input_len% GoTo :Split-loop
REM set /a %_SPLT_Output%.ubound=%_SPLT_Output_ubound%
REM for /F "delims=" %%a in ('set %_SPLT_Output%') do (
	REM endlocal
	REM set "%%a"
	REM )
REM if defined _SPLT_localscope endlocal
REM Call :ClearVariablesByPrefix %_Split_prefix% _Split_prefix  & exit /b %_SPLT_count%
REM REM thanks to https://stackoverflow.com/questions/49041934/how-to-return-an-array-of-values-across-endlocal https://stackoverflow.com/a/49042678




















REM REM _SPLT_count is not being counted, number of total elements added to output
REM REM Features to add [TRIM] TRIMLEFT TRIMRIGHT [TRIM] [TRIMLEFT:[-],'"] TRIMRIGHT:ABC TRUNKATE:25 NOEMPTY 1D 2D 3D XD ESCAPE:& INCLUDEDELIMITERS REGEX: IGNOREQUOTE:[] RUNMACRO TUPLE OVERLAP
REM REM [LIMIT] [STARTINDEX] [RANGE] [Nth]
REM REM arguments should be [CASESENSITIVE] [etc.] inputstring outputarray delimiter1 delimiter2 ... delimiterN
REM REM this will need a startindex probably, to start at a certain position in the string
REM ::Usage Call :split InputString Delimiter OutputArray optional limit [CASESENSITIVE]
REM :Split
REM set "_Split_prefix=_SPLT"
REM set "_SPLT_CaseSensitivity=/i"
REM if "[%~1]" EQU "[CASESENSITIVE]" ( set "_SPLT_CaseSensitivity=" & shift )
REM set "_SPLT_Input=%~1"
REM set "_SPLT_Delimiter=%~2"
REM set "_SPLT_Output=%~3"
REM shift & shift & shift
REM echo.%~1| findstr /r "[^0123456789]" >nul || ( set /a _SPLT_Limit=%~1 & shift )
REM setlocal enabledelayedexpansion
REM set "_SPLT_localscope=true"
REM set "_SPLT_Input_Pointer=_SPLT_Input" 
REM set "_SPLT_Delimiter_Pointer=_SPLT_Delimiter"
REM if defined !_SPLT_Input! ( set "_SPLT_Input_Pointer=!_SPLT_Input!" )
REM if defined !_SPLT_Delimiter! ( set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter!" )
REM REM if defined !_SPLT_Delimiter!.ubound set /a _SPLT_Delimiter_ubound=!%_SPLT_Delimiter%.ubound!
REM REM if defined !_SPLT_Delimiter!.ubound set "_SPLT_Delimiter_Pointer=!_SPLT_Delimiter![!%_SPLT_Delimiter%.lbound!]"
REM if defined %_SPLT_Output%.ubound set /a _SPLT_Output_ubound=!%_SPLT_Output%.ubound!
REM if not defined _SPLT_Output_ubound set /a _SPLT_Output_ubound=-1
REM Call :len "%_SPLT_Input_Pointer%" _SPLT_Input_len
REM Call :len "%_SPLT_Delimiter_Pointer%" _SPLT_Delimiter_len
REM REM if not defined !_SPLT_Delimiter!.ubound GoTo :Split-get-delimiter-len-skip
REM REM :Split-get-delimiter-len-loop
REM REM FOR EACH DELIMITER, FIND DELIMITER.LEN
REM REM :Split-get-delimiter-len-skip
REM REM if defined _SPLT_Delimiter_ubound set /a _SPLT_Delimiter_index=0
REM REM :Split-delimiter-loop ?
REM set /a _SPLT_StartIndex=0
REM set /a _SPLT_Index=0
REM set "_SPLT_Search=!%_SPLT_Delimiter_Pointer%!"
REM :Split-loop
REM set /a _SPLT_remaining_input_len=%_SPLT_Input_len%-%_SPLT_Index%
REM if %_SPLT_remaining_input_len% LSS 64 ( set /a _SPLT_Search_Window_len=%_SPLT_remaining_input_len% ) else ( set /a _SPLT_Search_Window_len=64 )
REM :Split-substring-pre-loop
REM set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
REM set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
REM set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
REM if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" EQU "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% GEQ %_SPLT_remaining_input_len% ( set /a _SPLT_Index=%_SPLT_Input_len% & GoTo :Split-substring-end ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len%-1 & set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%*2 & GoTo :Split-substring-pre-loop ) )
REM set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2
REM :Split-substring-loop
REM set /a _SPLT_Actual_Search_Window_len=%_SPLT_Search_Window_len%+%_SPLT_Delimiter_len%-1
REM set "_SPLT_CurrentWindow=!%_SPLT_Input_Pointer%:~%_SPLT_Index%,%_SPLT_Actual_Search_Window_len%!"
REM set "_SPLT_CurrentWindowResult=!_SPLT_CurrentWindow:%_SPLT_Search%=!"
REM REM set _SPLT
REM if %_SPLT_CaseSensitivity% "!_SPLT_CurrentWindow!" NEQ "!_SPLT_CurrentWindowResult!" ( if %_SPLT_Search_Window_len% EQU 1 ( GoTo :Split-substring-end ) else ( set /a _SPLT_Search_Window_len=%_SPLT_Search_Window_len%/2 ) ) else ( set /a _SPLT_Index=%_SPLT_Index%+%_SPLT_Search_Window_len% )
REM GoTo :Split-substring-loop 
REM :Split-substring-end
REM if %_SPLT_Index% EQU -1 ( set /a _SPLT_Len=%_SPLT_Input_len%-%_SPLT_Index% ) else ( set /a _SPLT_Len=%_SPLT_Index%-%_SPLT_StartIndex% )
REM set /a _SPLT_Output_ubound+=1
REM REM echo set "%_SPLT_Output%[%_SPLT_Output_ubound%]=^!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%^!"
REM set "%_SPLT_Output%[%_SPLT_Output_ubound%]=!%_SPLT_Input_Pointer%:~%_SPLT_StartIndex%,%_SPLT_Len%!"
REM REM if %_SPLT_Delimiter_index% LEQ %_SPLT_Delimiter_ubound% GoTo :Split-delimiter-loop
REM set /a _SPLT_StartIndex=%_SPLT_Index%+%_SPLT_Delimiter_len%
REM set /a _SPLT_Index=%_SPLT_StartIndex%
REM if %_SPLT_Index% LSS %_SPLT_Input_len% GoTo :Split-loop
REM set /a %_SPLT_Output%.ubound=%_SPLT_Output_ubound%
REM for /F "delims=" %%a in ('set %_SPLT_Output%') do (
	REM endlocal
	REM set "%%a"
	REM )
REM if defined _SPLT_localscope endlocal
REM Call :ClearVariablesByPrefix %_Split_prefix% _Split_prefix  & exit /b %_SPLT_count%
REM REM thanks to https://stackoverflow.com/questions/49041934/how-to-return-an-array-of-values-across-endlocal https://stackoverflow.com/a/49042678

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
echo.%~1| findstr /r "[^0123456789]" >nul || ( echo isnum "%~1" & set /a _GSSI_StartIndex=%~1 & shift )
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
if "[%~1]" NEQ "[]" if defined _GSSI_Delimiter_is_array set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=!%~1[%_GSSI_Delimiter.index%]!"
REM if "[%~1]" NEQ "[]" if defined _GSSI_Delimiter_is_array echo _GSSI_Delimiter_is_array is defined 
REM if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array echo set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=%~1"
if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array set "_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]=%~1"
REM if "[%~1]" NEQ "[]" if not defined _GSSI_Delimiter_is_array echo _GSSI_Delimiter_is_array is not defined
if defined _GSSI_Delimiter_is_array set /a _GSSI_Delimiter.index+=1
if defined _GSSI_Delimiter_is_array if %_GSSI_Delimiter.index% LEQ %_GSSI_Delimiter_input_array_ubound% ( GoTo :GetSubstringIndex-delimiters-loop-args )
set "_GSSI_Delimiter.index=" & set "_GSSI_Delimiter_is_array=" & if "[%~2]" NEQ "[]" ( shift & GoTo :GetSubstringIndex-delimiters-args )
set /a _GSSI_Delimiter.index=0
set "_GSSI_Input_Pointer=_GSSI_Input" & if defined !_GSSI_Input! ( set "_GSSI_Input_Pointer=!_GSSI_Input!" )
Call :len "%_GSSI_Input_Pointer%" _GSSI_Input_len
if not defined _GSSI_StartIndex set /a _GSSI_StartIndex=0
:GetSubstringIndex-loop
set /a _GSSI_Index=%_GSSI_StartIndex%
set "_GSSI_Delimiter_Pointer=_GSSI_Delimiter[%_GSSI_Delimiter.ubound%]" 
if defined !%_GSSI_Delimiter_Pointer%! ( set "_GSSI_Delimiter_Pointer=!%_GSSI_Delimiter_Pointer%!" )
Call :len "%_GSSI_Delimiter_Pointer%" _GSSI_Delimiter_len
set "_GSSI_Search=!%_GSSI_Delimiter_Pointer%!"
set /a _GSSI_remaining_input_len=%_GSSI_Input_len%-%_GSSI_Index%
if %_GSSI_remaining_input_len% LSS 64 ( set /a _GSSI_Search_Window_len=%_GSSI_remaining_input_len% ) else ( set /a _GSSI_Search_Window_len=64 )
:GetSubstringIndex-substring-pre-loop
set /a _GSSI_Actual_Search_Window_len=%_GSSI_Search_Window_len%+%_GSSI_Delimiter_len%-1
set "_GSSI_CurrentWindow=!%_GSSI_Input_Pointer%:~%_GSSI_Index%,%_GSSI_Actual_Search_Window_len%!"
set "_GSSI_CurrentWindowResult=!_GSSI_CurrentWindow:%_GSSI_Search%=!"
if %_GSSI_CaseSensitivity% "!_GSSI_CurrentWindow!" EQU "!_GSSI_CurrentWindowResult!" ( if %_GSSI_Search_Window_len% GEQ %_GSSI_remaining_input_len% ( set /a _GSSI_Index=%_GSSI_Input_len% & GoTo :GetSubstringIndex-substring-end ) else ( set /a _GSSI_Index=%_GSSI_Index%+%_GSSI_Search_Window_len%-1 & set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%*2 & GoTo :GetSubstringIndex-substring-pre-loop ) )
set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%/2
:GetSubstringIndex-substring-loop
set /a _GSSI_Actual_Search_Window_len=%_GSSI_Search_Window_len%+%_GSSI_Delimiter_len%-1
set "_GSSI_CurrentWindow=!%_GSSI_Input_Pointer%:~%_GSSI_Index%,%_GSSI_Actual_Search_Window_len%!"
set "_GSSI_CurrentWindowResult=!_GSSI_CurrentWindow:%_GSSI_Search%=!"
if %_GSSI_CaseSensitivity% "!_GSSI_CurrentWindow!" NEQ "!_GSSI_CurrentWindowResult!" ( if %_GSSI_Search_Window_len% EQU 1 ( GoTo :GetSubstringIndex-substring-end ) else ( set /a _GSSI_Search_Window_len=%_GSSI_Search_Window_len%/2 ) ) else ( set /a _GSSI_Index=%_GSSI_Index%+%_GSSI_Search_Window_len% )
GoTo :GetSubstringIndex-substring-loop 
:GetSubstringIndex-substring-end
:GetSubstringIndex-end
if not defined _GSSI_Result ( set /a _GSSI_Result=%_GSSI_Index% ) else ( if %_GSSI_Index% LSS %_GSSI_Result% set /a _GSSI_Result=%_GSSI_Index% )
set /a _GSSI_Delimiter.index+=1
IF %_GSSI_Delimiter.index% LEQ %_GSSI_Delimiter.ubound% GoTo :GetSubstringIndex-loop
endlocal & set /a _GSSI_Index=%_GSSI_Index% & if "[%_GSSI_Output%]" NEQ "[]" set /a %_GSSI_Output%=%_GSSI_Index%
Call :ClearVariablesByPrefix %_GetSubstringIndex_prefix% _GetSubstringIndex_prefix & exit /b %_GSSI_Index% 

::Usage Call :CreateRandomStringPS [NONUMBERS] [NOUPPERCASE] [NOUPPERCASE] [SPACE] [PUNCTUATION] [NOPOISON] [POISON] [EXTENDED] [CONTROL] [RESET] Stringlength1 OutputVariable1 Stringlength2 OutputVariable2 ... StringlengthN OutputVariableN
::You can your CLEAR in front of the switches to clear them
:CreateRandomStringPS
set "_CreateRandomStringPS_prefix=_CRS"
set "_CRS_SetList=NONUMBERS NOUPPERCASE NOLOWERCASE SPACE PUNCTUATION NOPOISON EXTENDED CONTROL NOPOISON POISON"
if "[%~1]" EQU "[RESET]" ( for %%a in (%_CRS_SetList%) do ( set "_CRS_%%a=" ) & shift & GoTo :CreateRandomStringPS )
if "[%~1]" EQU "[OVERRIDE]" ( set "_CRS_%~1= + %~2" & shift & shift & GoTo :CreateRandomStringPS )
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
if defined _CRS_OVERRIDE call set "_CRS_CurrentSet=%_CRS_OVERRIDE%"
for /f "tokens=1* delims=" %%a in ('powershell -command "-join (1..%_CRS_Len% | ForEach-Object { %_CRS_CurrentSet:~3% | Get-Random } | ForEach-Object { [char]$_ })" 2^>nul') do set %_CRS_Output%=%%a
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" ( shift & shift & GoTo :CreateRandomStringPS )
Call :ClearVariablesByPrefix %_CreateRandomStringPS_prefix% _CreateRandomStringPS_prefix & GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF


:len <stringVar> <resultVar>
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

:CopyObject objectname destinationobject
set "_CopyObject_prefix=_CO"
set _CO_Input=%~1
set _CO_Output=%~2

for /f "tokens=1,2* delims==" %%a in ('set %_CO_Input% 2^>nul') do  (
	setlocal enabledelayedexpansion
	set "_CO_localscope=true"
	set _CO_Suffix_buffer_input=%%a
	set _CO_Suffix_buffer_output=%_CO_Output%!_CO_Suffix_buffer_input:%_CO_Input%=!
	for /f "tokens=*" %%Z in ('echo.!_CO_Suffix_buffer_output!') do (
																endlocal 
																set %%Z=%%b
																)
	if defined _CO_localscope endlocal
	)
if defined _CO_localscope endlocal
Call :ClearVariablesByPrefix %_CopyObject_prefix% _CopyObject 
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" shift & shift & GoTo :CopyObject
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

:argprint
echo 1%~1 2%~2 3%~3 4%~4 5%~5 6%~6 7%~7 8%~8 9%~9
GoTo :EOF

REM INCOMPLETE
::Usage Call :GetArgumentString OutputString [SHIFT [X] [/X] [X/]] [DOUBLEQUOTE [']] [DEDUPLICATECARRETS] [TOARRAY] [INCLUDECALLER] %*
:GetArgumentString
set "_GAS_prefix=_GAS"
set "_GAS_Output=%~1" & shift
setlocal enabledelayedexpansion
:GetArgumentString-args
set "_GAS_buffer=%~2"
if "[%~1]" EQU "[SHIFT]" ( echo.%~2| findstr /r "[^0123456789]" >nul && ( set /a "_GAS_Shift=0" & shift & GoTo :GetArgumentString-args ) ) || ( set /a "_GAS_Shift=%~2" & shift & shift & GoTo :GetArgumentString-args )
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


