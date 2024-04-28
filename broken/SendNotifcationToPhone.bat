
::Usage Call :SendNotifcationToPhone %MyPhoneIPorHostname% "%CredentialFile%"  "%NotificationMessage%" 'optional %MessageType%
:SendNotifcationToPhone
SendPhoneNotif.exe %~1 "%~dpf2" %4 "%~3"
GoTo :EOF

