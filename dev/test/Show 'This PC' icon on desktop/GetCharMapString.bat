
::Usage Call :GetCharMapString optional OutputString
:GetCharMapString
if "[%~1]"=="[]" ( set "_GetCharMapString_Output=CharMap" ) else ( set "_GetCharMapString_Output=%~1" )
Call :SetArrayParameters _GetCharMapString_Output "" 0 255 0
:GetCharMapString-loop
cmd /c exit %_GetCharMapString_Output.index%
set _GetCharMapString_Output.value=%_GetCharMapString_Output.value%%=exitcodeascii%
set /a _GetCharMapString_Output.index+=1
if %_GetCharMapString_Output.index% leq %_GetCharMapString_Output.ubound% GoTo :GetCharMapString-loop
set %_GetCharMapString_Output%=%_GetCharMapString_Output.value%
Call :ClearVariablesByPrefix _GetCharMapString
GoTo :EOF


REM ::Usage Call :len InputString OutputResult
REM :: 10X slower for 100 strings
REM :len 
REM set "_len_input=%~1"
REM if not defined _len_input ( set /a "_len=0" GoTo :len-end ) else ( set /a "_len=1" & set /a "_len.index=4096" )
REM :len-loop
REM call set "_len.sample=%%_len_input:~%_len.index%,1%%"
REM if not "[%_len.sample%]"=="[]" set /a "_len+=%_len.index%" & call set "_len_input=%%_len_input:~%_len.index%%%
REM set /a "_len.index/=2"
REM if %_len.index% GTR 0 GoTo :len-loop
REM :len-end
REM set /a "%~2=%_len%"
REM exit /b %_len% & Call :ClearVariablesByPrefix _len

REM ::Usage Call :len "%InputString%" OutputResult
REM :: 5% slower for 100 strings
REM :len
REM set^ _len_input=%~1
REM if not defined _len_input set /a "_len=0" GoTo :len-end
REM set /a "_len=1"
REM if "%_len_input:~4096,1%" NEQ "" ( set /a "_len+=4096" & set "_len_input=%_len_input:~4096%" )
REM if "%_len_input:~2048,1%" NEQ "" ( set /a "_len+=2048" & set "_len_input=%_len_input:~2048%" )
REM if "%_len_input:~1024,1%" NEQ "" ( set /a "_len+=1024" & set "_len_input=%_len_input:~1024%" )
REM if "%_len_input:~512,1%" NEQ "" ( set /a "_len+=512" & set "_len_input=%_len_input:~512%" )
REM if "%_len_input:~256,1%" NEQ "" ( set /a "_len+=256" & set "_len_input=%_len_input:~256%" )
REM if "%_len_input:~128,1%" NEQ "" ( set /a "_len+=128" & set "_len_input=%_len_input:~128%" )
REM if "%_len_input:~64,1%" NEQ "" ( set /a "_len+=64" & set "_len_input=%_len_input:~64%" )
REM if "%_len_input:~32,1%" NEQ "" ( set /a "_len+=32" & set "_len_input=%_len_input:~32%" )
REM if "%_len_input:~16,1%" NEQ "" ( set /a "_len+=16" & set "_len_input=%_len_input:~16%" )
REM if "%_len_input:~8,1%" NEQ "" ( set /a "_len+=8" & set "_len_input=%_len_input:~8%" )
REM if "%_len_input:~4,1%" NEQ "" ( set /a "_len+=4" & set "_len_input=%_len_input:~4%" )
REM if "%_len_input:~2,1%" NEQ "" ( set /a "_len+=2" & set "_len_input=%_len_input:~2%" )
REM if "%_len_input:~1,1%" NEQ "" ( set /a "_len+=1" & set "_len_input=%_len_input:~1%" )
REM :len-end
REM set /a "%~2=%_len%"
REM exit /b %_len% & Call :ClearVariablesByPrefix _len

