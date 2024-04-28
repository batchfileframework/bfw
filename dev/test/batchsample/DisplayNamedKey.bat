
::Usage Call :DisplayNameKey NamedKey
:DisplayNamedKey
echo.
Call :GetNamedKey %~1 _DisplayNameKeyOutput
echo Named key : %~1
call echo Current value : %%%~1.Value%% Current named value : %_DisplayNameKeyOutput%
for /f "tokens=1-26 delims=[]=" %%a in ('set %~1.NamedValues[ 2^>nul') do (
REM in other words, find the last two defined token variables
if "[%%z]"=="[]" if not "[%%y]"=="[]" if not "[%%x]"=="[]" echo Named value %%x means %%y 
if "[%%y]"=="[]" if not "[%%x]"=="[]" if not "[%%w]"=="[]" echo Named value %%w means %%x
if "[%%x]"=="[]" if not "[%%w]"=="[]" if not "[%%v]"=="[]" echo Named value %%v means %%w
if "[%%w]"=="[]" if not "[%%v]"=="[]" if not "[%%u]"=="[]" echo Named value %%u means %%v
if "[%%v]"=="[]" if not "[%%u]"=="[]" if not "[%%t]"=="[]" echo Named value %%t means %%u
if "[%%u]"=="[]" if not "[%%t]"=="[]" if not "[%%s]"=="[]" echo Named value %%s means %%t
if "[%%t]"=="[]" if not "[%%s]"=="[]" if not "[%%r]"=="[]" echo Named value %%r means %%s
if "[%%s]"=="[]" if not "[%%r]"=="[]" if not "[%%q]"=="[]" echo Named value %%q means %%r
if "[%%r]"=="[]" if not "[%%q]"=="[]" if not "[%%p]"=="[]" echo Named value %%p means %%q
if "[%%q]"=="[]" if not "[%%p]"=="[]" if not "[%%o]"=="[]" echo Named value %%o means %%p
if "[%%p]"=="[]" if not "[%%o]"=="[]" if not "[%%n]"=="[]" echo Named value %%n means %%o
if "[%%o]"=="[]" if not "[%%n]"=="[]" if not "[%%m]"=="[]" echo Named value %%m means %%n
if "[%%n]"=="[]" if not "[%%m]"=="[]" if not "[%%l]"=="[]" echo Named value %%l means %%m
if "[%%m]"=="[]" if not "[%%l]"=="[]" if not "[%%k]"=="[]" echo Named value %%k means %%l
if "[%%l]"=="[]" if not "[%%k]"=="[]" if not "[%%j]"=="[]" echo Named value %%j means %%k
if "[%%k]"=="[]" if not "[%%j]"=="[]" if not "[%%i]"=="[]" echo Named value %%i means %%j
if "[%%j]"=="[]" if not "[%%i]"=="[]" if not "[%%h]"=="[]" echo Named value %%h means %%i
if "[%%i]"=="[]" if not "[%%h]"=="[]" if not "[%%g]"=="[]" echo Named value %%g means %%h
if "[%%h]"=="[]" if not "[%%g]"=="[]" if not "[%%f]"=="[]" echo Named value %%f means %%g
if "[%%g]"=="[]" if not "[%%f]"=="[]" if not "[%%e]"=="[]" echo Named value %%e means %%f
if "[%%f]"=="[]" if not "[%%e]"=="[]" if not "[%%d]"=="[]" echo Named value %%d means %%e
if "[%%e]"=="[]" if not "[%%d]"=="[]" if not "[%%c]"=="[]" echo Named value %%c means %%d
if "[%%d]"=="[]" if not "[%%c]"=="[]" if not "[%%b]"=="[]" echo Named value %%b means %%c
if "[%%c]"=="[]" if not "[%%b]"=="[]" if not "[%%a]"=="[]" echo Named value %%a means %%b
REM :DisplayNamedKey-for-next-iteration
)
call echo Registery path : %%%~1.key%%
set "_DisplayNameKeyOutput="
GoTo :EOF

