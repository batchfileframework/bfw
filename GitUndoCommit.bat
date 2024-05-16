@echo off

:GitUndoCommit
git reset --soft HEAD^^
GoTo :EOF
