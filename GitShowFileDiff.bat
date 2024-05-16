@echo off 

:GitShowFileDiff
git fetch origin
git diff origin
GoTo :EOF
