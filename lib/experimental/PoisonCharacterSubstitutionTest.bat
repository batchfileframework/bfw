@echo off 

:PoisonCharacterSubstitutionTest

echo.
set "_testvar=This is a test"
echo substitution with poison characters, without delayed expansion
set "_substvar11=%_testvar:s=!%"
set "_substvar12=%_testvar:s="%"
set "_substvar13=%_testvar:s=%%%"
set "_substvar14=%_testvar:s=&%"
set "_substvar15=%_testvar:s=(%"
set "_substvar16=%_testvar:s=)%"
set "_substvar17=%_testvar:s=<%"
set "_substvar18=%_testvar:s=>%"
set "_substvar19=%_testvar:s=^%"
set "_substvar20=%_testvar:s=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution with poison characters, with delayed expansion
set "_substvar11=!_testvar:s=!!"
set "_substvar12=!_testvar:s="!"
set "_substvar13=!_testvar:s=%%!"
set "_substvar14=!_testvar:s=&!"
set "_substvar15=!_testvar:s=(!"
set "_substvar16=!_testvar:s=)!"
set "_substvar17=!_testvar:s=<!"
set "_substvar18=!_testvar:s=>!"
set "_substvar19=!_testvar:s=^!"
set "_substvar20=!_testvar:s=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ! test"
echo substitution of ! with poison characters, without delayed expansion
set "_substvar11=%_testvar:!=!%"
set "_substvar12=%_testvar:!="%"
set "_substvar13=%_testvar:!=%%%"
set "_substvar14=%_testvar:!=&%"
set "_substvar15=%_testvar:!=(%"
set "_substvar16=%_testvar:!=)%"
set "_substvar17=%_testvar:!=<%"
set "_substvar18=%_testvar:!=>%"
set "_substvar19=%_testvar:!=^%"
set "_substvar20=%_testvar:!=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ! with poison characters, with delayed expansion
set "_substvar11=!_testvar:!=!!"
set "_substvar12=!_testvar:!="!"
set "_substvar13=!_testvar:!=%%!"
set "_substvar14=!_testvar:!=&!"
set "_substvar15=!_testvar:!=(!"
set "_substvar16=!_testvar:!=)!"
set "_substvar17=!_testvar:!=<!"
set "_substvar18=!_testvar:!=>!"
set "_substvar19=!_testvar:!=^!"
set "_substvar20=!_testvar:!=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is " test"
echo substitution of " with poison characters, without delayed expansion
set "_substvar11=%_testvar:"=!%"
set "_substvar12=%_testvar:"="%"
set "_substvar13=%_testvar:"=%%%"
set "_substvar14=%_testvar:"=&%"
set "_substvar15=%_testvar:"=(%"
set "_substvar16=%_testvar:"=)%"
set "_substvar17=%_testvar:"=<%"
set "_substvar18=%_testvar:"=>%"
set "_substvar19=%_testvar:"=^%"
set "_substvar20=%_testvar:"=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of " with poison characters, with delayed expansion

