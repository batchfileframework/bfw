
::Usage Call :Char2Asc InputChar OutputAsciiCode
:Char2AscFast
if "[%CharMap%]"=="[]" call :GetCharMapStringFast
:Char2Asc
Call :SetIfNotDefined "%~1" _Char2Asc_input "%~2" _Char2Asc_output
if "[%CharMap%]"=="[]" call :GetCharMapString
if "[%Charmap.len%]"=="[]" call :len %CharMap% Charmap.len
Call :SetArrayParameters _Char2Asc "" 0 %Charmap.len% 0
:Char2Asc-loop
call set _Char2Asc.currentChar=%%CharMap[%_Char2Asc.index%]%%
if "[%_Char2Asc.currentChar%]"=="[%_Char2Asc_input%]" set "%_Char2Asc_output%=%_Char2Asc.index%" & GoTo :Char2Asc-end
set /a _Char2Asc.index+=1
if %_Char2Asc.index% leq %_Char2Asc.ubound% GoTo :Char2Asc-loop
:Char2Asc-end
if "[%_Char2Asc_input%]"=="[ ]" set "%_Char2Asc_output%=32"
if "[%_Char2Asc_input%]"=="[ ]" set "%_Char2Asc.index%=32"
exit /b %_Char2Asc.index%

