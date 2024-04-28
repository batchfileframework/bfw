
::Usage Call :GetLastToken InputString OutputLastToken
:GetLastToken
for %%a in (%~1) do set %~2=%%a
GoTo :EOF