set "_substvar11=!_testvar:"=!!"
set "_substvar12=!_testvar:"="!"
set "_substvar13=!_testvar:"=%%!"
set "_substvar14=!_testvar:"=^&!"
set "_substvar15=!_testvar:"=(!"
set "_substvar16=!_testvar:"=)!"
set "_substvar17=!_testvar:"=^<!"
set "_substvar18=!_testvar:"=^>!"
set "_substvar19=!_testvar:"=^^!"
set "_substvar20=!_testvar:"=^|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is %% test"
echo "substitution of %% with poison characters, without delayed expansion"
set "_substvar11=%_testvar:%%=!%"
set "_substvar12=%_testvar:%%="%"
set "_substvar13=%_testvar:%%=%%%"
set "_substvar14=%_testvar:%%=&%"
set "_substvar15=%_testvar:%%=(%"
set "_substvar16=%_testvar:%%=)%"
set "_substvar17=%_testvar:%%=<%"
set "_substvar18=%_testvar:%%=>%"
set "_substvar19=%_testvar:%%=^%"
set "_substvar20=%_testvar:%%=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of %% with poison characters, with delayed expansion"
set "_substvar11=!_testvar:%%=!!"
set "_substvar12=!_testvar:%%="!"
set "_substvar13=!_testvar:%%=%%!"
set "_substvar14=!_testvar:%%=&!"
set "_substvar15=!_testvar:%%=(!"
set "_substvar16=!_testvar:%%=)!"
set "_substvar17=!_testvar:%%=<!"
set "_substvar18=!_testvar:%%=>!"
set "_substvar19=!_testvar:%%=^!"
set "_substvar20=!_testvar:%%=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is & test"
echo "substitution of & with poison characters, without delayed expansion"
set "_substvar11=%_testvar:&=!%"
set "_substvar12=%_testvar:&="%"
set "_substvar13=%_testvar:&=%%%"
set "_substvar14=%_testvar:&=&%"
set "_substvar15=%_testvar:&=(%"
set "_substvar16=%_testvar:&=)%"
set "_substvar17=%_testvar:&=<%"
set "_substvar18=%_testvar:&=>%"
set "_substvar19=%_testvar:&=^%"
set "_substvar20=%_testvar:&=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of & with poison characters, with delayed expansion"
set "_substvar11=!_testvar:&=!!"
set "_substvar12=!_testvar:&="!"
set "_substvar13=!_testvar:&=%%!"
set "_substvar14=!_testvar:&=&!"
set "_substvar15=!_testvar:&=(!"
set "_substvar16=!_testvar:&=)!"
set "_substvar17=!_testvar:&=<!"
set "_substvar18=!_testvar:&=>!"
set "_substvar19=!_testvar:&=^!"
set "_substvar20=!_testvar:&=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ( test"
echo substitution of ( with poison characters, without delayed expansion
set "_substvar11=%_testvar:(=!%"
set "_substvar12=%_testvar:(="%"
set "_substvar13=%_testvar:(=%%%"
set "_substvar14=%_testvar:(=&%"
set "_substvar15=%_testvar:(=(%"
set "_substvar16=%_testvar:(=)%"
set "_substvar17=%_testvar:(=<%"
set "_substvar18=%_testvar:(=>%"
set "_substvar19=%_testvar:(=^%"
set "_substvar20=%_testvar:(=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ( with poison characters, with delayed expansion
set "_substvar11=!_testvar:(=!!"
set "_substvar12=!_testvar:(="!"
set "_substvar13=!_testvar:(=%%!"
set "_substvar14=!_testvar:(=&!"
set "_substvar15=!_testvar:(=(!"
set "_substvar16=!_testvar:(=)!"
set "_substvar17=!_testvar:(=<!"
set "_substvar18=!_testvar:(=>!"
set "_substvar19=!_testvar:(=^!"
set "_substvar20=!_testvar:(=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ) test"
echo substitution of ) with poison characters, without delayed expansion
set "_substvar11=%_testvar:)=!%"
set "_substvar12=%_testvar:)="%"
set "_substvar13=%_testvar:)=%%%"
set "_substvar14=%_testvar:)=&%"
set "_substvar15=%_testvar:)=(%"
set "_substvar16=%_testvar:)=)%"
set "_substvar17=%_testvar:)=<%"
set "_substvar18=%_testvar:)=>%"
set "_substvar19=%_testvar:)=^%"
set "_substvar20=%_testvar:)=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ) with poison characters, with delayed expansion
set "_substvar11=!_testvar:)=!!"
set "_substvar12=!_testvar:)="!"
set "_substvar13=!_testvar:)=%%!"
set "_substvar14=!_testvar:)=&!"
set "_substvar15=!_testvar:)=(!"
set "_substvar16=!_testvar:)=)!"
set "_substvar17=!_testvar:)=<!"
set "_substvar18=!_testvar:)=>!"
set "_substvar19=!_testvar:)=^!"
set "_substvar20=!_testvar:)=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is < test"
echo "substitution of < with poison characters, without delayed expansion"
set "_substvar11=%_testvar:<=!%"
set "_substvar12=%_testvar:<="%"
set "_substvar13=%_testvar:<=%%%"
set "_substvar14=%_testvar:<=&%"
set "_substvar15=%_testvar:<=(%"
set "_substvar16=%_testvar:<=)%"
set "_substvar17=%_testvar:<=<%"
set "_substvar18=%_testvar:<=>%"
set "_substvar19=%_testvar:<=^%"
set "_substvar20=%_testvar:<=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of < with poison characters, with delayed expansion"
set "_substvar11=!_testvar:<=!!"
set "_substvar12=!_testvar:<="!"
set "_substvar13=!_testvar:<=%%!"
set "_substvar14=!_testvar:<=&!"
set "_substvar15=!_testvar:<=(!"
set "_substvar16=!_testvar:<=)!"
set "_substvar17=!_testvar:<=<!"
set "_substvar18=!_testvar:<=>!"
set "_substvar19=!_testvar:<=^!"
set "_substvar20=!_testvar:<=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is > test"
echo "substitution of > with poison characters, without delayed expansion"
set "_substvar11=%_testvar:>=!%"
set "_substvar12=%_testvar:>="%"
set "_substvar13=%_testvar:>=%%%"
set "_substvar14=%_testvar:>=&%"
set "_substvar15=%_testvar:>=(%"
set "_substvar16=%_testvar:>=)%"
set "_substvar17=%_testvar:>=<%"
set "_substvar18=%_testvar:>=>%"
set "_substvar19=%_testvar:>=^%"
set "_substvar20=%_testvar:>=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of > with poison characters, with delayed expansion"
set "_substvar11=!_testvar:>=!!"
set "_substvar12=!_testvar:>="!"
set "_substvar13=!_testvar:>=%%!"
set "_substvar14=!_testvar:>=&!"
set "_substvar15=!_testvar:>=(!"
set "_substvar16=!_testvar:>=)!"
set "_substvar17=!_testvar:>=<!"
set "_substvar18=!_testvar:>=>!"
set "_substvar19=!_testvar:>=^!"
set "_substvar20=!_testvar:>=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ^ test"
echo "substitution of ^ with poison characters, without delayed expansion"
set "_substvar11=%_testvar:^=!%"
set "_substvar12=%_testvar:^="%"
set "_substvar13=%_testvar:^=%%%"
set "_substvar14=%_testvar:^=&%"
set "_substvar15=%_testvar:^=(%"
set "_substvar16=%_testvar:^=)%"
set "_substvar17=%_testvar:^=<%"
set "_substvar18=%_testvar:^=>%"
set "_substvar19=%_testvar:^=^%"
set "_substvar20=%_testvar:^=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of ^ with poison characters, with delayed expansion"
set "_substvar11=!_testvar:^=!!"
set "_substvar12=!_testvar:^="!"
set "_substvar13=!_testvar:^=%%!"
set "_substvar14=!_testvar:^=&!"
set "_substvar15=!_testvar:^=(!"
set "_substvar16=!_testvar:^=)!"
set "_substvar17=!_testvar:^=<!"
set "_substvar18=!_testvar:^=>!"
set "_substvar19=!_testvar:^=^!"
set "_substvar20=!_testvar:^=|!"
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is | test"
echo "substitution of | with poison characters, without delayed expansion"
set "_substvar11=%_testvar:|=!%"
set "_substvar12=%_testvar:|="%"
set "_substvar13=%_testvar:|=%%%"
set "_substvar14=%_testvar:|=&%"
set "_substvar15=%_testvar:|=(%"
set "_substvar16=%_testvar:|=)%"
set "_substvar17=%_testvar:|=<%"
set "_substvar18=%_testvar:|=>%"
set "_substvar19=%_testvar:|=^%"
set "_substvar20=%_testvar:|=|%"
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of | with poison characters, with delayed expansion"
set "_substvar11=!_testvar:|=!!"
set "_substvar12=!_testvar:|="!"
set "_substvar13=!_testvar:|=%%!"
set "_substvar14=!_testvar:|=&!"
set "_substvar15=!_testvar:|=(!"
set "_substvar16=!_testvar:|=)!"
set "_substvar17=!_testvar:|=<!"
set "_substvar18=!_testvar:|=>!"
set "_substvar19=!_testvar:|=^!"
set "_substvar20=!_testvar:|=|!"
set _testvar & set _substvar
endlocal

