
::Usage Call :ReplaceString InputString ReplaceString optional OutputString optional StartIndex optional len
:ReplaceString
set "_ReplaceString_prefix=_RS"
Call :ClearVariablesByPrefix _RS_byref
setlocal enabledelayedexpansion
if defined %~1 set "_RS_byref_input=true"
if defined %~2 set "_RS_byref_replace=true"
set _RS_Input=%~1
set _RS_Replace=%~2
set _RS_Output=%~3
if not defined _RS_Output set _RS_Output=%_RS_Input%
set /a _RS_StartIndex=%~4 2>nul
if not defined _RS_StartIndex set /a _RS_StartIndex=0
set /a _RS_len=%~5 2>nul
if not defined _RS_len call :len _RS_Replace _RS_len
set /a _RS_RemainIndex=%_RS_StartIndex%+%_RS_len%
if defined _RS_byref_input if defined _RS_byref_replace GoTo :ReplaceString-both-byref-skip
if defined _RS_byref_input if not defined _RS_byref_replace GoTo :ReplaceString-input-byref-skip
if defined not _RS_byref_input if defined _RS_byref_replace GoTo :ReplaceString-replace-byref-skip
set _RS_Intermetiate=!_RS_Input:~,%_RS_StartIndex%!!_RS_Replace!!_RS_Input:~%_RS_RemainIndex%!
GoTo :ReplaceString-end
:ReplaceString-both-byref-skip
set _RS_Intermetiate=!%_RS_Input%:~,%_RS_StartIndex%!!%_RS_Replace%!!%_RS_Input%:~%_RS_RemainIndex%!
GoTo :ReplaceString-end
:ReplaceString-replace-byref-skip
set _RS_Intermetiate=!_RS_Input:~,%_RS_StartIndex%!!%_RS_Replace%!!_RS_Input:~%_RS_RemainIndex%!
GoTo :ReplaceString-end
:ReplaceString-input-byref-skip
if not defined _RS_byref_replace set _RS_Replace=%~2
set _RS_Intermetiate=!%_RS_Input%:~,%_RS_StartIndex%!!_RS_Replace!!%_RS_Input%:~%_RS_RemainIndex%!
:ReplaceString-end
if "[%~6]" NEQ "[]" (shift & shift & shift & shift & shift & GoTo :ReplaceString)
for /f "tokens=1* delims=" %%a in ('echo.!_RS_Intermetiate!') do endlocal & set %_RS_Output%=%%a
Call :ClearVariablesByPrefix %_ReplaceString_prefix% _ReplaceString_prefix & GoTo :EOF


:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
if "[%~1]" NEQ "[]" for /f "tokens=1 delims==" %%a in ('set "%~1" 2^>nul') do set %%a=
if "[%~2]" NEQ "[]" shift & GoTo :ClearVariablesByPrefix
GoTo :EOF
