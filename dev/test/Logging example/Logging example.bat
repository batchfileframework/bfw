@echo off
REM Logging batch file scaffold

:setup
set STDOUTLOGFILE=output.log
set STDERRLOGFILE=error.log

:main 

echo deleting log files
REM Add IF exist (if defined if exist ?)
del %STDOUTLOGFILE%
del %STDERRLOGFILE%

echo manual time stamp
echo manual time stamp 1>> %STDOUTLOGFILE%
echo manual time stamp 1>> %STDERRLOGFILE%
echo %DATE% %TIME% 1>> %STDOUTLOGFILE%
echo %DATE% %TIME% 1>> %STDERRLOGFILE%
REM works

echo test output to log files
echo test output to log files 1>> %STDOUTLOGFILE%
echo test output to log files 1>> %STDERRLOGFILE%
echo %DATE% %TIME% 1>> %STDOUTLOGFILE%
echo %DATE% %TIME% 1>> %STDERRLOGFILE%
powershell.exe -Command Write-Host "Message 1 on console"
powershell.exe -Command Write-Host "Message 1 on standard output" 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE%
powershell.exe -command "Write-Error 'Message 1 on error output'" 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE%

echo test timestamp function
echo test timestamp function 1>> %STDOUTLOGFILE%
echo test timestamp function 1>> %STDERRLOGFILE%
Call :TimeStampLogs

echo test output with inline timestamps
echo test output with inline timestamps 1>> %STDOUTLOGFILE%
echo test output with inline timestamps 1>> %STDERRLOGFILE%
powershell.exe -Command Write-Host "Message 2 on console"
powershell.exe -Command Write-Host "Message 2 on standard output" 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE% & echo %DATE% %TIME% 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE%
powershell.exe -command "Write-Error 'Message 2 on error output'" 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE% & echo %DATE% %TIME% 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE%
Call :TimeStampLogs

echo testing "logger" facility
echo testing "logger" facility 1>> %STDOUTLOGFILE%
echo testing "logger" facility 1>> %STDERRLOGFILE%
Set "Logger= 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE%"
Call :TimeStampLogs
powershell.exe -Command Write-Host "Message 3 on console"
powershell.exe -Command Write-Host "Message 3 on standard output" %Logger%
powershell.exe -command "Write-Error 'Message 3 on error output'" %Logger%


echo testing disabling logger facility
echo testing disabling logger facility 1>> %STDOUTLOGFILE%
echo testing disabling logger facility 1>> %STDERRLOGFILE%
Call :MessageToLogsADV "11testing disabling logger facility using messagetologsadv"
REM Disable logging
Set Logger=
Call :TimeStampLogs
powershell.exe -Command Write-Host "Message 4 on console"
powershell.exe -Command Write-Host "Message 4 on standard output" %Logger%
powershell.exe -command "Write-Error 'Message 4 on error output'" %Logger%


echo testing "logger" facility
echo testing "logger" facility 1>> %STDOUTLOGFILE%
echo testing "logger" facility 1>> %STDERRLOGFILE%
call :EnableLogging
Call :TimeStampLogs
powershell.exe -Command Write-Host "Message 5 on console" %Logger%
powershell.exe -Command Write-Host "Message 5 on standard output" %Logger%
powershell.exe -command "Write-Error 'Message 5 on error output'" %Logger%


echo testing disabling logger facility
echo testing disabling logger facility 1>> %STDOUTLOGFILE%
echo testing disabling logger facility 1>> %STDERRLOGFILE%
Call :MessageToLogsADV "22testing disabling logger facility using messagetologsadv" NoTimeStamp
REM Disable logging
call :DisableLogging
Call :TimeStampLogs
powershell.exe -Command Write-Host "Message 6 on console" %Logger%
powershell.exe -Command Write-Host "Message 6 on standard output" %Logger%
powershell.exe -command "Write-Error 'Message 6 on error output'" %Logger%





REM call :logcmd dir

:end
GoTo :EOF

::FUNCTIONS
REM logcmd function doesn't work
:logcmd 
powershell -Command "Start-Transcript -Path output.log -Append; Get-Date -Format 'yyyy-MM-dd HH:mm:ss'; %1 2>&1 | Tee-Object -FilePath output.log -Append | ForEach-Object { Write-Host ('[{0}] ' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')) + $_; $_ } 1>>output.log 2>>error.log; Stop-Transcript" 2>>error.log
goto :eof

:TimeStampLogs
set timestamp=%DATE% %TIME%
if not "%quiet%"=="true" echo %timestamp%
if not defined logger GoTo :EOF
echo timestamlong running
echo %timestamp% 1>> %STDOUTLOGFILE%
echo %timestamp% 1>> %STDERRLOGFILE%
echo timestamlong ending
GoTo :EOF

:EnableLogging
Set "Logger= 1>> %STDOUTLOGFILE% 2>> %STDERRLOGFILE%"
GoTo :EOF

:DisableLogging
Set Logger=
GoTo :EOF

:MessageToLogs
echo %1
echo %1 1>> %STDOUTLOGFILE%
echo %1 1>> %STDERRLOGFILE%
GoTo :EOF

:MessageToLogsTimeStamped
echo %DATE% %TIME% %1
echo %DATE% %TIME% %1 1>> %STDOUTLOGFILE%
echo %DATE% %TIME% %1 1>> %STDERRLOGFILE%
GoTo :EOF

:MessageToSTDOUTTimeStamped
echo %DATE% %TIME% %1
echo %DATE% %TIME% %1 1>> %STDOUTLOGFILE%
GoTo :EOF

:MessageToSTDERRTimeStamped
echo %DATE% %TIME% %1
echo%DATE% %TIME%  %1 1>> %STDERRLOGFILE%
GoTo :EOF

REM Usage :MessageToLogsADV "your message" Silent|NoTimeStamp|NoErr|NoStd
:MessageToLogsADV
set "_MessageToLogsADVMessage=%~1"
set _MessageToLogsADVParam=empty
if not "%~2" == "" set _MessageToLogsADVParam=%2
setlocal
if [%_MessageToLogsADVParam%]==[%_MessageToLogsADVParam:NoTimeStamp=%] set "_MessageToLogsADVMessage=%DATE% %TIME% %_MessageToLogsADVMessage%"
if not [%_MessageToLogsADVParam%]==[%_MessageToLogsADVParam:Silent=%] echo _MessageToLogsADVMessage
if not [%_MessageToLogsADVParam%]==[%_MessageToLogsADVParam:NoStd=%] echo _MessageToLogsADVMessage  1>> %STDOUTLOGFILE%
if not [%_MessageToLogsADVParam%]==[%_MessageToLogsADVParam:NoErr=%] echo _MessageToLogsADVMessage  1>> %STDERRLOGFILE%
endlocal
GoTo :EOF