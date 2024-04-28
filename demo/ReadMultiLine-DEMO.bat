
:ReadMultiLine-DEMO

Call :ClearVariablesByPrefix my

REM del ReadMultiLine-DEMO.txt 2>nul
if not exist ReadMultiLine-DEMO.txt echo creating file ReadMultiLine-DEMO.txt with 15 lines of 30 random characters
if not exist ReadMultiLine-DEMO.txt Call :RunMultipleTimes 15 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>ReadMultiLine-DEMO.txt"

set myArrayOfLineNumbers[0]=2
set myArrayOfLineNumbers[1]=5
set myArrayOfLineNumbers[2]=6
set myArrayOfLineNumbers[3]=12
set myArrayOfLineNumbers.ubound=3
echo.
echo testing ReadMultiline
Call :ReadMultiLine "ReadMultiLine-DEMO.txt" myArrayOfLineNumbers myOutputArray 
REM echo echo array
REM Call :EchoArray myOutputArray
set myOutputArray

GoTo :EOF







REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%myOutputArray[%_RunMultipleTimes_index%]%%" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]%%%%%%%%%%%%%%%%" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" "endlocal"
REM echo now exclam
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!myOutputArray[!_RunMultipleTimes_index!]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!myOutputArray[!!_RunMultipleTimes_index!!]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!myOutputArray[!!!!_RunMultipleTimes_index!!!!]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!_RunMultipleTimes_index!!!!!!!!]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[!!!!!!!!!!!!!!!!_RunMultipleTimes_index!!!!!!!!!!!!!!!!]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo inner variable with percent
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo -0
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!myOutputArray[%_RunMultipleTimes_index%]!!" "endlocal"
REM echo -1
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!myOutputArray[%%_RunMultipleTimes_index%%]!!!!" "endlocal"
REM echo -2
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!myOutputArray[%%%%_RunMultipleTimes_index%%%%]!!!!!!!!" "endlocal"
REM echo -3
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%_RunMultipleTimes_index%%%%%%%%]!!!!!!!!!!!!!!!!" "endlocal"
REM echo -4
REM Call :RunMultipleTimes 3 "setlocal enabledelayedexpansion" "call call call echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!myOutputArray[%%%%%%%%%%%%%%%%_RunMultipleTimes_index%%%%%%%%%%%%%%%%]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" "endlocal"
REM echo.

REM Call :ReadMultiLine "AddEscapeCharacters-AND-GetRandomString-DEMO.txt" myLineNumbers myOutputArray
REM echo -1
REM Call :RunMultipleTimes 3 "echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 0
REM Call :RunMultipleTimes 3 "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 1
REM Call :RunMultipleTimes 3 "call echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo 2
REM Call :RunMultipleTimes 3 "echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo -1
REM Call :RunMultipleTimes 3 "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 0
REM Call :RunMultipleTimes 3 "call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 1
REM Call :RunMultipleTimes 3 "call call echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo 2
REM Call :RunMultipleTimes 3 "call echo %%myOutputArray[%_RunMultipleTimes_index%]%%"
REM echo -1
REM Call :RunMultipleTimes 3 "call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"
REM echo 0
REM Call :RunMultipleTimes 3 "call call echo %%%%%%%%myOutputArray[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%"
REM echo 1
REM Call :RunMultipleTimes 3 "call call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
REM echo 2
REM Call :RunMultipleTimes 3 "call echo %%%%myOutputArray[%%_RunMultipleTimes_index%%]%%%%"
GoTo :EOF

