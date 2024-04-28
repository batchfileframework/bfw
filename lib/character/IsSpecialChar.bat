
::Usage Call :IsSpecialChar byref InputString
:IsSpecialChar
setlocal EnableDelayedExpansion
	(set^ tmp=!%~1!)
	REM for %%a in (^^ ^> ^< ^& ^| %% ^") do ( echo %%a )
	for %%a in (^^ ^> ^< ^& ^| %% ^") do ( if "!tmp:%%a=!" NEQ "!tmp!" ( set "_IsSpecialChar_found=true" ) )
endlocal & set _IsSpecialChar_found=%_IsSpecialChar_found%
if not "[%~2]"=="[]" if "[%_IsSpecialChar_found%]"=="[true]" ( set "%~2=true" ) else ( set "%~2=false" )
if "[%_IsSpecialChar_found%]"=="[true]" ( set /a "_IsSpecialChar_found=0" ) else ( set "_IsSpecialChar_found=1" )
set "_IsSpecialChar_found=" & exit /b %_IsSpecialChar_found%

