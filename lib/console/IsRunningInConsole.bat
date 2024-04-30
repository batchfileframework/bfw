
REM The function
:IsRunningInConsole
Set "CleanedCMD=%cmdcmdline:"=_%"
Set IsRunningInConsole=false & if "%CleanedCMD:cmd.exe=%" == "%CleanedCMD%" ( Set IsRunningInConsole=true)
goto :eof