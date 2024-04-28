@echo off

REM GoTo :SetSpecialFolder-DEMO

::Values for SpecialFolderName:3DObjects,Contacts,Desktop,Documents,Downloads,Favourites,Links,Music,OneDrive,Pictures,SavedGames,Searches,Videos,ALL
::If SpecialFolderName is "ALL" then NewFolderPath is the root folder for all special folders
::Usage Call :ChangeSpecialFolder EXACTFOLDER SpecialFolderName NewFolderPath
::Usage Call :ChangeSpecialFolder SpecialFolderName NewFolderPath
:SetSpecialFolder
REM echo args %1 %2 %3

set "_SSF[3DObjects].subfolder=3D Objects"
set "_SSF[Contacts].subfolder=Contacts"
set "_SSF[Desktop].subfolder=Desktop"
set "_SSF[Documents].subfolder=Documents"
set "_SSF[Downloads].subfolder=Downloads"
set "_SSF[Favorites].subfolder=Favorites"
set "_SSF[Links].subfolder=Links"
set "_SSF[Music].subfolder=Music"
set "_SSF[Pictures].subfolder=Pictures"
set "_SSF[SavedGames].subfolder=Saved Games"
set "_SSF[Searches].subfolder=Searches"
set "_SSF[Videos].subfolder=Videos"
REM set "_SSF[3DObjects].GUID={31C0DD25-9439-4F12-BF41-7FF4EDA38722}"
set "_SSF[Contacts].GUID={56784854-C6CB-462B-8169-88E350ACB882}"
REM set "_SSF[Desktop].GUID={B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"
set "_SSF[Desktop].GUID={754AC886-DF64-4CBA-86B5-F7FBF4FBCEF5}"
set "_SSF[Desktop].GUID=Desktop"
REM set "_SSF[Documents].GUID={FDD39AD0-238F-46AF-ADB4-6C85480369C7}"
set "_SSF[Documents].GUID={F42EE2D3-909F-4907-8871-4C22FC0BF756}"
set "_SSF[Documents].GUID=Personal"
set "_SSF[Downloads].GUID={374DE290-123F-4565-9164-39C4925E467B}"
REM set "_SSF[Favorites].GUID={1777F761-68AD-4D8A-87BD-30B759FA33DD}"
set "_SSF[Favorites].GUID=Favorites"
set "_SSF[Links].GUID={BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}"
REM set "_SSF[Music].GUID={4BD8D571-6D19-48D3-BE97-422220080E43}"
set "_SSF[Music].GUID={A0C69A99-21C8-4671-8703-7934162FCF1D}"
set "_SSF[Music].GUID=My Music"
REM set "_SSF[Pictures].GUID={33E28130-4E1E-4676-835A-98395C3BC3BB}"
set "_SSF[Pictures].GUID={0DDD015D-B06C-45D5-8C4C-F59713854639}"
set "_SSF[Pictures].GUID=My Pictures"
set "_SSF[SavedGames].GUID={4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}"
REM set "_SSF[Searches].GUID={98ec0e18-2098-4d44-8644-66979315a281}"
set "_SSF[Searches].GUID={7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}"
REM set "_SSF[Videos].GUID={18989B1D-99B5-455B-841C-AB7C74E4DDFC}"
set "_SSF[Videos].GUID={35286A68-3C57-41A1-BBB1-0EAE73D76C95}"
set "_SSF[Videos].GUID=My Video"

if "[%~1]" EQU "[EXACTFOLDER]" ( shift & set "_SSF_ShellFolder_ExactFolderMode=true" ) else ( set "_SSF_ShellFolder_ExactFolderMode=" )

set "_SSF_ShellFolder_Destination=%~2"
set "_SSF_ShellFolder_Destination_lastchar=%_SSF_ShellFolder_Destination:~-1%"

if "[%_SSF_ShellFolder_ExactFolderMode%]" EQU "[true]" if "[%_SSF_ShellFolder_Destination_lastchar%]" EQU "[\]" set "_SSF_ShellFolder_Destination=%_SSF_ShellFolder_Destination:~0,-1%"
if "[%_SSF_ShellFolder_ExactFolderMode%]" NEQ "[true]" if "[%_SSF_ShellFolder_Destination_lastchar%]" NEQ "[\]" set "_SSF_ShellFolder_Destination=%_SSF_ShellFolder_Destination%\"
if "[%_SSF_ShellFolder_ExactFolderMode%]" EQU "[true]" for %%a in (3DObjects,Contacts,Desktop,Documents,Downloads,Favorites,Links,Music,Pictures,SavedGames,Searches,Videos) do ( set "_SSF[%%a].subfolder=" )

