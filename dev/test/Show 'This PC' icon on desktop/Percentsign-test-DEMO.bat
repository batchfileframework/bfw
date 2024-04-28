
:Percentsign-test-DEMO

echo.
echo increasing number of percent signs, set without quotes, echo without quotes
echo.

set testvar=%
set testvar
echo 1 %testvar%

set testvar=%%
set testvar
echo 2 %testvar%

set testvar=%%%
set testvar
echo 3 %testvar%

set testvar=%%%%
set testvar
echo 4 %testvar%

set testvar=%%%%%
set testvar
echo 5 %testvar%

set testvar=%%%%%%
set testvar
echo 6 %testvar%

set testvar=%%%%%%%
set testvar
echo 7 %testvar%

set testvar=%%%%%%%%
set testvar
echo 8 %testvar%

echo observations : single percentsigns are discarded, double percentsigns are reduced to one
echo three percentsigns, two of them get reduced to one and the extra is discarded
echo four percentsigns gets reduced to two and so on

echo.
echo increasing number of percent signs, set with quote, echo without quote
echo.

set "testvar=%"
set testvar
echo 1 %testvar%

set "testvar=%%"
set testvar
echo 2 %testvar%

set "testvar=%%%"
set testvar
echo 3 %testvar%

set "testvar=%%%%"
set testvar
echo 4 %testvar%

set "testvar=%%%%%"
set testvar
echo 5 %testvar%

set "testvar=%%%%%%"
set testvar
echo 6 %testvar%

set "testvar=%%%%%%%"
set testvar
echo 7 %testvar%

set "testvar=%%%%%%%%"
set testvar
echo 8 %testvar%

echo observation, putting set variable in quotes had no effect on percentsigns parsing

echo.
echo increasing number of percent signs, set without quotes, echo with quotes
echo.

set testvar=%
set testvar
echo 1 "%testvar%"

set testvar=%%
set testvar
echo 2 "%testvar%"

set testvar=%%%
set testvar
echo 3 "%testvar%"

set testvar=%%%%
set testvar
echo 4 "%testvar%"

set testvar=%%%%%
set testvar
echo 5 "%testvar%"

set testvar=%%%%%%
set testvar
echo 6 "%testvar%"

set testvar=%%%%%%%
set testvar
echo 7 "%testvar%"

set testvar=%%%%%%%%
set testvar
echo 8 "%testvar%"

echo observation, putting echo variable in double quotes had no effect on percentsigns parsing

echo.
echo increasing number of percent signs, set with quote, echo with quote
echo.

set "testvar=%"
set testvar
echo 1 "%testvar%"

set "testvar=%%"
set testvar
echo 2 "%testvar%"

set "testvar=%%%"
set testvar
echo 3 "%testvar%"

set "testvar=%%%%"
set testvar
echo 4 "%testvar%"

set "testvar=%%%%%"
set testvar
echo 5 "%testvar%"

set "testvar=%%%%%%"
set testvar
echo 6 "%testvar%"

set "testvar=%%%%%%%"
set testvar
echo 7 "%testvar%"

set "testvar=%%%%%%%%"
set testvar
echo 8 "%testvar%"

echo observation, again doublequotes have had no effect on percent sign parsing

echo.
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter A or B alternating before and after every percentsign
echo.

set testvar=A%B
set testvar
echo 1 %testvar%

set testvar=A%B%A
set testvar
echo 2 %testvar%

set testvar=A%B%A%B
set testvar
echo 3 %testvar%

set testvar=A%B%A%B%A
set testvar
echo 4 %testvar%

set testvar=A%B%A%B%A%A
set testvar
echo 5 %testvar%

set testvar=A%B%A%B%A%B%A
set testvar
echo 6 %testvar%

set testvar=A%B%A%B%A%B%A%B
set testvar
echo 7 %testvar%

set testvar=A%B%A%B%A%B%A%B%A
set testvar
echo 8 %testvar%

echo observation, all characters enclosed between sets of percentsigns are expanded into variable
echo in this case, empty variables
echo.
echo increasing number of percent signs, set with quotes, echo without quotes
echo added letter A or B alternating before and after every percentsign
echo.

set "testvar=A%B"
set testvar
echo 1 %testvar%

set "testvar=A%B%A"
set testvar
echo 2 %testvar%

set "testvar=A%B%A%B"
set testvar
echo 3 %testvar%

set "testvar=A%B%A%B%A"
set testvar
echo 4 %testvar%

set "testvar=A%B%A%B%A%A"
set testvar
echo 5 %testvar%

set "testvar=A%B%A%B%A%B%A"
set testvar
echo 6 %testvar%

set "testvar=A%B%A%B%A%B%A%B"
set testvar
echo 7 %testvar%

set "testvar=A%B%A%B%A%B%A%B%A"
set testvar
echo 8 %testvar%

echo observation, set with quotes had no effect of percentsign parsing
echo.
echo increasing number of percent signs, set without quotes, echo with quotes
echo added letter A or B alternating before and after every percentsign
echo.

set testvar=A%B
set testvar
echo 1 "%testvar%"

