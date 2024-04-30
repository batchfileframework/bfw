@echo off

set booleanvalue=false

if "%booleanvalue%"=="true" (
    set "color=32"  REM Green color
    set "outputvalue=%booleanvalue%"
) else (
    set "color=31"  REM Red color
    set "outputvalue=%booleanvalue%"
)

echo %outputvalue%
echo.


