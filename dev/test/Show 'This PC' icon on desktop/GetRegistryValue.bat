
::Usage Call :GetRegistryValue RegistryKey Output
:GetRegistryValue
set "_GetRegistryValue="
Set "_GetRegistryKey=%~1"
Call :GetLastElement \ %_GetRegistryKey% _GetRegistryKeyName
Call :TrimQuotes %_GetRegistryKeyName% _GetRegistryKeyName
Call :Replace "%_GetRegistryKey%" "\%_GetRegistryKeyName%" _GetRegistryPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "%_GetRegistryPath%" 2^>nul') do if "[%%a]"=="[%_GetRegistryKeyName%]" set _GetRegistryValue=%%c
set "%~2=%_GetRegistryValue%"
if "[%_GetRegistryValue%]"=="[]" set "%~2=NOT SET"
set "_GetRegistryValue="
GoTo :EOF

