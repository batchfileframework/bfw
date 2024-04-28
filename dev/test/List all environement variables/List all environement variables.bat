@echo off

REM Loop through each line of output from SET
for /f "tokens=1* delims==" %%a in ('SET') do (

    REM Execute your command here, using the value of the environment variable on each line
    echo TESTTEXT %%*
)