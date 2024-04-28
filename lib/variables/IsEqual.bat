
::Usage Call :IsEqual StringA StringB optional OutputBool && echo it is true (errorlevel 0) || echo it is false (errorlevel not 0)
:IsEqual
setlocal enabledelayedexpansion
endlocal & if "[%~3]" NEQ "[]"