echo.
echo ----------------------------------------------------------------------
echo Retrying everything with the trailing doublequotes removed
echo.

echo.
set "_testvar=This is a test"
echo substitution with poison characters, without delayed expansion
set "_substvar11=%_testvar:s=!%
set "_substvar12=%_testvar:s="%
set "_substvar13=%_testvar:s=%%%
set "_substvar14=%_testvar:s=&%
set "_substvar15=%_testvar:s=(%
set "_substvar16=%_testvar:s=)%
set "_substvar17=%_testvar:s=<%
set "_substvar18=%_testvar:s=>%
set "_substvar19=%_testvar:s=^%
set "_substvar20=%_testvar:s=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution with poison characters, with delayed expansion
set "_substvar11=!_testvar:s=!!
set "_substvar12=!_testvar:s="!
set "_substvar13=!_testvar:s=%%!
set "_substvar14=!_testvar:s=&!
set "_substvar15=!_testvar:s=(!
set "_substvar16=!_testvar:s=)!
set "_substvar17=!_testvar:s=<!
set "_substvar18=!_testvar:s=>!
set "_substvar19=!_testvar:s=^!
set "_substvar20=!_testvar:s=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ! test"
echo substitution of ! with poison characters, without delayed expansion
set "_substvar11=%_testvar:!=!%
set "_substvar12=%_testvar:!="%
set "_substvar13=%_testvar:!=%%%
set "_substvar14=%_testvar:!=&%
set "_substvar15=%_testvar:!=(%
set "_substvar16=%_testvar:!=)%
set "_substvar17=%_testvar:!=<%
set "_substvar18=%_testvar:!=>%
set "_substvar19=%_testvar:!=^%
set "_substvar20=%_testvar:!=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ! with poison characters, with delayed expansion
set "_substvar11=!_testvar:!=!!
set "_substvar12=!_testvar:!="!
set "_substvar13=!_testvar:!=%%!
set "_substvar14=!_testvar:!=&!
set "_substvar15=!_testvar:!=(!
set "_substvar16=!_testvar:!=)!
set "_substvar17=!_testvar:!=<!
set "_substvar18=!_testvar:!=>!
set "_substvar19=!_testvar:!=^!
set "_substvar20=!_testvar:!=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is " test"
echo substitution of " with poison characters, without delayed expansion
set "_substvar11=%_testvar:"=!%
set "_substvar12=%_testvar:"="%
set "_substvar13=%_testvar:"=%%%
set "_substvar14=%_testvar:"=&%
set "_substvar15=%_testvar:"=(%
set "_substvar16=%_testvar:"=)%
set "_substvar17=%_testvar:"=<%
set "_substvar18=%_testvar:"=>%
set "_substvar19=%_testvar:"=^%
set "_substvar20=%_testvar:"=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of " with poison characters, with delayed expansion

