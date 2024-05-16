
::Usage Call :SetSketchupKeybinds [CTRL] [ALT] [SHIFT] key "keybinding name"
:SetSketchupKeybinds
set "_SSK_prefix=_SSK"
set "_SSK_SHIFT=0"
set "_SSK_CTRL=0"
set "_SSK_ALT=0"
:SetSketchupKeybinds-args
if /i "%~1"=="SHIFT" ( set "_SSK_SHIFT=1" & shift & GoTo :SetSketchupKeybinds-args)
if /i "%~1"=="CTRL" ( set "_SSK_CTRL=1" & shift & GoTo :SetSketchupKeybinds-args)
if /i "%~1"=="ALT" ( set "_SSK_ALT=1" & shift & GoTo :SetSketchupKeybinds-args)
:: Ensure both arguments are provided after optional shifting
set "_SSK_Key=%~1"
set "_SSK_KeybindName=%~1"
if "%arg1%"=="" ( echo Key for keybind not provided, quitting & GoTo :EOF )
if "%arg2%"=="" ( echo Keybind not provided, quitting & GoTo :EOF )
:: Construct the new shortcut value
set "_SSK_RegValue=%CTRL% %ALT% %SHIFT% %arg1% %arg2%"
:: Query the registry, count occurrences of "Shortcut", and compute the new shortcut index
for /f %%a in ('reg query "HKEY_CURRENT_USER\Software\Google\SketchUp8\Settings" 2^>nul ^| find /c "Shortcut"') do set /a _SSK_count=%%a
REM why +1 ?
set /a _SSK_count+=1
for /f %%a in ('reg query "HKEY_CURRENT_USER\Software\Google\SketchUp8\Settings" 2^>nul ^| find /c "Num_Shortcuts"') do if "[%%a]" EQU "[1]" set /a _SSK_count-=1
:: Add the new shortcut to the registry
reg add "HKEY_CURRENT_USER\Software\Google\SketchUp8\Settings" /v Shortcut_%_SSK_count% /t REG_SZ /d "%_SSK_RegValue%" /f
echo Shortcut_%_SSK_count% created with value "%_SSK_RegValue%"
call :SetSketchupKeybinds_UpdateNumCount
GoTo :EOF
