
::Usage Call :NoTrailingBackslash PathVariable
::Will remove trailing backslash, if there is one 
:NoTrailingBackslash
call set "_NoTrailingBackslash_Input=%%%~1%%"
if "[%_NoTrailingBackslash_Input:~-1%]" EQU "[\]" set "%~1="
GoTo :EOF
