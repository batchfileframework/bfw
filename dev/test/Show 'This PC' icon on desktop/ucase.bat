
:ucase
:lcase
REM :split

::Usage Call :join OutputString InputString1 InputString2 InputString3 InputStringN
:join
setlocal enabledelayedexpansion
set _join_output=%~1
set _join_intermediate=!%~1!
:join-setup
if "[%~2]"=="[joindelimiter]" ( set "_join_delimiter=%~3" & shift & shift & GoTo :join-setup )
if "[%~2]"=="[joincleardelimiter]" ( set "_join_delimiter=" & shift & GoTo :join-setup )
if defined %~2 ( 
		set _join_string=!%~2!
	) else ( 
		set _join_string=%~2
	)
if "[!_join_intermediate!]"=="[]" (
	set _join_intermediate=!_join_string!
) else (
	set _join_intermediate=!_join_intermediate!!_join_delimiter!!_join_string!
)
if "[%~3]" NEQ "[]" shift & GoTo :join-setup
endlocal & set %_join_output%=%_join_intermediate%
GoTo :EOF

