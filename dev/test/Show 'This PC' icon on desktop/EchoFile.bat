
::Usage Call :EchoFile InputFile
:EchoFile
for /F "delims=" %%i in (%~1) do ( echo %%i )
GoTo :EOF

