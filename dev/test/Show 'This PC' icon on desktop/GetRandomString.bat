
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

