
:: Usage: Call :IsPathRelative FilePath && echo Is relative || echo Is NOT relative
:IsPathRelative
if "[%~1]" EQU "[%~dpnx1]" ( exit /b 1 ) else ( exit /b 0 )
