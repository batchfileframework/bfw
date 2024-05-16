@echo off

:GitCompareWithServer
git fetch origin
git log -1 HEAD
git log -1 origin/main
git rev-parse HEAD
git rev-parse origin/main
GoTo :EOF
