@echo off

REM Test cases for the InStr function
set testCases[1]="Hello, world!","world",8
set testCases[2]="The quick brown fox jumps over the lazy dog","brown",11
set testCases[3]="This is a test","is",3
set testCases[4]="This is a test","xyz",-1
set testCases[5]="","abc",-1
set testCases[6]="abc","",-1

REM Loop through each test case
for /f "tokens=2,3,4 delims=," %%a in ('set testCases[') do (
    set inputString=%%~a
    set searchString=%%~b
    set expectedPosition=%%~c

    REM Call the InStr function with the test case parameters
    call :InStr "!inputString!" "!searchString!" position

    REM Compare the actual and expected output
    if !position! equ !expectedPosition! (
        echo Test case passed: Input="!inputString!", Search="!searchString!", Expected Position=!expectedPosition!, Actual Position=!position!
    ) else (
        echo Test case failed: Input="!inputString!", Search="!searchString!", Expected Position=!expectedPosition!, Actual Position=!position!
    )
)

goto :eof

:InStr
setlocal enabledelayedexpansion

REM Initialize variables
set string=%~1
set substring=%~2
set position=0

REM Loop through each character in the string
for /l %%i in (0,1,99999) do (

    REM Get the substring starting at the current position
    set current=!string:~%%i!

    REM Check if the substring starts with the target substring
    if "!current:~0,%len%!"=="%substring%" (

        REM If it does, set the position and exit the loop
        set /a position=%%i+1
        goto :eof
    )

    REM If we've reached the end of the string, exit the loop
    if "!current!"=="" goto :eof
)

:end
endlocal & set %~3=%position%
goto :eof
