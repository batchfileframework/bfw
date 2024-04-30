
REM TODO MAKE VERSION THAT OUTPUTS TO ARRAY OR FILE
REM This function takes elements numbers from ElementsArray
REM Then it retrieves those elements from the ReferenceArray (with suffix, if provided)
REM And outputs them to OutputArray
REM Elements are appended to OutputArray starting from OutputArray.ubound
REM Suffixes are defined with _DerefArrayReferenceSuffix, space separated for multiple elements
REM The suffixes will be used on the output array unless overriden by _DerefArrayOutputSuffix
REM The suffix NOSUFFIX has the special meaning of an empty suffix
::Usage Call :DereferenceArrayToArray ElementsArray ReferenceArray OutputArray
:DereferenceArrayToArray
if "[%~1]"=="[]" GoTo :EOF
if "[%~2]"=="[]" GoTo :EOF
if "[%~3]"=="[]" GoTo :EOF
set "_DerefArrayElementsArray=%~1" & set "_DerefArrayReferenceArray=%~2" & set "_DerefArrayOutputArray=%~3"
REM call echo call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
call set /a _DerefArrayElementsArray.ubound=%%%_DerefArrayElementsArray%.ubound%%
if not "[%_DerefArrayReferenceSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayReferenceSuffix%" _DerefArrayReferenceSuffix
if not "[%_DerefArrayOutputSuffix%]"=="[]" Call :Deconcatenate " " "%_DerefArrayOutputSuffix%" _DerefArrayOutputSuffix
if "[%_DerefArrayReferenceSuffix.ubound%]"=="[]" set /a _DerefArrayReferenceSuffix.ubound=0
REM Set _DerefArrayOutput's index to OutputArray's .ubound+1, if any, or else set to zero
set _DerefArrayOutput.index=%_DerefArrayOutputArray.ubound%
if not "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index+=1
if "[%_DerefArrayOutput.index%]"=="[]" set /a _DerefArrayOutput.index=0
set /a _DerefArrayElements.index=0
:DereferenceArrayToArray-output-loop
set /a _DerefArraySuffix.index=0
:DereferenceArrayToArray-suffix-loop
REM if %_DerefArrayElements.index% LEQ 0 call  echo %_DerefArrayReferenceSuffix[0]% %_DerefArrayReferenceSuffix% %_DerefArraySuffix.index% 
call set "_DerefArrayReferenceSuffix=%%_DerefArrayReferenceSuffix[%_DerefArraySuffix.index%]%%"
call set "_DerefArrayOutputSuffix=%%_DerefArrayOutputSuffix[%_DerefArraySuffix.index%]%%"
if "[%_DerefArrayReferenceSuffix%]"=="[NOSUFFIX]" set _DerefArrayReferenceSuffix=
if "[%_DerefArrayOutputSuffix%]"=="[]" set "_DerefArrayOutputSuffix=%_DerefArrayReferenceSuffix%"
if "[%_DerefArrayOutputSuffix%]"=="[NOSUFFIX]" set _DerefArrayOutputSuffix=
REM if %_DerefArrayElements.index%==0 echo ref-suffix "%_DerefArrayReferenceSuffix%" out-suffix "%_DerefArrayOutputSuffix%"
REM call call echo %%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%% %_DerefArrayReferenceSuffix%
call call set %_DerefArrayOutputArray%[%_DerefArrayOutput.index%]%_DerefArrayOutputSuffix%=%%%%%_DerefArrayReferenceArray%[%%%_DerefArrayElementsArray%[%_DerefArrayElements.index%]%%]%_DerefArrayReferenceSuffix%%%%%
set %_DerefArrayOutputArray%.ubound=%_DerefArrayOutput.index%
set /a _DerefArraySuffix.index+=1
REM echo _DerefArrayReferenceSuffix.ubound is %_DerefArrayReferenceSuffix.ubound%
REM echo if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
REM if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% echo doing another suffix !
if %_DerefArraySuffix.index% LEQ %_DerefArrayReferenceSuffix.ubound% GoTo :DereferenceArrayToArray-suffix-loop
set /a _DerefArrayOutput.index+=1
set /a _DerefArrayElements.index+=1
if %_DerefArrayElements.index% LEQ %_DerefArrayElementsArray.ubound% GoTo :DereferenceArrayToArray-output-loop
REM Call :ClearVariablesByPrefix _DerefArray
REM set _DerefArray
GoTo :EOF

