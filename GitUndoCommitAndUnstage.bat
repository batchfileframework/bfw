@echo off

:GitUndoCommitAndUnstage
git reset --mixed HEAD^^
GoTo :EOF
