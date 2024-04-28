REM harvested
@echo off

set Settings[0]=Do nothing
set Settings[1]=Sleep
set Settings[2]=Hibernate
set Settings[3]=Shut down


REM call :FolderToArray "D:\scripts\musthave" OutputArray

REM call :EchoArray OutputArray 25 50
call :EchoArray Settings

call :Get10DigitNumber 1 mynumber
echo %mynumber%

call :FillArrayWithDigits myarray 125
call :FillArrayWithDigits mysecondarray 125

call :ArrayComparator myarray mysecondarray

REM call :EchoArray Settings
REM call :EchoArray Settings 2 1

REM call :EchoArrayToFile Settings "d:\powercfg\test.txt" 2 1
REM call :EchoArrayToFile Settings "test.txt" 2 1


GoTo :EOF

:OwnFile
takeown /skipsl /f %~1
GoTo :EOF

:OwnFolder
takeown /d y /skipsl /r /f %~1
GoTo :EOF

:GrantFile
set TargetUser=%username%
if not ["%~2"]==[""] set TargetUser=%~2
icacls %~1 /grant %TargetUser%:m /t
GoTo :EOF

:GrantFolder
set TargetUser=%username%
if not ["%~2"]==[""] set TargetUser=%~2
icacls %~1 /grant %TargetUser%:m /t
GoTo :EOF

:DeleteFolder
rd /s /q %~1
GoTo :EOF

:DeleteFile
del /f /q %~1
GoTo :EOF


:PUSHD
:POPD

REM call :folderToArray "%programfiles%\Internet Explorer" _outputArray
REM echo %_outputArray[1]%
REM echo %_outputArray[7]%
REM echo %_outputArray[8]%
 
REM pause 
REM goto :eof 
::ArrayComparator Array1 Array2 limit
:ArrayComparator 
set /a index=1
:ArrayComparator-internal-loop
echo %1
echo %2
echo %~1
echo %~2
echo %~1[%index%] %~2[%index%]
call echo %%%~1[%index%]%%%
call echo %%%~2[%index%]%%%
echo %~1[%index%]
echo %~2[%index%]
echo %%~1[%index%]
echo %%~2[%index%]
echo %%~1[%index%]%
echo %%~2[%index%]%
echo %~1[%index%]%
echo %~2[%index%]%
echo %%~1[%index%]%%
echo %%~2[%index%]%%
echo %%%~1[%index%]%%
echo %%%~2[%index%]%%
echo %%%~1[%index%]%%%
echo %%%~2[%index%]%%%
echo beep
echo %1[%index%]
echo %2[%index%]
echo %%1[%index%]
echo %%2[%index%]
echo %%1[%index%]%
echo %%2[%index%]%
echo %1[%index%]%
echo %2[%index%]%
echo %%1[%index%]%%
echo %%2[%index%]%%
echo %%%1[%index%]%%
echo %%%2[%index%]%%
echo %%%1[%index%]%%%
echo %%%2[%index%]%%%
echo ff%%~1[%index%]%ff%%%~2[%index%]%ff
if not defined %%~1[%index%]% GoTo :EOF
if not defined %%~2[%index%]% GoTo :EOF
if not %%~1[%index%]% == %%~2[%index%]% echo array index %index% does no match, element 1 : %~1[%index%] element 2 : %~2[%index%]
set /a "index+=1" 
GoTo :ArrayComparator-internal-loop


:FillArrayWithDigits OutputArray limit
	set /a i=0
    for /l %%n in (0,1,%2) do (
		call :Get10DigitNumber %%~n %~1[%%i%%]
		set /a "i+=1" 
    )
exit /b
 
REM ========== FUNCTIONS ==========
:FolderToArray [sourceDir] [returnVar]
	set /a i=0
    for /f "tokens=*" %%f in ('dir /b /s /a:-d "%~1\*.*"') do (
        call set "%~2[%%i%%]=%%~f"
		set /a "i+=1"
    )
exit /b


