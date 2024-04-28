@echo off
:setup
:main

GoTo :AppendToPathDEMO
:AppendToPathDEMO

set silent=true

echo User path test
echo.
Call :ShowUserPath
echo.
Call :AddFolderToUserPath x:\path\to\folder
echo.
Call :ShowUserPath
echo.
Call :RemoveFolderFromUserPath x:\path\to\folder
echo.
Call :ShowUserPath
echo.

echo System path test

echo.
Call :ShowSystemPath
echo.
Call :AddFolderToSystemPath x:\path\to\folder
echo.
Call :ShowSystemPath
echo.
Call :RemoveFolderFromSystemPath x:\path\to\folder
echo.
Call :ShowSystemPath

GoTo :END
:END
GoTo :EOF 

::Usage Call :ShowUserPath
:ShowUserPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :ShowSystemPath
:ShowSystemPath
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" echo Current system path variable is : %%c
GoTo :EOF

::Usage Call :AddFolderToUserPath x:\path\to\folder
:AddFolderToUserPath
set CurrentUserPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" set CurrentUserPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentUserPath:%NewPath%=%%
if "%CurrentUserPath%"=="%FilteredPath%" echo Adding : %NewPath% to current user path : %CurrentUserPath%
if "%CurrentUserPath%"=="%FilteredPath%" setx Path "%CurrentUserPath%%NewPath%"
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :AddFolderToSystemPath x:\path\to\folder (requires admin privileges)
:AddFolderToSystemPath
set CurrentSystemPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" set CurrentSystemPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentSystemPath:%NewPath%=%%
if "%CurrentSystemPath%"=="%FilteredPath%" echo Adding : %NewPath% to current user path : %CurrentSystemPath%
if "%CurrentSystemPath%"=="%FilteredPath%" setx Path "%CurrentSystemPath%%NewPath%" /m
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :RemoveFolderFromUserPath x:\path\to\folder
:RemoveFolderFromUserPath
set CurrentUserPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" set CurrentUserPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentUserPath:%NewPath%=%%
if not "%CurrentUserPath%"=="%FilteredPath%" echo Removing : %NewPath% from current user path : %CurrentUserPath%
if not "%CurrentUserPath%"=="%FilteredPath%" setx Path "%FilteredPath%"
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKCU\Environment"') do if "[%%a]"=="[Path]" echo Current user path variable is : %%c
GoTo :EOF

::Usage Call :RemoveFolderFromSystemPath x:\path\to\folder (requires admin privileges)
:RemoveFolderFromSystemPath
set CurrentSystemPath= & set FilteredPath= & set NewPath=
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" set CurrentSystemPath=%%c
set NewPath=%~1;
call set FilteredPath=%%CurrentSystemPath:%NewPath%=%%
if not "%CurrentSystemPath%"=="%FilteredPath%" echo Removing : %NewPath% from current system path : %CurrentSystemPath%
if not "%CurrentSystemPath%"=="%FilteredPath%" setx Path "%FilteredPath%" /m
if not "[%silent%]"=="[true]" echo.
if not "[%silent%]"=="[true]" for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"') do if "[%%a]"=="[Path]" echo Current system path variable is : %%c
GoTo :EOF
