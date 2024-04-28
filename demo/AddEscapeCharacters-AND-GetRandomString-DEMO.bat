
:AddEscapeCharacters-AND-GetRandomString-DEMO

echo new attempt>>randomstring.txt

set "myteststring=" & set "myescapedstring="
call :GetRandomString 20 myteststring USESPECIALCHARS

Call :AddEscapeCharacters myteststring  myescapedstring

setlocal enabledelayedexpansion
echo E !myescapedstring!
echo E !myescapedstring!>>randomstring.txt
endlocal

setlocal enabledelayedexpansion
echo I !myteststring!
echo I !myteststring!>>randomstring.txt
endlocal
echo O %myescapedstring%
echo O %myescapedstring%>>randomstring.txt

goto :AddEscapeCharacters-AND-GetRandomString-DEMO

GoTo :EOF

