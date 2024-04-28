
::Usage Call :ArrayToString InputArray OutputString optional DelimiterChar
:ArrayToString
set "_ArrayToString_prefix=_ATS"
Call :SetIfNotDefined "%~1" _ATS_InputArray "%~2" _ATS_OutputString 0 _ATS_index "%%%~1.ubound%%" _ATS_ubound "%~3" _ATS_delimiter
REM Call :SetIfNotDefined " " _ATS_delimiter
setlocal enabledelayedexpansion
:ArrayToString-loop
set _ATS_intermediate=!_ATS_intermediate!!%_ATS_InputArray%[%_ATS_index%]!!_ATS_delimiter!
set /a "_ATS_index+=1"
if %_ATS_index% LEQ %_ATS_ubound% GoTo :ArrayToString-loop
REM Call :AddEscapeCharacters _ATS_intermediate
endlocal & set %_ATS_OutputString%=%_ATS_intermediate%
Call :ClearVariablesByPrefix %_ArrayToString_prefix% _ArrayToString
GoTo :EOF
