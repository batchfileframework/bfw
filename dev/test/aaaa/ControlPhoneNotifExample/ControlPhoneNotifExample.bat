@echo off
:setup
set MyPhoneIPorHostname=myphone.lan
set CredentialFile=x:\path\to\credentials.file
:main

Call :SendNotifcationToPhone %MyPhoneIPorHostname% "%CredentialFile%"  "Hello, this is a dismissable notification" 
Call :SendNotifcationToPhone %MyPhoneIPorHostname% "%CredentialFile%"  "Hello, this is a permanent notification" Permanent

Call :ListPhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%"

Call :GetPhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%" NotifSearchText myNotifGUID myNotifText

Echo We will not delete notif GUID=%myNotifGUID% containing text :%myNotifText%

Call :DeletePhoneNotificationsByGUID %MyPhoneIPorHostname% "%CredentialFile%" %myNotifGUID%
REM or 
Call :DeletePhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%" %myNotifText%

set myNotifGUID= & set myNotifText=

echo checking that the notification is gone 

Call :GetPhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%" NotifSearchText myNotifGUID myNotifText

echo if notification is gone there should be no text after : %myNotifGUID% %myNotifText%

:end
GoTo :EOF

::Usage Call :SendNotifcationToPhone %MyPhoneIPorHostname% "%CredentialFile%"  "%NotificationMessage%" 'optional %MessageType%
:SendNotifcationToPhone
SendPhoneNotif.exe %~1 "%~dpf2" %4 "%~3"
GoTo :EOF

::Usage Call :ListPhoneNotifications %MyPhoneIPorHostname% "%CredentialFile%"
:ListPhoneNotifications
for /f "usebackq tokens=* skip=1 delim=, eol=;" %%a in (`GetPhoneNotifications.exe %~1 "%~dpf2"`) do echo NofiGUID%%a NotifText%%b
GoTo :EOF

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

::Usage Call :DeletePhoneNotificationsByGUID %MyPhoneIPorHostname% "%CredentialFile%" NotifGUIDtoDelete
:DeletePhoneNotificationsByGUID
for /f "usebackq tokens=* skip=1 delim=, eol=;" %%a in (`GetPhoneNotifications.exe %~1 "%~dpf2"`) do (
	if "[%%a]"="[NotifGUIDtoDelete]" DeletePhoneNotification.exe %~1 "%~dpf2" %~3
	)
GoTo :EOF