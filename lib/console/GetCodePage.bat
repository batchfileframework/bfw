
::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF
