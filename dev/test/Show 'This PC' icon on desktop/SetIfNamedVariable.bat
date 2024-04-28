
::Usage Call :SetIfNamedVariable "%val1%" var1 "%val2%" var2 "%val3%" var3 "%val4%" var4 continue "%val5%" var5 "%val6%" var6 "%val7%" var7 "%val8%" var8 continue "%valN%" varN
:SetIfNamedVariable
if not "[%~2]"=="[]" set "%~2=%~1" & set "_SetIfNamedVariable.onefound=true"
if not "[%~4]"=="[]" set "%~4=%~3" & set "_SetIfNamedVariable.onefound=true"
if not "[%~6]"=="[]" set "%~6=%~5" & set "_SetIfNamedVariable.onefound=true"
if not "[%~8]"=="[]" set "%~8=%~7" & set "_SetIfNamedVariable.onefound=true"
if not "[%~9]"=="[]" set "_SetIfNamedVariable.onefound=true"
if "[%_SetIfNamedVariable.onefound%]"=="[true]" shift & shift & shift & shift & shift & shift & shift & shift & shift
if "[%_SetIfNamedVariable.onefound%]"=="[true]" set "_SetIfNamedVariable.onefound=" & GoTo :SetIfNamedVariable
GoTo :EOF

