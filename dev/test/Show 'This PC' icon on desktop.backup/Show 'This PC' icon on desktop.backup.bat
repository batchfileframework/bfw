@echo off
:setup
call :ClearLocalVariables
Call :GetTime FileTime StartDate StartTime
Call :GetCodePage InitialCodepage
Call :SetTitle "Control 'This PC' icon on the desktop" 
set debug=false
set verbose=100
set silent=false
set logfile=%tmp%\%filetime%
if "[debug]"=="[true]" Call :PrintTime
:: Uncomment line below if this scripts needs to run with admin privileges
REM call :IsAdmin || set args=%* && (call :ElevateAndWait & exit /b)

:macro
call :SetMacroPrintTime

:main

cls

%PrintTime%
if "[%debug%]"=="[true]" echo Debug mode is enabled
if "[%silent%]"=="[true]" echo Silent mode is enabled
if not "[%verbose%]"=="[]" echo Verbose level : %verbose%
if not "[%verbose%]"=="[]" if %verbose% GTR 49 echo Verbose level 50 or more

Call :DereferenceArrayToArrayDEMO
REM GoTo :ShowAppxPackageInfoDEMOv3
REM GoTo :DeleteAppxPackagesDEMO
REM GoTo :ShowAppxPackageInfoDEMO
REM GoTo :GetNamedKeyDEMOv2
GoTo :END

:GetNamedKeyDEMO

REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][AllUser]
REM Call :ClearVariablesByPrefix ThisPCicon[ClassicStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]

set myval[0]=ThisPCicon[NewStart][CurrentUser]
set myval[1]=ThisPCicon[NewStart][AllUser]
set myval[2]=ThisPCicon[ClassicStart][CurrentUser]
set myval[3]=ThisPCicon[ClassicStart][AllUser]

Call :GetNamedKey ThisPCicon[NewStart][CurrentUser] OutputVar2
echo OutputVar2 %OutputVar2%

for /l %%a in (0,1,3) do Call :ClearVariablesByPrefix %%myval[%%a]%% 

REM for /l %%a in (0,1,3) do (
  REM Call :GetNamedKey %%myval[%%a]%% 
  REM call echo %%myval[%%a]%%'s Named Value is = %%%myval[%%a]%%.CurrentNamedValue%
REM )

set /a index=0
:GetNamedKeyDEMO-internal-loop
  REM call echo Call :GetNamedKey %%myval[%index%]%% OutputVar
  echo.
  Call :GetNamedKey %%myval[%index%]%% OutputVar
  call echo %%myval[%index%]%%'s Named Value is = %OutputVar% 
  call call echo %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%

  set /a index+=1
if %index% LEQ 3 GoTo :GetNamedKeyDEMO-internal-loop

REM echo ThisPCicon[NewStart][CurrentUser] %ThisPCicon[NewStart][CurrentUser].CurrentNamedValue%
REM echo ThisPCicon[NewStart][AllUser] %ThisPCicon[NewStart][AllUser].CurrentNamedValue%
REM echo ThisPCicon[ClassicStart][CurrentUser] %ThisPCicon[ClassicStart][CurrentUser].CurrentNamedValue%
REM echo ThisPCicon[ClassicStart][AllUser] %ThisPCicon[ClassicStart][AllUser].CurrentNamedValue%

REM Call :GetNamedKey ThisPCicon[NewStart][CurrentUser] OutputVar
REM echo ThisPCicon[NewStart][CurrentUser] Named Value %OutputVar%
REM Call :GetNamedKey ThisPCicon[NewStart][AllUser]
REM Call :GetNamedKey ThisPCicon[ClassicStart][CurrentUser]
REM Call :GetNamedKey ThisPCicon[ClassicStart][AllUser]

GoTo :END

:DereferenceArrayToArrayDEMO

Call :ClearVariablesByPrefix _DerefArray
Call :ClearVariablesByPrefix TestElementArray
Call :ClearVariablesByPrefix TestReferenceArray
Call :ClearVariablesByPrefix TestOutputArray

set /a TestElementArray[0]=4
set /a TestElementArray[1]=2
set /a TestElementArray[2]=1
set /a TestElementArray[3]=7
set /a TestElementArray[4]=8

set "TestReferenceArray[0]=testvar0"
set "TestReferenceArray[1]=testvar1"
set "TestReferenceArray[2]=testvar2"
set "TestReferenceArray[3]=testvar3"
set "TestReferenceArray[4]=testvar4"
set "TestReferenceArray[5]=testvar5"
set "TestReferenceArray[6]=testvar6"
set "TestReferenceArray[7]=testvar7"
set "TestReferenceArray[8]=testvar8"
set "TestReferenceArray[9]=testvar9"
set "TestReferenceArray[10]=testvar10"


Call :DereferenceArrayToArray TestElementArray TestReferenceArray TestOutputArray
Call EchoArray TestOutputArray
GoTo :EOF

:ShowAppxPackageInfoDEMOv3

Call :ClearVariablesByPrefix MatchingPackages
REM Call :ClearVariablesByPrefix AppxPackages
Call :ClearVariablesByPrefix _EchoArrayElementFromList


goto :skiphere
::Usage Call :FindAppxPackages MatchingPackages optional SearchTerms optional only|except optional SearchProperties
REM echo.
REM Call :SetTitle Find full package name for map application
REM Call :FindAppxPackages MatchingPackages map
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM echo. 
REM Call :SetTitle Find full package name for map,zune and xbox related applications
REM set "SearchTerms[0]=map"
REM set "SearchTerms[1]=zune"
REM set "SearchTerms[2]=box"
REM set /a "SearchTerms.ubound=2"
REM Call :FindAppxPackages MatchingPackages SearchTerms
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
REM Call :ClearVariablesByPrefix MatchingPackages
REM Call :ClearVariablesByPrefix SearchTerms
REM pause

REM echo.
REM Call :SetTitle Find full package name for all installed applications
REM Call :FindAppxPackages MatchingPackages Installed only .PackageUserInformation
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM echo. 
REM Call :SetTitle Find Name and userinfo for all not installed applications
REM Call :FindAppxPackages MatchingPackages Installed except .PackageUserInformation
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PackageUserInformation
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

echo. BROKEN
Call :SetTitle Find Name and userinfo for all not staged applications
Call :FindAppxPackages MatchingPackages Staged except .PackageUserInformation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PackageUserInformation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo. BROKEN
Call :SetTitle Find full package name for all applications that are not installed
Call :FindAppxPackages MatchingPackages Installed except .PackageUserInformation
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
Call :ClearVariablesByPrefix MatchingPackages
pause

REM echo.
REM Call :SetTitle Find full package name for all applications located in C:\Windows\SystemApps\
REM Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" only .InstallLocation
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM function RemoveValuesFromArray not yet coded
REM echo.
REM Call :SetTitle Find full package name for all applications located  outside of C:\Windows\SystemApps\ or C:\Program Files\WindowsApps\
REM Call :FindAppxPackages AllPackages
REM Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" only .InstallLocation
REM Call :FindAppxPackages MatchingPackages2 "C:\Windows\SystemApps\" only .InstallLocation
REM Call :RemoveValuesFromArray AllPackages MatchingPackages MatchingPackages2
REM Call :EchoArrayElementFromList AllPackages AppxPackages .PackageFullName 
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM echo. 
REM Call :SetTitle Find FullPackName AND location for all applications located inside C:\Windows\SystemApps\
REM Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" only .InstallLocation
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .InstallLocation
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM echo. 
REM Call :SetTitle Find FullPackName AND location for all applications located outside C:\Windows\SystemApps\
REM Call :FindAppxPackages MatchingPackages "C:\Windows\SystemApps\" except .InstallLocation
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .InstallLocation
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

REM echo.
REM Call :SetTitle Find full package name for all non-removable applications
REM Call :FindAppxPackages MatchingPackages Installed True .NonRemovable
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName 
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause

echo.
Call :SetTitle Find Name,location,version,arch,hash for map,zune and xbox 
set "SearchTerms[0]=map"
set "SearchTerms[1]=zune"
set "SearchTerms[2]=xbox"
set /a "SearchTerms.ubound=2"
Call :FindAppxPackages MatchingPackages SearchTerms
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .InstallLocation .version .architecture .gethashcode
Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix SearchTerms
pause

echo.
Call :SetTitle Find Name,PackageUserInformation for map,zune and xbox 
set "SearchTerms[0]=map"
set "SearchTerms[1]=zune"
set "SearchTerms[2]=xbox"
set /a "SearchTerms.ubound=2"
Call :FindAppxPackages MatchingPackages SearchTerms
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PackageUserInformation 
Call :ClearVariablesByPrefix MatchingPackages
Call :ClearVariablesByPrefix SearchTerms
pause

echo.
Call :SetTitle Find Name and dependencies for all apps with dependencies
Call :FindAppxPackages MatchingPackages NoDependencies except .Dependencies
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Dependencies
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find name for all apps not by publisher 8wekyb3d8bbwe (microsoft)
Call :FindAppxPackages MatchingPackages 8wekyb3d8bbwe except .PublisherId
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .PublisherId .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause

REM echo. BROKEN PROBABLY BECAUSE 0 RESULTS = CRASH
REM Call :SetTitle Find name for all apps not by publisher microsoft
REM Call :FindAppxPackages MatchingPackages Microsoft except .Publisher
REM Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Publisher .InstallLocation
REM Call :ClearVariablesByPrefix MatchingPackages
REM pause
REM Missing operand.
REM Missing operand.
REM ECHO is off.
REM ECHO is off.
REM ECHO is off.
REM The syntax of the command is incorrect.

:skiphere
echo.
Call :SetTitle Find name for all partially staged applications
Call :FindAppxPackages MatchingPackages NoValue except .IsPartiallyStaged
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .InstallLocation
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find name and version for all apps not version 10.0.19041.1023
Call :FindAppxPackages MatchingPackages 10.0.19041.1023 except .Version
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Version
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle Find name and version for all apps part of a bundle
Call :FindAppxPackages MatchingPackages NoValue except .IsBundle
Call :EchoArrayElementFromList MatchingPackages AppxPackages .Name .Publisher .Version .IsBundle
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle List all packages by FullPackageName
Call :FindAppxPackages MatchingPackages 
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle List all packages without a store signature
Call :FindAppxPackages MatchingPackages Store except .SignatureKind
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .SignatureKind
Call :ClearVariablesByPrefix MatchingPackages
pause

echo.
Call :SetTitle List all packages in development mode
Call :FindAppxPackages MatchingPackages NoValue except .IsDevelopmentMode
Call :EchoArrayElementFromList MatchingPackages AppxPackages .PackageFullName .IsDevelopmentMode
Call :ClearVariablesByPrefix MatchingPackages
pause


GoTo :EOF

REM Superseeded by :ShowAppxPackageInfoDEMOv3
REM :ShowAppxPackageInfoDEMOv2

REM Call :ClearVariablesByPrefix myoutput
REM Call :ClearVariablesByPrefix _EchoArrayElementFromList

