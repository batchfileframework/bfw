@echo off

:GitRenormalize
git add --renormalize .
REM # to see which files have been normalized
git status  
echo Press any key to commit renormalization
echo CTRL+C to cancel
pause
git commit -m "Normalize line endings"
GoTo :EOF