set "_substvar11=!_testvar:"=!!
set "_substvar12=!_testvar:"="!
set "_substvar13=!_testvar:"=%%!
set "_substvar14=!_testvar:"=^&!
set "_substvar15=!_testvar:"=(!
set "_substvar16=!_testvar:"=)!
set "_substvar17=!_testvar:"=^<!
set "_substvar18=!_testvar:"=^>!
set "_substvar19=!_testvar:"=^^!
set "_substvar20=!_testvar:"=^|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is %% test"
echo "substitution of %% with poison characters, without delayed expansion"
set "_substvar11=%_testvar:%%=!%
set "_substvar12=%_testvar:%%="%
set "_substvar13=%_testvar:%%=%%%
set "_substvar14=%_testvar:%%=&%
set "_substvar15=%_testvar:%%=(%
set "_substvar16=%_testvar:%%=)%
set "_substvar17=%_testvar:%%=<%
set "_substvar18=%_testvar:%%=>%
set "_substvar19=%_testvar:%%=^%
set "_substvar20=%_testvar:%%=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of %% with poison characters, with delayed expansion"
set "_substvar11=!_testvar:%%=!!
set "_substvar12=!_testvar:%%="!
set "_substvar13=!_testvar:%%=%%!
set "_substvar14=!_testvar:%%=&!
set "_substvar15=!_testvar:%%=(!
set "_substvar16=!_testvar:%%=)!
set "_substvar17=!_testvar:%%=<!
set "_substvar18=!_testvar:%%=>!
set "_substvar19=!_testvar:%%=^!
set "_substvar20=!_testvar:%%=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is & test"
echo "substitution of & with poison characters, without delayed expansion"
set "_substvar11=%_testvar:&=!%
set "_substvar12=%_testvar:&="%
set "_substvar13=%_testvar:&=%%%
set "_substvar14=%_testvar:&=&%
set "_substvar15=%_testvar:&=(%
set "_substvar16=%_testvar:&=)%
set "_substvar17=%_testvar:&=<%
set "_substvar18=%_testvar:&=>%
set "_substvar19=%_testvar:&=^%
set "_substvar20=%_testvar:&=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of & with poison characters, with delayed expansion"
set "_substvar11=!_testvar:&=!!
set "_substvar12=!_testvar:&="!
set "_substvar13=!_testvar:&=%%!
set "_substvar14=!_testvar:&=&!
set "_substvar15=!_testvar:&=(!
set "_substvar16=!_testvar:&=)!
set "_substvar17=!_testvar:&=<!
set "_substvar18=!_testvar:&=>!
set "_substvar19=!_testvar:&=^!
set "_substvar20=!_testvar:&=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ( test"
echo substitution of ( with poison characters, without delayed expansion
set "_substvar11=%_testvar:(=!%
set "_substvar12=%_testvar:(="%
set "_substvar13=%_testvar:(=%%%
set "_substvar14=%_testvar:(=&%
set "_substvar15=%_testvar:(=(%
set "_substvar16=%_testvar:(=)%
set "_substvar17=%_testvar:(=<%
set "_substvar18=%_testvar:(=>%
set "_substvar19=%_testvar:(=^%
set "_substvar20=%_testvar:(=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ( with poison characters, with delayed expansion
set "_substvar11=!_testvar:(=!!
set "_substvar12=!_testvar:(="!
set "_substvar13=!_testvar:(=%%!
set "_substvar14=!_testvar:(=&!
set "_substvar15=!_testvar:(=(!
set "_substvar16=!_testvar:(=)!
set "_substvar17=!_testvar:(=<!
set "_substvar18=!_testvar:(=>!
set "_substvar19=!_testvar:(=^!
set "_substvar20=!_testvar:(=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ) test"
echo substitution of ) with poison characters, without delayed expansion
set "_substvar11=%_testvar:)=!%
set "_substvar12=%_testvar:)="%
set "_substvar13=%_testvar:)=%%%
set "_substvar14=%_testvar:)=&%
set "_substvar15=%_testvar:)=(%
set "_substvar16=%_testvar:)=)%
set "_substvar17=%_testvar:)=<%
set "_substvar18=%_testvar:)=>%
set "_substvar19=%_testvar:)=^%
set "_substvar20=%_testvar:)=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ) with poison characters, with delayed expansion
set "_substvar11=!_testvar:)=!!
set "_substvar12=!_testvar:)="!
set "_substvar13=!_testvar:)=%%!
set "_substvar14=!_testvar:)=&!
set "_substvar15=!_testvar:)=(!
set "_substvar16=!_testvar:)=)!
set "_substvar17=!_testvar:)=<!
set "_substvar18=!_testvar:)=>!
set "_substvar19=!_testvar:)=^!
set "_substvar20=!_testvar:)=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is < test"
echo "substitution of < with poison characters, without delayed expansion"
set "_substvar11=%_testvar:<=!%
set "_substvar12=%_testvar:<="%
set "_substvar13=%_testvar:<=%%%
set "_substvar14=%_testvar:<=&%
set "_substvar15=%_testvar:<=(%
set "_substvar16=%_testvar:<=)%
set "_substvar17=%_testvar:<=<%
set "_substvar18=%_testvar:<=>%
set "_substvar19=%_testvar:<=^%
set "_substvar20=%_testvar:<=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of < with poison characters, with delayed expansion"
set "_substvar11=!_testvar:<=!!
set "_substvar12=!_testvar:<="!
set "_substvar13=!_testvar:<=%%!
set "_substvar14=!_testvar:<=&!
set "_substvar15=!_testvar:<=(!
set "_substvar16=!_testvar:<=)!
set "_substvar17=!_testvar:<=<!
set "_substvar18=!_testvar:<=>!
set "_substvar19=!_testvar:<=^!
set "_substvar20=!_testvar:<=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is > test"
echo "substitution of > with poison characters, without delayed expansion"
set "_substvar11=%_testvar:>=!%
set "_substvar12=%_testvar:>="%
set "_substvar13=%_testvar:>=%%%
set "_substvar14=%_testvar:>=&%
set "_substvar15=%_testvar:>=(%
set "_substvar16=%_testvar:>=)%
set "_substvar17=%_testvar:>=<%
set "_substvar18=%_testvar:>=>%
set "_substvar19=%_testvar:>=^%
set "_substvar20=%_testvar:>=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of > with poison characters, with delayed expansion"
set "_substvar11=!_testvar:>=!!
set "_substvar12=!_testvar:>="!
set "_substvar13=!_testvar:>=%%!
set "_substvar14=!_testvar:>=&!
set "_substvar15=!_testvar:>=(!
set "_substvar16=!_testvar:>=)!
set "_substvar17=!_testvar:>=<!
set "_substvar18=!_testvar:>=>!
set "_substvar19=!_testvar:>=^!
set "_substvar20=!_testvar:>=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ^ test"
echo "substitution of ^ with poison characters, without delayed expansion"
set "_substvar11=%_testvar:^=!%
set "_substvar12=%_testvar:^="%
set "_substvar13=%_testvar:^=%%%
set "_substvar14=%_testvar:^=&%
set "_substvar15=%_testvar:^=(%
set "_substvar16=%_testvar:^=)%
set "_substvar17=%_testvar:^=<%
set "_substvar18=%_testvar:^=>%
set "_substvar19=%_testvar:^=^%
set "_substvar20=%_testvar:^=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of ^ with poison characters, with delayed expansion"
set "_substvar11=!_testvar:^=!!
set "_substvar12=!_testvar:^="!
set "_substvar13=!_testvar:^=%%!
set "_substvar14=!_testvar:^=&!
set "_substvar15=!_testvar:^=(!
set "_substvar16=!_testvar:^=)!
set "_substvar17=!_testvar:^=<!
set "_substvar18=!_testvar:^=>!
set "_substvar19=!_testvar:^=^!
set "_substvar20=!_testvar:^=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is | test
echo "substitution of | with poison characters, without delayed expansion"
set "_substvar11=%_testvar:|=!%
set "_substvar12=%_testvar:|="%
set "_substvar13=%_testvar:|=%%%
set "_substvar14=%_testvar:|=&%
set "_substvar15=%_testvar:|=(%
set "_substvar16=%_testvar:|=)%
set "_substvar17=%_testvar:|=<%
set "_substvar18=%_testvar:|=>%
set "_substvar19=%_testvar:|=^%
set "_substvar20=%_testvar:|=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of | with poison characters, with delayed expansion"
set "_substvar11=!_testvar:|=!!
set "_substvar12=!_testvar:|="!
set "_substvar13=!_testvar:|=%%!
set "_substvar14=!_testvar:|=&!
set "_substvar15=!_testvar:|=(!
set "_substvar16=!_testvar:|=)!
set "_substvar17=!_testvar:|=<!
set "_substvar18=!_testvar:|=>!
set "_substvar19=!_testvar:|=^!
set "_substvar20=!_testvar:|=|!
set _testvar & set _substvar
endlocal