REM argument parser dev
REM echo.
REM Call :SetTitle "FindAppxPackages no arguments test # Call :FindAppxPackages myoutput"
REM Call :FindAppxPackages myoutput
REM echo.
REM set myoutput
REM echo.
REM set "_EchoArrayElementFromListPrefix=%%%%_EchoArrayElementFromList_SuffixList[%%_EchoArrayElementFromList_SuffixList.index%%]%%%%="
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName 
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle "FindAppxPackages one search term # Call :FindAppxPackages myoutput maps"
REM Call :FindAppxPackages myoutput maps
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle "FindAppxPackages one search term in array form # testsearch[0]=maps Call :FindAppxPackages myoutput testsearch"
REM set "testsearch[0]=maps"
REM set /a "testsearch.ubound=0"
REM Call :FindAppxPackages myoutput testsearch
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages three search term in array form # maps Zune box Photo
REM set "testsearch[0]=maps"
REM set "testsearch[1]=Zune"
REM set "testsearch[2]=box"
REM set "testsearch[3]=Photo"
REM set "testsearch.ubound=3"
REM Call :FindAppxPackages myoutput testsearch
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, onlymatch # Call :FindAppxPackages myoutput maps only
REM Call :FindAppxPackages myoutput maps only
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch # Call :FindAppxPackages myoutput maps except
REM Call :FindAppxPackages myoutput maps except
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch and one searchproperties defined # Call :FindAppxPackages myoutput maps except PackageFullName
REM Call :FindAppxPackages myoutput maps except PackageFullName
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch and two searchproperties defined # Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName
REM Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM echo.
REM Call :SetTitle FindAppxPackages one search term, exceptmatch and two searchproperties defined # Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName\IsFramework
REM Call :FindAppxPackages myoutput maps except InstallLocation\PackageFullName\IsFramework
REM echo.
REM set myoutput
REM echo.
REM Call :EchoArrayElementFromList myoutput AppxPackages .PackageFullName
REM echo.
REM pause
REM Call :ClearVariablesByPrefix myoutput

REM argument parser works


GoTo :EOF

:DeleteAppxPackagesDEMO

echo.
call :ShowAppxPackageInfoFull maps
goto :eof
Call :GetAppxPackageFullName maps MapsFullName
echo Maps app fullname is :%MapsFullName%
Call :GetAppxPackageInstallLocation %MapsFullName% MapsInstallLocation
echo Maps install location is :%MapsInstallLocation%
Call :InstallAppxPackages "%MapsInstallLocation%"
Call :ShowAppxForceUpdate
call :ShowAppxPackageInfoFull maps
REM Call :DeleteAppxPackages Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe
Call :ShowAppxForceUpdate
call :ShowAppxPackageInfoFull maps
GoTo :EOF

REM ShowAppxPackageInfo superseeded by ? FindAppxPackages plus EchoArrayElementFromList
REM :ShowAppxPackageInfoDEMO
REM Call :ClearVariablesByPrefix AppxPackages
REM call :ShowAppxPackageInfoFull 
REM call :ShowAppxPackageInfoTerse 
REM call :ShowAppxPackageInfoFull une
REM call :ShowAppxPackageInfo Zune
REM call :ShowAppxPackageInfoFull Zune
REM call :ShowAppxPackageInfoFull installed PackageUserInformation exclude
REM call :ShowAppxPackageInfoFull staged PackageUserInformation exclude

REM GoTo :EOF

:GetAppxPackagesDEMO

call :GetAppxPackages

GoTo :EOF

:GetNamedKeyDEMOv2

REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][AllUser]
REM Call :ClearVariablesByPrefix ThisPCicon[ClassicStart][CurrentUser]
REM Call :ClearVariablesByPrefix ThisPCicon[NewStart][CurrentUser]

for /l %%a in (0,1,57) do Call :ClearVariablesByPrefix %%myval[%%a]%% 

set myval[0]=ThisPCicon[NewStart][CurrentUser]
set myval[1]=ThisPCicon[NewStart][AllUser]
set myval[2]=ThisPCicon[ClassicStart][CurrentUser]
set myval[3]=ThisPCicon[ClassicStart][AllUser]
set myval[4]=LockScreen
set myval[5]=NoLockScreenCamera
set myval[6]=BackgroundColor
set myval[7]=AccentColor
set myval[8]=LockScreenImage
set myval[9]=LockScreenOverlaysDisabled
set myval[10]=ForceStartBackground
set myval[11]=NoChangingLockScreen
set myval[12]=NoChangingStartMenuBackground
set myval[13]=NoLockScreenSlideshow
set myval[14]=TurnOffAutomaticTextLearning
set myval[15]=TurnOffAutomaticInkLearning
set myval[16]=AllowOnlineSpeechRecognition
set myval[17]=BlockCleanupOfUnusedLangPacks
set myval[18]=ForceSelectedUILanguage
set myval[19]=RestrictLanguagePackAndFeatureInstall
set myval[20]=RestrictUILanguageForAllUsers
set myval[21]=User'sFilesIcon[NewStart][CurrentUser]
set myval[22]=User'sFilesIcon[NewStart][AllUser]
set myval[23]=User'sFilesIcon[ClassicStart][CurrentUser]
set myval[24]=User'sFilesIcon[ClassicStart][AllUser]
set myval[25]=AllowInsecureGuestAuth
set myval[26]=HideFileExt
set myval[27]=AllowOnlineTips
set myval[28]=SettingsPageVisibility
set myval[29]=UserSettingsPageVisibility
set myval[30]=UseDefaultTile
set myval[31]=AllowPrelaunch
set myval[32]=IntelShowTrayIcon
set myval[33]=IntelHotKeysEnable
set myval[34]=DevicePasswordLessBuildVersion
set myval[35]=DefaultUserName
set myval[36]=DefaultPassword
set myval[37]=AutoAdminLogon
set myval[38]=AppsUseLightTheme
set myval[39]=SystemUsesLightTheme
set myval[40]=ShowCortanaButton
set myval[41]=SearchboxTaskbarMode
set myval[42]=ShowTaskViewButton
set myval[43]=WallPaper
set myval[44]=Background
set myval[45]=RealtekShowTrayIcon
set myval[46]=EnableAutoTray
set myval[47]=AllowTelemetry
set myval[48]=NoAutoUpdate
set myval[49]=HideSCAMeetNow[CurrentUser]
set myval[50]=HideSCAMeetNow[AllUser]
set /a myval.lbound=50
set /a myval.ubound=50
set /a myval.count=51


Call :EchoArray myval

Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval

echo. 
Call :EchoArray myval

set /a myval.ubound=50
set _AddArrayElementSuffix=.subvalue
Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval

GoTo :EOF

for /l %%a in (0,1,50) do Call :ClearVariablesByPrefix %%myval[%%a]%% 

set /a index=0
:GetNamedKeyDEMOv2-internal-loop
  
  echo.
  REM Call :DisplayNamedKey %%myval[%index%]%%
  
  Call :GetNamedKey %%myval[%index%]%% OutputVar
  call echo %%myval[%index%]%%'s Named Value is = %OutputVar% 
  call call echo %%myval[%index%]%%'s Named Value is = %%%%%%myval[%index%]%%.CurrentNamedValue%%%%
  
  
  set /a index+=1
if %index% LEQ 50 GoTo :GetNamedKeyDEMOv2-internal-loop

REM echo ThisPCicon[NewStart][CurrentUser] %ThisPCicon[NewStart][CurrentUser].CurrentNamedValue%
REM echo ThisPCicon[NewStart][AllUser] %ThisPCicon[NewStart][AllUser].CurrentNamedValue%
REM echo ThisPCicon[ClassicStart][CurrentUser] %ThisPCicon[ClassicStart][CurrentUser].CurrentNamedValue%
REM echo ThisPCicon[ClassicStart][AllUser] %ThisPCicon[ClassicStart][AllUser].CurrentNamedValue%
  
GoTo :END




:end
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions 


REM This function takes elements numbers from ElementsArray
REM Then it retrieves those elements from the ReferenceArray (with suffix, if provided)
REM And outputs them to OutputArray
REM Elements are appended to OutputArray starting from OutputArray.ubound
REM You can define suffix with _DerefArrayReferenceSuffix, space separated for multiple elements
REM The suffixes will be used on the output array as well but you can define alternate suffixes
REM With _DerefArrayOutputSuffix, which must have the same number of suffixes
REM The suffix NOSUFFIX has the special meaning of an empty suffix
REM Suffixes are defined with _DerefArrayReferenceSuffix, space separated for multiple elements
REM You can specify new output suffixes
::Usage Call :DereferenceArrayToArray ElementsArray ReferenceArray OutputArray
:DereferenceArrayToArray
REM for each element of element array
REM for each suffix, if any
REM if there are no suffix, or suffix is  NOSUFFIX
REM copy ReferenceArray[ElementsArray[X]] to OutputArray[NextValue]
REM copy ReferenceArray[ElementsArray[X]].refsuffix to OutputArray[NextValue].outsuffix

if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
if "[%~3]"=="[]" GoTo :EOF

set "_DerefArrayElementsArray=%~1" & set "_DerefArrayReferenceArray=%~2" & set "_DerefArrayOutputArray=%~3"
call set _DerefArrayElementsArray.ubound=%%_DerefArrayElementsArray%.ubound%

if not "[%_DerefArrayReferenceSuffix%]"=="[]" ^
	Call :Deconcatenate \ %_DerefArrayReferenceSuffix% _DerefArrayReferenceSuffix
if not "[%_DerefArrayOutputSuffix%]"=="[]" ^
	Call :Deconcatenate \ %_DerefArrayOutputSuffix% _DerefArrayOutputSuffix
if "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" set /a _DerefArrayReferenceSuffix.ubound=0

REM Set _DerefArrayOutput's index to OutputArray's .ubound+1, if any, or else set to zero
set _DerefArrayOutput.index=%_DerefArrayOutputArray.ubound%
if not "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index+=1
if "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index=0
set /a _DerefArrayElements.index=0
:DereferenceArrayToArray-output-loop
set /a _DerefArraySuffix.index=0
:DereferenceArrayToArray-suffix-loop
call set "_DerefArrayReferenceSuffix=%%%_DerefArrayReferenceSuffix%[%_DerefArraySuffix.index%]%%"
call set "_DerefArrayOutputSuffix=%%%_DerefArrayOutputSuffix%[%_DerefArraySuffix.index%]%%"
if "[%_DerefArrayOutputSuffix=%]"=="[]" set "_DerefArrayOutputSuffix=%_DerefArrayReferenceSuffix=%"
echo before error 1
call call set %%%_DerefArrayOutputArray%[%_DerefArrayOutput.index%]%%=%%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%%%%%_DerefArrayReferenceSuffix%
echo after error 1
set %_DerefArrayOutputArray%.ubound=%_DerefArrayOutput.index%

set /a _DerefArraySuffix.index+=1
echo after error1.5 %_DerefArrayReferenceSuffix.ubound%
if not "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" echo it is not
if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% GoTo :DereferenceArrayToArray-suffix-loop
echo after error2
set /a _DerefArrayOutput.index+=1
set /a _DerefArrayElements.index+=1
echo if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
REM Call :ClearVariablesByPrefix _DerefArray
GoTo :EOF

