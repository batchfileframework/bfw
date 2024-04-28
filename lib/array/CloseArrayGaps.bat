
::Usage Call :CloseArrayGaps ArrayName IndexList1 IndexList2 IndexListN
:CloseArrayGaps
set "_CloseArrayGaps_prefix=_CAG"
set "_CAG_array=%~1" & shift
call set "_CAG_array_ubound=%%%_CAG_array%.ubound%%"
:CloseArrayGaps-arguments
if "[%~1]" NEQ "[]" ( Call :GetIndexArray _CAG_IndexList "%~1" & shift & GoTo :CloseArrayGaps-arguments )
if defined _CAG_IndexList.lbound ( set /a "_CAG_IndexList_index=%_CAG_IndexList.lbound%" ) else ( set /a "_CAG_IndexList_index=0" )
set /a "_CAG_IndexList_ubound=%_CAG_IndexList.ubound%"
call set /a "_CAG_index=%%_CAG_IndexList[%_CAG_IndexList_index%]%%"
set /a "_CAG_next_index=%_CAG_index%+1"
set /a "_CAG_IndexList_index+=1"
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( call set /a "_CAG_next_limit=%%_CAG_IndexList[%_CAG_IndexList_index%]%%" ) else ( set /a "_CAG_next_limit=%_CAG_array_ubound%" )
GoTo :CloseArrayGaps-loop-end
:CloseArrayGaps-loop
setlocal enabledelayedexpansion
set "_CAG_localscope=true"
for /f "tokens=*" %%Z in ('echo.!%_CAG_array%[%_CAG_next_index%]!') do (
															endlocal 
															set %_CAG_array%[%_CAG_index%]=%%Z
															)
if defined _CAG_localscope endlocal
set /a "_CAG_index+=1"
set /a "_CAG_next_index+=1"
:CloseArrayGaps-loop-end
if %_CAG_next_index% LSS %_CAG_next_limit% GoTo :CloseArrayGaps-loop
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( set /a "_CAG_IndexList_index+=1" & set /a "_CAG_next_index+=1" )
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( call set /a "_CAG_next_limit=%%_CAG_IndexList[%_CAG_IndexList_index%]%%" )
if %_CAG_IndexList_index% LEQ %_CAG_IndexList_ubound% ( GoTo :CloseArrayGaps-loop-end ) else ( set /a "_CAG_next_limit=%_CAG_array_ubound%" )
if %_CAG_next_index% LEQ %_CAG_array_ubound% GoTo :CloseArrayGaps-loop
set /a "%_CAG_array%.ubound=%_CAG_index%-1"
Call :ClearVariablesByPrefix %_CloseArrayGaps_prefix% _CloseArrayGaps
GoTo :EOF

