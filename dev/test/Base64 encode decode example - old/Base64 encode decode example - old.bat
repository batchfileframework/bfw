@echo off

rem command line "Base64 encode decode example.bat" parameter1 parameter2 parameter3 value1=true -command "path and file"

Set params=%*
Set "params7=parameter1 parameter2 parameter3 value1=true -command "path and file""
Set "params1=%params:"=^"%"
Set "params2=%params:^^=`^^%"
Set "params3=parameter1 parameter2 parameter3 value1=true -command "path and file""
Set "params4=parameter1 parameter2 parameter3 value1=true -command ^"path and file^""
Set params5=parameter1 parameter2 parameter3 value1=true -command "path and file"
Set params6=parameter1 parameter2 parameter3 value1=true -command ^"path and file^"
echo ANDSIGNSTAR %*
echo params %params%
echo params1 %params1%
echo params2 %params2%
echo params3 %params3%
echo params4 %params4%
echo params5 %params5%
echo params6 %params6%

echo TEST TEST MAYBE WORKING ?
echo encoding params %params%
rem set params=%params:"=\"%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params:"=\"%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=
echo TEST TEST MAYBE WORKING ?

pause


echo encoding ANDSIGNSTAR %*
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%*'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=


echo encoding ANDSIGNSTAR %*
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%*:"=\"%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params %params%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params1 %params1%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params1%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params2 %params2%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params2%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params3333 %params3%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params3%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params44444 %params4%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params4%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params5 %params5%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params5%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params6 %params6%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params6%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

set params=%params:"=\"%
set params1=%params1:"=\"%
set params2=%params2:"=\"%
set params3=%params3:"=\"%
set params4=%params4:"=\"%
set params5=%params5:"=\"%
set params6=%params6:"=\"%


echo encoding ANDSIGNSTAR %*
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%*'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=


echo encoding params %params%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params1 %params1%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params1%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params2 %params2%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params2%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params3--- %params3%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params3%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params4 %params4%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params4%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params5 %params5%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params5%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params6 %params6%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params6%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

set params=%params:"=`"%
set params1=%params1:"=`"%
set params2=%params2:"=`"%
set params3=%params3:"=`"%
set params4=%params4:"=`"%
set params5=%params5:"=`"%
set params6=%params6:"=`"%


echo encoding ANDSIGNSTAR %*
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%*'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=


echo encoding params %params%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params1 %params1%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params1%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params2 %params2%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params2%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params3 %params3%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params3%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params4 %params4%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params4%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params5 %params5%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params5%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=

echo encoding params6 %params6%
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%params6%'))"`) do set "MYVAR=%%a"
echo %MYVAR%
echo decoding
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%MYVAR%'))"`) do set "MYVAR2=%%a"
echo %MYVAR2%
set MYVAR= & set MYVAR2=



call :EncodeToBase64 %params1% Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%



call :EncodeToBase64 "Hello, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hella, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hellb, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hellc, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hell1, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hell12, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hell123, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hell, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hel, World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Hel World!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "HelWorld!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Heorld!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Herld!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "Held!" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

call :EncodeToBase64 "ZZZZZZZZ" Base64String
echo Encoded: %Base64String%

call :DecodeFromBase64 "%Base64String%" DecodedString
echo Decoded: %DecodedString%

pause

goto :eof

:EncodeToBase64
set "InputString=%~1"
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('%InputString%'))"`) do set "%2=%%a"
goto :eof

:DecodeFromBase64
set "InputBase64=%~1"
for /f "usebackq delims=" %%a in (`powershell -NoProfile -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('%InputBase64%'))"`) do set "%2=%%a"
goto :eof
