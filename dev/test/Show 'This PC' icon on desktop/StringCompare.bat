
::Usage Call :StringCompare StringA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len
:StringCompare
Call :SetIfNotDefined "%~1" _StringCompare_StringA "%~2" _StringCompare_StringB
Call :Len "%_StringCompare_StringA%" _StringCompare_StringA.len
echo A %_StringCompare_StringA.len% B %_StringCompare_StringB.len%
Call :SetArrayParameters _StringCompare_StringA ParameterVariable 0 %_StringCompare_StringA.len% 0
Call :Len "%_StringCompare_StringB%" _StringCompare_StringB.len
echo A %_StringCompare_StringA.len% B %_StringCompare_StringB.len%
Call :SetArrayParameters _StringCompare_StringB ParameterVariable 0 %_StringCompare_StringB.len% 0
set /a _StringCompare.MatchingChars=0

:StringCompare-loop
call set "_StringCompare_StringA.CurrentChar=%%_StringCompare_StringA:~%_StringCompare_StringA.index%,1%%"
call set "_StringCompare_StringB.CurrentChar=%%_StringCompare_StringB:~%_StringCompare_StringB.index%,1%%"
if "[%_StringCompare_StringA.CurrentChar%]"=="[%_StringCompare_StringB.CurrentChar%]" set /a _StringCompare.MatchingChars+=1
set /a _StringCompare_StringA.index+=1
if %_StringCompare_StringA.index% leq %_StringCompare_StringA.ubound% GoTo :StringCompare-loop
echo set /a _StringCompare.MatchingPercent=%_StringCompare.MatchingChars%/%_StringCompare_StringA.len%
set /a _StringCompare.MatchingPercent=%_StringCompare.MatchingChars%/%_StringCompare_StringA.len%
Call :SetIfNamedVariable "%_StringCompare.MatchingPercent%" "%~3" "%_StringCompare.MatchingChars%" "%~4" "%_StringCompare_StringA.len%" "%~5" "%_StringCompare_StringB.len%" "%~6"
exit /b %_StringCompare.MatchingPercent%