:ProgressMeter
:: 2007_01_10 by rholt
:: core2quad@rogers.com
:: This subroutine displays a progress meter in the titlebar of
:: the current CMD shell window.
::
:: Input: %1 must contain the current progress (0-100)
:: Return: None
:: ******************************************************************
:: Calculate the number of vertical bars then spaces based on the percentage value passed
SETLOCAL ENABLEDELAYEDEXPANSION
SET ProgressPercent=%1
SET /A NumBars=%ProgressPercent%/2
SET /A NumSpaces=50-%NumBars%
:: Clear the progress meter image
SET Meter=
:: Build the meter image using vertical bars followed by trailing spaces
:: Note there is a trailing space at the end of the second line below
FOR /L %%A IN (%NumBars%,-1,1) DO SET Meter=!Meter!I
FOR /L %%A IN (%NumSpaces%,-1,1) DO SET Meter=!Meter! 
:: Display the progress meter in the title bar and return to the main program
TITLE Progress:  [%Meter%]  %ProgressPercent%%%
ENDLOCAL
GOTO :EOF

REM ::FolderToArray FolderName FolderArray
REM :FolderToArray
REM set /a index=0
REM set "inputFolder=%~1"
REM setlocal enabledelayedexpansion
REM for /r "%inputFolder%" %%f in (*.*) do (
	REM set "FolderToArrayInternal[!index!]=%%f"
	REM set /a index+=1
REM )

REM echo 00 !FolderToArrayInternal[0]!
REM echo 11 !FolderToArrayInternal[1]!
REM echo 22 !FolderToArrayInternal[2]!
REM echo 33 !FolderToArrayInternal[3]!


REM set /a index-=1
REM :: Copy the FolderToArrayInternal array elements to the output array in the main scope
REM for /l %%i in (0,1,!index!) do (
    REM call :SetOutputArrayElement %2[%%i] "!FolderToArrayInternal[%%i]!"
	REM call set %2[%%i]=!FolderToArrayInternal[%%i]!
REM )

REM for /l %%i in (0,1,!index!) do (
    REM for /f "delims=" %%t in ("!FolderToArrayInternal[%%i]!") do (
        REM endlocal
		REM echo loop %%i %%t
        REM set %2[%%i]=%%t
        REM setlocal enabledelayedexpansion
    REM )
REM )

REM set temp=
REM for /l %%i in (0,1,!index!) do (
	REM set "temp=%FolderToArrayInternal[%%i]%"
	REM echo contents of temp variable is : !temp! %temp%
    REM endlocal & set %2[%%i]=%temp% & setlocal enabledelayedexpansion
	REM endlocal & set %2[%%i]=!FolderToArrayInternal[%%i]!
	REM setlocal enabledelayedexpansion
REM )
REM endlocal
REM GoTo :EOF

REM :SetOutputArrayElement
REM set "%1=%2"

REM echo 1 %1  2 %~2

REM goto :eof
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %%%1[%index%]%%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop

:: EchoArray InputArray optional start optional end
:EchoArrayToFile
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
:EchoArrayToFile-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %%%1[%index%]%% >> %~2
set /a index+=1
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop



REM :: ::EchoArray InputArray, optional limit optional start :Echo entire array, requires Ubound
REM :: Usage Call EchoArray myArrayName 10 3 ' Will output elements 3 to 10
REM :EchoArrayWlimits
REM call :Ubound %~1 upperbound
REM set /a index=0
REM set /a limit=0
REM if not ["%~2"]==[""] set /a limit=%~2
REM if not ["%~3"]==[""] set /a index=%~3
REM if not ["%~2"]==[""] if %upperbound% GTR %limit% set /a upperbound=limit
REM echo limit %limit% index %index% upperbound %upperbound%
REM :EchoArrayWlimits-internal-loop
REM call echo %%%1[%index%]%%
REM set /a index+=1
REM IF %index% LEQ %upperbound% GoTo :EchoArray-internal-loop
REM GoTo :EOF

REM :: ::EchoToFile InputArray OutputFile optional limit optional start :Echo entire array, requires Ubound
REM :: Usage Call EchoToFile myArrayName 10 3 ' Will output elements 3 to 10
REM :EchoArrayToFile
REM call :Ubound Settings upperbound
REM set /a index=0
REM if not ["%~3"]==[""] set /a limit=%~3
REM if not ["%~4"]==[""] set /a index=%~4
REM if defined limit if %upperbound% GTR %limit% set /a upperbound=limit
REM :EchoArrayToFile-internal-loop
REM call echo %%%1[%index%]%% %~2
REM call echo %%%1[%index%]%% >> %~2
REM set /a index+=1
REM IF %index% LEQ %upperbound% GoTo :EchoToFile-internal-loop
REM GoTo :EOF

::Get10DigitNumber input output optional seed : return a 10 digit number based on input value plus optional seed
::call :Get10DigitNumber 123 myoutput 456481
:Get10DigitNumber 
set /a input=%~1
set /a seed=912756852
if not ["%~3"]==[""] set /a seed=%~3
set /a %2=%input% * %seed%
GoTo :EOF

:: Ubound arrayname uboundresult
:Ubound 
set array_name=%1
set last_index=0
:Ubound-internal-loop
if defined %1[%last_index%] ( 
set /a last_index+=1
GoTo :Ubound-internal-loop
)
set /a %2=%last_index% - 1
EXIT /b



REM Source http://www.trytoprogram.com
REM The precedence of arithmetic operators are in the following order:
REM /  *  %  +  -

REM + 	Addition operator 	Set /A 5+5 =10
REM – 	Subtraction operator 	Set /A 10-5 = 5
REM % 	Modulus operator 	Set /A 5%2 = 1
REM / 	Division operator 	Set /A 20/2 = 10
REM * 	Multiplication operator 	Set /A 2*2 = 4

REM Relational Operators
REM if %x% EQU %y% echo x is equal to y
REM if %x% NEQ %y% echo x is not equal to y
REM if %x% LSS %y% echo x is less than y
REM if %x% LEQ %y% echo x is less than or equal to y
REM if %x% GTR %y% echo x is greater than y
REM if %x% GEQ %y% echo x is greater than or equal to y

REM Logical shift and re directional Operators
REM >> 	Logical shift operator 	command > filename Append the output to a file
REM > 	Re directional operator 	command > filename Redirect the output to a file
REM < 	Re directional operator 	command < filename Redirect text to command

REM ~ 	Tilde operator
REM ! 	Boolean NOT operator (negation)
REM – 	unary minus operator
REM & 	Bitwise and operator
REM | 	Bitwise or operator
REM ^ 	Bitwise exclusive or operator
REM , 	Separator
REM && 	For using Multiple Commands
REM || 	For executing one from many commands

REM Bitwise operations example
REM p 	q 	p & q 	p | q 	p ^ q
REM 0 	0 	0 	0 	0
REM 0 	1 	0 	1 	1
REM 1 	1 	1 	1 	0
REM 1 	0 	0 	1 	1

REM += 	Set /A x = 4 & x += 2
REM Value of x: 6 	2 is added to the value of x and the result is assigned to x
REM -= 	Set /A x = 4 & x -= 2
REM Value of x: 2 	2 is subtracted from the value of x and the result is assigned to x
REM *= 	Set /A x = 4 & x *= 2
REM Value of x: 8 	2 is multiplied to the value of x and the result is assigned to x
REM /= 	Set /A x = 4 & x /= 2
REM Value of x: 2 	The value of x is divided by 2 and the result is assigned to x 
REM %= 	Set /A x = 4 & x %= 2 
REM Value of x: 2 	This will find the modulus and result is assigned to x

REM SET varibale_name=variable_value
:: for assigning numeric value
REM SET /A variable_name=nameric_value
:: To create local variable space, global values can be read in local, but not local in global
REM SETLOCAL
REM ENDLOCAL

REM ASSOC - Displays or modifies file extension associations.
REM Example: ASSOC .txt=txtfile
REM ATTRIB - Displays or modifies file attributes.
REM Example: ATTRIB +h example.txt
REM CD - Changes the current working directory.
REM Example: CD C:\Windows\System32
REM CHKDSK - Checks a disk and displays a status report.
REM Example: CHKDSK C: /F
REM CHOICE - Prompts the user to make a choice from a set of options.
REM Example: CHOICE /C YN /M "Do you want to continue?"
REM CLS - Clears the screen.
REM Example: CLS
REM CMD - Starts a new instance of the command prompt.
REM Example: CMD /K "echo Hello, World!"
REM COMP - Compares the contents of two files or sets of files.
REM Example: COMP file1.txt file2.txt
REM CONVERT - Converts a volume from FAT to NTFS.
REM Example: CONVERT C: /FS:NTFS
REM COPY - Copies one or more files from one location to another.
REM Example: COPY C:\Folder1\file1.txt D:\Folder2\file1.txt
REM DATE - Displays or sets the date.
REM Example: DATE /T
REM DEL - Deletes one or more files.
REM Example: DEL C:\Folder1\file1.txt
REM DIR - Displays a list of files and subdirectories in a directory.
REM Example: DIR /A /W C:\Windows
REM DISKPART - Manages disks, partitions, and volumes.
REM Example: DISKPART
REM DRIVERQUERY - Displays a list of installed device drivers.
REM Example: DRIVERQUERY
REM ECHO - Displays messages or turns command echoing on or off.
REM Example: ECHO Hello, World!
REM EXIT - Quits the command prompt.
REM Example: EXIT
REM EXPAND - Expands one or more compressed files.
REM Example: EXPAND file1.cab -F:* C:\Folder1
REM FC - Compares the contents of two files or sets of files.
REM Example: FC file1.txt file2.txt
REM FIND - Searches for a text string in one or more files.
REM Example: FIND "Hello" file1.txt
REM FORMAT - Formats a disk for use with Windows.
REM Example: FORMAT C: /FS:NTFS /V:Data
REM HELP - Provides Help information for Windows commands.
REM Example: HELP FORMAT
REM IPCONFIG - Displays network configuration information.
REM Example: IPCONFIG /all
REM LABEL - Creates, changes, or deletes the volume label of a disk.
REM Example: LABEL C: NewLabel
REM MD - Creates a new directory.
REM Example: MD C:\Folder1
REM MORE - Displays output one screen at a time.
REM Example: DIR /A /W C:\Windows | MORE
REM MOVE - Moves one or more files from one location to another.
REM Example: MOVE C:\Folder1\file1.txt D:\Folder2\file1.txt
REM NET - Manages network resources.
REM Example: NET USE
REM PAUSE - Pauses the command prompt.
REM Example: PAUSE
REM PING - Tests network connectivity.
REM Example: PING www.google.com
REM RD - Removes a directory.
REM Example: RD C:\Folder1
REM REM - Adds comments to a batch file.
REM Example: REM This is a comment.
REM REN - Renames a file or files.
REM Example: REN C:\Folder1\file1.txt file2.txt
REM SET - Sets environment variables.
REM Example: SET Path=%Path%;C:\MyFolder
REM SHUTDOWN - Shuts down or restarts the computer.
REM Example: SHUTDOWN /s /t 60
REM SORT - Sorts input.
REM Example: SORT file1.txt
REM START - Starts a new window to run a specified command or program.
REM Example: START notepad.exe
REM SYSTEMINFO - Displays system information.
REM Example: SYSTEMINFO
REM TASKKILL - Terminates a process or a set of processes.
REM Example: TASKKILL /IM notepad.exe
REM TASKLIST - Displays a list of currently running processes.
REM Example: TASKLIST
REM TIME - Displays or sets the system time.
REM Example: TIME /T
REM TITLE - Sets the window title for the command prompt.
REM Example: TITLE My Batch File
REM TREE - Displays the directory structure of a path or of the disk in a drive.
REM Example: TREE C:\Windows
REM TYPE - Displays the contents of a text file.
REM Example: TYPE C:\Folder1\file1.txt
REM VER - Displays the Windows version.
REM Example: VER
REM VOL - Displays the volume label and serial number of a disk.
REM Example: VOL C:
REM XCOPY - Copies directories, files, and subdirectories, including empty ones.
REM Example: XCOPY C:\Folder1 D:\Folder2 /E /H /C /I /K /Y

