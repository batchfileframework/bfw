
::Usage Call :IsLastToken InputString SearchString optional OutputValue
:IsLastToken
set "_IsLastToken_result=false"
if defined %~1 call set _IsLastToken_input=%%%~1%%
if not defined _IsLastToken_input set "_IsLastToken_input=%~1"
set "_IsLastToken_input=%_IsLastToken_input:-= %"
set "_IsLastToken_input=%_IsLastToken_input::= %"
for %%a in (%_IsLastToken_input%) do if "[%%a]" EQU "[%~2]" set "_IsLastToken_result=true"
set "_IsLastToken_input=" & set "_IsLastToken_result=" & if "[%_IsLastToken_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )

