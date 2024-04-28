
:EchoSingleArgumentTest
echo testtext1 %1
echo testtext2 %~1
echo testtext3 "%1"
echo testtext4 "%~1"
setlocal enabledelayedexpansion
echo testtext5 %1
echo testtext6 %~1
echo testtext7 "%1"
echo testtext8 "%~1"
endlocal
echo testtex21 %2
echo testtex22 %~2
echo testtex23 "%2"
echo testtex24 "%~2"
setlocal enabledelayedexpansion
echo testtex25 %2
echo testtex26 %~2
echo testtex27 "%2"
echo testtex28 "%~2"

endlocal
GoTo :EOF