set testvar=A%B%A
set testvar
echo 2 "%testvar%"

set testvar=A%B%A%B
set testvar
echo 3 "%testvar%"

set testvar=A%B%A%B%A
set testvar
echo 4 "%testvar%"

set testvar=A%B%A%B%A%A
set testvar
echo 5 "%testvar%"

set testvar=A%B%A%B%A%B%A
set testvar
echo 6 "%testvar%"

set testvar=A%B%A%B%A%B%A%B
set testvar
echo 7 "%testvar%"

set testvar=A%B%A%B%A%B%A%B%A
set testvar
echo 8 "%testvar%"

echo observation, echo with quotes had no effect of percentsign parsing

echo.
echo increasing number of percent signs, set with quotes, echo with quotes
echo added letter A or B alternating before and after every percentsign
echo.

set "testvar=A%B"
set testvar
echo 1 "%testvar%"

set "testvar=A%B%A"
set testvar
echo 2 "%testvar%"

set "testvar=A%B%A%B"
set testvar
echo 3 "%testvar%"

set "testvar=A%B%A%B%A"
set testvar
echo 4 "%testvar%"

set "testvar=A%B%A%B%A%A"
set testvar
echo 5 "%testvar%"

set "testvar=A%B%A%B%A%B%A"
set testvar
echo 6 "%testvar%"

set "testvar=A%B%A%B%A%B%A%B"
set testvar
echo 7 "%testvar%"

set "testvar=A%B%A%B%A%B%A%B%A"
set testvar
echo 8 "%testvar%"

echo observation, set and set with quotes had no effect of percentsign parsing

echo.
echo increasing number of percent signs, set with quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo.

set "testvar=AAA%BBB"
set testvar
echo 1 %testvar%

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 %testvar%

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 8 %testvar%

observation no change in pattern from single characters to triple characters

echo.
echo increasing number of percent signs, set without quotes, echo with quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo.

set testvar=AAA%BBB
set testvar
echo 1 "%testvar%"

set testvar=AAA%BBB%AAA
set testvar
echo 2 "%testvar%"

set testvar=AAA%BBB%AAA%BBB
set testvar
echo 3 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA
set testvar
echo 4 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%AAA
set testvar
echo 5 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB
set testvar
echo 7 "%testvar%"

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 "%testvar%"

observation no change in pattern from single characters to triple characters

echo.
echo increasing number of percent signs, set with quotes, echo with quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo.

set "testvar=AAA%BBB"
set testvar
echo 1 "%testvar%"

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 "%testvar%"

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 8 "%testvar%"

observation no change in pattern from single characters to triple characters

echo.
echo increasing number of percent signs
echo added letter AAA or BBB alternating before and after every percentsign
echo This one will have 8 percent signs with various locations to include doublequotes
echo.


set testvar=A"AA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 1 %testvar%

set testvar=AAA%B"BB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%BBB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=A"AA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 5 %testvar%

set testvar=AAA"%"BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 %testvar%

set testvar=A"A"A%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 7 %testvar%

set testvar=AAA%B"B"B%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 %testvar%

set testvar=AAA%BBB%AAA%"BBB"%AAA%BBB%AAA%BBB%AAA
set testvar
echo 9 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B"%AAA%BBB%AAA
set testvar
echo 1 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AA"A%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B%AA"A%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%A"A"A"%BBB%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A"%BBB%AAA
set testvar
echo 6 %testvar%


echo observation, no matter where the quotes are places, appears to have no impact on the percentsign parsing

echo.
echo same pattern as previous, this time with added carrets ^^ for escaping percent signs
echo Doublequotes are left in, expected to have no effects on percent sign parsing
echo.


set testvar=A"AA^%BBB^%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 1 %testvar%

set testvar=AAA%B"BB%^A^A^A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA^%BBB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^%BBB%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^%BBB^^%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^^%BBB^^%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 %testvar%

set testvar=AAA^^%BBB^^%AA"A%BBB%AA^A%BBB%AAA%BBB%AAA
set testvar
echo 3 "%testvar%"

set "testvar=^AAA^^%BBB^^%AA"A%BBB%AA^A%BBB%A^^AA%BBB%A^^^AA"
set testvar
echo 3 "%testvar%"

echo observation, carrets appear to have no effect on  percentsign parsing
echo unquoted carrets are parsed and removed at both the set and the echo step unless they are inside of quotes

echo.
echo previous pattern of 
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo now with one added percent sign
echo.

set testvar=AAA%BBB
set testvar
echo 1 %testvar%

set testvar=AAA%%BBB%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%%BBB%AAA%BBB
set testvar
echo 3 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%BBB%AAA%BBB
set testvar
echo 7 %testvar%

set testvar=AAA%%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 %testvar%

echo observation, every variable expansion group is flipped

echo.
echo previous pattern of 
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo first percentsign pair is doubled
echo.

set testvar=AAA%%BBB
set testvar
echo 1 %testvar%

set testvar=AAA%%BBB%%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%%BBB%%AAA%BBB
set testvar
echo 3 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%BBB%AAA
set testvar
echo 6 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%BBB%AAA%BBB
set testvar
echo 7 %testvar%

