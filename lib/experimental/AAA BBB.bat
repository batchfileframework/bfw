@ECHO OFF

echo this is AAA BBB.bat
echo 1 %~dp0
PUSHD %~dp0
echo 2 %~dp0
cd ..
echo 3 %~dp0
popd 
echo 4 %~dp0

echo this is AAA BBB.bat part2
echo 1 %~dpn0
PUSHD %~dp0
echo 2 %~dpn0
cd ..
echo 3 %~dpn0
popd 
echo 4 %~dpn0