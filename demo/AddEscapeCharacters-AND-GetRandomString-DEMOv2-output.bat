
:AddEscapeCharacters-AND-GetRandomString-DEMOv2-output
echo I %myteststring.len% %myteststring.len2% "%myteststring%"
echo O %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%
echo I %myteststring.len% %myteststring.len2% "%myteststring%">>randomstring.txt
echo O %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%>>randomstring.txt
setlocal enabledelayedexpansion
echo II !myteststring.len! !myteststring.len2!  !myteststring!
echo OO !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!
echo II !myteststring.len! !myteststring.len2!  !myteststring!>>randomstring.txt
echo OO !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!>>randomstring.txt
endlocal
REM set my
GoTo :EOF