echo.
echo ----------------------------------------------------------------------
echo Retrying everything with the leading doublequotes also removed
echo.

echo.
set "_testvar=This is a test"
echo substitution with poison characters, without delayed expansion
set _substvar11=%_testvar:s=!%
set _substvar12=%_testvar:s="%
set _substvar13=%_testvar:s=%%%
REM set _substvar14=%_testvar:s=&% MALFUNCTION
set _substvar14=%_testvar:s=^&%
set _substvar15=%_testvar:s=(%
set _substvar16=%_testvar:s=)%
REM set _substvar17=%_testvar:s=<% BREAKS
set _substvar17=%_testvar:s=^<%
REM set _substvar18=%_testvar:s=>% BREAKS
set _substvar18=%_testvar:s=^>%
REM set _substvar19=%_testvar:s=^% MALFUNCTION
set _substvar19=%_testvar:s=^^%
REM set _substvar20=%_testvar:s=|%  BREAKS
set _substvar20=%_testvar:s=^|%
set _testvar & set _substvar
REM set _substvar13=%_testvar:s=%
REM set _substvar13
REM set _substvar13=%_testvar:s=%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%%%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%%%%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%%%%%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%^%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%^%^%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=^%^%^%^%^%^%%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%^%^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%^%^%^%^%^%%
REM set _substvar13
REM set _substvar13=%_testvar:s=%^%^%^%^%^%^%%
REM set _substvar13
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution with poison characters, with delayed expansion
set _substvar11=!_testvar:s=!!
set _substvar12=!_testvar:s="!
set _substvar13=!_testvar:s=%%!
REM set _substvar14=!_testvar:s=&! BREAKS
set _substvar14=!_testvar:s=^&!
set _substvar15=!_testvar:s=(!
set _substvar16=!_testvar:s=)!
REM set _substvar17=!_testvar:s=<! BREAKS
set _substvar17=!_testvar:s=^<! 
REM set _substvar18=!_testvar:s=>! BREAKS
set _substvar18=!_testvar:s=^>!
REM set _substvar19=!_testvar:s=^! MALFUNCTION
set _substvar19=!_testvar:s=^^!
REM set _substvar20=!_testvar:s=|! BREAKS
set _substvar20=!_testvar:s=^|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ! test"
echo substitution of ! with poison characters, without delayed expansion
set _substvar11=%_testvar:!=!%
set _substvar12=%_testvar:!="%
set _substvar13=%_testvar:!=%%%
set _substvar14=%_testvar:!=&%
set _substvar15=%_testvar:!=(%
set _substvar16=%_testvar:!=)%
set _substvar17=%_testvar:!=<%
set _substvar18=%_testvar:!=>%
set _substvar19=%_testvar:!=^%
set _substvar20=%_testvar:!=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ! with poison characters, with delayed expansion
set _substvar11=!_testvar:!=!!
set _substvar12=!_testvar:!="!
set _substvar13=!_testvar:!=%%!
set _substvar14=!_testvar:!=&!
set _substvar15=!_testvar:!=(!
set _substvar16=!_testvar:!=)!
set _substvar17=!_testvar:!=<!
set _substvar18=!_testvar:!=>!
set _substvar19=!_testvar:!=^!
set _substvar20=!_testvar:!=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is " test"
echo substitution of " with poison characters, without delayed expansion
set _substvar11=%_testvar:"=!%
set _substvar12=%_testvar:"="%
set _substvar13=%_testvar:"=%%%
set _substvar14=%_testvar:"=&%
set _substvar15=%_testvar:"=(%
set _substvar16=%_testvar:"=)%
set _substvar17=%_testvar:"=<%
set _substvar18=%_testvar:"=>%
set _substvar19=%_testvar:"=^%
set _substvar20=%_testvar:"=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of " with poison characters, with delayed expansion

