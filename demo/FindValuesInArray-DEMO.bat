
:FindValuesInArray-DEMO

Call :ClearVariablesByPrefix testarray
Call :ClearVariablesByPrefix OutputArray
set testarray[uhoh]=alb
set testarray[-1]=alb
set testarray[0]=bla
set testarray[1]=bli
set testarray[2]=blo
set testarray[3]=blou
set testarray[4]=ble
set testarray[5]=bly
set testarray[6]=blu
set /a testarray.lbound=-1
set /a testarray.ubound=6
set /a testarray.count=%testarray.ubound%-%testarray.lbound%+1

REM Call :FindValuesInArray InputArray OutputArray ".list .of .suffix" SearchList1 SearchList2 SearchListN

Call :FindValuesInArray testarray OutputArray "match=only,partial" blou fff
set OutputArray
GoTo :EOF

