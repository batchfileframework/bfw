
:Join-DEMO

set myvalue=

call :join myvalue "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

call :join myvalue joindelimiter " " "This" "is" "a" "sentence"
echo output %myvalue% & set myvalue=
echo.

call :join myvalue joindelimiter " " "This" "is" "a" "sentence. " joincleardelimiter "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

call :join myvalue joindelimiter "W" "This" "is" "a" "sentence. " joincleardelimiter "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

set myextravalue=THISISTHEEXTRAVALUE
call :join myvalue joindelimiter " " "This" "is" "myextravalue" "sentence. " joincleardelimiter "This " "is " "a " "sentence"
echo output %myvalue% & set myvalue=
echo.

GoTo :EOF