::Usage Call :AddArrayElementFromArray InputArray OutputArray
:AddArrayElementFromArray
GoTo :EOF

:: Set _AddArrayElementSuffix to insert text after array name
:: Example Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval
:: Example set _AddArrayElementSuffix=.subvalue NOTE You need to roll back array ubound
:: Example set /a myval.ubound=50
:: Example Call :AddArrayElement mytestvalue1 mytestvalue2 mytestvalue3 mytestvalue4 mytestvalue5 myval
::Usage Call :AddArrayElement AddedValue1 AddedValue2 ... AddedValueN OutputArray
:AddArrayElement
if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
set /a _AddArrayElement.count=0
set /a _AddArrayElement.lbound=0
set /a _AddArrayElement.ubound=0
set /a _AddArrayElement.index=0
:AddArrayElement-internal-loop-collect
set "_AddArrayElement[%_AddArrayElement.index%]=%~1"
set /a _AddArrayElement.ubound=%_AddArrayElement.index%
set /a _AddArrayElement.count+=1
set /a _AddArrayElement.index+=1
shift
if not "[%~2]"=="[]" GoTo :AddArrayElement-internal-loop-collect
set /a _AddArrayElement.index=0
:AddArrayElement-internal-loop-store
set /a %~1.ubound+=1
call set "%~1[%%%~1.ubound%%]%_AddArrayElementSuffix%=%%_AddArrayElement[%_AddArrayElement.index%]%%"
set /a _AddArrayElement.index+=1
if %_AddArrayElement.index% LEQ %_AddArrayElement.ubound% GoTo :AddArrayElement-internal-loop-store
Call :ClearVariablesByPrefix _AddArrayElement
if not "[%_AddArrayElementSuffix%]"=="[]" set "_AddArrayElementSuffix="
GoTo :EOF

::Usage Call :GetAppxPackageFullName PackageName ReturnValue
:GetAppxPackageFullName
set "_PartialPackageName=%~1"
if not "[%~2]"=="[]" set "_SearchProperty=%~2"
set "_Invert=not"
if not "[%~3]"=="[]" set "_Invert="
if "[%_SearchProperty%]"=="[]" set "_SearchProperty=PackageFullName"
if "[%AppxPackages.ubound%]"=="[]" if "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackagesFull
if "[%AppxPackages.ubound%]"=="[]" if not "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackages
set /a _ShowAppxPackageInfo_index=0
:GetAppxPackageFullName-internal-loop
call set "_ShowAppxPackageInfo_FullName=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%%%"
if not "[%_PartialPackageName%]"=="[]" call set "_ShowAppxPackageInfo_FullNameCompare=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%:%_PartialPackageName%=%%"
REM echo compare "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]"
if %_Invert% "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]" (
	call set "%~2=%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFullName%%"
	REM call set %~2=%%AppxPackages[%_ShowAppxPackageInfo_index%].InstallLocation%%
	REM echo.
)
set /a _ShowAppxPackageInfo_index+=1
if %_ShowAppxPackageInfo_index% LEQ %AppxPackages.ubound% GoTo :GetAppxPackageFullName-internal-loop
set "_ShowAppxPackageInfoFull=" & set "_ShowAppxPackageInfo_index=" & set "_ShowAppxPackageInfo_FullName=" & set "_ShowAppxPackageInfo_FullNameCompare=" & set "_PartialPackageName=" & set set "_SearchProperty=" & set "_Invert="
GoTo :EOF


REM REM this should return the first result in ReturnValue and if there are more than one result, then also in ReturnValue[0],ReturnValue[1] and so on
REM ::Usage Call :GetAppxPackageInstallLocation PackageName ReturnValue
REM :GetAppxPackageInstallLocation
REM set "_PartialPackageName=%~1"
REM if not "[%~2]"=="[]" set "_SearchProperty=%~2"
REM set "_Invert=not"
REM if not "[%~3]"=="[]" set "_Invert="
REM if "[%_SearchProperty%]"=="[]" set "_SearchProperty=PackageFullName"
REM if "[%AppxPackages.ubound%]"=="[]" if "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackagesFull
REM if "[%AppxPackages.ubound%]"=="[]" if not "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackages
REM set /a _ShowAppxPackageInfo_index=0
REM :GetAppxPackageInstallLocation-internal-loop
REM call set "_ShowAppxPackageInfo_FullName=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%%%"
REM if not "[%_PartialPackageName%]"=="[]" call set "_ShowAppxPackageInfo_FullNameCompare=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%:%_PartialPackageName%=%%"
REM REM echo compare "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]"
REM if %_Invert% "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]" (
	REM REM call echo FullName:%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFullName%%
	REM call set "%~2=%%AppxPackages[%_ShowAppxPackageInfo_index%].InstallLocation%%"
	REM REM echo. oops
REM )
REM set /a _ShowAppxPackageInfo_index+=1
REM if %_ShowAppxPackageInfo_index% LEQ %AppxPackages.ubound% GoTo :GetAppxPackageInstallLocation-internal-loop
REM set "_ShowAppxPackageInfoFull=" & set "_ShowAppxPackageInfo_index=" & set "_ShowAppxPackageInfo_FullName=" & set "_ShowAppxPackageInfo_FullNameCompare=" & set "_PartialPackageName=" & set set "_SearchProperty=" & set "_Invert="
REM GoTo :EOF


::Usage Call :InstallAppxPackages PackageList
:InstallAppxPackages
REM if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -Package '%~1'"
echo powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
if not "[%~1]"=="[]" powershell -Command "Add-AppxPackage -DisableDevelopmentMode -Register '%~1\AppXManifest.xml'"
REM call echo %%%~1.ubound%% REM weird \Program Files\WindowsApps\Microsoft.Winget.Source_2023.515.1421.333_neutral__8wekyb3d8bbwe.ubound
call set "_InstallAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_InstallAppxPackages_PackageList_ubound=%]"=="[]" GoTo :EOF
set /a _InstallAppxPackages_index=0
:InstallAppxPackages-internal-loop
call echo call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
call powershell -Command "Add-AppxPackage -Package '%%%~1[%_InstallAppxPackages_index%]%%'"
set /a _InstallAppxPackages_index+=1
if %_InstallAppxPackages_index% LEQ %_InstallAppxPackages_PackageList_ubound% GoTo :InstallAppxPackages-internal-loop
GoTo :EOF

::Usage Call :DeleteAppxPackages PackageList
:DeleteAppxPackages
if not "[%~1]"=="[]" powershell -Command "Remove-AppxPackage -Package '%~1'"
call echo %%%~1.ubound%%
call set "_DeleteAppxPackages_PackageList_ubound=%%%~1.ubound%%"
if "[%_DeleteAppxPackages_PackageList_ubound=%]"="[]" GoTo :EOF
set /a _DeleteAppxPackages_index=0
:DeleteAppxPackages-internal-loop
call echo call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
call powershell -Command "Remove-AppxPackage -Package '%%%~1[%_DeleteAppxPackages_index%]%%'"
set /a _DeleteAppxPackages_index+=1
if %_DeleteAppxPackages_index% LEQ %_DeleteAppxPackages_PackageList_ubound% GoTo :DeleteAppxPackages-internal-loop
GoTo :EOF

::Usage Call :SearchAppxPackages OutputArray SearchTerm Optional SearchProperty Optional Exclude
REM GoTo :EOF

REM ::Usage Call :ShowAppxPackageInfoNamesOnly PartialPackageName Optional SearchProperty Optional Exclude
REM :ShowAppxPackageInfoNamesOnly
REM REM Call :ClearVariablesByPrefix  _ShowAppxPackage
REM set "_PartialPackageName=%~1"
REM if not "[%~2]"=="[]" set "_SearchProperty=%~2"
REM set "_Invert=not"
REM if not "[%~3]"=="[]" set "_Invert="
REM if "[%_SearchProperty%]"=="[]" set "_SearchProperty=PackageFullName"
REM if "[%AppxPackages.ubound%]"=="[]" if "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackagesFull
REM if "[%AppxPackages.ubound%]"=="[]" if not "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackages
REM set /a _ShowAppxPackageInfo_index=0
REM :ShowAppxPackageInfoNamesOnly-internal-loop
REM call set "_ShowAppxPackageInfo_FullName=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%%%"
REM if not "[%_PartialPackageName%]"=="[]" call set "_ShowAppxPackageInfo_FullNameCompare=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%:%_PartialPackageName%=%%"
REM REM echo compare "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]"
REM if %_Invert% "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]" (
	REM call echo FullName:%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFullName%%
	REM echo.
REM )
REM set /a _ShowAppxPackageInfo_index+=1
REM if %_ShowAppxPackageInfo_index% LEQ %AppxPackages.ubound% GoTo :ShowAppxPackageInfoNamesOnly-internal-loop
REM set "_ShowAppxPackageInfoFull=" & set "_ShowAppxPackageInfo_index=" & set "_ShowAppxPackageInfo_FullName=" & set "_ShowAppxPackageInfo_FullNameCompare=" & set "_PartialPackageName=" & set set "_SearchProperty=" & set "_Invert="
REM GoTo :EOF

REM ::Usage Call :ShowAppxPackageInfoTerse PartialPackageName Optional SearchProperty Optional Exclude
REM :ShowAppxPackageInfoTerse
REM Call :ClearVariablesByPrefix  _ShowAppxPackage
REM set _ShowAppxPackageInfoFull=true
REM set "_PartialPackageName=%~1"
REM if not "[%~2]"=="[]" set "_SearchProperty=%~2"
REM set "_Invert=not"
REM if not "[%~3]"=="[]" set "_Invert="
REM if "[%_SearchProperty%]"=="[]" set "_SearchProperty=PackageFullName"
REM if "[%AppxPackages.ubound%]"=="[]" if "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackagesFull
REM if "[%AppxPackages.ubound%]"=="[]" if not "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackages
REM set /a _ShowAppxPackageInfo_index=0
REM :ShowAppxPackageInfoTerse-internal-loop
REM call set "_ShowAppxPackageInfo_FullName=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%%%"
REM if not "[%_PartialPackageName%]"=="[]" call set "_ShowAppxPackageInfo_FullNameCompare=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%:%_PartialPackageName%=%%"
REM REM echo compare "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]"
REM if %_Invert% "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]" (
	REM call echo FullName:%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFullName%%
	REM call echo Location:%%AppxPackages[%_ShowAppxPackageInfo_index%].InstallLocation%%
	REM call echo PackageFamily"%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFamilyName%%
	REM call echo PackageUserInfo:%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageUserInform
	REM call echo IsResourcePack:%%AppxPackages[%_ShowAppxPackageInfo_index%].IsResourcePackage%%
	REM call echo IsNonRemovable:%%AppxPackages[%_ShowAppxPackageInfo_index%].NonRemovable%%
	REM echo.
REM )
REM set /a _ShowAppxPackageInfo_index+=1
REM if %_ShowAppxPackageInfo_index% LEQ %AppxPackages.ubound% GoTo :ShowAppxPackageInfoTerse-internal-loop
REM set "_ShowAppxPackageInfoFull=" & set "_ShowAppxPackageInfo_index=" & set "_ShowAppxPackageInfo_FullName=" & set "_ShowAppxPackageInfo_FullNameCompare=" & set "_PartialPackageName=" & set set "_SearchProperty=" & set "_Invert="
REM GoTo :EOF