set _substvar11=!_testvar:"=!!
set _substvar12=!_testvar:"="!
set _substvar13=!_testvar:"=%%!
set _substvar14=!_testvar:"=^&!
set _substvar15=!_testvar:"=(!
set _substvar16=!_testvar:"=)!
set _substvar17=!_testvar:"=^<!
set _substvar18=!_testvar:"=^>!
set _substvar19=!_testvar:"=^^!
set _substvar20=!_testvar:"=^|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is %% test"
echo "substitution of %% with poison characters, without delayed expansion"
set _substvar11=%_testvar:%%=!%
set _substvar12=%_testvar:%%="%
set _substvar13=%_testvar:%%=%%%
set _substvar14=%_testvar:%%=&%
set _substvar15=%_testvar:%%=(%
set _substvar16=%_testvar:%%=)%
set _substvar17=%_testvar:%%=<%
set _substvar18=%_testvar:%%=>%
set _substvar19=%_testvar:%%=^%
set _substvar20=%_testvar:%%=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of %% with poison characters, with delayed expansion"
set _substvar11=!_testvar:%%=!!
set _substvar12=!_testvar:%%="!
set _substvar13=!_testvar:%%=%%!
set _substvar14=!_testvar:%%=&!
set _substvar15=!_testvar:%%=(!
set _substvar16=!_testvar:%%=)!
set _substvar17=!_testvar:%%=<!
set _substvar18=!_testvar:%%=>!
set _substvar19=!_testvar:%%=^!
set _substvar20=!_testvar:%%=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is & test"
echo "substitution of & with poison characters, without delayed expansion"
set _substvar11=%_testvar:&=!%
set _substvar12=%_testvar:&="%
set _substvar13=%_testvar:&=%%%
set _substvar14=%_testvar:&=&%
set _substvar15=%_testvar:&=(%
set _substvar16=%_testvar:&=)%
set _substvar17=%_testvar:&=<%
set _substvar18=%_testvar:&=>%
set _substvar19=%_testvar:&=^%
set _substvar20=%_testvar:&=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of & with poison characters, with delayed expansion"
set _substvar11=!_testvar:&=!!
set _substvar12=!_testvar:&="!
set _substvar13=!_testvar:&=%%!
set _substvar14=!_testvar:&=&!
set _substvar15=!_testvar:&=(!
set _substvar16=!_testvar:&=)!
set _substvar17=!_testvar:&=<!
set _substvar18=!_testvar:&=>!
set _substvar19=!_testvar:&=^!
set _substvar20=!_testvar:&=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ( test"
echo substitution of ( with poison characters, without delayed expansion
set _substvar11=%_testvar:(=!%
set _substvar12=%_testvar:(="%
set _substvar13=%_testvar:(=%%%
set _substvar14=%_testvar:(=&%
set _substvar15=%_testvar:(=(%
set _substvar16=%_testvar:(=)%
set _substvar17=%_testvar:(=<%
set _substvar18=%_testvar:(=>%
set _substvar19=%_testvar:(=^%
set _substvar20=%_testvar:(=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ( with poison characters, with delayed expansion
set _substvar11=!_testvar:(=!!
set _substvar12=!_testvar:(="!
set _substvar13=!_testvar:(=%%!
set _substvar14=!_testvar:(=&!
set _substvar15=!_testvar:(=(!
set _substvar16=!_testvar:(=)!
set _substvar17=!_testvar:(=<!
set _substvar18=!_testvar:(=>!
set _substvar19=!_testvar:(=^!
set _substvar20=!_testvar:(=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ) test"
echo substitution of ) with poison characters, without delayed expansion
set _substvar11=%_testvar:)=!%
set _substvar12=%_testvar:)="%
set _substvar13=%_testvar:)=%%%
set _substvar14=%_testvar:)=&%
set _substvar15=%_testvar:)=(%
set _substvar16=%_testvar:)=)%
set _substvar17=%_testvar:)=<%
set _substvar18=%_testvar:)=>%
set _substvar19=%_testvar:)=^%
set _substvar20=%_testvar:)=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo substitution of ) with poison characters, with delayed expansion
set _substvar11=!_testvar:)=!!
set _substvar12=!_testvar:)="!
set _substvar13=!_testvar:)=%%!
set _substvar14=!_testvar:)=&!
set _substvar15=!_testvar:)=(!
set _substvar16=!_testvar:)=)!
set _substvar17=!_testvar:)=<!
set _substvar18=!_testvar:)=>!
set _substvar19=!_testvar:)=^!
set _substvar20=!_testvar:)=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is < test"
echo "substitution of < with poison characters, without delayed expansion"
set _substvar11=%_testvar:<=!%
set _substvar12=%_testvar:<="%
set _substvar13=%_testvar:<=%%%
set _substvar14=%_testvar:<=&%
set _substvar15=%_testvar:<=(%
set _substvar16=%_testvar:<=)%
set _substvar17=%_testvar:<=<%
set _substvar18=%_testvar:<=>%
set _substvar19=%_testvar:<=^%
set _substvar20=%_testvar:<=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of < with poison characters, with delayed expansion"
set _substvar11=!_testvar:<=!!
set _substvar12=!_testvar:<="!
set _substvar13=!_testvar:<=%%!
set _substvar14=!_testvar:<=&!
set _substvar15=!_testvar:<=(!
set _substvar16=!_testvar:<=)!
set _substvar17=!_testvar:<=<!
set _substvar18=!_testvar:<=>!
set _substvar19=!_testvar:<=^!
set _substvar20=!_testvar:<=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is > test"
echo "substitution of > with poison characters, without delayed expansion"
set _substvar11=%_testvar:>=!%
set _substvar12=%_testvar:>="%
set _substvar13=%_testvar:>=%%%
set _substvar14=%_testvar:>=&%
set _substvar15=%_testvar:>=(%
set _substvar16=%_testvar:>=)%
set _substvar17=%_testvar:>=<%
set _substvar18=%_testvar:>=>%
set _substvar19=%_testvar:>=^%
set _substvar20=%_testvar:>=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of > with poison characters, with delayed expansion"
set _substvar11=!_testvar:>=!!
set _substvar12=!_testvar:>="!
set _substvar13=!_testvar:>=%%!
set _substvar14=!_testvar:>=&!
set _substvar15=!_testvar:>=(!
set _substvar16=!_testvar:>=)!
set _substvar17=!_testvar:>=<!
set _substvar18=!_testvar:>=>!
set _substvar19=!_testvar:>=^!
set _substvar20=!_testvar:>=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is ^ test"
echo "substitution of ^ with poison characters, without delayed expansion"
set _substvar11=%_testvar:^=!%
set _substvar12=%_testvar:^="%
set _substvar13=%_testvar:^=%%%
set _substvar14=%_testvar:^=&%
set _substvar15=%_testvar:^=(%
set _substvar16=%_testvar:^=)%
set _substvar17=%_testvar:^=<%
set _substvar18=%_testvar:^=>%
set _substvar19=%_testvar:^=^%
set _substvar20=%_testvar:^=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of ^ with poison characters, with delayed expansion"
set _substvar11=!_testvar:^=!!
set _substvar12=!_testvar:^="!
set _substvar13=!_testvar:^=%%!
set _substvar14=!_testvar:^=&!
set _substvar15=!_testvar:^=(!
set _substvar16=!_testvar:^=)!
set _substvar17=!_testvar:^=<!
set _substvar18=!_testvar:^=>!
set _substvar19=!_testvar:^=^!
set _substvar20=!_testvar:^=|!
set _testvar & set _substvar
endlocal

