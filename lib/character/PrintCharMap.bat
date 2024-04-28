
::Usage Call :PrintCharMap FULLRANGE
:PrintCharMap
set /a "_PrintCharMap_index=32" & set /a "_PrintCharMap_count=126"
if "[%~1]"=="[FULLRANGE]" set /a "_PrintCharMap_index=0" & set /a "_PrintCharMap_count=255"
:PrintCharMap-loop
cmd /c exit %_PrintCharMap_index%
setlocal enabledelayedexpansion
echo %_PrintCharMap_index% !=exitcodeascii!
endlocal
set /a "_PrintCharMap_index+=1"
if %_PrintCharMap_index% LEQ %_PrintCharMap_count% GoTo :PrintCharMap-loop
GoTo :EOF

