@echo off
setlocal EnableDelayedExpansion


GoTo :attempt4

:attempt4
set number=%1

powershell -Command "if (%number%) -gt [uint]::MaxValue { exit 1 }" >nul 2>&1

if %errorlevel% equ 0 (
    echo Number is greater than 4,294,967,295
) else (
    echo Number is not greater than 4,294,967,295
)


GoTo :EOF

:attempt3
set num=%1
set max_uint=4294967295

if %num% gtr %max_uint% (
  echo Number is greater than 4,294,967,295
) else (
  echo Number is not greater than 4,294,967,295
)

GoTo :EOF


:attempt2
set "number=%~1"
set /a "isGreaterThanMax=(number>>32) & 1"
if %isGreaterThanMax% equ 1 (
    echo Number is greater than 4,294,967,295
) else if %number% gtr 4294967295 (
    echo Number is greater than 4,294,967,295
) else (
    echo Number is not greater than 4,294,967,295
)

GoTo :EOF


:attempt1

set /a number=4294967294
echo %number%
if %number% GTR 4294967295 (
    echo The number is bigger than 4,294,967,295.
) else (
    echo The number is smaller than or equal to 4,294,967,295.
)

set /a number=4294967295
echo %number%
if %number% GTR 4294967295 (
    echo The number is bigger than 4,294,967,295.
) else (
    echo The number is smaller than or equal to 4,294,967,295.

set /a number=4294967296
echo %number%
if %number% GTR 4294967295 (
    echo The number is bigger than 4,294,967,295.
) else (
    echo The number is smaller than or equal to 4,294,967,295.
	
set /a number=0
echo %number%
if %number% GTR 4294967295 (
    echo The number is bigger than 4,294,967,295.
) else (
    echo The number is smaller than or equal to 4,294,967,295.

set /a number=-1
echo %number%
if %number% GTR 4294967295 (
    echo The number is bigger than 4,294,967,295.
) else (
    echo The number is smaller than or equal to 4,294,967,295.