
::Usage Call :DownloadFile http://example.com/example.file optional alternate.name.example.file
:DownloadFile
set "_DownloadFile_URL=%~1"
set "_DownloadFile_OutputFileName=%~2"
if "[%_DownloadFile_OutputFileName%]" NEQ "[]" set "_DownloadFile_OutputParameter=-o %_DownloadFile_OutputFileName%"
curl --location --fail %_DownloadFile_URL% %_DownloadFile_OutputParameter%
set "_DownloadFile_URL=" & set "_DownloadFile_OutputFileName=" & set "_DownloadFile_OutputParameter="
GoTo :EOF
