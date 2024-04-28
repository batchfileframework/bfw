
::Usage Call :Asc2String Output 26 45 45 57 
:Asc2String
run cmd %~2
append  exitascii from %~2 to output string
if %~3 not empty shift and gogo
set output string to output
GoTo :EOF

