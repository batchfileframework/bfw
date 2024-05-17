@echo off

:GitUpdateLocalButPreserveChanges
git pull --rebase --autostash
git stash list
GoTo :EOF
