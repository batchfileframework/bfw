
::Usage Call :CopyElementAndSuffix InputElement OutputElement DontClearOutput
:CopyElementAndSuffix
set "_CopyElementAndSuffix_Input=%~1"
set "_CopyElementAndSuffix_Output=%~2"
set "_CopyElementAndSuffix_Directive=%~3"
if not "[%_CopyElementAndSuffix_Directive%]"=="[DontClearOutput]" (
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Output% 2^>NUL') do ( set "%%a=" )
)
for /F "tokens=1* delims==" %%a in ('set %_CopyElementAndSuffix_Input% 2^>NUL') do (
	call set "_token=%%a"
	call set "%%_token:%_CopyElementAndSuffix_Input%=%_CopyElementAndSuffix_Output%%%=%%b"
)
GoTo :EOF

