
::Usage Call :PrintRandomStringPS [NONUMBERS] [NOUPPERCASE] [NOUPPERCASE] [SPACE] [PUNCTUATION] [NOPOISON] [POISON] [EXTENDED] [CONTROL] [RESET] StringLenght1 OutputVariable1 StringLenght2 OutputVariable2 ... StringLenghtN OutputVariableN
::You can your CLEAR in front of the switches to clear them
:PrintRandomStringPS
set "_PrintRandomStringPS_prefix=_PRS"
set "_PRS_SetList=NONUMBERS NOUPPERCASE NOLOWERCASE SPACE PUNCTUATION NOPOISON EXTENDED CONTROL NOPOISON POISON"
if "[%~1]" EQU "[RESET]" ( for %%a in (%_PRS_SetList%) do ( set "_PRS_%%a=" ) & shift & GoTo :PrintRandomStringPS )
for %%a in (%_PRS_SetList%) do if "[%%a]" EQU "[%~1]" ( set "_PRS_%%a=true" & shift & GoTo :PrintRandomStringPS ) else ( if "[CLEAR%%a]" EQU "[CLEAR%~1]" ( set "_PRS_%%a=" & shift & GoTo :PrintRandomStringPS ) )
set /a _PRS_Len=%~1
set "_PRS_CurrentSet="
if not defined _PRS_NONUMBERS set "_PRS_CurrentSet=%_PRS_CurrentSet% + 48..57"
if not defined _PRS_NOUPPERCASE set "_PRS_CurrentSet=%_PRS_CurrentSet% + 65..90"
if not defined _PRS_NOLOWERCASE set "_PRS_CurrentSet=%_PRS_CurrentSet% + 97..122"
if defined _PRS_SPACE set "_PRS_CurrentSet=%_PRS_CurrentSet% + 32"
if defined _PRS_PUNCTUATION if not defined _PRS_NOPOISON ( set "_PRS_CurrentSet=%_PRS_CurrentSet% + 33..47 + 58..64 + 91..96 + 123..126" ) else ( set "_PRS_CurrentSet=%_PRS_CurrentSet%+ 35..36 + 39 + 42..47 + 58..59 + 61 + 63..64 + 91..93 + 95..96 + 123 + 125 + 126" )
if defined _PRS_POISON if not defined _PRS_PUNCTUATION  set "_PRS_CurrentSet=%_PRS_CurrentSet% + 33 + 34 + 37 + 38 + 40 + 41 + 60 + 62 + 94 + 124"
if defined _PRS_EXTENDED set "_PRS_CurrentSet=%_PRS_CurrentSet% + 128..255"
if defined _PRS_CONTROL set "_PRS_CurrentSet=%_PRS_CurrentSet% + 0..31 + 127"
for /f "tokens=1* delims=" %%a in ('powershell -command "-join (1..%_PRS_Len% | ForEach-Object { %_PRS_CurrentSet:~3% | Get-Random } | ForEach-Object { [char]$_ })" 2^>nul') do echo.%%a
if "[%~2]" NEQ "[]" ( shift & GoTo :PrintRandomStringPS )
Call :ClearVariablesByPrefix %_PrintRandomStringPS_prefix% _PrintRandomStringPS_prefix & GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF


