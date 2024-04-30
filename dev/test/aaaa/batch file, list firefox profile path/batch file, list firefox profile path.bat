@echo off
set "firefoxProfilePaths="

for /D %%i in (C:\Users\%username%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release) do (
    if not defined firefoxProfilePaths (
        set "firefoxProfilePaths=%%i"
    ) else (
        set "firefoxProfilePaths=!firefoxProfilePaths!;%%i"
    )
)

echo Firefox profile paths: %firefoxProfilePaths%