:ShowAppxForceUpdate
set "AppxPackages.ubound="
GoTo :EOF

REM Example call :ShowAppxPackageInfo Zune
REM Example call :ShowAppxPackageInfoFull Zune
REM Example call :ShowAppxPackageInfoFull 
REM Example call :ShowAppxPackageInfoFull installed PackageUserInformation exclude
REM Example call :ShowAppxPackageInfoFull staged PackageUserInformation exclude
REM ::Usage Call :ShowAppxPackageInfoFull PartialPackageName Optional SearchProperty Optional Exclude
REM :ShowAppxPackageInfoFull
REM set _ShowAppxPackageInfoFull=true
REM ::Usage Call :ShowAppxPackageInfo PartialPackageName Optional SearchProperty Optional Exclude
REM :ShowAppxPackageInfo
REM REM Call :ClearVariablesByPrefix  _ShowAppxPackage
REM set "_PartialPackageName=%~1"
REM if not "[%~2]"=="[]" set "_SearchProperty=%~2"
REM if "[%~2]"=="[]" set "_SearchProperty=PackageFullName"
REM set "_Invert=not"
REM if not "[%~3]"=="[]" set "_Invert="
REM if "[%AppxPackages.ubound%]"=="[]" if "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackagesFull
REM if "[%AppxPackages.ubound%]"=="[]" if not "[%_ShowAppxPackageInfoFull%]"=="[true]" Call :GetAppxPackages
REM set /a _ShowAppxPackageInfo_index=0
REM :ShowAppxPackageInfo-internal-loop
REM call set "_ShowAppxPackageInfo_FullName=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%%%"
REM if not "[%_PartialPackageName%]"=="[]" call set "_ShowAppxPackageInfo_FullNameCompare=%%AppxPackages[%_ShowAppxPackageInfo_index%].%_SearchProperty%:%_PartialPackageName%=%%"
REM REM echo compare "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]"
REM if %_Invert% "[%_ShowAppxPackageInfo_FullName%]"=="[%_ShowAppxPackageInfo_FullNameCompare%]" (
	REM call echo FullName:%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFullName%%
	REM call echo Name:%%AppxPackages[%_ShowAppxPackageInfo_index%].Name%%
	REM call echo Location:%%AppxPackages[%_ShowAppxPackageInfo_index%].InstallLocation%%
	REM call echo arch:%%AppxPackages[%_ShowAppxPackageInfo_index%].Architecture%% hash:%%AppxPackages[%_ShowAppxPackageInfo_index%].GetHashCode%% signature:%%AppxPackages[%_ShowAppxPackageInfo_index%].SignatureKind%%
	REM call echo dependencies:%%AppxPackages[%_ShowAppxPackageInfo_index%].Dependencies%%
	REM call echo bundle:%%AppxPackages[%_ShowAppxPackageInfo_index%].IsBundle%% status:%%AppxPackages[%_ShowAppxPackageInfo_index%].Status%% version:%%AppxPackages[%_ShowAppxPackageInfo_index%].Version%%
	
	REM if "[%_ShowAppxPackageInfoFull%]"=="[true]" (
	REM call echo Type:%%AppxPackages[%_ShowAppxPackageInfo_index%].GetType%%
	REM call echo String:%%AppxPackages[%_ShowAppxPackageInfo_index%].ToString%%
	REM call echo DevMode:%%AppxPackages[%_ShowAppxPackageInfo_index%].IsDevelopmentMode%%
	REM call echo Framework:%%AppxPackages[%_ShowAppxPackageInfo_index%].IsFramework%%
	REM call echo PartialStage:%%AppxPackages[%_ShowAppxPackageInfo_index%].IsPartiallyStaged%%
	REM call echo IsResourcePack:%%AppxPackages[%_ShowAppxPackageInfo_index%].IsResourcePackage%%
	REM call echo IsNonRemovable:%%AppxPackages[%_ShowAppxPackageInfo_index%].NonRemovable%%
	REM call echo PackageFamily"%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageFamilyName%%
	REM call echo PackageUserInfo:%%AppxPackages[%_ShowAppxPackageInfo_index%].PackageUserInformation%%
	REM call echo Publisher:%%AppxPackages[%_ShowAppxPackageInfo_index%].Publisher%%
	REM call echo PublisherID:%%AppxPackages[%_ShowAppxPackageInfo_index%].PublisherId%%
	REM call echo ResourceID:%%AppxPackages[%_ShowAppxPackageInfo_index%].ResourceId%%
	REM )
	REM echo.
REM )
REM set /a _ShowAppxPackageInfo_index+=1
REM if %_ShowAppxPackageInfo_index% LEQ %AppxPackages.ubound% GoTo :ShowAppxPackageInfo-internal-loop
REM set "_ShowAppxPackageInfoFull=" & set "_ShowAppxPackageInfo_index=" & set "_ShowAppxPackageInfo_FullName=" & set "_ShowAppxPackageInfo_FullNameCompare=" & set "_PartialPackageName=" & set set "_SearchProperty=" & set "_Invert="
REM GoTo :EOF

::Usage Call :FindAppxPackages MatchingPackages optional SearchTerms optional only|except optional SearchProperties
:: SearchTerms contains the search terms, can be an array, if it is an array lbound must be 0 and ubound must be set
:: only|except : ("only" is default behaviour) whether to return only matching results or, all results except matching
:: SearchProperties : List of properties to search for SearchTerm, separated by backslash
:: SearchProperties : If not specified, will use FullName property only
:FindAppxPackages
Call :ClearVariablesByPrefix _FindAppxPackages
REM Obtain ubound from output array, if there's one, so we can just append to it
call set "_FindAppxPackages_MatchingPackages.ubound=%%%~1.ubound%%"
REM Obtain individual search term
set "_FindAppxPackages_SearchTerms[0]=%~2"
REM Obtain ubound, if there's a search terms array
REM call echo call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
REM echo _FindAppxPackages_SearchTerms %_FindAppxPackages_SearchTerms%
REM In case there's a path in %~2, we check IsNumeric and wipe the value if not
Call :IsNumeric %_FindAppxPackages_SearchTerms.ubound% && set "_FindAppxPackages_SearchTerms.ubound="
REM If there is no search terms array provided, we skip filling local search terms array
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" echo Case where there is no SearchTerms array
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" GoTo :FindAppxPackages-fill-in-SearchTerms-skip
REM We are filling local search terms array, starting at 0
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-fill-in-SearchTerms-loop
REM We have a search terms array provided, copying to local variable and updating local ubound on each loop
REM call echo Case where SearchTerms array exists, running call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
REM echo _FindAppxPackages_SearchTerms[0] %_FindAppxPackages_SearchTerms[0]%
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-fill-in-SearchTerms-loop
:FindAppxPackages-fill-in-SearchTerms-skip
REM If there's a search terms array, it has overwritten the erroneous "individual search term" 
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" echo Case where no SearchTerms array, but one SearchTerms exists
REM If no search terms array was provided but there is a search term, then set local search terms array ubound to zero
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" set /a "_FindAppxPackages_SearchTerms.ubound=0"
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if "[%~2]"=="[]" echo No search terms, no array, no action needed
REM We are setting the matching behaviour from the third argument, only returning matching result is the default
set "_FindAppxPackages_MatchingBehaviour=only"
if not "[%~3]"=="[]" set "_FindAppxPackages_MatchingBehaviour=%~3"
REM The way this works, there is on main IF for the comparator, and we use MatchingBehaviour as a macro to boolean flip by writing "not" in it
if "[%_FindAppxPackages_MatchingBehaviour%]"=="[only]" ( set "_FindAppxPackages_MatchingBehaviour=not" ) else ( set "_FindAppxPackages_MatchingBehaviour=" )
REM This is a splitting function, it splits the fourth parameter, delimited with backslash into an array
if not "[%~4]"=="[]" ( Call :Deconcatenate \ %~4 _FindAppxPackages_SearchProperties ) else ( set "_FindAppxPackages_SearchProperties[0]=.PackageFullName" & set /a "_FindAppxPackages_SearchProperties.ubound=0")
REM Time to fill the main database of all AppxPackages
REM Fill array AppxPackages if ubound is not set, clearing the ubound is how to for a refresh
if "[%AppxPackages.ubound%]"=="[]" Call :GetAppxPackages
REM We will now loop through each AppxPackage, we will look for all provided Search terms in each of the specified Properties
set /a "_FindAppxPackages.index=0"
:FindAppxPackages-loop-through-AppxPackages
set /a "_FindAppxPackages_SearchProperties.index=0"
:FindAppxPackages-loop-through-SearchProperties
REM echo _FindAppxPackages.index %_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index %_FindAppxPackages_SearchProperties.index%
REM echo AppxPackages[%_FindAppxPackages.index%] _FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]
REM call echo AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%
REM call call echo call echo %%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%
REM call call echo call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
REM echo CURRENT PROPERTY:%_FindAppxPackages_CurrentSearchProperty%
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-loop-through-SearchTerms
REM call echo call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
if "[%_FindAppxPackages_CurrentSearchTerm%]"=="[]" GoTo :FindAppxPackages-match-found
REM echo looping through _FindAppxPackages.index=%_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index=%_FindAppxPackages_SearchProperties.index% _FindAppxPackages_SearchTerms.index=%_FindAppxPackages_SearchTerms.index%
REM call echo call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
REM call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
call set "_FindAppxPackages_CurrentSearchPropertyCompare=%%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%%"
REM echo _FindAppxPackages_CurrentSearchProperty=%_FindAppxPackages_CurrentSearchProperty% 
REM echo _FindAppxPackages_CurrentSearchTerm=%_FindAppxPackages_CurrentSearchTerm% 
REM echo _FindAppxPackages_CurrentSearchPropertyCompare %_FindAppxPackages_CurrentSearchPropertyCompare%
REM echo MAIN COMPARATOR if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]"
REM if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( echo comparator says yes ) else ( echo comparator says no)
if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( GoTo :FindAppxPackages-match-found ) else ( GoTo :FindAppxPackages-no-match-found )
:FindAppxPackages-match-found
if not "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound+=1
if "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound=0
REM echo MATCH FOUND ADDING %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
set /a %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
REM echo we made it here ? 5
GoTo :FindAppxPackages-go-to-next-AppxPackages-index
:FindAppxPackages-no-match-found
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-loop-through-SearchTerms
set /a "_FindAppxPackages_SearchProperties.index+=1"
if %_FindAppxPackages_SearchProperties.index% LEQ %_FindAppxPackages_SearchProperties.ubound% GoTo :FindAppxPackages-loop-through-SearchProperties
:FindAppxPackages-go-to-next-AppxPackages-index
REM echo we made it here ? 6
set /a "_FindAppxPackages.index+=1"
REM echo if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
call set /a %%%~1.ubound=%_FindAppxPackages_MatchingPackages.ubound%
set /a _FindAppxPackages_MatchingPackages.ubound+=1
call set /a %%%~1.count=%_FindAppxPackages_MatchingPackages.ubound%
Call :ClearVariablesByPrefix _FindAppxPackages
GoTo :EOF
REM https://stackoverflow.com/questions/8481558/windows-batch-goto-within-if-block-behaves-very-strangely
REM https://stackoverflow.com/users/1012053/dbenham
REM https://stackoverflow.com/questions/47280217/was-unexpected-at-this-time-generated-from-batch-script-line-if-exist-file/47280406#47280406