REM Redirection
REM command > file 	Write standard output of command to file
REM command 1> file 	Write standard output of command to file (same as previous)
REM command 2> file 	Write standard error of command to file (OS/2 and NT)
REM command > file 2>&1 	Write both standard output and standard error of command to file (OS/2 and NT)
REM command >> file 	Append standard output of command to file
REM command 1>> file 	Append standard output of command to file (same as previous)
REM command 2>> file 	Append standard error of command to file (OS/2 and NT)
REM command >> file 2>&1 	Append both standard output and standard error of command to file (OS/2 and NT)
REM commandA | commandB 	Redirect standard output of commandA to standard input of commandB
REM commandA 2>&1 | commandB 	Redirect standard output and standard error of commandA to standard input of commandB (OS/2 and NT)
REM command < file 	command gets standard input from file
REM command 2>&1 	command's standard error is redirected to standard output (OS/2 and NT)
REM command 1>&2 	command's standard output is redirected to standard error (OS/2 and NT)



REM :DemonstrateTestFunctionVariableExpansionTest
REM echo calling with no parameters
REM call :TestFunctionVariableExpansionTest 
REM echo calling with 1
REM call :TestFunctionVariableExpansionTest 1
REM echo calling with a
REM call :TestFunctionVariableExpansionTest a
REM echo calling with "1"
REM call :TestFunctionVariableExpansionTest "1"
REM echo calling with "a"
REM call :TestFunctionVariableExpansionTest "a"
REM echo calling with "1"
REM call :TestFunctionVariableExpansionTest "1"
REM echo calling with 1,a
REM call :TestFunctionVariableExpansionTest 1,a
REM echo calling with "1","a"
REM call :TestFunctionVariableExpansionTest "1","a"
REM echo calling with d:\powercfg\
REM call :TestFunctionVariableExpansionTest d:\powercfg\
REM echo calling with "d:\powercfg\"
REM call :TestFunctionVariableExpansionTest "d:\powercfg\"
REM echo calling with d:\Firefox Profile
REM call :TestFunctionVariableExpansionTest d:\Firefox Profile
REM echo calling with "d:\Firefox Profile" 
REM call :TestFunctionVariableExpansionTest "d:\Firefox Profile" 
REM GoTo :EOF

REM :TestFunctionVariableExpansionTest
REM REM %1: First argument AS IS 
REM REM %~1: First argument with quoting removed 
REM REM %~f1: Full path 
REM REM %~n1: Filename only
REM REM %~x1: File extension only
REM REM %~dp1: Drive letter and path
REM REM %~dpnx1: Drive letter path and file name
REM echo percent1 %1
REM echo percent~1 %~1
REM echo percent~f1 %~f1
REM echo percent~n1 %~n1
REM echo percent~x1 %~x1
REM echo percent~dp1 %~dp1
REM echo percent~dpnx1 %~dpnx1

rem WHAT IS %~s1\NUL \  it transforms
REM GoTo :EOF

:ArgumentsDetectorAndTypeIdentifier


GoTo :EOF

REM Notepad tips and tricks
REM CTRL+Q toggle batch file line as comment
REM CTRL+K line is a comment now
REM TAB / Shift-tab indent/deindent all lines

REM Structure of arrays
REM set obj[0].Name=Joe 
REM set obj[0].ID=1 
REM set obj[1].Name=Mark 
REM set obj[1].ID=2 
REM set obj[2].Name=Mohan 
REM set obj[2].ID=3 
REM FOR /L %%i IN (0 1 2) DO  (
   REM call echo Name = %%obj[%%i].Name%%
   REM call echo Value = %%obj[%%i].ID%%
REM )