set "_SSF_UserShellFolder_Key=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
set "_SSF_ShellFolder_Key=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
if "[%~1]" EQU "[ALL]" GoTo :SetSpecialFolder-all-skip
setlocal enabledelayedexpansion
for %%a in (3DObjects,Contacts,Desktop,Documents,Downloads,Favorites,Links,Music,Pictures,SavedGames,Searches,Videos) do (
	if "[%%a]" EQU "[%~1]" if not exist "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" ( md "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" )
	if "[%%a]" EQU "[%~1]" reg add "%_SSF_ShellFolder_Key%" /v "!_SSF[%%a].GUID!" /t REG_SZ /d "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" /f
	if "[%%a]" EQU "[%~1]" reg add "%_SSF_UserShellFolder_Key%" /v "!_SSF[%%a].GUID!" /t REG_EXPAND_SZ /d "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" /f
	)
endlocal
GoTo:EOF
:SetSpecialFolder-all-skip
setlocal enabledelayedexpansion
for %%a in (3DObjects,Contacts,Desktop,Documents,Downloads,Favorites,Links,Music,Pictures,SavedGames,Searches,Videos) do (
	if not exist "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" ( md "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" )
	reg add "%_SSF_ShellFolder_Key%" /v "!_SSF[%%a].GUID!" /t REG_SZ /d "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" /f
	reg add "%_SSF_UserShellFolder_Key%" /v "!_SSF[%%a].GUID!" /t REG_EXPAND_SZ /d "%_SSF_ShellFolder_Destination%!_SSF[%%a].subfolder!" /f
	)
endlocal
GoTo:EOF

:SetSpecialFolder-DEMO

echo.& echo do not run this without putting echo in front of all active commands in :SetSpecialFolder & GoTo :EOF

echo.& echo setting special folders to a new root
Call :SetSpecialFolder ALL C:\example
echo.& echo setting special folders to a new root (and trailing backslash)
Call :SetSpecialFolder ALL C:\example\

echo.& echo setting individual folders

Call :SetSpecialFolder 3DObjects C:\example
Call :SetSpecialFolder Contacts C:\example
Call :SetSpecialFolder Desktop C:\example
Call :SetSpecialFolder Documents C:\example
Call :SetSpecialFolder Downloads C:\example
Call :SetSpecialFolder Favorites C:\example
Call :SetSpecialFolder Links C:\example
Call :SetSpecialFolder Music C:\example
Call :SetSpecialFolder Pictures C:\example
Call :SetSpecialFolder SavedGames C:\example
Call :SetSpecialFolder Searches C:\example
Call :SetSpecialFolder Videos C:\example

echo.&echo setting individual folders with trailing backslash
Call :SetSpecialFolder 3DObjects C:\example\
Call :SetSpecialFolder Contacts C:\example\
Call :SetSpecialFolder Desktop C:\example\
Call :SetSpecialFolder Documents C:\example\
Call :SetSpecialFolder Downloads C:\example\
Call :SetSpecialFolder Favorites C:\example\
Call :SetSpecialFolder Links C:\example\
Call :SetSpecialFolder Music C:\example\
Call :SetSpecialFolder Pictures C:\example\
Call :SetSpecialFolder SavedGames C:\example\
Call :SetSpecialFolder Searches C:\example\
Call :SetSpecialFolder Videos C:\example\

echo.&echo setting individual folders with trailing backslash, a space in the path
Call :SetSpecialFolder 3DObjects "C:\exa mple\"
Call :SetSpecialFolder Contacts "C:\exa mple\"
Call :SetSpecialFolder Desktop "C:\exa mple\"
Call :SetSpecialFolder Documents "C:\exa mple\"
Call :SetSpecialFolder Downloads "C:\exa mple\"
Call :SetSpecialFolder Favorites "C:\exa mple\"
Call :SetSpecialFolder Links "C:\exa mple\"
Call :SetSpecialFolder Music "C:\exa mple\"
Call :SetSpecialFolder Pictures "C:\exa mple\"
Call :SetSpecialFolder SavedGames "C:\exa mple\"
Call :SetSpecialFolder Searches "C:\exa mple\"
Call :SetSpecialFolder Videos "C:\exa mple\"

