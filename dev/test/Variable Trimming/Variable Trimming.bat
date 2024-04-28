@echo off
setlocal EnableDelayedExpansion

set "original_var=This is the original string."
echo Original variable: %original_var%

set "trimmed_var=%original_var:~1,-1%"
echo Trimmed variable: %trimmed_var%