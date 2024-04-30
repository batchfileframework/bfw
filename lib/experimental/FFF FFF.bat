@ECHO OFF

echo this is FFF FFF.bat
echo 1 %~dp0
echo 2 %~dp0
cd ..
echo 3 %~dp0
cd experimental
echo 3 %~dp0

echo this is FFF FFF.bat part2
echo 1 %~dpn0
PUSHD %~dp0
echo 2 %~dpn0
cd ..
echo 3 %~dpn0
popd 
echo 4 %~dpn0