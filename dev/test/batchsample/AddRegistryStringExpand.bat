
:AddRegistryString
set "_REGTYPE=REG_SZ" & GoTo :AddRegistryValue
:AddRegistryDWORD
set "_REGTYPE=REG_DWORD" & GoTo :AddRegistryValue
:AddRegistryStringExpand
set "_REGTYPE=REG_EXPAND_SZ" & GoTo :AddRegistryValue
:AddRegistryStringMulti
set "_REGTYPE=REG_MULTI_SZ" & GoTo :AddRegistryValue
:AddRegistryQWORD
set "_REGTYPE=REG_QWORD" & GoTo :AddRegistryValue
:AddRegistryBinary
set "_REGTYPE=REG_BINARY" & GoTo :AddRegistryValue
:AddRegistryValue
set _AddRegistryKeyPath=%1
if "[%_REGTYPE%]"=="[]" Call :AddRegistryDetermineREGTYPE %~1 %~2 _REGTYPE
Call :GetLastElement \ %_AddRegistryKeyPath% _AddRegistryKeyName
Call :TrimQuotes %_AddRegistryKeyName% _AddRegistryKeyName
Call set _AddRegistryKeyPath=%%_AddRegistryKeyPath:%_AddRegistryKeyName%=%%
Call :TrimTrailingBackslash %_AddRegistryKeyPath% _AddRegistryKeyPath
REG ADD "%_AddRegistryKeyPath%" /v "%_AddRegistryKeyName%" /t REG_DWORD /d "%~2" /f 2>&1>nul
set "_AddRegistryKeyPath=" & set "_AddRegistryKeyName=" & set "_REGTYPE="
GoTo :EOF
:AddRegistryDetermineREGTYPE
REM It's always a string for now, TODO
set %3=REG_SZ
GoTo :EOF
REM https://learn.microsoft.com/en-us/windows/win32/sysinfo/registry-value-types

