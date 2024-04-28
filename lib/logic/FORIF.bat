
REM Example usage inside a for loop
REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" && echo it was same || echo it was not
::Usage Call :FORIF your IF statement
:FORIF
REM echo just before forif %*
if %* (exit /b 0) ELSE (exit /b 1)
GoTo :EOF

