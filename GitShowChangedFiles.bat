@echo off

:GitShowChangedFiles
git fetch origin
git status
GoTo :EOF
