
:ArrayToFile-DEMO


set testarray[0]=test1
set testarray[1]=test2
set testarray[2]=test3
set testarray[3]=test4
set testarray[4]=test5
set /a "testarray.lbound=0"
set /a "testarray.ubound=4"


del arrayoutputtest.txt
call :ArrayToFile testarray arrayoutputtest.txt
type arrayoutputtest.txt

GoTo :EOF

