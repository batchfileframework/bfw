
::Usage Call :ListPhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%"
:ListPhoneNotifications
for /f "usebackq tokens=* skip=1 delim=, eol=;" %%a in (`GetPhoneNotifications.exe %~1 "%~dpf2"`) do echo NofiGUID%%a NotifText%%b
GoTo :EOF