set testvar=AAA%%BBB%%AAA%BBB%AAA%BBB%AAA%BBB%AAA
set testvar
echo 8 %testvar%

echo.
echo previous pattern of 
echo increasing number of percent signs, set without quotes, echo without quotes
echo added letter AAA or BBB alternating before and after every percentsign
echo every percentsign pair is doubled
echo.

set testvar=AAA%%BBB
set testvar
echo 1 %testvar%

set testvar=AAA%%BBB%%AAA
set testvar
echo 2 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB
set testvar
echo 3 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA
set testvar
echo 4 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%AAA
set testvar
echo 5 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA
set testvar
echo 6 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA%%BBB
set testvar
echo 7 %testvar%

set testvar=AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA%%BBB%%AAA
set testvar
echo 8 %testvar%


echo observation,


set "testvar=AAA%BBB"
set testvar
echo 1 %testvar%

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 %testvar%

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 8 %testvar%


testvar=AAA%BBB
1 AAA%BBB
testvar=AAA%BBB%AAA
2 AAA%BBB%AAA
testvar=AAA%BBB%AAA%BBB
3 AAA%BBB%AAA%BBB
testvar=AAA%BBB%AAA%BBB%AAA
4 AAA%BBB%AAA%BBB%AAA
testvar=AAA%BBB%AAA%BBB%AAAAAA
5 AAA%BBB%AAA%BBB%AAAAAA
testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA
6 AAA%BBB%AAA%BBB%AAA%BBB%AAA
testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB
7 AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB
testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
8 AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA

set "testvar=AAA%BBB"
set testvar
echo 1 %testvar%

set "testvar=AAA%BBB%AAA"
set testvar
echo 2 %testvar%

set "testvar=AAA%BBB%AAA%BBB"
set testvar
echo 3 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA"
set testvar
echo 4 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%AAA"
set testvar
echo 5 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA"
set testvar
echo 6 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB"
set testvar
echo 7 %testvar%

set "testvar=AAA%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA"


REM set testvar=AAA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 4 %testvar%

REM set testvar=A"AA%B"BB%AA"A%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 5 %testvar%

REM set testvar=AAA"%"BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 6 %testvar%

REM set testvar=A"A"A%BBB%AAA%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 7 %testvar%

REM set testvar=AAA%B"B"B%AAA%BBB%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 8 %testvar%

REM set testvar=AAA%BBB%AAA%"BBB"%AAA%BBB%AAA%BBB%AAA
REM set testvar
REM echo 9 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B"%AAA%BBB%AAA
REM set testvar
REM echo 1 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%AA"A%BBB%AAA
REM set testvar
REM echo 2 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%"B"B"B%AA"A%BBB%AAA
REM set testvar
REM echo 3 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A%BBB%AAA
REM set testvar
REM echo 4 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%A"A"A"%BBB%AAA
REM set testvar
REM echo 5 %testvar%

REM set testvar=AAA%BBB%AAA%BBB%AAA%BBB%"A"A"A"%BBB%AAA
REM set testvar
REM echo 6 %testvar%
goto :eof
REM Call :ClearVariablesByPrefix  OptionalFeatures
REM call :GetOptionalFeatures

REM set OptionalFeatures[
REM Set "_CopyValuesFromArray_SearchSuffix=.state"
REM Call :CopyValuesFromArray OptionalFeatures OptionalFeatures.disabled Disabled
REM set OptionalFeatures.disabled
REM Call :CopyValuesFromArray OptionalFeatures OptionalFeatures.enabled Enabled
REM set OptionalFeatures.enabled
REM set "_RemoveValuesFromArray_ArrayToRemoveFrom.suffix=.state"
REM Call :RemoveValuesFromArray OptionalFeatures Disabled Enabled

REM set OptionalFeatures[

REM Call :FindUniqueValues InputArray OutputArray .suffixName
REM set _SplitArrayByValue_PartialMatch=true
REM set SortingValues[X].value ' the value to be matched
REM set SortingValues[X].NewArrayName ' Array name where matching elements will be copied to, empty will just use the value (sanitized) as an arrayname 
REM set SortingValues[X].SuffixList ' list of only these suffixes to copy to new array, empty means all
REM Call :SplitArrayByValue InputArray SortingValues optional .suffixName

REM call :CopyValuesFromArray-DEMO
REM call :ArrayManipulation-DEMO
REM call :CreateTestArray-DEMO
REM GoTo :AddArrayElement-DEMO
REM GoTo :RemoveValuesFromArray-DEMO
REM Call :DereferenceArrayToArrayDEMO
REM GoTo :ShowAppxPackageInfoDEMOv3
REM GoTo :DeleteAppxPackagesDEMO
REM GoTo :ShowAppxPackageInfoDEMO
REM GoTo :GetNamedKeyDEMOv2
GoTo :END



:end
set FileTime=
set StartDate=
set StartTime=
set InitialCodepage=
set debug=
set verbose=
set silent=
set logfile=

GoTo :EOF
REM Exit /b %returnvalue%

