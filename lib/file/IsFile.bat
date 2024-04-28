
::Usage Call :IsFile optional _OutputVar File1 File2 ... FileN && IsFile || IsNotFile
:IsFile
set "_IsFile_buffer=%~1"
if /i "[%_IsFile_buffer:~0,10%]" EQU "[_OutputVar]" ( set "_IsFile_output=%~1" & shift )
set "_IsFile_buffer="
:IsFile-loop
set "_IsFile_Filename=%~a1"
if "[%_IsFile_Filename:~0,1%]" EQU "[-]" ( set "_IsFile_result=true" ) else ( set "_IsFile_result=false" )
if "[%_IsFile_output%]" NEQ "[]" set "%_IsFile_output%=%_IsFile_result%"
if "[%_IsFile_result%]" EQU "[true]" if "[%~2]" NEQ "[]" ( shift & GoTo :IsFile-loop )
set "_IsFile_Filename=" & set "_IsFile_output=" & set "_IsFile_result=" & if "[%_IsFile_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )

