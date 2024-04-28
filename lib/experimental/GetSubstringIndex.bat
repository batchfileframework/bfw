@echo off

:setup


:main

call :GetSubstringIndex-demo
GoTo :EOF

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
if "[%~n0]" EQU "[bfw]" ( Call :ShiftedArgumentCaller %* ) else ( Call :%~n0 %* )

:end


GoTo :EOF

:EchoWithoutNewline
echo|set /p="%*"
GoTo :EOF

:GetSubstringIndex-demo
set counter=0
:GetSubstringIndex-demo-loop
call :EchoWithoutNewline set testvar[%counter%]=
for /L %%a in (1,1,%counter%) do ( call :EchoWithoutNewline F )
call :EchoWithoutNewline TEST
set /a remaining=96-%counter%
for /L %%a in (1,1,%remaining%) do ( call :EchoWithoutNewline F )
echo.
set /a counter+=1
if %counter% LEQ 100 GoTo :GetSubstringIndex-demo-loop

goto :eof

set testvar[0]=TESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[1]=FTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[2]=FFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[3]=FFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[4]=FFFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[5]=FFFFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[6]=FFFFFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[7]=FFFFFFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[8]=FFFFFFFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar[9]=FFFFFFFFFTESTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
set testvar.ubound=9


GoTo :EOF

::Usage Call :GetSubstringIndex StartIndex InputString SearchString  ... StartIndexN InputStringN SearchStringN
:GetSubstringIndex






mystring
searchstring

startindex

mystring.len
searchstring.len

searchable.len = mystring.len -  startindex

region.start = startindex
region.middle = startindex+(searchable.len / 2)
region.end mystring.len

:loop
search string in region.start to region.middle 
	if found (if region.middle - region.start = searchstring.len goto exit)
	if found (set region.start=region.start region.end=region.middle region.middle=(region.end-region.start)/2 & goto loop )
search string in region.middle to region.end
	if found (if region.middle - region.start = searchstring.len goto exit)
	if found (set region.start=region.start region.end=region.middle region.middle=(region.end-region.start)/2 & goto loop )

search string in  "startindex to startindex+(searchable.len / 2)" if found set region.start/.end  goto found
search string in  "startindex+(searchable.len / 2) mystring.len to " if found set region.start/.end goto found
still not found , goto notfound

:found

:notfound

:exit


(mystring.len /2 +searchstring.len)

currentstring = get (mystring.len /2 +searchstring.len) of mystring

IsInString ? findstr /I of 





ALT
FFFF
FALTF
FALT

::Usage Call :SubstringIndex InputString SearchString optional StartIndex=0
:SubstringIndex
set "_SubstringIndex_prefix=_SI"
set "_SI_Input=%~1"
set "_SI_Search=%~2"
if "[%~3]" NEQ "[]" ( set /a _SI_StartIndex=%~3 ) else ( set /a _SI_StartIndex=0 )

set /a _SI_Start=
set /a _SI_Middle=
set /a _SI_End=

:SubstringIndex-loop



call clearvar %_SubstringIndex_prefix% _SubstringIndex_prefix

