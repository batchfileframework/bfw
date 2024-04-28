
:StringCompare-DEMO

set "output="
set "mystring1=This is a string"
set "mystring2=This is a strinx"
set "mystring3=REM Call :StringCompare StringA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len"
set "mystring4=REM Call :StringCompare StrigA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len"

REM Call :StringCompare StringA StringB optional OutputPercentMarch optional OutputMachingChars optional OutputStringA.len optional OutputStringB.len
call :len "%mystring4%" output & call echo output %%output%%
echo output %output%
echo.
echo Running simple string compare
Call :StringCompare "%mystring1%" "%mystring2%" optional OutputPercentMarch


GoTo :EOF

