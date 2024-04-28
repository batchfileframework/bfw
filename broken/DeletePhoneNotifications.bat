
::Usage Call :DeletePhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%" NotifText
:DeletePhoneNotifications
set buffer=
for /f "usebackq tokens=* skip=1 delim=, eol=;" %%a in (`GetPhoneNotifications.exe %~1 "%~dpf2"`) do (
    set buffer=
	set buffer=%%b
	call set buffer=%%buffer:%NotifText%=%%
	if not "[%%b]"="[%buffer%]" DeletePhoneNotification.exe %~1 "%~dpf2" %~3 %%b
	)
GoTo :EOF