echo.&echo setting individual folders with a space in the path, and an exact path
Call :SetSpecialFolder EXACTFOLDER 3DObjects "C:\exa mple\my3dobj"
Call :SetSpecialFolder EXACTFOLDER Contacts "C:\exa mple\mycontacts"
Call :SetSpecialFolder EXACTFOLDER Desktop "C:\exa mple\mydesktop"
Call :SetSpecialFolder EXACTFOLDER Documents "C:\exa mple\mydocuments"
Call :SetSpecialFolder EXACTFOLDER Downloads "C:\exa mple\mydownloads"
Call :SetSpecialFolder EXACTFOLDER Favorites "C:\exa mple\myfavorites"
Call :SetSpecialFolder EXACTFOLDER Links "C:\exa mple\mylinks"
Call :SetSpecialFolder EXACTFOLDER Music "C:\exa mple\mymusic"
Call :SetSpecialFolder EXACTFOLDER Pictures "C:\exa mple\mypictures"
Call :SetSpecialFolder EXACTFOLDER SavedGames "C:\exa mple\mysavedgames"
Call :SetSpecialFolder EXACTFOLDER Searches "C:\exa mple\mysearches"
Call :SetSpecialFolder EXACTFOLDER Videos "C:\exa mple\myvideos"


GoTo :EOF


:SampleOutput

setting special folders to a new root
args ALL C:\example
md "C:\example\3D Objects"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\example\3D Objects" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "C:\example\3D Objects" /f
md "C:\example\Contacts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_SZ /d "C:\example\Contacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "C:\example\Contacts" /f
md "C:\example\Desktop"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_SZ /d "C:\example\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_EXPAND_SZ /d "C:\example\Desktop" /f
md "C:\example\Documents"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_SZ /d "C:\example\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_EXPAND_SZ /d "C:\example\Documents" /f
md "C:\example\Downloads"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\example\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "C:\example\Downloads" /f
md "C:\example\Favorites"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_SZ /d "C:\example\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_EXPAND_SZ /d "C:\example\Favorites" /f
md "C:\example\Links"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_SZ /d "C:\example\Links" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_EXPAND_SZ /d "C:\example\Links" /f
md "C:\example\Music"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_SZ /d "C:\example\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_EXPAND_SZ /d "C:\example\Music" /f
md "C:\example\Pictures"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_SZ /d "C:\example\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_EXPAND_SZ /d "C:\example\Pictures" /f
md "C:\example\Saved Games"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\example\Saved Games" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "C:\example\Saved Games" /f
md "C:\example\Searches"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_SZ /d "C:\example\Searches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_EXPAND_SZ /d "C:\example\Searches" /f
md "C:\example\Videos"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_SZ /d "C:\example\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_EXPAND_SZ /d "C:\example\Videos" /f

setting special folders to a new root (and trailing backslash)
args ALL C:\example\
md "C:\example\3D Objects"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\example\3D Objects" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "C:\example\3D Objects" /f
md "C:\example\Contacts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_SZ /d "C:\example\Contacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "C:\example\Contacts" /f
md "C:\example\Desktop"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_SZ /d "C:\example\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_EXPAND_SZ /d "C:\example\Desktop" /f
md "C:\example\Documents"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_SZ /d "C:\example\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_EXPAND_SZ /d "C:\example\Documents" /f
md "C:\example\Downloads"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\example\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "C:\example\Downloads" /f
md "C:\example\Favorites"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_SZ /d "C:\example\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_EXPAND_SZ /d "C:\example\Favorites" /f
md "C:\example\Links"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_SZ /d "C:\example\Links" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_EXPAND_SZ /d "C:\example\Links" /f
md "C:\example\Music"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_SZ /d "C:\example\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_EXPAND_SZ /d "C:\example\Music" /f
md "C:\example\Pictures"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_SZ /d "C:\example\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_EXPAND_SZ /d "C:\example\Pictures" /f
md "C:\example\Saved Games"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\example\Saved Games" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "C:\example\Saved Games" /f
md "C:\example\Searches"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_SZ /d "C:\example\Searches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_EXPAND_SZ /d "C:\example\Searches" /f
md "C:\example\Videos"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_SZ /d "C:\example\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_EXPAND_SZ /d "C:\example\Videos" /f

