@echo off

:setup
:main

Call :IsObject-DEMO
Call :IsObjectStrict-DEMO

GoTo :EOF


:IsObject-DEMO

set NotAnObject=test

set IsAnObject=test
set IsAnObject.suffixA=test
set IsAnObject.suffixB=test
set IsAnObject.suffixC=test

set IsAnotherObject.suffixA=test
set IsAnotherObject.suffixB=test
set IsAnotherObject.suffixC=test

echo.&echo Testing function Call :IsObject ObjectName optional Output  With the optional output&echo.

set myoutput=
Call :IsObject NotAnObject myoutput
echo IsObject NotAnObject ? %myoutput%
set myoutput=
Call :IsObject IsAnObject myoutput
echo IsObject IsAnObject ? %myoutput%
set myoutput=
Call :IsObject IsAnotherObject myoutput
echo IsObject IsAnotherObject ? %myoutput%
set myoutput=

echo.&echo Testing function Call :IsObject ObjectName optional Output  Without the optional output, using return value&echo.

Call :IsObject NotAnObject && echo NotAnObject is an object || echo NotAnObject is not object 
Call :IsObject IsAnObject && echo IsAnObject is an object || echo IsAnObject is not object 
Call :IsObject IsAnotherObject && echo IsAnotherObject is an object || echo IsAnotherObject is not object 

GoTo :EOF

:IsObjectStrict-DEMO

set NotAnObject=test

set IsAnObject=test
set IsAnObject.suffixA=test
set IsAnObject.suffixB=test
set IsAnObject.suffixC=test

set IsAnotherObject.suffixA=test
set IsAnotherObject.suffixB=test
set IsAnotherObject.suffixC=test

set IsNotStrictlyAnObject1=test
set IsNotStrictlyAnObject1[42]=test

set IsNotStrictlyAnObject2=test
set IsNotStrictlyAnObject2Extra=test

set IsNotStrictlyAnObject3[42]=test

set IsNotStrictlyAnObject4Extra=test

echo.&echo Testing function Call :IsObjectStrict ObjectName optional Output  With the optional output&echo.

set myoutput=
Call :IsObjectStrict NotAnObject myoutput
echo IsObjectStrict NotAnObject ? %myoutput%
set myoutput=
Call :IsObjectStrict IsAnObject myoutput
echo IsObjectStrict IsAnObject ? %myoutput%
set myoutput=
Call :IsObjectStrict IsAnotherObject myoutput
echo IsObjectStrict IsAnotherObject ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject1 myoutput
echo IsObjectStrict IsNotStrictlyAnObject1 ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject2 myoutput
echo IsObjectStrict IsNotStrictlyAnObject2 ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject3 myoutput
echo IsObjectStrict IsNotStrictlyAnObject3 ? %myoutput%
set myoutput=
Call :IsObjectStrict IsNotStrictlyAnObject4 myoutput
echo IsObjectStrict IsNotStrictlyAnObject4 ? %myoutput%
set myoutput=

echo.&echo Testing function Call :IsObjectStrict ObjectName optional Output  Without the optional output, using return value&echo.

Call :IsObjectStrict NotAnObject && echo NotAnObject is an object || echo NotAnObject is not object 
Call :IsObjectStrict IsAnObject && echo IsAnObject is an object || echo IsAnObject is not object 
Call :IsObjectStrict IsAnotherObject && echo IsAnotherObject is an object || echo IsAnotherObject is not object 
Call :IsObjectStrict IsNotStrictlyAnObject1 && echo IsNotStrictlyAnObject1 is an object || echo IsNotStrictlyAnObject1 is not object 
Call :IsObjectStrict IsNotStrictlyAnObject2 && echo IsNotStrictlyAnObject2 is an object || echo IsNotStrictlyAnObject2 is not object 
Call :IsObjectStrict IsNotStrictlyAnObject3 && echo IsNotStrictlyAnObject3 is an object || echo IsNotStrictlyAnObject3 is not object 
Call :IsObjectStrict IsNotStrictlyAnObject4 && echo IsNotStrictlyAnObject4 is an object || echo IsNotStrictlyAnObject4 is not object 

GoTo :EOF

::Usage Call :IsObjectStrict ObjectName optional Output
:IsObjectStrict
set /a "_IsObjectStrict=1"
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do  (
	if "[%%a]" NEQ "[%~1]" (
							setlocal enabledelayedexpansion
							set _IsObjectStrict_buffer=%%a
							set _IsObjectStrict_buffer=!_IsObjectStrict_buffer:%~1=!
							set _IsObjectStrict_buffer=!_IsObjectStrict_buffer:~,1!
							if "[!_IsObjectStrict_buffer!]" EQU "[.]" ( endlocal & set /a "_IsObjectStrict=0" & GoTo :IsObjectStrict-for-exit )
							endlocal
							)
	)

:IsObjectStrict-for-exit
if "[%~2]" NEQ "[]" if "[%_IsObjectStrict%]" EQU "[0]" ( set "%~2=true" ) else ( set "%~2=false"  )
set "_IsObjectStrict=" & exit /b %_IsObjectStrict%


::Usage Call :IsObject ObjectName optional Output
:IsObject
set /a "_IsObject=1"
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do  (
	if "[%%a]" NEQ "[%~1]" ( set /a "_IsObject=0" & GoTo :IsObject-for-exit )
	)
:IsObject-for-exit
if "[%~2]" NEQ "[]" if "[%_IsObject%]" EQU "[0]" ( set "%~2=true" ) else ( set "%~2=false"  )
set "_IsObject=" & exit /b %_IsObject%