::Usage Call :GetAppxPackages
:GetAppxPackages
Call :ClearVariablesByPrefix AppxPackages
set /a "AppxPackages.lbound=0"
set /a "AppxPackages.ubound=0"
set /a "AppxPackages.count=0"
for /f "tokens=1-24 delims=|" %%a in ('powershell -Command "$i = 0; Get-AppxPackage -AllUsers | ForEach-Object { (&{ if ($_.GetHashCode().ToString()) { $_.GetHashCode().ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.GetType()) { $_.GetType() } else { 'NoValue' } }) + '|' + (&{ if ($_.ToString()) { $_.ToString() } else { 'NoValue' } }) + '|' + (&{ if ($_.Architecture) { $_.Architecture } else { 'NoValue' } }) + '|' + (&{ if ($_.Dependencies) { $_.Dependencies } else { 'NoDependencies' } }) + '|' + (&{ if ($_.InstallLocation) { $_.InstallLocation } else { 'NoValue' } }) + '|' + (&{ if ($_.IsBundle) { $_.IsBundle } else { 'NoValue' } }) + '|' + (&{ if ($_.IsDevelopmentMode) { $_.IsDevelopmentMode } else { 'NoValue' } }) + '|' + (&{ if ($_.IsFramework) { $_.IsFramework } else { 'NoValue' } }) + '|' + (&{ if ($_.IsPartiallyStaged) { $_.IsPartiallyStaged } else { 'NoValue' } }) + '|' + (&{ if ($_.IsResourcePackage) { $_.IsResourcePackage } else { 'NoValue' } }) + '|' + (&{ if ($_.Name) { $_.Name } else { 'NoValue' } }) + '|' + (&{ if ($_.NonRemovable) { $_.NonRemovable } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFamilyName) { $_.PackageFamilyName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageFullName) { $_.PackageFullName } else { 'NoValue' } }) + '|' + (&{ if ($_.PackageUserInformation) { $_.PackageUserInformation } else { 'NoValue' } }) + '|' + (&{ if ($_.Publisher) { $_.Publisher } else { 'NoValue' } }) + '|' + (&{ if ($_.PublisherId) { $_.PublisherId } else { 'NoValue' } }) + '|' + (&{ if ($_.ResourceId) { $_.ResourceId } else { 'NoValue' } }) + '|' + (&{ if ($_.SignatureKind) { $_.SignatureKind } else { 'NoValue' } }) + '|' + (&{ if ($_.Status) { $_.Status } else { 'NoValue' } }) + '|' + (&{ if ($_.Version) { $_.Version } else { 'NoValue' } }) + '|' + $i++ }"') do (
set "AppxPackages[%%w].GetHashCode=%%a"
set "AppxPackages[%%w].GetType=%%b"
set "AppxPackages[%%w].ToString=%%c"
set "AppxPackages[%%w].Architecture=%%d"
set "AppxPackages[%%w].Dependencies=%%e"
set "AppxPackages[%%w].InstallLocation=%%f"
set "AppxPackages[%%w].IsBundle=%%g"
set "AppxPackages[%%w].IsDevelopmentMode=%%h"
set "AppxPackages[%%w].IsFramework=%%i"
set "AppxPackages[%%w].IsPartiallyStaged=%%j"
set "AppxPackages[%%w].IsResourcePackage=%%k"
set "AppxPackages[%%w].Name=%%l"
set "AppxPackages[%%w].NonRemovable=%%m"
set "AppxPackages[%%w].PackageFamilyName=%%n"
set "AppxPackages[%%w].PackageFullName=%%o"
set "AppxPackages[%%w].PackageUserInformation=%%p"
set "AppxPackages[%%w].Publisher=%%q"
set "AppxPackages[%%w].PublisherId=%%r"
set "AppxPackages[%%w].ResourceId=%%s"
set "AppxPackages[%%w].SignatureKind=%%t"
set "AppxPackages[%%w].Status=%%u"
set "AppxPackages[%%w].Version=%%v"
set "AppxPackages.ubound=%%w"
)
set /a "AppxPackages.count=%AppxPackages.ubound%+1"
GoTo :EOF

::Usage Call :DisplayNameKey NamedKey
:DisplayNamedKey
echo.
Call :GetNamedKey %~1 _DisplayNameKeyOutput
echo Named key : %~1
call echo Current value : %%%~1.Value%% Current named value : %_DisplayNameKeyOutput%
for /f "tokens=1-26 delims=[]=" %%a in ('set %~1.NamedValues[ 2^>nul') do (
REM in other words, find the last two defined token variables
if "[%%z]"=="[]" if not "[%%y]"=="[]" if not "[%%x]"=="[]" echo Named value %%x means %%y 
if "[%%y]"=="[]" if not "[%%x]"=="[]" if not "[%%w]"=="[]" echo Named value %%w means %%x
if "[%%x]"=="[]" if not "[%%w]"=="[]" if not "[%%v]"=="[]" echo Named value %%v means %%w
if "[%%w]"=="[]" if not "[%%v]"=="[]" if not "[%%u]"=="[]" echo Named value %%u means %%v
if "[%%v]"=="[]" if not "[%%u]"=="[]" if not "[%%t]"=="[]" echo Named value %%t means %%u
if "[%%u]"=="[]" if not "[%%t]"=="[]" if not "[%%s]"=="[]" echo Named value %%s means %%t
if "[%%t]"=="[]" if not "[%%s]"=="[]" if not "[%%r]"=="[]" echo Named value %%r means %%s
if "[%%s]"=="[]" if not "[%%r]"=="[]" if not "[%%q]"=="[]" echo Named value %%q means %%r
if "[%%r]"=="[]" if not "[%%q]"=="[]" if not "[%%p]"=="[]" echo Named value %%p means %%q
if "[%%q]"=="[]" if not "[%%p]"=="[]" if not "[%%o]"=="[]" echo Named value %%o means %%p
if "[%%p]"=="[]" if not "[%%o]"=="[]" if not "[%%n]"=="[]" echo Named value %%n means %%o
if "[%%o]"=="[]" if not "[%%n]"=="[]" if not "[%%m]"=="[]" echo Named value %%m means %%n
if "[%%n]"=="[]" if not "[%%m]"=="[]" if not "[%%l]"=="[]" echo Named value %%l means %%m
if "[%%m]"=="[]" if not "[%%l]"=="[]" if not "[%%k]"=="[]" echo Named value %%k means %%l
if "[%%l]"=="[]" if not "[%%k]"=="[]" if not "[%%j]"=="[]" echo Named value %%j means %%k
if "[%%k]"=="[]" if not "[%%j]"=="[]" if not "[%%i]"=="[]" echo Named value %%i means %%j
if "[%%j]"=="[]" if not "[%%i]"=="[]" if not "[%%h]"=="[]" echo Named value %%h means %%i
if "[%%i]"=="[]" if not "[%%h]"=="[]" if not "[%%g]"=="[]" echo Named value %%g means %%h
if "[%%h]"=="[]" if not "[%%g]"=="[]" if not "[%%f]"=="[]" echo Named value %%f means %%g
if "[%%g]"=="[]" if not "[%%f]"=="[]" if not "[%%e]"=="[]" echo Named value %%e means %%f
if "[%%f]"=="[]" if not "[%%e]"=="[]" if not "[%%d]"=="[]" echo Named value %%d means %%e
if "[%%e]"=="[]" if not "[%%d]"=="[]" if not "[%%c]"=="[]" echo Named value %%c means %%d
if "[%%d]"=="[]" if not "[%%c]"=="[]" if not "[%%b]"=="[]" echo Named value %%b means %%c
if "[%%c]"=="[]" if not "[%%b]"=="[]" if not "[%%a]"=="[]" echo Named value %%a means %%b
REM :DisplayNamedKey-for-next-iteration
)
call echo Registery path : %%%~1.key%%
set "_DisplayNameKeyOutput="
GoTo :EOF

::Usage Call :GetNamedKey NamedKey optional NamedValue
:GetNamedKey
call set "_bufferKey=%%%~1.Key%%"
if "[%_bufferKey%]"=="[]" call :GetNamedKeyLookup %~1 
call set "_bufferKeyType=%%%~1.Type%%"
REM Obtain registry value with GetRegistryValue
REM call echo Call :GetRegistryValue "%%%~1.Key%%" %~1.Value
Call :GetRegistryValue "%%%~1.Key%%" %~1.Value
if "[%_bufferKeyType%]"=="[DWORD]" Call :HexPrefixStripper "%%%~1.Value%%" "%~1.Value"
REM Put all values and named values in array _bufferNamedValues[x]
Call set "_bufferCurrentValue=%%%~1.Value%%"
Call set "_bufferNamedValues=%%%~1.NamedValues%%"
if "[%_bufferNamedValues%]"=="[]" GoTo :GetNamedKey-internal-loop-skip
REM call echo Call :Deconcatenate \ "%%%~1.NamedValues%%" _bufferNamedValues
Call :Deconcatenate \ "%%%~1.NamedValues%%" _bufferNamedValues
REM Loop through array _bufferNamedValues[x], save lookup in %~1.NamedValues[x]
set /a _index=0 & set _bufferline=
:GetNamedKey-internal-loop
call set _bufferline=%%_bufferNamedValues[%_index%]%%
for /f "tokens=1,2 delims==" %%a in ("%_bufferline%") do ( 
  set "%~1.NamedValues[%%a]=%%b"
  if "[%_bufferCurrentValue%]"=="[%%a]" set "%~1.CurrentNamedValue=%%b"
)
set /a _index+=1
if %_index% LEQ %_bufferNamedValues.ubound% GoTo :GetNamedKey-internal-loop
:GetNamedKey-internal-loop-skip
REM return optional value and cleanup temporary variables
if not "[%~2]"=="[]" call set "%~2=%%%~1.CurrentNamedValue%%"
set "_bufferCurrentValue=" & set "_bufferKeyType=" & set "_bufferline=" & set "_bufferNamedValues="
Call :ClearVariablesByPrefix _bufferNamedValues
GoTo :EOF




HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden
HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds\ShellFeedsTaskbarViewMode 2





