@echo off

del stdout.txt 2>nul
del stderr.txt 2>nul

call "Batch stdout and stderr demo.bat" >stdout.txt 2>stderr.txt

echo this is stdout.txt
type stdout.txt

echo this is stderr.txt
type stderr.txt
