@echo off
:setup
:main


Call :CreateFile file1.ext
Call :CreateFile file2.ext
Call :CreateFile file3.ext
Call :CreateFile file4.ext
Call :CreateFile file5.ext
Call :CreateFile test1\file1.ext
Call :CreateFile test1\file2.ext
Call :CreateFile test1\file3.ext
Call :CreateFile test1\file4.ext
Call :CreateFile test1\file5.ext
Call :CreateFile test1\test2\file1.ext
Call :CreateFile test1\test2\file2.ext
Call :CreateFile test1\test2\file3.ext
Call :CreateFile test1\test2\file4.ext
Call :CreateFile test1\test2\file5.ext

Call :ListFiles "test1\" 
Call :ListFiles "test1\" filelist.text.txt
Call :ListFiles "test1\" FileListArray

echo 0 %FileListArray[0]%
echo 1 %FileListArray[1]%
echo 2 %FileListArray[2]%
echo 3 %FileListArray[3]%
echo 4 %FileListArray[4]%
echo 5 %FileListArray[5]%
echo 6 %FileListArray[6]%

echo lbound %FileListArray.lbound%
echo ubound %FileListArray.ubound%
echo list all array element using for loop
for /L %%i in (%FileListArray.lbound% 1 %FileListArray.ubound%) do (
  call echo %%i %%FileListArray[%%i]%%
)
echo list file contents
type filelist.text.txt

GoTo :END
:END
GoTo :EOF
:: Internal functions
:: Function library

:: Usage Call :CreateFile x:\path\to\file.ext optional variable[X]
:CreateFile 
md %~dp1 2>nul
echo. >%~dpf1
GoTo :EOF

::Usage Call :ListFiles x:\path\to\folder 'Will output to console
::Usage Call :ListFiles x:\path\to\folder ArrayName 'Will output to ArrayName[X], range ArrayName.lbound to ArrayName.ubound
::Usage Call :ListFiles x:\path\to\folder Filename.ext 'Will output to a file, must contain a dot, can be relative or absolute path
:ListFiles
set "InputFolder=%~1"
set /a index=0
set SearchPattern=*.*
if not ["%~3"]==[""] set SearchPattern=%~3
if ["%~2"]==[""] GoTo :ListFileToConsole
echo %2 | findstr "\." > nul && set OutputFile=%~dpf2
echo %2 | findstr "\." > nul && GoTo :ListFileToFile
GoTo :ListFileToArray
REM Do the right thing about the trailing backslash (not done)
:ListFileToConsole
echo ListToConsole
for /r "%InputFolder%" %%f in (%SearchPattern%) do ( echo %%f )
GoTo :ListFilesEND
:ListFileToFile 
echo ListToFile %OutputFile%
del %OutputFile%
for /r "%InputFolder%" %%f in (%SearchPattern%) do ( echo %%f >> %OutputFile% )
GoTo :ListFilesEND
:ListFileToArray
echo ListToArray %~2
set /a %~2.lbound=%index%
for /f "tokens=*" %%f in ('dir /b /s /a:-d "%InputFolder%\%SearchPattern%"') do (
	call set "%~2[%%index%%]=%%~f"
	set /a "index+=1"
)
set /a "index-=1"
set /a %~2.ubound=%index%
GoTo :ListFilesEND
:ListFilesEND
GoTo :EOF
REM https://old.reddit.com/r/Batch/comments/12hzftu/trying_to_create_a_subfunction_that_puts_all/jfxubzv/
REM https://stackoverflow.com/a/830566
REM call :ListFiles "%PROGRAMFILES%\Internet Explorer\" 
REM call :ListFiles "%PROGRAMFILES%\Internet Explorer\" OutputArray
REM call :ListFiles "%PROGRAMFILES%\Internet Explorer\" OutputFile.txt