
:IsLabel-DEMO

echo. 
set _IsLabel-DEMO=My test line
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=:YesALabel
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=   :LabelWithSpaceInFront
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=  	  :LabelWithSpaceAndTabs
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=::This is a comment
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="

echo. 
set _IsLabel-DEMO=if blabla EQU notthat do nothing
echo testing IsLabel with line %_IsLabel-DEMO%
Call :IsLabel _IsLabel_return "%_IsLabel-DEMO%" && echo this was a label %_IsLabel-DEMO% || echo this was not a label %_IsLabel-DEMO%
echo return value is %_IsLabel_return%
set "_IsLabel_return="


GoTo :EOF

