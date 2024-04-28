
:: This function is very very old and sucks now, TODO REWRITE
:: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
:: Example set EchoArrayPrefix=InputArray[%%index%%]=
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "len=%%%~1.len%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
if not ["%len%"]==[""] call echo %~1.len %%%~1.len%%
if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop


:: This function is very very old and sucks now, TODO REWRITE
:: Set EchoArrayPrefix EchoArraySuffix to insert text before or after
:: Example set EchoArrayPrefix=InputArray[%%index%%]=
:: EchoArray InputArray optional start optional end
:EchoArray
set /a index=0 
set /a limit=2147483647
if not ["%~2"]==[""] set /a index=%~2
if not ["%~3"]==[""] set /a limit=%~3
call set "lbound=%%%~1.lbound%%" 
call set "ubound=%%%~1.ubound%%"
call set "len=%%%~1.len%%"
call set "next=%%%~1.next%%"
call set "previous=%%%~1.previous%%"
if not ["%lbound%"]==[""] call echo %~1.lbound %%%~1.lbound%%
if not ["%ubound%"]==[""] call echo %~1.ubound %%%~1.ubound%%
if not ["%len%"]==[""] call echo %~1.len %%%~1.len%%
if not ["%next%"]==[""] call echo %~1.next %%%~1.next%%
if not ["%previous%"]==[""] call echo %~1.previous %%%~1.previous%%
:EchoArray-internal-loop
if not defined %1[%index%] GoTo :EOF
call echo %EchoArrayPrefix%%%%1[%index%]%%%EchoArraySuffix%
set /a index+=1
if %index% GTR %limit% goto :EOF
GoTo :EchoArray-internal-loop

