
::Usage Call :FindAppxPackages MatchingPackages optional SearchTerms optional only|except optional SearchProperties
:: SearchTerms contains the search terms, can be an array, if it is an array lbound must be 0 and ubound must be set
:: only|except : ("only" is default behaviour) whether to return only matching results or, all results except matching
:: SearchProperties : List of properties to search for SearchTerm, separated by backslash
:: SearchProperties : If not specified, will use FullName property only
:FindAppxPackages
call :IsAdmin || echo This command requires admin privileges
Call :ClearVariablesByPrefix _FindAppxPackages
REM Obtain ubound from output array, if there's one, so we can just append to it
call set "_FindAppxPackages_MatchingPackages.ubound=%%%~1.ubound%%"
REM Obtain individual search term
set "_FindAppxPackages_SearchTerms[0]=%~2"
REM Obtain ubound, if there's a search terms array
REM call echo call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
call set "_FindAppxPackages_SearchTerms.ubound=%%%~2.ubound%%"
REM echo _FindAppxPackages_SearchTerms %_FindAppxPackages_SearchTerms%
REM In case there's a path in %~2, we check IsNumeric and wipe the value if not
Call :IsNumeric %_FindAppxPackages_SearchTerms.ubound% && set "_FindAppxPackages_SearchTerms.ubound="
REM If there is no search terms array provided, we skip filling local search terms array
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" echo Case where there is no SearchTerms array
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" GoTo :FindAppxPackages-fill-in-SearchTerms-skip
REM We are filling local search terms array, starting at 0
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-fill-in-SearchTerms-loop
REM We have a search terms array provided, copying to local variable and updating local ubound on each loop
REM call echo Case where SearchTerms array exists, running call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]=%%%~2[%_FindAppxPackages_SearchTerms.index%]%%"
REM echo _FindAppxPackages_SearchTerms[0] %_FindAppxPackages_SearchTerms[0]%
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-fill-in-SearchTerms-loop
:FindAppxPackages-fill-in-SearchTerms-skip
REM If there's a search terms array, it has overwritten the erroneous "individual search term" 
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" echo Case where no SearchTerms array, but one SearchTerms exists
REM If no search terms array was provided but there is a search term, then set local search terms array ubound to zero
if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if not "[%_FindAppxPackages_SearchTerms[0]%]"=="[]" set /a "_FindAppxPackages_SearchTerms.ubound=0"
REM if "[%_FindAppxPackages_SearchTerms.ubound%]"=="[]" if "[%~2]"=="[]" echo No search terms, no array, no action needed
REM We are setting the matching behaviour from the third argument, only returning matching result is the default
set "_FindAppxPackages_MatchingBehaviour=only"
if not "[%~3]"=="[]" set "_FindAppxPackages_MatchingBehaviour=%~3"
REM The way this works, there is on main IF for the comparator, and we use MatchingBehaviour as a macro to boolean flip by writing "not" in it
if "[%_FindAppxPackages_MatchingBehaviour%]"=="[only]" ( set "_FindAppxPackages_MatchingBehaviour=not" ) else ( set "_FindAppxPackages_MatchingBehaviour=" )
REM This is a splitting function, it splits the fourth parameter, delimited with backslash into an array
if not "[%~4]"=="[]" ( Call :Deconcatenate \ %~4 _FindAppxPackages_SearchProperties ) else ( set "_FindAppxPackages_SearchProperties[0]=.PackageFullName" & set /a "_FindAppxPackages_SearchProperties.ubound=0")
REM Time to fill the main database of all AppxPackages
REM Fill array AppxPackages if ubound is not set, clearing the ubound is how to for a refresh
if "[%AppxPackages.ubound%]"=="[]" Call :GetAppxPackages
REM We will now loop through each AppxPackage, we will look for all provided Search terms in each of the specified Properties
set /a "_FindAppxPackages.index=0"
:FindAppxPackages-loop-through-AppxPackages
set /a "_FindAppxPackages_SearchProperties.index=0"
:FindAppxPackages-loop-through-SearchProperties
REM echo _FindAppxPackages.index %_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index %_FindAppxPackages_SearchProperties.index%
REM echo AppxPackages[%_FindAppxPackages.index%] _FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]
REM call echo AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%
REM call call echo call echo %%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%
REM call call echo call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
call call set "_FindAppxPackages_CurrentSearchProperty=%%%%AppxPackages[%_FindAppxPackages.index%]%%_FindAppxPackages_SearchProperties[%_FindAppxPackages_SearchProperties.index%]%%%%%%"
REM echo CURRENT PROPERTY:%_FindAppxPackages_CurrentSearchProperty%
set /a "_FindAppxPackages_SearchTerms.index=0"
:FindAppxPackages-loop-through-SearchTerms
REM call echo call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
call set "_FindAppxPackages_CurrentSearchTerm=%%_FindAppxPackages_SearchTerms[%_FindAppxPackages_SearchTerms.index%]%%"
if "[%_FindAppxPackages_CurrentSearchTerm%]"=="[]" GoTo :FindAppxPackages-match-found
REM echo looping through _FindAppxPackages.index=%_FindAppxPackages.index% _FindAppxPackages_SearchProperties.index=%_FindAppxPackages_SearchProperties.index% _FindAppxPackages_SearchTerms.index=%_FindAppxPackages_SearchTerms.index%
REM call echo call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
REM call echo set "_FindAppxPackages_CurrentSearchPropertyCompare=%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%"
call set "_FindAppxPackages_CurrentSearchPropertyCompare=%%_FindAppxPackages_CurrentSearchProperty:%_FindAppxPackages_CurrentSearchTerm%=%%"
REM echo _FindAppxPackages_CurrentSearchProperty=%_FindAppxPackages_CurrentSearchProperty% 
REM echo _FindAppxPackages_CurrentSearchTerm=%_FindAppxPackages_CurrentSearchTerm% 
REM echo _FindAppxPackages_CurrentSearchPropertyCompare %_FindAppxPackages_CurrentSearchPropertyCompare%
REM echo MAIN COMPARATOR if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]"
REM if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( echo comparator says yes ) else ( echo comparator says no)
if %_FindAppxPackages_MatchingBehaviour% "[%_FindAppxPackages_CurrentSearchProperty%]"=="[%_FindAppxPackages_CurrentSearchPropertyCompare%]" ( GoTo :FindAppxPackages-match-found ) else ( GoTo :FindAppxPackages-no-match-found )
:FindAppxPackages-match-found
if not "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound+=1
if "[%_FindAppxPackages_MatchingPackages.ubound%]"=="[]" set /a _FindAppxPackages_MatchingPackages.ubound=0
REM echo MATCH FOUND ADDING %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
set /a %~1[%_FindAppxPackages_MatchingPackages.ubound%]=%_FindAppxPackages.index%
REM echo we made it here ? 5
GoTo :FindAppxPackages-go-to-next-AppxPackages-index
:FindAppxPackages-no-match-found
set /a "_FindAppxPackages_SearchTerms.index+=1"
if %_FindAppxPackages_SearchTerms.index% LEQ %_FindAppxPackages_SearchTerms.ubound% GoTo :FindAppxPackages-loop-through-SearchTerms
set /a "_FindAppxPackages_SearchProperties.index+=1"
if %_FindAppxPackages_SearchProperties.index% LEQ %_FindAppxPackages_SearchProperties.ubound% GoTo :FindAppxPackages-loop-through-SearchProperties
:FindAppxPackages-go-to-next-AppxPackages-index
REM echo we made it here ? 6
set /a "_FindAppxPackages.index+=1"
REM echo if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
if %_FindAppxPackages.index% LEQ %AppxPackages.ubound% GoTo :FindAppxPackages-loop-through-AppxPackages
call set /a %%%~1.ubound=%_FindAppxPackages_MatchingPackages.ubound%
set /a _FindAppxPackages_MatchingPackages.ubound+=1
call set /a %%%~1.count=%_FindAppxPackages_MatchingPackages.ubound%
Call :ClearVariablesByPrefix _FindAppxPackages
GoTo :EOF
REM https://stackoverflow.com/questions/8481558/windows-batch-goto-within-if-block-behaves-very-strangely
REM https://stackoverflow.com/users/1012053/dbenham
REM https://stackoverflow.com/questions/47280217/was-unexpected-at-this-time-generated-from-batch-script-line-if-exist-file/47280406#47280406

