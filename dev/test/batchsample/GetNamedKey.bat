
::Usage Call :GetNamedKey NamedKey optional NamedValue
:GetNamedKey
call set "_bufferKey=%%%~1.Key%%"
if "[%_bufferKey%]"=="[]" call :GetNamedKeyLookup %~1 
call set "_bufferKeyType=%%%~1.Type%%"
REM Obtain registry value with GetRegistryValue
REM call echo Call :GetRegistryValue "%%%~1.Key%%" %~1.Value
Call :GetRegistryValue "%%%~1.Key%%" %~1.Value
if "[%_bufferKeyType%]"=="[DWORD]" Call :HexPrefixStripper "%%%~1.Value%%" "%~1.Value"
REM Put all values and named values in array _bufferNamedValues[x]
Call set "_bufferCurrentValue=%%%~1.Value%%"
Call set "_bufferNamedValues=%%%~1.NamedValues%%"
if "[%_bufferNamedValues%]"=="[]" GoTo :GetNamedKey-internal-loop-skip
REM call echo Call :Deconcatenate \ "%%%~1.NamedValues%%" _bufferNamedValues
Call :Deconcatenate \ "%%%~1.NamedValues%%" _bufferNamedValues
REM Loop through array _bufferNamedValues[x], save lookup in %~1.NamedValues[x]
set /a _index=0 & set _bufferline=
:GetNamedKey-internal-loop
call set _bufferline=%%_bufferNamedValues[%_index%]%%
for /f "tokens=1,2 delims==" %%a in ("%_bufferline%") do ( 
  set "%~1.NamedValues[%%a]=%%b"
  if "[%_bufferCurrentValue%]"=="[%%a]" set "%~1.CurrentNamedValue=%%b"
)
set /a _index+=1
if %_index% LEQ %_bufferNamedValues.ubound% GoTo :GetNamedKey-internal-loop
:GetNamedKey-internal-loop-skip
REM return optional value and cleanup temporary variables
if not "[%~2]"=="[]" call set "%~2=%%%~1.CurrentNamedValue%%"
set "_bufferCurrentValue=" & set "_bufferKeyType=" & set "_bufferline=" & set "_bufferNamedValues="
Call :ClearVariablesByPrefix _bufferNamedValues
GoTo :EOF

