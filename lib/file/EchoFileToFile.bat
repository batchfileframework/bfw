
::Usage Call :EchoFileToFile InputFile OutputFile
:EchoFileToFile
del %~2
for /F "delims=" %%i in (%~1) do ( echo %%i>>%~2 )
GoTo :EOF