setting individual folders
args 3DObjects C:\example
md "C:\example\3D Objects"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\example\3D Objects" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "C:\example\3D Objects" /f
args Contacts C:\example
md "C:\example\Contacts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_SZ /d "C:\example\Contacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "C:\example\Contacts" /f
args Desktop C:\example
md "C:\example\Desktop"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_SZ /d "C:\example\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_EXPAND_SZ /d "C:\example\Desktop" /f
args Documents C:\example
md "C:\example\Documents"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_SZ /d "C:\example\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_EXPAND_SZ /d "C:\example\Documents" /f
args Downloads C:\example
md "C:\example\Downloads"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\example\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "C:\example\Downloads" /f
args Favorites C:\example
md "C:\example\Favorites"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_SZ /d "C:\example\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_EXPAND_SZ /d "C:\example\Favorites" /f
args Links C:\example
md "C:\example\Links"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_SZ /d "C:\example\Links" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_EXPAND_SZ /d "C:\example\Links" /f
args Music C:\example
md "C:\example\Music"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_SZ /d "C:\example\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_EXPAND_SZ /d "C:\example\Music" /f
args Pictures C:\example
md "C:\example\Pictures"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_SZ /d "C:\example\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_EXPAND_SZ /d "C:\example\Pictures" /f
args SavedGames C:\example
md "C:\example\Saved Games"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\example\Saved Games" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "C:\example\Saved Games" /f
args Searches C:\example
md "C:\example\Searches"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_SZ /d "C:\example\Searches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_EXPAND_SZ /d "C:\example\Searches" /f
args Videos C:\example
md "C:\example\Videos"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_SZ /d "C:\example\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_EXPAND_SZ /d "C:\example\Videos" /f

setting individual folders with trailing backslash
args 3DObjects C:\example\
md "C:\example\3D Objects"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\example\3D Objects" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "C:\example\3D Objects" /f
args Contacts C:\example\
md "C:\example\Contacts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_SZ /d "C:\example\Contacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "C:\example\Contacts" /f
args Desktop C:\example\
md "C:\example\Desktop"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_SZ /d "C:\example\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_EXPAND_SZ /d "C:\example\Desktop" /f
args Documents C:\example\
md "C:\example\Documents"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_SZ /d "C:\example\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_EXPAND_SZ /d "C:\example\Documents" /f
args Downloads C:\example\
md "C:\example\Downloads"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\example\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "C:\example\Downloads" /f
args Favorites C:\example\
md "C:\example\Favorites"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_SZ /d "C:\example\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_EXPAND_SZ /d "C:\example\Favorites" /f
args Links C:\example\
md "C:\example\Links"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_SZ /d "C:\example\Links" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_EXPAND_SZ /d "C:\example\Links" /f
args Music C:\example\
md "C:\example\Music"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_SZ /d "C:\example\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_EXPAND_SZ /d "C:\example\Music" /f
args Pictures C:\example\
md "C:\example\Pictures"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_SZ /d "C:\example\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_EXPAND_SZ /d "C:\example\Pictures" /f
args SavedGames C:\example\
md "C:\example\Saved Games"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\example\Saved Games" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "C:\example\Saved Games" /f
args Searches C:\example\
md "C:\example\Searches"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_SZ /d "C:\example\Searches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_EXPAND_SZ /d "C:\example\Searches" /f
args Videos C:\example\
md "C:\example\Videos"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_SZ /d "C:\example\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_EXPAND_SZ /d "C:\example\Videos" /f

