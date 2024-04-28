@echo off
:setup
set debug=true
:main

GoTo :DeconcatenateDEMO
GoTo :END

REM This demonstrates functions Deconcatenate,GetLastElement and GetNthElement
:DeconcatenateDEMO
REM set debug=true

set TestVar=HKEY_CURRENT_USER\EUDC\666\myteststring
set TestVar=HKEY_CURRENT_USER/EUDC/666/myteststring
set EchoArrayPrefix=Output[%%index%%]=

echo. & echo Deconcatenate to array %date% %time%
Call :deconcatenate "/" %TestVar% Output
Call :EchoArray Output
Call :ClearArray Output

echo. & echo DeconcatenateFast to array %date% %time%
Call :deconcatenateFast "/" %TestVar% Output
Call :EchoArray Output
Call :ClearArray Output

echo. & echo GetLastElement from  array %date% %time%
Call :GetLastElement / %TestVar% Output
set Output=& echo last element %output%

echo. & echo GetLastElementFast from  array %date% %time%
Call :GetLastElementFast / %TestVar% Output
set Output=&echo last element %output%

echo. & echo GetNthElement from  array %date% %time%
set Output=&Call :GetNthElement / %TestVar% Output 0
set Output=&echo 0th element %output%
set Output=&Call :GetNthElement / %TestVar% Output 1
set Output=&echo 1st element %output%
set Output=&Call :GetNthElement / %TestVar% Output 2
set Output=&echo 2nd element %output%
set Output=&Call :GetNthElement / %TestVar% Output 3
set Output=&echo 3rd element %output%
set Output=&Call :GetNthElement / %TestVar% Output 4
set Output=&echo 4th element %output%
set Output=&Call :GetNthElement / %TestVar% Output 5
set Output=&echo 5th element %output%

echo. & echo GetNthElementFast from  array %date% %time%
set Output=&Call :GetNthElementFast / %TestVar% Output 0
set Output=&echo 0th element %output%
set Output=&Call :GetNthElementFast / %TestVar% Output 1
set Output=&echo 1st element %output%
set Output=&Call :GetNthElementFast / %TestVar% Output 2
set Output=&echo 2nd element %output%
set Output=&Call :GetNthElementFast / %TestVar% Output 3
set Output=&echo 3rd element %output%
set Output=&Call :GetNthElementFast / %TestVar% Output 4
set Output=&echo 4th element %output%
set Output=&Call :GetNthElementFast / %TestVar% Output 5
set Output=&echo 5th element %output%

echo. & echo Demo finished %date% %time%

GoTo :EOF

:END
GoTo :EOF
REM Function library



:ReadFile

GoTo :EOF

:ReadFolder

GoTo :EOF

:ReadCommand

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

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
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

:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "len=%%%~1.len%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
if not ["%len%"]==[""] call echo %~1.len %%%~1.len%%
if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop

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
if not defined %~1[%index%] GoTo :EOF
call set %%%~1[%index%]%=
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :ClearArray-internal-loop
 
REM ********* function *****************************
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