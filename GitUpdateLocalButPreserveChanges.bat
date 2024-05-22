@echo off

:GitUpdateLocalButPreserveChanges
echo this should show local files that have changed and will be locally updated
echo this should show local files that have changed and remain to be uploaded
git pull --rebase --autostash
git stash list
GoTo :EOF
