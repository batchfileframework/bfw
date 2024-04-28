@echo off
:setup
:main

set mystring=test\string\
Call :TrimTrailingBackslash %mystring% Output 
echo for %mystring% it returns %output%

echo.

set mystring=test\string
Call :TrimTrailingBackslash %mystring% Output 
echo for %mystring% it returns %output%

:end

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions
REM Function library

::Usage Call :TrimTrailingBackslash %Input% Output 
:TrimTrailingBackslash
set TrimTrailingBackslashInput=%1
if "%TrimTrailingBackslashInput:~-1%"=="\" ( 
  set %2=%TrimTrailingBackslashInput:~0,-1%
  ) else (
  set %2=%TrimTrailingBackslashInput%
  )
GoTo :EOF