setting individual folders with trailing backslash, a space in the path
args 3DObjects "C:\exa mple\"
md "C:\exa mple\3D Objects"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\exa mple\3D Objects" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "C:\exa mple\3D Objects" /f
args Contacts "C:\exa mple\"
md "C:\exa mple\Contacts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_SZ /d "C:\exa mple\Contacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "C:\exa mple\Contacts" /f
args Desktop "C:\exa mple\"
md "C:\exa mple\Desktop"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_SZ /d "C:\exa mple\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_EXPAND_SZ /d "C:\exa mple\Desktop" /f
args Documents "C:\exa mple\"
md "C:\exa mple\Documents"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_SZ /d "C:\exa mple\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_EXPAND_SZ /d "C:\exa mple\Documents" /f
args Downloads "C:\exa mple\"
md "C:\exa mple\Downloads"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\exa mple\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "C:\exa mple\Downloads" /f
args Favorites "C:\exa mple\"
md "C:\exa mple\Favorites"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_SZ /d "C:\exa mple\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_EXPAND_SZ /d "C:\exa mple\Favorites" /f
args Links "C:\exa mple\"
md "C:\exa mple\Links"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_SZ /d "C:\exa mple\Links" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_EXPAND_SZ /d "C:\exa mple\Links" /f
args Music "C:\exa mple\"
md "C:\exa mple\Music"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_SZ /d "C:\exa mple\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_EXPAND_SZ /d "C:\exa mple\Music" /f
args Pictures "C:\exa mple\"
md "C:\exa mple\Pictures"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_SZ /d "C:\exa mple\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_EXPAND_SZ /d "C:\exa mple\Pictures" /f
args SavedGames "C:\exa mple\"
md "C:\exa mple\Saved Games"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\exa mple\Saved Games" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "C:\exa mple\Saved Games" /f
args Searches "C:\exa mple\"
md "C:\exa mple\Searches"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_SZ /d "C:\exa mple\Searches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_EXPAND_SZ /d "C:\exa mple\Searches" /f
args Videos "C:\exa mple\"
md "C:\exa mple\Videos"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_SZ /d "C:\exa mple\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_EXPAND_SZ /d "C:\exa mple\Videos" /f

setting individual folders with a space in the path, and an exact path
args EXACTFOLDER 3DObjects "C:\exa mple\my3dobj"
md "C:\exa mple\my3dobj"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\exa mple\my3dobj" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "C:\exa mple\my3dobj" /f
args EXACTFOLDER Contacts "C:\exa mple\mycontacts"
md "C:\exa mple\mycontacts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_SZ /d "C:\exa mple\mycontacts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462b-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "C:\exa mple\mycontacts" /f
args EXACTFOLDER Desktop "C:\exa mple\mydesktop"
md "C:\exa mple\mydesktop"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_SZ /d "C:\exa mple\mydesktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /t REG_EXPAND_SZ /d "C:\exa mple\mydesktop" /f
args EXACTFOLDER Documents "C:\exa mple\mydocuments"
md "C:\exa mple\mydocuments"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_SZ /d "C:\exa mple\mydocuments" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{FDD39AD0-238F-46AF-ADB4-6C85480369C7}" /t REG_EXPAND_SZ /d "C:\exa mple\mydocuments" /f
args EXACTFOLDER Downloads "C:\exa mple\mydownloads"
md "C:\exa mple\mydownloads"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\exa mple\mydownloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "C:\exa mple\mydownloads" /f
args EXACTFOLDER Favorites "C:\exa mple\myfavorites"
md "C:\exa mple\myfavorites"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_SZ /d "C:\exa mple\myfavorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{1777F761-68AD-4D8A-87BD-30B759FA33DD}" /t REG_EXPAND_SZ /d "C:\exa mple\myfavorites" /f
args EXACTFOLDER Links "C:\exa mple\mylinks"
md "C:\exa mple\mylinks"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_SZ /d "C:\exa mple\mylinks" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}" /t REG_EXPAND_SZ /d "C:\exa mple\mylinks" /f
args EXACTFOLDER Music "C:\exa mple\mymusic"
md "C:\exa mple\mymusic"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_SZ /d "C:\exa mple\mymusic" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4BD8D571-6D19-48D3-BE97-422220080E43}" /t REG_EXPAND_SZ /d "C:\exa mple\mymusic" /f
args EXACTFOLDER Pictures "C:\exa mple\mypictures"
md "C:\exa mple\mypictures"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_SZ /d "C:\exa mple\mypictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{33E28130-4E1E-4676-835A-98395C3BC3BB}" /t REG_EXPAND_SZ /d "C:\exa mple\mypictures" /f
args EXACTFOLDER SavedGames "C:\exa mple\mysavedgames"
md "C:\exa mple\mysavedgames"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\exa mple\mysavedgames" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "C:\exa mple\mysavedgames" /f
args EXACTFOLDER Searches "C:\exa mple\mysearches"
md "C:\exa mple\mysearches"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_SZ /d "C:\exa mple\mysearches" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{98ec0e18-2098-4d44-8644-66979315a281}" /t REG_EXPAND_SZ /d "C:\exa mple\mysearches" /f
args EXACTFOLDER Videos "C:\exa mple\myvideos"
md "C:\exa mple\myvideos"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_SZ /d "C:\exa mple\myvideos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{18989B1D-99B5-455B-841C-AB7C74E4DDFC}" /t REG_EXPAND_SZ /d "C:\exa mple\myvideos" /f

GoTo :EFO