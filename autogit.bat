@echo off

:autogitcommit
git add *
if "[%~1]" EQU "[]" ( set "_autogit_message=No commit message" ) else ( set "_autogit_message=%~1" )
git commit -m "%_autogit_message%"
git push
GoTo :EOF