echo.
set "_testvar=This is | test
echo "substitution of | with poison characters, without delayed expansion"
set _substvar11=%_testvar:|=!%
set _substvar12=%_testvar:|="%
set _substvar13=%_testvar:|=%%%
set _substvar14=%_testvar:|=&%
set _substvar15=%_testvar:|=(%
set _substvar16=%_testvar:|=)%
set _substvar17=%_testvar:|=<%
set _substvar18=%_testvar:|=>%
set _substvar19=%_testvar:|=^%
set _substvar20=%_testvar:|=|%
set _testvar & set _substvar
Call :ClearVariablesByPrefix _substvar

setlocal enabledelayedexpansion
echo.
echo "substitution of | with poison characters, with delayed expansion"
set _substvar11=!_testvar:|=!!
set _substvar12=!_testvar:|="!
set _substvar13=!_testvar:|=%%!
set _substvar14=!_testvar:|=&!
set _substvar15=!_testvar:|=(!
set _substvar16=!_testvar:|=)!
set _substvar17=!_testvar:|=<!
set _substvar18=!_testvar:|=>!
set _substvar19=!_testvar:|=^!
set _substvar20=!_testvar:|=|!
set _testvar & set _substvar
endlocal

GoTo :EOF


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF




REM set "_substvar11=!_testvar:"=!!"
REM set "_substvar12=!_testvar:"="!"
REM set "_substvar13=!_testvar:"=%%!"
REM set "_substvar14=!_testvar:"=&!"
REM set "_substvar15=!_testvar:"=(!"
REM set "_substvar16=!_testvar:"=)!"
REM set "_substvar17=!_testvar:"=<!"
REM set "_substvar18=!_testvar:"=>!"
REM set "_substvar19=!_testvar:"=^!"
REM set "_substvar20=!_testvar:"=|!"