::Usage Call :GetNamedKeyLookup NamedKey
:GetNamedKeyLookup
if "[%~1]"=="[User'sFilesIcon[NewStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'New Start Menu' for current user only" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[User'sFilesIcon[NewStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'New Start Menu' for all users" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[User'sFilesIcon[ClassicStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'Classic Start Menu' for current user only" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[User'sFilesIcon[ClassicStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display User's files icon only, if using 'Classic Start Menu' for all users" & set "%1.NamedValues=0=Show User's files icon\1=Hide User's files icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
if "[%~1]"=="[ThisPCicon[NewStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'New Start Menu' for current user only" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[ThisPCicon[NewStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'New Start Menu' for all users" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[ThisPCicon[ClassicStart][CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'Classic Start Menu' for current user only" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[ThisPCicon[ClassicStart][AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Display 'This PC' icon only, if using 'Classic Start Menu' for all users" & set "%1.NamedValues=0=Show 'This PC' icon\1=Hide 'This PC' icon" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
if "[%~1]"=="[LockScreen]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or Disable the Lock Screen for all users" & set "%~1.NamedValues=0=Enable Lock Screen\1=Disable Lock Screen" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen"
if "[%~1]"=="[NoLockScreenCamera]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or Disable the Lock Screen Camera" & set "%~1.NamedValues=0=Disable Lock Screen Camera\1=Enable Lock Screen Camera" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoLockScreenCamera"
if "[%~1]"=="[BackgroundColor]" set "%~1.Type=STRING" & set "%~1.Description=Set Start Background Color for all users" & set "%~1.NamedValues=Black=000000\White=FFFFFF\Red=FF0000\Green=00FF00\Blue=0000FF" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\PersonalColors_Background"
if "[%~1]"=="[AccentColor]" set "%~1.Type=STRING" & set "%~1.Description=Set Accent Color for all users" & set "%~1.NamedValues=Black=000000\White=FFFFFF\Red=FF0000\Green=00FF00\Blue=0000FF" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\PersonalColors_Accent"
if "[%~1]"=="[LockScreenImage]" set "%~1.Type=STRING" & set "%~1.Description=Set Lock Screen Image for all users" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\LockScreenImage"
if "[%~1]"=="[LockScreenOverlaysDisabled]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or Disable Fun Facts, Tips, Tricks, and More on Lock Screen for all users" & set "%~1.NamedValues=0=Enable Overlays\1=Disable Overlays" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\LockScreenOverlaysDisabled"
if "[%~1]"=="[ForceStartBackground]" set "%~1.Type=DWORD" & set "%~1.Description=Force a specific Start Background (1-20) for all users, users cannot change it" & set "%~1.NamedValues=0=Default Background\1=Background 1\2=Background 2\3=Background 3\4=Background 4\5=Background 5\6=Background 6\7=Background 7\8=Background 8\9=Background 9\10=Background 10\11=Background 11\12=Background 12\13=Background 13\14=Background 14\15=Background 15\16=Background 16\17=Background 17\18=Background 18\19=Background 19\20=Background 20" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\ForceStartBackground"
if "[%~1]"=="[NoChangingLockScreen]" set "%~1.Type=DWORD" & set "%~1.Description=Prevent changing lock screen and logon image for all users" & set "%~1.NamedValues=0=Allow Change\1=Prevent Change" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoChangingLockScreen"
if "[%~1]"=="[NoChangingStartMenuBackground]" set "%~1.Type=DWORD" & set "%~1.Description=Prevent changing start menu background for all users" & set "%~1.NamedValues=0=Allow Change\1=Prevent Change" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoChangingStartMenuBackground"
if "[%~1]"=="[NoLockScreenSlideshow]" set "%~1.Type=DWORD" & set "%~1.Description=Prevent enabling lock screen slide show for all users" & set "%~1.NamedValues=0=Allow Slide Show\1=Prevent Slide Show" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization\NoLockScreenSlideshow"
if "[%~1]"=="[TurnOffAutomaticTextLearning]" set "%~1.Type=DWORD" & set "%~1.Description=Turn off automatic learning for handwriting recognition personalization" &  set "%~1.NamedValues=0=Allow Automatic Learning\1=Prevent Automatic Learning" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization\RestrictImplicitTextCollection" 
if "[%~1]"=="[TurnOffAutomaticInkLearning]" set "%~1.Type=DWORD" & set "%~1.Description=Turn off automatic learning for handwriting recognition personalization" &  set "%~1.NamedValues=0=Allow Automatic Learning\1=Prevent Automatic Learning" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization\RestrictImplicitInkCollection"
if "[%~1]"=="[AllowOnlineSpeechRecognition]" set "%~1.Type=DWORD" &  set "%~1.Description=Allow users to enable online speech recognition services" &  set "%~1.NamedValues=0=Disable Speech Services\1=Enable Speech Services" &  set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\InputPersonalization\AllowInputPersonalization"
if "[%~1]"=="[BlockCleanupOfUnusedLangPacks]" set "%~1.Type=DWORD" &  set "%~1.Description=Block clean-up of unused language packs" &  set "%~1.NamedValues=0=Allow Cleanup\1=Block Cleanup" &  set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Control Panel\International\BlockCleanupOfUnusedPreinstalledLangPacks"
if "[%~1]"=="[ForceSelectedUILanguage]" set "%~1.Type=DWORD" & set "%~1.Description=Force selected system UI language to overwrite the user UI language" & set "%~1.NamedValues=0=No Restriction\1=Force Selected Language" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MUI\Settings\MachineUILock"
if "[%~1]"=="[RestrictLanguagePackAndFeatureInstall]" set "%~1.Type=DWORD" & set "%~1.Description=Restrict Language Pack and Language Feature Installation" & set "%~1.NamedValues=0=No Restriction\1=Restrict Installation" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Control Panel\International\RestrictLanguagePacksAndFeaturesInstall"
if "[%~1]"=="[RestrictUILanguageForAllUsers]" set "%~1.Type=STRING" &  set "%~1.Description=Restricts the Windows UI language for all users." &  set "%~1.NamedValues=en-US=English\ja-JP=Japanese\ko-KR=Korean\de-DE=German\zh-CN=Simplified Chinese\zh-TW=Traditional Chinese (Taiwan)\fr-FR=French\es-ES=Spanish\it-IT=Italian\sv-SE=Swedish\nl-NL=Dutch\pt-BR=Portuguese (Brazil)\fi-FI=Finnish\nb-NO=Norwegian\da-DK=Danish\hu-HU=Hungarian\pl-PL=Polish\ru-RU=Russian\cs-CZ=Czech\el-GR=Greek\pt-PT=Portuguese (Portugal)\tr-TR=Turkish\ar-SA=Arabic\he-IL=Hebrew\sk-SK=Slovak\sl-SI=Slovenian\ro-RO=Romanian\hr-HR=Croatian\bg-BG=Bulgarian\et-EE=Estonian\lt-LT=Lithuanian\lv-LV=Latvian\th-TH=Thai\zh-HK=Traditional Chinese (Hong Kong)\sr-Latn-CS=Serbian (Latin)\uk-UA=Ukrainian" &  set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\MUI\Settings\PreferredUILanguages"
if "[%~1]"=="[AllowInsecureGuestAuth]" set "%~1.Type=DWORD" &  set "%~1.Description=Allows insecure guest logons from the network" &  set "%~1.NamedValues=0=Disable Insecure Guest Logons\1=Enable Insecure Guest Logons" &  set "%~1.Key=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\AllowInsecureGuestAuth"
if "[%~1]"=="[HideFileExt]" set "%~1.Type=DWORD" &  set "%~1.Description=Hide file extensions for known file types" & set "%~1.NamedValues=0=Show extensions\1=Hide extensions" &  set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt"
if "[%~1]"=="[AllowOnlineTips]" set "%~1.Type=DWORD" & set "%~1.Description=Allow online tips" & set "%~1.NamedValues=0=Disallow online tips\1=Allow online tips" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\AllowOnlineTips"
if "[%~1]"=="[SettingsPageVisibility]" set "%~1.Type=STRING" & set "%~1.Description=Specify settings pages visibility" & set "%~1.NamedValues=hide:about;bluetooth=Hide about and bluetooth page settings page\showonly:about;bluetooth=Show only about and bluetooth settings page" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\SettingsPageVisibility"
if "[%~1]"=="[UserSettingsPageVisibility]" set "%~1.Type=STRING" & set "%~1.Description=Specify settings pages visibility for current user" & set "%~1.NamedValues=hide:about;bluetooth=Hide about and bluetooth page settings page\showonly:about;bluetooth=Show only about and bluetooth settings page" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\SettingsPageVisibility"
if "[%~1]"=="[UseDefaultTile]" set "%~1.Type=DWORD" & set "%~1.Description=Use the default Start Menu tile layout" & set "%~1.NamedValues=0=Use custom layout\1=Use default layout" & set "%~1.Key=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\UseDefaultTile"
if "[%~1]"=="[AllowPrelaunch]" set "%~1.Type=DWORD" & set "%~1.Description=Allow Microsoft Edge to start and load the Start and New Tab page at Windows startup and each time Microsoft Edge is closed" & set "%~1.NamedValues=0=Disallow prelaunch\1=Allow prelaunch" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main\AllowPrelaunch"
if "[%~1]"=="[IntelShowTrayIcon]" set "%~1.Type=DWORD" & set "%~1.Description=Show Intel Graphics Tray Icon" & set "%~1.NamedValues=0=Hide Icon\1=Show Icon" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Intel\Display\igfxcui\igfxtray\TrayIcon\ShowTrayIcon"
if "[%~1]"=="[IntelHotKeysEnable]" set "%~1.Type=DWORD" & set "%~1.Description=Enable HotKeys for Intel Graphics" & set "%~1.NamedValues=0=Disable HotKeys\1=Enable HotKeys" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Intel\Display\igfxcui\HotKeys\Enable"
if "[%~1]"=="[DevicePasswordLessBuildVersion]" set "%~1.Type=DWORD" & set "%~1.Description=Controls the version of the password-less framework" & set "%~1.NamedValues=0=Password Less Build Version" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device\DevicePasswordLessBuildVersion"
if "[%~1]"=="[DefaultUserName]" set "%~1.Type=STRING" & set "%~1.Description=Default username for automatic logon" & set "%~1.NamedValues=user=user username" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultUserName"
if "[%~1]"=="[DefaultPassword]" set "%~1.Type=STRING" & set "%~1.Description=Default password for automatic logon" & set "%~1.NamedValues=password=password password" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultPassword"
if "[%~1]"=="[AutoAdminLogon]" set "%~1.Type=DWORD" & set "%~1.Description=Enables or disables automatic logon" & set "%~1.NamedValues=0=Disabled\1=Enabled" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon"
if "[%~1]"=="[AppsUseLightTheme]" set "%~1.Type=DWORD" & set "%~1.Description=Enables or disables light theme for apps" & set "%~1.NamedValues=0=Dark\1=Light" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme"
if "[%~1]"=="[SystemUsesLightTheme]" set "%~1.Type=DWORD" & set "%~1.Description=Enables or disables light theme for system" & set "%~1.NamedValues=0=Dark\1=Light" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\SystemUsesLightTheme"
if "[%~1]"=="[ShowCortanaButton]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide Cortana button on taskbar" & set "%~1.NamedValues=0=Hide\1=Show" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowCortanaButton"
if "[%~1]"=="[SearchboxTaskbarMode]" set "%~1.Type=DWORD" & set "%~1.Description=Controls the display mode of the search box on the taskbar" & set "%~1.NamedValues=0=Hidden\1=Collapsed\2=Visible" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\SearchboxTaskbarMode"
if "[%~1]"=="[ShowTaskViewButton]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide Task View button on taskbar" & set "%~1.NamedValues=0=Hide\1=Show" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowTaskViewButton"
if "[%~1]"=="[WallPaper]" set "%~1.Type=STRING" & set "%~1.Description=Path of the wallpaper image" & set "%~1.NamedValues=Path to the image file" & set "%~1.Key=HKEY_CURRENT_USER\Control Panel\Desktop\WallPaper"
if "[%~1]"=="[Background]" set "%~1.Type=STRING" & set "%~1.Description=Background color in RGB format" & set "%~1.NamedValues=RGB color value" & set "%~1.Key=HKEY_CURRENT_USER\Control Panel\Colors\Background"
if "[%~1]"=="[RealtekShowTrayIcon]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide Realtek Audio Manager Tray Icon" & set "%~1.NamedValues=0=Hide\1=Show" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Realtek\RAVCpl64\General\ShowTrayIcon"
if "[%~1]"=="[EnableAutoTray]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or disable automatic hiding of system tray icons" & set "%~1.NamedValues=0=Disable\1=Enable" & set "%~1.Key=HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\EnableAutoTray"
if "[%~1]"=="[AllowTelemetry]" set "%~1.Type=DWORD" & set "%~1.Description=Allow or prevent sending of telemetry data" & set "%~1.NamedValues=0=Prevent\1=Allow basic\2=Allow enhanced\3=Allow full" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowTelemetry"
if "[%~1]"=="[NoAutoUpdate]" set "%~1.Type=DWORD" & set "%~1.Description=Enable or disable automatic updates" & set "%~1.NamedValues=0=Enable\1=Disable" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate"
if "[%~1]"=="[HideSCAMeetNow[CurrentUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide 'Meet Now' icon in the taskbar" & set "%~1.NamedValues=0=Show\1=Hide" & set "%~1.Key=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\HideSCAMeetNow"
if "[%~1]"=="[HideSCAMeetNow[AllUser]]" set "%~1.Type=DWORD" & set "%~1.Description=Show or hide 'Meet Now' icon in the taskbar" & set "%~1.NamedValues=0=Show\1=Hide" & set "%~1.Key=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\HideSCAMeetNow"
GoTo :EOF

:AddRegistryString
set "_REGTYPE=REG_SZ" & GoTo :AddRegistryValue
:AddRegistryDWORD
set "_REGTYPE=REG_DWORD" & GoTo :AddRegistryValue
:AddRegistryStringExpand
set "_REGTYPE=REG_EXPAND_SZ" & GoTo :AddRegistryValue
:AddRegistryStringMulti
set "_REGTYPE=REG_MULTI_SZ" & GoTo :AddRegistryValue
:AddRegistryQWORD
set "_REGTYPE=REG_QWORD" & GoTo :AddRegistryValue
:AddRegistryBinary
set "_REGTYPE=REG_BINARY" & GoTo :AddRegistryValue
:AddRegistryValue
set _AddRegistryKeyPath=%1
if "[%_REGTYPE%]"=="[]" Call :AddRegistryDetermineREGTYPE %~1 %~2 _REGTYPE
Call :GetLastElement \ %_AddRegistryKeyPath% _AddRegistryKeyName
Call :TrimQuotes %_AddRegistryKeyName% _AddRegistryKeyName
Call set _AddRegistryKeyPath=%%_AddRegistryKeyPath:%_AddRegistryKeyName%=%%
Call :TrimTrailingBackslash %_AddRegistryKeyPath% _AddRegistryKeyPath
REG ADD "%_AddRegistryKeyPath%" /v "%_AddRegistryKeyName%" /t REG_DWORD /d "%~2" /f 2>&1>nul
set "_AddRegistryKeyPath=" & set "_AddRegistryKeyName=" & set "_REGTYPE="
GoTo :EOF
:AddRegistryDetermineREGTYPE
REM It's always a string for now, TODO
set %3=REG_SZ
GoTo :EOF
REM https://learn.microsoft.com/en-us/windows/win32/sysinfo/registry-value-types

::Usage Call :GetRegistryValue RegistryKey Output
:GetRegistryValue
set "_GetRegistryValue="
Set "_GetRegistryKey=%~1"
Call :GetLastElement \ %_GetRegistryKey% _GetRegistryKeyName
Call :TrimQuotes %_GetRegistryKeyName% _GetRegistryKeyName
Call :Replace "%_GetRegistryKey%" "\%_GetRegistryKeyName%" _GetRegistryPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "%_GetRegistryPath%" 2^>nul') do if "[%%a]"=="[%_GetRegistryKeyName%]" set _GetRegistryValue=%%c
set "%~2=%_GetRegistryValue%"
if "[%_GetRegistryValue%]"=="[]" set "%~2=NOT SET"
set "_GetRegistryValue="
GoTo :EOF

REM Macro definitions
:SetMacroPrintTime
set PrintTime=& Call :PrintTime
GoTo :EOF

REM Function library


REM example function structure, with usage and signature
:FunctionNameHELP
echo Name and usage
echo dependencies
echo Date and URL
echo by YourName
echo examples 
echo examples 
echo examples 
echo credit 
:GoTo :EOF
:FunctionName
::End Functionname SHA256:1234567890 SignDate:

REM -- console functions --

::Usage Call SetTitle MyTitle
:SetTitle 
title %*
GoTo:EOF

:: Perform self-elevation, passing all arguments through.
:ElevateAndWait
set _ElevateAndWait=-Wait
:Elevate
  if defined args set args=%args:^=^^%
  if defined args set args=%args:<=^<%
  if defined args set args=%args:>=^>%
  if defined args set args=%args:&=^&%
  if defined args set args=%args:|=^|%
  if defined args set "args=%args:"=\"\"%"
  :: Note:  
  ::  * To keep the elevated session open until explicitly exited by the user,
  ::    use /k instead of /c
  powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    " Start-Process %_ElevateAndWait% -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD% \"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
goto :EOF
REM https://stackoverflow.com/questions/76040676/batch-file-auto-elevation-using-powershell-and-not-mangling-the-arguments-but-pr/76055486?noredirect=1#comment134178642_76055486

:: Test if this session is elevated.
:: `net session` only succeeds and therefore reports exit code 0 
:: in an elevated session.
:IsAdmin
if not "[%1]"=="[]" set %1=false
  net session >NUL 2>&1
  if %ERRORLEVEL% == 0 if not "[%1]"=="[]" set %1=true
  net session >NUL 2>&1
goto :EOF

:: Usage Call :ClearLocalVariables
:ClearLocalVariables
for /f "tokens=1,2 delims==" %%a in ('set _ 2^>nul') do set %%a=
GoTo :EOF

:: Usage Call :ClearVariablesByPrefix myPrefix
:ClearVariablesByPrefix
for /f "tokens=1,2 delims==" %%a in ('set %~1 2^>nul') do set %%a=
GoTo :EOF

:GoToFolderOfBatchFile
pushd %1
GoTo :EOF

:ReturnToInitialFolder
popd
GoTo :EOF

::Usage Call :ShowCodepage 
:ShowCodepage
chcp
GoTo :EOF

::Usage Call :GetCodePage ReturnValue
:GetCodePage
for /f "tokens=1,2 delims=:" %%a in ('chcp') do set %1=%%b
call set %1=%%%1:~1%%
GoTo :EOF

::Usage Call :SetCodePage NewCodePage
:SetCodePage
chcp %~1
GoTo :EOF

REM -- time functions --

::Usage Call :PrintTime
:PrintTime
echo %date% %time%
GoTo :EOF

::Usage Call :GetTime
:GetTime
set _GetDate=%date% & set _GetTime=%time%
set _GetTime=%_GetTime: 0=00%
set _GetTime=%_GetTime:~0,2%h%_GetTime:~3,2%m%_GetTime:~6,2%s%_GetTime:~9,2%
set "%~1=%_GetDate% %_GetTime%" & set "%~2=%_GetDate%" & set "%~3=%_GetTime%"
set "_GetDate=" & set "_GetTime="
GoTo :EOF

:: Usage Call :Sleep 5 ' Sleep time in seconds
:Sleep
timeout /t %~1
GoTo :EOF

REM -- string manipulation --

::Usage Call :Replace Input Search Output
:Replace
set ReplaceInput=%~1
set ReplaceSearch=%~2
call set %3=%%ReplaceInput:%ReplaceSearch%=%%
GoTo :EOF

::Usage Call :TrimQuotes %variable% variable
:TrimQuotes
set TrimQuotes=%~1
set %2=%TrimQuotes%
GoTo :EOF

::Usage Call :TrimTrailingBackslash %Input% Output 
:TrimTrailingBackslash
set TrimTrailingBackslashInput=%1
if "%TrimTrailingBackslashInput:~-1%"=="\" ( 
  set %2=%TrimTrailingBackslashInput:~0,-1%
  ) else (
  set %2=%TrimTrailingBackslashInput%
  )
GoTo :EOF


REM Untested
::Usage Call :deasterisk Input Output
:deasterisk
FOR /f "tokens=1* delims=*" %%i IN ("%~1") DO (
   SET _deasterisk=%%j
   IF DEFINED _deasterisk (
      SET _deasterisk=%%i%%j
      GOTO :deasterisk
   ) ELSE (
      SET _deasterisk=%%i
   )
)
set %2=%_deasterisk%
GoTo :EOF
REM https://stackoverflow.com/questions/15441422/replace-character-of-string-in-batch-script

::Usage Call :EchoValue myValue
:EchoValue
call echo %1=%%%1%%
GoTo :EOF
REM echo 1 %1 
REM echo 2 %1% 
REM echo 3 %%1 
REM echo 4 %%1%
REM echo 5 %%%1
REM echo 6 %%%1%
REM echo 7 %%%%1
REM echo 8 %%%%1%
REM echo 9 %%%%%1
REM echo 0 %%%%%1%
REM echo 1 %%%%%%1
REM echo 2 %%%%%%1%
REM echo 3 %1%%
REM echo 4 %%1%%
REM echo 5 %%%1%%
REM echo 6 %%%%1%%
REM echo 7 %%%%%1%%
REM echo 8 %%%%%%1%%
REM echo 9 %1%%%
REM echo 0 %%1%%%
REM echo 1 %%%1%%%
REM echo 2 %%%%1%%%
REM echo 3 %%%%%1%%%
REM echo 4 %%%%%%1%%%
REM echo 5 %%1% 
REM echo 6 %1% 
REM echo 7 %%%1%% 
REM echo 8 %%%1%%% 
REM echo 9 %%%%1%%%
REM echo call
REM call echo 1 %1 
REM call echo 2 %1% 
REM call echo 3 %%1 
REM call echo 4 %%1%
REM call echo 5 %%%1
REM call echo 6 %%%1%
REM call echo 7 %%%%1
REM call echo 8 %%%%1%
REM call echo 9 %%%%%1
REM call echo 0 %%%%%1%
REM call echo 1 %%%%%%1
REM call echo 2 %%%%%%1%
REM call echo 3 %1%%
REM call echo 4 %%1%%
REM call echo x5 %%%1%%
REM call echo 6 %%%%1%%
REM call echo 7 %%%%%1%%
REM call echo 8 %%%%%%1%%
REM call echo 9 %1%%%
REM call echo 0 %%1%%%
REM call echo x1 %%%1%%%
REM call echo 2 %%%%1%%%
REM call echo 3 %%%%%1%%%
REM call echo 4 %%%%%%1%%%
REM call echo 5 %%1% 
REM call echo 6 %1% 
REM call echo x7 %%%1%% 
REM call echo x8 %%%1%%% 
REM call echo 9 %%%%1%%%
GoTo :EOF

REM -- Array manipulation

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:deconcatenate
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:deconcatenate_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:deconcatenate_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :deconcatenate_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo writing set %~3[%_token%] = %_buffer% 
if "[%_IsDelimiter%]"=="[true]" call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :deconcatenate_input_loop
if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns array starting at [0], see .lbound and .ubound
:DeconcatenateFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set /a index=0
set /a %3.lbound=%index%
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%~3[%%index%%]=%%w"
	set /a "index+=1"
)
set /a "index-=1"
set %3.ubound=%index%
GoTo :EOF

:: Requires :len (maybe support %ReturnEmpty% for special cases ?)
::Usage Call :GetLastElement Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=%_input.len%-1 & set "_char=" & set "_buffer="
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetLastElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor-=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetLastElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_char%%_buffer%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetLastElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" echo is a delimiter and buffer not empty %_buffer% 
if "[%_IsDelimiter%]"=="[true]" if not "[%_buffer%]"=="[]" set "%~3=%_buffer%" & GoTo :EOF
if %_cursor% LSS %_input.len% goto :GetLastElement_input_loop
GoTo :EOF

::Usage Call :Deconcatenate Delimiter Input Output 'Returns the last element in string based on specified delimiter
:GetLastElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
call set _input="%%_input:%_delimiter%=" "%%"
for %%w in (%_input%) do (
	REM echo %%w
	call set "%3=%%~w"
)
GoTo :EOF

::Usage Call :GetNthElement Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElement
set "_delimiter=%~1" & set /a _delimiter.len=0
set "_input=%~2" & set /a _input.len=0
call :len _delimiter _delimiter.len
call :len _input _input.len
set /a _cursor=0 & set /a _token=0 & set "_char=" & set "_buffer="
::set /a %3.lbound=%_cursor%
REM if "[%debug%]"=="[true]" echo input [%_input%] len %_input.len% delimiter [%_delimiter%] len %_delimiter.len%
:GetNthElement_input_loop
REM if "[%debug%]"=="[true]" pause
call set _char=%%_input:~%_cursor%,1%%
REM if "[%debug%]"=="[true]" echo char %_char%
set /a _cursor+=1
set /a _cursor2=0 & set "_IsDelimiter=false"  
:GetNthElement_delimiter_loop
call set _charDelimiter=%%_delimiter:~%_cursor2%,1%%
if "[%_char%]"=="[%_charDelimiter%]" set "_IsDelimiter=true"
if not "[%_IsDelimiter%]"=="[true]" set "_buffer=%_buffer%%_char%"
REM if "[%debug%]"=="[true]" echo _charDelimiter [%_charDelimiter%] _IsDelimiter [%_IsDelimiter%] _cursor %_cursor% _cursor2 %_cursor2% _buffer %_buffer%
set /a _cursor2+=1
if %_cursor2% LSS %_delimiter.len% goto :GetNthElement_delimiter_loop
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" echo if %_token% EQU %4 
if "[%_IsDelimiter%]"=="[true]" if %_token% EQU %4 set "%~3=%_buffer%" & GoTo :EOF 
if "[%_IsDelimiter%]"=="[true]" set "_buffer=" && set /a _token+=1 
REM if "[%debug%]"=="[true]" if "[%_IsDelimiter%]"=="[true]" pause
if %_cursor% LSS %_input.len% goto :GetNthElement_input_loop
::if %_cursor% EQU %_input.len% call set "%~3[%%_token%%]=%_buffer%" & set "_buffer=" & set /a %3.ubound=%_token%
if %_token% EQU %4 set "%~3=%_buffer%"
GoTo :EOF

::Usage Call :GetNthElementFast Delimiter Input Output NthCount 'Returns Nth element from string using specified delimiter
:GetNthElementFast 
Set "_delimiter=%~1"
Set "_input=%~2"
set "_buffer="
set /a index=0
call set _input="%%_input:%_delimiter%=" "%%"
setlocal enableDelayedExpansion
for %%w in (%_input%) do (
	REM echo %%w
	call set "_buffer=%%~w"
	if !index! EQU %4 GoTo :GetNthElementFast_ExitFor
	set /a "index+=1"
)
REM clearing buffer, index did not reach count
 set "_buffer="
:GetNthElementFast_ExitFor
endlocal & set "%3=%_buffer%"
GoTo :EOF


:: Set _EchoArrayElementFromListPrefix to insert text 
:: Usage Call :EchoArrayElementFromList ElementList ArrayForOutput optional Suffix1 Suffix2 ... SuffixN'both array must have .ubound set
:EchoArrayElementFromList
set "_EchoArrayElementFromList_ElementList=%~1"
set "_EchoArrayElementFromList_ArrayForOutput=%~2"
set /a _EchoArrayElementFromList_SuffixList.index=-1
if "[%~3]"=="[]" GoTo :EchoArrayElementFromList-fill-suffix-list-skip
:EchoArrayElementFromList-fill-suffix-list
set /a _EchoArrayElementFromList_SuffixList.index+=1
if not "[%~3]"=="[]" set "_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]=%~3"
shift
if not "[%~3]"=="[]" GoTo :EchoArrayElementFromList-fill-suffix-list
set /a _EchoArrayElementFromList_SuffixList.ubound=%_EchoArrayElementFromList_SuffixList.index%
:EchoArrayElementFromList-fill-suffix-list-skip
call set /a _EchoArrayElementFromList.ElementList.ubound=%%%_EchoArrayElementFromList_ElementList%.ubound%%
set /a _EchoArrayElementFromList.index=0
:EchoArrayElementFromList-ElementList-loop
set /a _EchoArrayElementFromList_SuffixList.index=0
:EchoArrayElementFromList-SuffixList-loop
REM call call echo %%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%
REM echo %_EchoArrayElementFromListPrefix%%%%%%_EchoArrayElementFromList_ArrayForOutput%[%%%_EchoArrayElementFromList_ElementList%[%_EchoArrayElementFromList.index%]%%]%%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%%%%%
call call echo %_EchoArrayElementFromListPrefix%%%%%%_EchoArrayElementFromList_ArrayForOutput%[%%%_EchoArrayElementFromList_ElementList%[%_EchoArrayElementFromList.index%]%%]%%_EchoArrayElementFromList_SuffixList[%_EchoArrayElementFromList_SuffixList.index%]%%%%%%
set /a _EchoArrayElementFromList_SuffixList.index+=1
if "[%_EchoArrayElementFromList_SuffixList.ubound%]"=="[]" GoTo :EchoArrayElementFromList-SuffixList-loop-skip
if %_EchoArrayElementFromList_SuffixList.index% LEQ %_EchoArrayElementFromList_SuffixList.ubound% GoTo :EchoArrayElementFromList-SuffixList-loop
:EchoArrayElementFromList-SuffixList-loop-skip
set /a _EchoArrayElementFromList.index+=1
if %_EchoArrayElementFromList.index% LEQ %_EchoArrayElementFromList.ElementList.ubound% GoTo :EchoArrayElementFromList-ElementList-loop
Call :ClearVariablesByPrefix _EchoArrayElementFromList
GoTo :EOF

:: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
:: Example set EchoArrayPrefix=InputArray[%%index%%]=
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "count=%%%~1.count%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
REM if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
REM if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
REM if not ["%count%"]==[""] call echo %~1.count %%%~1.count%%
REM if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
REM if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop

::Usage Call :Ubound InputArray UboundOutput ' make this better, search "set" for the real ubound
:ubound
set %2=%~1.ubound
GoTo :EOF

::Usage Call :Lbound InputArray LboundOutput' make this better, search "set" for the real ubound
:lbound
set %2=%~1.lbound
GoTo :EOF

:: ClearArray InputArray optional start optional end
:ClearArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
if not ["%~1.lbound"]==[""] set %~1.lbound=
if not ["%~1.ubound"]==[""] set %~1.ubound=
if not ["%~1.count"]==[""] set %~1.count=
if not ["%~1.next"]==[""] set %~1.next=
if not ["%~1.previous"]==[""] set %~1.previous=
:ClearArray-internal-loop
if not defined %~1[%index%] GoTo :ClearArray-end
call set %%%~1[%index%]%=
set /a index+=1
if %index% GTR %limit% goto :ClearArray-end
GoTo :ClearArray-internal-loop
:ClearArray-end
set index=
set limit=
GoTo :EOF


REM -- misc --

::Usage Call :IsNumeric Value optional Output
:IsNumeric
set "IsNumericInternal=0123456789"
echo.%1| findstr /r "[^%IsNumericInternal%]" >nul && (
    if not "[%2]"=="[]" set %2=false
) || (
    if not "[%2]"=="[]" set %2=true
)
GoTo :EOF
REM Call :IsNumeric %var% && echo it is not numeric || echo it is numeric

::Usage Call :HexPrefixStripper InputHex OutputDecimal ' This just strips leading "0x" if present
:HexPrefixStripper
if "[%~1]"=="[]" GoTo :EOF
set "_HexPrefixStripper_buffer=%~1"
set "%~2=%~1"
if "[%_HexPrefixStripper_buffer:~0,2%]"=="[0x]" call set "%~2=%_HexPrefixStripper_buffer:~2%"
set "_HexPrefixStripper_buffer="
GoTo :EOF

REM incomplete
:: Call :InStB input search result
:InStB
set "InputSTR=%1"
set "SearchSTR=%2"
set %3=false
echo input string %InputSTR%
echo search string %SearchSTR%
echo third param %3
call set TestSTR=%%InputSTR:%SearchSTR:~1,-1%=%%
echo test string %InputSTR%
echo test string %TestSTR%
if %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( echo if ran payload )
if not %TestSTR%==%InputSTR% ( set %3=true )
GoTo :EOF
REM Add example if test || && etc..

:len <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~1!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~2=%len%"
    exit /b
)
REM https://stackoverflow.com/a/5841587

::Usage Call :True ReturnValue 'Always returns true, both return value and errorlevel
:true 
if not "[%1]"=="[]" set %1=true
exit /b 0

::Usage Call :false ReturnValue 'Always returns false, both return value and errorlevel
:false 
if not "[%1]"=="[]" set %1=false
exit /b 1
REM thanks https://www.tutorialspoint.com/batch_script/