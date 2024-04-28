
:: Usage Call :GetOptionalFeatures optional FeaturesArrayName
:GetOptionalFeatures
Call :ClearVariablesByPrefix  _GetOptionalFeatures
set "_GetOptionalFeatures_FeaturesArrayName=%~1"
if "[%_GetOptionalFeatures_FeaturesArrayName%]"=="[]" set "_GetOptionalFeatures_FeaturesArrayName=OptionalFeatures"
call set "_GetOptionalFeatures_FeaturesArrayName.lbound=%%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%
call set "_GetOptionalFeatures_FeaturesArrayName.ubound=%%%_GetOptionalFeatures_FeaturesArrayName%.ubound%%
Call :IsNumeric "%_GetOptionalFeatures_FeaturesArrayName.lbound%" && set /a %_GetOptionalFeatures_FeaturesArrayName%.lbound=0
Call :IsNumeric "%_GetOptionalFeatures_FeaturesArrayName.ubound%" && set /a %_GetOptionalFeatures_FeaturesArrayName%.ubound=-1


set /a _GetOptionalFeatures_TempArray.index=-1
for /f "tokens=1* delims=:" %%a in ('dism /online /get-features') do (
call set /a _GetOptionalFeatures_TempArray.index+=1
REM call echo index %%_GetOptionalFeatures_TempArray.index%% %%a %%b
if not "[%%a]"=="[]" call set "_GetOptionalFeatures_TempArray[%%_GetOptionalFeatures_TempArray.index%%].1=%%a"
if not "[%%b]"=="[]" call set "_GetOptionalFeatures_TempArray[%%_GetOptionalFeatures_TempArray.index%%].2=%%b"
)
set /a _GetOptionalFeatures_TempArray.lbound=0
set /a "_GetOptionalFeatures_TempArray.ubound=%_GetOptionalFeatures_TempArray.index%"

REM set _GetOptionalFeatures_TempArray

set /a _GetOptionalFeatures_TempArray.index=0
:GetOptionalFeatures-temp-array-loop
call :trim "%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1%%" _GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1
call :trim "%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%" _GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2
set /a _GetOptionalFeatures_TempArray.index+=1
if %_GetOptionalFeatures_TempArray.index% LEQ %_GetOptionalFeatures_TempArray.ubound% GoTo :GetOptionalFeatures-temp-array-loop
set /a _GetOptionalFeatures_TempArray.index=0
:GetOptionalFeatures-temp-array-loop-2
REM call echo %_GetOptionalFeatures_TempArray.index% UU%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1%%UU FF%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%FF
set /a _GetOptionalFeatures_TempArray.index+=1
if %_GetOptionalFeatures_TempArray.index% LEQ %_GetOptionalFeatures_TempArray.ubound% GoTo :GetOptionalFeatures-temp-array-loop-2
set /a _GetOptionalFeatures_TempArray.index=-1
:GetOptionalFeatures-temp-array-loop-3
call set "_GetOptionalFeatures_TempArray.current.1=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].1%%"
call set "_GetOptionalFeatures_TempArray.current.2=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
set "_GetOptionalFeatures.Property="
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Deployment Image Servicing and Management tool]" set "_GetOptionalFeatures.Property=ignore"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[The operation completed successfully.]" set "_GetOptionalFeatures.Property=ignore"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Version]" set "_GetOptionalFeatures.Property=dismversion"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Image Version]" set "_GetOptionalFeatures.Property=imageversion"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Features listing for package]" set "_GetOptionalFeatures.Property=packagename"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[Feature Name]" set "_GetOptionalFeatures.Property=name"
if "[%_GetOptionalFeatures_TempArray.current.1%]"=="[State]" set "_GetOptionalFeatures.Property=state"
if "[%_GetOptionalFeatures.Property%]"=="[]" echo unknown property found %_GetOptionalFeatures_TempArray.current.1%+++%_GetOptionalFeatures_TempArray.current.2%
if "[%_GetOptionalFeatures.Property%]"=="[dismversion]" call set %_GetOptionalFeatures_FeaturesArrayName%.dismversion=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
if "[%_GetOptionalFeatures.Property%]"=="[imageversion]" call set %_GetOptionalFeatures_FeaturesArrayName%.imageversion=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
if "[%_GetOptionalFeatures.Property%]"=="[packagename]" call set %_GetOptionalFeatures_FeaturesArrayName%.packagename=%%_GetOptionalFeatures_TempArray[%_GetOptionalFeatures_TempArray.index%].2%%"
if "[%_GetOptionalFeatures.Property%]"=="[name]" set /a _GetOptionalFeatures_FeaturesArrayName.ubound+=1
if "[%_GetOptionalFeatures.Property%]"=="[name]" set "%_GetOptionalFeatures_FeaturesArrayName%[%_GetOptionalFeatures_FeaturesArrayName.ubound%].name=%_GetOptionalFeatures_TempArray.current.2%"
if "[%_GetOptionalFeatures.Property%]"=="[state]" set "%_GetOptionalFeatures_FeaturesArrayName%[%_GetOptionalFeatures_FeaturesArrayName.ubound%].state=%_GetOptionalFeatures_TempArray.current.2%"
REM set "_GetOptionalFeatures.LastProperty=%_GetOptionalFeatures.Property%"
set /a _GetOptionalFeatures_TempArray.index+=1
if %_GetOptionalFeatures_TempArray.index% LEQ %_GetOptionalFeatures_TempArray.ubound% GoTo :GetOptionalFeatures-temp-array-loop-3

REM call echo 1 set /a %_GetOptionalFeatures_FeaturesArrayName%.lbound=%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%
REM call set /a %_GetOptionalFeatures_FeaturesArrayName%.lbound=%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%
echo 2 set /a %_GetOptionalFeatures_FeaturesArrayName%.ubound=%_GetOptionalFeatures_FeaturesArrayName.ubound%
set /a %_GetOptionalFeatures_FeaturesArrayName%.ubound=%_GetOptionalFeatures_FeaturesArrayName.ubound%
call echo call set /a %_GetOptionalFeatures_FeaturesArrayName%.count=%%%_GetOptionalFeatures_FeaturesArrayName%.ubound%%-%%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%+1
call set /a %_GetOptionalFeatures_FeaturesArrayName%.count=%%%_GetOptionalFeatures_FeaturesArrayName%.ubound%%-%%%_GetOptionalFeatures_FeaturesArrayName%.lbound%%+1
Call :ClearVariablesByPrefix  _GetOptionalFeatures_TempArray
Call :ClearVariablesByPrefix  _GetOptionalFeatures
GoTo :EOF