REM set "_substvar11=!_testvar:^"=!!"
REM set "_substvar12=!_testvar:^"="!"
REM set "_substvar13=!_testvar:^"=%%!"
REM set "_substvar14=!_testvar:^"=&!"
REM set "_substvar15=!_testvar:^"=(!"
REM set "_substvar16=!_testvar:^"=)!"
REM set "_substvar17=!_testvar:^"=<!"
REM set "_substvar18=!_testvar:^"=>!"
REM set "_substvar19=!_testvar:^"=^!"
REM set "_substvar20=!_testvar:^"=|!"

REM set "_substvar11=!_testvar:""=!!"
REM set "_substvar12=!_testvar:""="!"
REM set "_substvar13=!_testvar:""=%%!"
REM set "_substvar14=!_testvar:""=&!"
REM set "_substvar15=!_testvar:""=(!"
REM set "_substvar16=!_testvar:""=)!"
REM set "_substvar17=!_testvar:""=<!"
REM set "_substvar18=!_testvar:""=>!"
REM set "_substvar19=!_testvar:""=^!"
REM set "_substvar20=!_testvar:""=|!"

REM set "_substvar11=!_testvar:"""=!!"
REM set "_substvar12=!_testvar:"""="!"
REM set "_substvar13=!_testvar:"""=%%!"
REM set "_substvar14=!_testvar:"""=&!"
REM set "_substvar15=!_testvar:"""=(!"
REM set "_substvar16=!_testvar:"""=)!"
REM set "_substvar17=!_testvar:"""=<!"
REM set "_substvar18=!_testvar:"""=>!"
REM set "_substvar19=!_testvar:"""=^!"
REM set "_substvar20=!_testvar:"""=|!"

REM set "_substvar11=!_testvar:""""=!!"
REM set "_substvar12=!_testvar:""""="!"
REM set "_substvar13=!_testvar:""""=%%!"
REM set "_substvar14=!_testvar:""""=&!"
REM set "_substvar15=!_testvar:""""=(!"
REM set "_substvar16=!_testvar:""""=)!"
REM set "_substvar17=!_testvar:""""=<!"
REM set "_substvar18=!_testvar:""""=>!"
REM set "_substvar19=!_testvar:""""=^!"
REM set "_substvar20=!_testvar:""""=|!"


REM set "_substvar11=!_testvar:"^""=!!"
REM set "_substvar12=!_testvar:"^""="!"
REM set "_substvar13=!_testvar:"^""=%%!"
REM set "_substvar14=!_testvar:"^""=&!"
REM set "_substvar15=!_testvar:"^""=(!"
REM set "_substvar16=!_testvar:"^""=)!"
REM set "_substvar17=!_testvar:"^""=<!"
REM set "_substvar18=!_testvar:"^""=>!"
REM set "_substvar19=!_testvar:"^""=^!"
REM set "_substvar20=!_testvar:"^""=|!"