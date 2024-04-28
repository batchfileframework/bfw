
::Usage Call :AddArrayElement InputElement OutputArray OutputIndex
:AddArrayElement
Call :ClearVariablesByPrefix _AddArrayElement
set "_AddArrayElement_InputElement=%~1"
set "_AddArrayElement_OutputArray=%~2"
set "_AddArrayElement_OutputIndex=%~3"
call set /a "_AddArrayElement_OutputUbound=%%%_AddArrayElement_OutputArray%.ubound%%"
REM Start loop at OutputArray ubound and then work my way back until OutputIndex
call set /a _AddArrayElement_OutputArray.index=%%%_AddArrayElement_OutputArray%.ubound%%
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
set /a %_AddArrayElement_OutputArray%.ubound+=1
set /a %_AddArrayElement_OutputArray%.count+=1
if "[%_AddArrayElement_OutputIndex%]"=="[]" set /a _AddArrayElement_OutputIndex=%_AddArrayElement_OutputUbound% + 1
if %_AddArrayElement_OutputIndex% GEQ %_AddArrayElement_OutputUbound% GoTo :AddArrayElement-OutputArray-loop-skip
:AddArrayElement-OutputArray-loop
REM Move value to the next index, for every position in the array until OutputIndex
REM echo moving %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%] 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.index%]=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputArray.nextindex%]%%=%%b"
)
set /a _AddArrayElement_OutputArray.index-=1
set /a _AddArrayElement_OutputArray.nextindex=%_AddArrayElement_OutputArray.index% + 1
if %_AddArrayElement_OutputArray.index% GEQ %_AddArrayElement_OutputIndex% GoTo :AddArrayElement-OutputArray-loop
:AddArrayElement-OutputArray-loop-skip
REM Clear the destination index of the OutputArray
REM call echo Clearing %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] %%%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%].PackageFullName%%
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%] 2^>NUL') do (
	set "%%a="
)
REM Copy InputElement into the destination index of the OutputArray
for /F "tokens=1* delims==" %%a in ('set %_AddArrayElement_InputElement% 2^>NUL') do (
	call set "_token=%%a"
	REM call :FORIF "[%%_token%%]"=="[%%_tokensubst%%]" && echo it was same || echo it was not same
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo %%_token%%=%%b
	REM call :FORIF "[%%_token%%]"=="[%%_token:.PackageFullName=%%]" || call echo "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
	call set "%%_token:%_AddArrayElement_InputElement%=%_AddArrayElement_OutputArray%[%_AddArrayElement_OutputIndex%]%%=%%b"
)
GoTo :EOF

