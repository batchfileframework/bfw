
:IsSpecialChar-DEMO
set "forbiden.char[-1]=a"
set "forbiden.char[0]=>"
set "forbiden.char[1]=<"
set "forbiden.char[2]=&"
set "forbiden.char[3]=|"
set "forbiden.char[4]=%%"
set forbiden.char[5]="
set "forbiden.char[6]=^"
set forbiden.char[7]=~
set forbiden.char[8]=!
set forbiden.char[9]=@

set forbiden.char

echo.
echo checking forbiden.char[x] array for special characters
echo.

Call :IsSpecialChar forbiden.char[-1] && echo found special char in "%forbiden.char[-1]%" || echo didn't find special char in "%forbiden.char[-1]%"
Call :IsSpecialChar forbiden.char[0] && echo found special char in "%forbiden.char[0]%" || echo didn't find special char in "%forbiden.char[0]%"
Call :IsSpecialChar forbiden.char[1] && echo found special char in "%forbiden.char[1]%" || echo didn't find special char in "%forbiden.char[1]%"
Call :IsSpecialChar forbiden.char[2] && echo found special char in "%forbiden.char[2]%" || echo didn't find special char in "%forbiden.char[2]%"
Call :IsSpecialChar forbiden.char[3] && echo found special char in "%forbiden.char[3]%" || echo didn't find special char in "%forbiden.char[3]%"
Call :IsSpecialChar forbiden.char[4] && echo found special char in "%forbiden.char[4]%" || echo didn't find special char in "%forbiden.char[4]%"
Call :IsSpecialChar forbiden.char[5] && echo found special char in %forbiden.char[5]:"=""% || echo didn't find special char in %forbiden.char[5]:"=""%
Call :IsSpecialChar forbiden.char[6] && echo found special char in "%forbiden.char[6]%" || echo didn't find special char in "%forbiden.char[6]%"
Call :IsSpecialChar forbiden.char[7] && echo found special char in "%forbiden.char[7]%" || echo didn't find special char in "%forbiden.char[7]%"
Call :IsSpecialChar forbiden.char[8] && echo found special char in "%forbiden.char[8]%" || echo didn't find special char in "%forbiden.char[8]%"
Call :IsSpecialChar forbiden.char[9] && echo found special char in "%forbiden.char[9]%" || echo didn't find special char in "%forbiden.char[9]%"

echo.
echo checking forbiden.char[x] array for special characters, using for loop 
for /l %%a in (-1,1,9) do (Call :IsSpecialChar forbiden.char[%%a] && call echo found special char in forbiden.char[%%a] || call echo didn't find special char in forbiden.char[%%a])

echo.
echo checking for forbidden characters in a sentence

set "forbiden.char[-1]=This is a string"
set "forbiden.char[0]=This is > string"
set "forbiden.char[1]=This is < string"
set "forbiden.char[2]=This is & string"
set "forbiden.char[3]=This is | string"
set "forbiden.char[4]=This is %% string"
set forbiden.char[5]=This is "  string
set "forbiden.char[6]=This is ^ string"
set forbiden.char[7]=This is ~ string
set forbiden.char[8]=This is ! string
set forbiden.char[9]=This is @ string

Call :IsSpecialChar forbiden.char[-1] && echo found special char in "%forbiden.char[-1]%" || echo didn't find special char in "%forbiden.char[-1]%"
Call :IsSpecialChar forbiden.char[0] && echo found special char in "%forbiden.char[0]%" || echo didn't find special char in "%forbiden.char[0]%"
Call :IsSpecialChar forbiden.char[1] && echo found special char in "%forbiden.char[1]%" || echo didn't find special char in "%forbiden.char[1]%"
Call :IsSpecialChar forbiden.char[2] && echo found special char in "%forbiden.char[2]%" || echo didn't find special char in "%forbiden.char[2]%"
Call :IsSpecialChar forbiden.char[3] && echo found special char in "%forbiden.char[3]%" || echo didn't find special char in "%forbiden.char[3]%"
Call :IsSpecialChar forbiden.char[4] && echo found special char in "%forbiden.char[4]%" || echo didn't find special char in "%forbiden.char[4]%"
Call :IsSpecialChar forbiden.char[5] && echo found special char in %forbiden.char[5]:"=""% || echo didn't find special char in %forbiden.char[5]:"=""%
Call :IsSpecialChar forbiden.char[6] && echo found special char in "%forbiden.char[6]%" || echo didn't find special char in "%forbiden.char[6]%"
Call :IsSpecialChar forbiden.char[7] && echo found special char in "%forbiden.char[7]%" || echo didn't find special char in "%forbiden.char[7]%"
Call :IsSpecialChar forbiden.char[8] && echo found special char in "%forbiden.char[8]%" || echo didn't find special char in "%forbiden.char[8]%"
Call :IsSpecialChar forbiden.char[9] && echo found special char in "%forbiden.char[9]%" || echo didn't find special char in "%forbiden.char[9]%"

echo.
echo checking for forbidden characters in a sentence, using for loop 
for /l %%a in (-1,1,9) do (Call :IsSpecialChar forbiden.char[%%a] && call echo found special char in forbiden.char[%%a] || call echo didn't find special char in forbiden.char[%%a])

echo.
echo testing output variable of IsSpecialChar (does not work, value is sticky ?)
echo.
set "myoutput="
Call :IsSpecialChar forbiden.char[-1] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[-1]%"
Call :IsSpecialChar forbiden.char[0] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[0]%"
Call :IsSpecialChar forbiden.char[1] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[1]%"
Call :IsSpecialChar forbiden.char[2] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[2]%"
Call :IsSpecialChar forbiden.char[3] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[3]%"
Call :IsSpecialChar forbiden.char[4] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[4]%"
Call :IsSpecialChar forbiden.char[5] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[5]%"
Call :IsSpecialChar forbiden.char[6] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[6]%"
Call :IsSpecialChar forbiden.char[7] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[7]%"
Call :IsSpecialChar forbiden.char[8] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[8]%"
Call :IsSpecialChar forbiden.char[9] myoutput & call echo special char found is %%myoutput%% in "%forbiden.char[9]%"

echo.
echo checking for forbidden characters with output value, in a sentence, using for loop 
for /l %%a in (-1,1,9) do Call :IsSpecialChar forbiden.char[%%a] myoutput & call echo special char found is %%myoutput%% in "forbiden.char[%%a]"

GoTo :EOF

