@echo off

echo.
for /f "tokens=1,2,3,4,* skip=3 delims=: " %%a in ('powercfg /list') do ( 
	if "[%%a %%b %%c]" EQU "[Power Scheme GUID]" (
		for /f "tokens=1,* delims=()" %%f in ("%%e") do (
			if "[%%g]" EQU "[ *]" ( set "_powercfglist_default=This is the default scheme" ) else ( set "_powercfglist_default=" )
			setlocal enabledelayedexpansion
				echo Power Scheme Name : %%f GUID : %%d !_powercfglist_default!
			endlocal
			)
		echo.
		)
	)
