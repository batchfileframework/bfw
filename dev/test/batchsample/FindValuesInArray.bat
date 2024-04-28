
::Usage Call :FindValuesInArray InputArray OutputArray "suffix=.suffix" "match=only,except,partial,exact" SearchList1 SearchList2 SearchListN
:FindValuesInArray

Call :ClearVariablesByPrefix _FindValuesInArray
Call :GetArrayParameters %~1 _FindValuesInArray_InputArray
Call :GetArrayParameters %~2 _FindValuesInArray_OutputArray || Call :SetArrayParameters _FindValuesInArray_OutputArray nil 0 -1 0 
REM echo 1 %~1 2 %~2 3 %~3 4 %~4
REM set _FindValuesInArray

REM echo %~3 list of suffix
REM echo %~4 behavious only|except
REM if "[%~3]"=="[except]" set "_FindValuesInArray_SearchBehaviour=not"

Call :SetArrayParameters _FindValuesInArray_SearchTerms nil 0 -1 0 
:FindValuesInArray-SearchTermsFillArray-loop
echo number3 is %~3 %~4 %~5
SET "mytestvvv="
REM set mytestvvv=allo123456
REM set mytestvvv=%mytestvvv:~0,5%
REM set mytestvvv=%~3:~0,5
REM set mytestvvv=%~3:~0,5%
REM set mytestvvv=%%~3:~0,5%
REM set mytestvvv=%%~3:~0,5%%
REM call set mytestvvv=%%~3:~0,5%%


call :left "%~3" _FindValuesInArray_argumentleft5 6 & Call :IsMatch "%%_FindValuesInArray_argumentleft5%%" "match=" & Call :LeftCut "%~3" _FindValuesInArray_MatchBehaviour 6 & call echo %%_FindValuesInArray_MatchBehaviour%%
set _FindValuesInArray_MatchBehaviour
REM echo mytestvvv %mytestvvv%
REM Call :IsMatch "%%~3:~0,5%%" "match=" && echo yes || echo no
goto :eof
if "[%~3]"=="[match=]" set "_FindValuesInArray_SearchBehaviour=not"
Call :AddValuesToArray _FindValuesInArray_SearchTerms "%~3"
:FindValuesInArray-SearchTermsFillArray-skip
shift
if not "[%~4]"=="[]" GoTo :FindValuesInArray-SearchTermsFillArray-loop

set /a _FindValuesInArray_InputArray.index=%_FindValuesInArray_InputArray.lbound%
:FindValuesInArray-main-loop
set /a _FindValuesInArray_SearchTerms.index=%_FindValuesInArray_SearchTerms.lbound%
:FindValuesInArray-SearchTerms-loop
call set _FindValuesInArray_SearchTerms.current=%%_FindValuesInArray_SearchTerms[%_FindValuesInArray_SearchTerms.index%]%%
call set _FindValuesInArray_InputArray.current=%%_FindValuesInArray_InputArray[%_FindValuesInArray_InputArray.index%]%%
call set _FindValuesInArray_InputArray.current.compare=%%_FindValuesInArray_InputArray.current:%_FindValuesInArray_SearchTerms.current%=%%
if %_FindValuesInArray_SearchBehaviour% "[%_FindValuesInArray_SearchTerms.current%]"=="[%_FindValuesInArray_InputArray.current.compare%]" set %_FindValuesInArray_InputArray%[%_FindValuesInArray_InputArray.ubound%]

set /a _FindValuesInArray_SearchTerms.index+=1
if %_FindValuesInArray_SearchTerms.index% leq %_FindValuesInArray_SearchTerms.ubound% GoTo :FindValuesInArray-SearchTerms-loop
set /a _FindValuesInArray_InputArray.index+=1
if %_FindValuesInArray_InputArray.index% leq %_FindValuesInArray_InputArray.ubound% GoTo :FindValuesInArray-main-loop
REM getarray %~1
REM getarray OutputArray

REM build searchlist
REM if array, add searchlistarray to searchlistarray
REM deconcatenate SuffixList


REM loop through InputArray
REM loop through searchlist
REM loop through suffixlist
REM if there's a match add index as element of OutputArray
Call :ClearVariablesByPrefix _FindValuesInArray
GoTo :EOF

