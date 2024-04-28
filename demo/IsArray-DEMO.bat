@echo off

:setup
:main

Call :IsArray-DEMO

GoTo :EOF

:IsArray-DEMO

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

set IsAnArray1.lbound=0
set IsAnArray2.ubound=666
set IsAnArray3.datatype=array
set IsAnArray4=test
set IsAnArray4[666]=test
set IsAnArray5[666][123]=test
set IsAnArray6[666][123][456]=test

echo.&echo Testing function Call :IsArray ArrayName optional Output  With the optional output&echo.

set myoutput=
Call :IsArray NotAnObject myoutput
echo IsArray NotAnObject ? %myoutput%& set myoutput=
Call :IsArray IsAnotherObject myoutput
echo IsArray IsAnotherObject ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject1 myoutput
echo IsArray IsNotStrictlyAnObject1 ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject2 myoutput
echo IsArray IsNotStrictlyAnObject2 ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject3 myoutput
echo IsArray IsNotStrictlyAnObject3 ? %myoutput%& set myoutput=
Call :IsArray IsNotStrictlyAnObject4 myoutput
echo IsArray IsNotStrictlyAnObject4 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray1 myoutput
echo IsArray IsAnArray1 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray2 myoutput
echo IsArray IsAnArray2 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray3 myoutput
echo IsArray IsAnArray3 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray4 myoutput
echo IsArray IsAnArray4 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray5 myoutput
echo IsArray IsAnArray5 ? %myoutput%& set myoutput=
Call :IsArray IsAnArray6 myoutput
echo IsArray IsAnArray6 ? %myoutput%& set myoutput=

echo.&echo Testing function Call :IsArray ArrayName optional Output  Without the optional output, using return value&echo.

Call :IsArray NotAnObject && echo NotAnObject is an array || echo NotAnObject is not array 
Call :IsArray IsAnotherObject && echo IsAnotherObject is an array || echo IsAnotherObject is not array 
Call :IsArray IsNotStrictlyAnObject1 && echo IsNotStrictlyAnObject1 is an array || echo IsNotStrictlyAnObject1 is not array 
Call :IsArray IsNotStrictlyAnObject2 && echo IsNotStrictlyAnObject2 is an array || echo IsNotStrictlyAnObject2 is not array 
Call :IsArray IsNotStrictlyAnObject3 && echo IsNotStrictlyAnObject3 is an array || echo IsNotStrictlyAnObject3 is not array 
Call :IsArray IsNotStrictlyAnObject4 && echo IsNotStrictlyAnObject4 is an array || echo IsNotStrictlyAnObject4 is not array 
Call :IsArray IsAnArray1 && echo IsAnArray1 is an array || echo IsAnArray1 is not array 
Call :IsArray IsAnArray2 && echo IsAnArray2 is an array || echo IsAnArray2 is not array 
Call :IsArray IsAnArray3 && echo IsAnArray3 is an array || echo IsAnArray3 is not array 
Call :IsArray IsAnArray4 && echo IsAnArray4 is an array || echo IsAnArray4 is not array 
Call :IsArray IsAnArray5 && echo IsAnArray5 is an array || echo IsAnArray5 is not array 
Call :IsArray IsAnArray6 && echo IsAnArray6 is an array || echo IsAnArray6 is not array 

GoTo :EOF




::Usage :IsArray ArrayName optional output
:IsArray
set /a "_IsArray=1"
if defined %~1.lbound ( set /a "_IsArray=0" & GoTo :IsArray-end )
if defined %~1.ubound ( set /a "_IsArray=0" & GoTo :IsArray-end )
if defined %~1.datatype call set "_IsArray_datatype=%%%~1.datatype%%"
if "[%_IsArray_datatype%]" EQU "[array]" ( set /a "_IsArray=0" & GoTo :IsArray-end )
for /f "tokens=1,2* delims==" %%a in ('set %~1 2^>nul') do  (
	if "[%%a]" NEQ "[%~1]" (
							setlocal enabledelayedexpansion
							set _IsArray_buffer=%%a
							set _IsArray_buffer=!_IsArray_buffer:%~1=!
							set _IsArray_buffer=!_IsArray_buffer:~,1!
							if "[!_IsArray_buffer!]" EQU "[[]" ( endlocal & set /a "_IsArray=0" & GoTo :IsArray-end )
							endlocal
							)
	)
:IsArray-end
if "[%~2]" NEQ "[]" if "[%_IsArray%]" EQU "[0]" ( set "%~2=true" ) else ( set "%~2=false" )
set "IsArray=" & set "_IsArray_datatype=" & exit /b %_IsArray%