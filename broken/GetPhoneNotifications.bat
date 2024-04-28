
::Usage Call :GetPhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%" NotifSearchText OutputGUID OutputText
:GetPhoneNotifications
set buffer=
for /f "usebackq tokens=* skip=1 delim=, eol=;" %%a in (`GetPhoneNotifications.exe %~1 "%~dpf2"`) do (
    set buffer=
	set buffer=%%b
	call set buffer=%%buffer:%NotifText%=%%
	if not "[%%b]"="[%buffer%]" set %4="%%a" & set %5="%%b"
	)
GoTo :EOF

