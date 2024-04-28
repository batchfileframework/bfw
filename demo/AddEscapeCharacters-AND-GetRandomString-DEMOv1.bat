
:AddEscapeCharacters-AND-GetRandomString-DEMOv1

REM set debug=true

REM Call :PrintCharMap 
REM goto :eof
Call :ClearVariablesByPrefix _GetRandomString
Call :ClearVariablesByPrefix _AddEscapeCharacters
echo new attempt>>randomstring.txt

set "myteststring=" & set "myescapedstring=" & set "myteststring.len=" & set "myescapedstring.len="
REM call :GetRandomString 29 myteststring USESPECIALCHARS DONTESCAPE
REM call :GetRandomString 29 myteststring DONTESCAPE USEALLCHARS
REM call :GetRandomString 29 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 1000 myteststring DONTESCAPE USESPECIALCHARS USEPERCENT USEEXCLAMATION USEDELIMITERS
REM call :GetRandomString 30 myteststring DONTESCAPE 
call :GetRandomString 3000 myteststring DONTESCAPE 
Call :len myteststring.len2 myteststring

Call :AddEscapeCharacters myteststring  myescapedstring
Call :len myescapedstring.len2 myescapedstring



echo I1 %myteststring.len% %myteststring.len2% "%myteststring%"
echo I1 %myteststring.len% %myteststring.len2% "%myteststring%">>randomstring.txt
setlocal enabledelayedexpansion
Call :len myteststring.len myteststring
echo I2 !myteststring.len! !myteststring.len2!  !myteststring!
echo I2 !myteststring.len! !myteststring.len2!  !myteststring!>>randomstring.txt
endlocal
echo O1 %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%
echo O1 %myescapedstring.len% %myescapedstring.len2%  %myescapedstring%>>randomstring.txt
setlocal enabledelayedexpansion
echo O2 !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!
echo O2 !myescapedstring.len! !myescapedstring.len2!  !myescapedstring!>>randomstring.txt
endlocal
REM set my
goto :AddEscapeCharacters-AND-GetRandomString-DEMO

GoTo :EOF
