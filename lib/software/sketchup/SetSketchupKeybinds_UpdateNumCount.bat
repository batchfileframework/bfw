
:SetSketchupKeybinds_UpdateNumCount
set /a _SSKUNC_Count=%~1
::SetSketchupKeybinds_UpdateNumCount
:: Query the registry and count the occurrences of "Shortcut", subtracting 1 for the actual count
for /f %%a in ('reg query "HKEY_CURRENT_USER\Software\Google\SketchUp8\Settings" 2^>nul ^| find /c "Shortcut"') do set /a _SSKUNC_Count=%%a
for /f %%a in ('reg query "HKEY_CURRENT_USER\Software\Google\SketchUp8\Settings" 2^>nul ^| find /c "Num_Shortcuts"') do if "[%%a]" EQU "[1]" set /a _SSKUNC_Count-=1
:: Add or update the registry value with the computed count
reg add "HKEY_CURRENT_USER\Software\Google\SketchUp8\Settings" /v Num_Shortcuts /t REG_DWORD /d %_SSKUNC_Count% /f
:: Optional: Display the new count for confirmation
echo Number of Shortcuts set to: %_SSKUNC_Count%
set "_SSKUNC_Count="
GoTo :EOF
