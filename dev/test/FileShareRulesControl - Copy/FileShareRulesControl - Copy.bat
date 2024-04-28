@echo off
:setup
set "BatchName=%~n0"
:main



:end

GoTo :EOF
REM Exit /b %returnvalue%

REM Internal Functions


REM Function library


















REM setlocal enabledelayedexpansion

REM set "batch_name=%~n0"

REM REM Extract action, rules group and profile from batch_name or command line parameters
REM set "action=%batch_name:~0,6%"
REM set "rules_group=%batch_name:~6%"
REM set "profile="

REM for %%p in (%*) do (
  REM if "%%p"=="public" (set "profile=!profile! public") else (
  REM if "%%p"=="private" (set "profile=!profile! private") else (
  REM if "%%p"=="domain" (set "profile=!profile! domain") else (
  REM set "action=%%p"
  REM set "rules_group=!rules_group:~0,-7!"
REM ))))
REM if not defined profile set "profile=public private domain"

REM REM Define the rules for each group
REM set "NameResolution_rules=File and Printer Sharing (LLMNR-UDP-Out) File and Printer Sharing (LLMNR-UDP-In)"
REM set "RespondToPings_rules=File and Printer Sharing (Echo Request - ICMPv6-Out) File and Printer Sharing (Echo Request - ICMPv6-In) File and Printer Sharing (Echo Request - ICMPv4-Out) File and Printer Sharing (Echo Request - ICMPv4-In)"
REM set "PrinterSharing_rules=File and Printer Sharing (Spooler Service - RPC-EPMAP) File and Printer Sharing (Spooler Service - RPC)"
REM set "FileSharing_rules=File and Printer Sharing (SMB-Out) File and Printer Sharing (SMB-In)"
REM set "OldFileSharing_rules=File and Printer Sharing (NB-Datagram-Out) File and Printer Sharing (NB-Datagram-In) File and Printer Sharing (NB-Name-Out) File and Printer Sharing (NB-Name-In) File and Printer Sharing (NB-Session-Out) File and Printer Sharing (NB-Session-In)"

REM REM Process the rules
REM for %%p in (%profile%) do (
  REM for %%r in (!%rules_group%_rules!) do (
    REM echo %action%ing %%r on %%p profile...
    REM REM netsh advfirewall firewall set rule name="%%r" profile=%%p new enable=%action:Enable=Yes% %action:Disable=No%
	REM echo netsh advfirewall firewall set rule name="%%r" profile=%%p new enable=%action:Enable=Yes% %action:Disable=No%
  REM )
REM )

REM endlocal
