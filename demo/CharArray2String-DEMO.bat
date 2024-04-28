
:CharArray2String-DEMO

Call :ClearVariablesByPrefix testarray
set testarray[0]=t
set testarray[1]=e
set testarray[2]="
set testarray[3]=t
set testarray[4]=5
set testarray[5]="
set testarray[6]=5
set testarray[7]="
set testarray[8]=5
set testarray[9]=5
set testarray
Call :CharArray2String testarray _CharArray2String-DEMO

echo %_CharArray2String-DEMO%

GoTo :EOF

