
REM maybe add deleting array[x] too ? Would need to be able to tell between array and array element and array index in the argument
:DeleteArrayElement inarray indexnumber1 indexnumber2 indexnumber3  
if defined %~1.ubound ( set "_DeleteArrayElement_array=%~1" & shift )
set %_DeleteArrayElement_array%[%~1]=
if "[%~2]" NEQ "[]" shift & GoTo :DeleteArrayElement
GoTo :EOF

