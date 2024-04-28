
REM escape delimiters , reject delimiters
REM separate count for escaped and included characters
::Usage Call :GetRandomString CharacterCount OutputString USESPECIALCHARS DONTESCAPE FULLRANGE
:GetRandomString
set "_GetRandomString_prefix=_GSR"
Call :SetIfNotDefined "%~1" _GSR_count "%~2" _GSR_output
set "_GSR_space_genlist=32 "
set "_GSR_exclamation_genlist=33 "
set "_GSR_quotes_genlist=34 "
set "_GSR_percent_genlist=37 "
set "_GSR_special_genlist=38 60 62 94 124 "
set "_GSR_delimiter_genlist=44 59 61 "
set "_GSR_special_esclist=38 60 62 94 124 "
set "_GSR_delimiter_esclist=44 59 61 "
set "_GSR_special_escape_char=^^^"
set "_GSR_quotes_escape_char=^^^"
set "_GSR_percent_escape_char=%%%%"
set "_GSR_exclamation_escape_char=^^^"
set "_GSR_bracket_escape_char=^^^"
set "_GSR_delimiter_escape_char=^^^"
set "_GSR_extdelimiter_escape_char=^^^"
set "_GSR_special_esccharcount=3"
set "_GSR_space_esccharcount=3"
set "_GSR_quote_esccharcount=3"
set "_GSR_exclamation_esccharcount=3"
set "_GSR_percent_esccharcount=3"
set "_GSR_bracket_esccharcount=0"
set "_GSR_delimiter_esccharcount=3"
set "_GSR_extdelimiter_esccharcount=0"
:GetRandomString-arguments
if "[%~3]" EQU "[NOLEN]" set "_GSR_nolen=true"
if "[%~3]" EQU "[USEALLCHARS]" set "_GSR_useallchar=true"
if "[%~3]" EQU "[NUMERICONLY]" set "_GSR_numeric=true"
if "[%~3]" EQU "[DONTESCAPE]" set "_GSR_dontescape=true"
if "[%~3]" EQU "[FULLRANGE]" set "_GSR_fullrange=true"
if "[%~3]" EQU "[USESPECIALCHARS]" set "_GSR_special_genlist="
if "[%~3]" EQU "[USESPACE]" set "_GSR_space_genlist="
if "[%~3]" EQU "[USEEXCLAMATION]" set "_GSR_exclamation_genlist="
if "[%~3]" EQU "[USEQUOTES]" set "_GSR_quotes_genlist="
if "[%~3]" EQU "[USEPERCENT]" set "_GSR_percent_genlist="
if "[%~3]" EQU "[NOBRACKETS]" set "_GSR_bracket_genlist=40 41 91 93 123 125 "
if "[%~3]" EQU "[USEDELIMITERS]" set "_GSR_delimiter_genlist="
if "[%~3]" EQU "[NOEXTDELIMITERS]" set "_GSR_extdelimiter_genlist=39 43 64 96 126 "
if "[%~3]" EQU "[ESCNOTSPECIAL]" ( set "_GSR_special_escape_char=^" & set "_GSR_special_esccharcount=1" )
if "[%~3]" EQU "[ESCNOTSPACE]" ( set "_GSR_space_escape_char=" & set "_GSR_space_esccharcount=0" )
if "[%~3]" EQU "[ESCNOTPERCENT]" ( set "_GSR_percent_escape_char=%%" & set "_GSR_percent_esccharcount=1" )
if "[%~3]" EQU "[ESCNOTEXCLAMATION]" ( set "_GSR_exclamation_escape_char=" & set "_GSR_exclamation_esccharcount=0" )
if "[%~3]" EQU "[ESCNOTQUOTES]" ( set "_GSR_quotes_escape_char=^" & set "_GSR_quote_esccharcount=1" )
if "[%~3]" EQU "[ESCBRACKETS]" ( set "_GSR_bracket_esclist=40 41 91 93 123 125 " & set "_GSR_bracket_esccharcount=3" )
if "[%~3]" EQU "[ESCNOTDELIMITERS]" ( set "_GSR_delimiter_esclist=" & set "_GSR_delimiter_esccharcount=0" )
if "[%~3]" EQU "[ESCEXTDELIMITERS]" ( set "_GSR_extdelimiter_esclist=39 43 64 96 126 " & set "_GSR_extdelimiter_esccharcount=3" )
if "[%~3]" EQU "[ESCNOTLASTDIGIT]" ( set "_GSR_escnot_lastdigit=true" )
if "[%~4]" NEQ "[]" ( shift & GoTo :GetRandomString-arguments )
if "[%_GSR_useallchar%]" NEQ "[true]" set "_GSR_genlist=%_GSR_special_genlist%%_GSR_exclamation_genlist%%_GSR_space_genlist%%_GSR_quotes_genlist%%_GSR_percent_genlist%%_GSR_delimiter_genlist%%_GSR_bracket_genlist%%_GSR_extdelimiter_esclist%"
if "[%_GSR_numeric%]" EQU "[true]" set "_GSR_genlist=32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126" 
if "[%_GSR_dontescape%]"=="[true]" ( set "_GSR_special_esccharcount=0" & set "_GSR_quote_esccharcount=0" & set "_GSR_exclamation_esccharcount=0" & set "_GSR_percent_esccharcount=0" & set "_GSR_delimiter_esccharcount=0" & set "_GSR_special_escape_char=^" & set "_GSR_quotes_escape_char=^" & set "_GSR_percent_escape_char=%%" & set "_GSR_exclamation_escape_char=" & set "_GSR_delimiter_esclist=" & set "_GSR_delimiter_escape_char=^" )
if "[%_GSR_fullrange%]"=="[true]" ( set "_GSR_random_min=0" & set "_GSR_random_max=255" ) else ( set "_GSR_random_min=32" & set "_GSR_random_max=126" )
set /a "_GSR_index=0" & set /a "_GSR_regular_charcount=0" & set /a "_GSR_escapecount=0"
setlocal enabledelayedexpansion
:GetRandomString-loop
set "_GSR_escape_char=" & set "_GSR_escape_charcount=0" & set "_GSR_fillerchar="
set /a "_GSR_next_ascii=%RANDOM% * (%_GSR_random_max% - %_GSR_random_min% + 1) / 32768 + %_GSR_random_min%"
for %%a in (!_GSR_genlist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" GoTo :GetRandomString-loop )
for %%a in (!_GSR_special_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_special_escape_char%" & set "_GSR_escape_charcount=!_GSR_special_esccharcount!" ) )
for %%a in (!_GSR_bracket_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_bracket_escape_char%" & set "_GSR_escape_charcount=!_GSR_bracket_esccharcount!" ) )
for %%a in (!_GSR_delimiter_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_delimiter_escape_char%" & set "_GSR_escape_charcount=!_GSR_delimiter_esccharcount!" ) )
for %%a in (!_GSR_extdelimiter_esclist!) do ( if "[!_GSR_next_ascii!]"=="[%%a]" ( set "_GSR_escape_char=%_GSR_extdelimiter_escape_char%" & set "_GSR_escape_charcount=!_GSR_extdelimiter_esccharcount!" ) )
if "[!_GSR_next_ascii!]"=="[32]" ( set "_GSR_escape_char=%_GSR_space_escape_char%" & set "_GSR_escape_charcount=!_GSR_space_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[33]" ( set "_GSR_escape_char=%_GSR_exclamation_escape_char%" & set "_GSR_escape_charcount=!_GSR_exclamation_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[34]" ( set "_GSR_escape_char=%_GSR_quotes_escape_char%" & set "_GSR_escape_charcount=!_GSR_quote_esccharcount!" )
if "[!_GSR_next_ascii!]"=="[37]" ( set "_GSR_escape_char=%_GSR_percent_escape%" & set "_GSR_escape_charcount=!_GSR_percent_esccharcount!" )
cmd /c exit !_GSR_next_ascii!
if "[!=exitcodeascii!]" EQU "[]" set "_GSR_fillerchar= "
set _GSR_intermediate=!_GSR_intermediate!!_GSR_escape_char!!=exitcodeascii!!_GSR_fillerchar!
set /a "_GSR_index+=1"
if "!_GSR_escape_char!" NEQ "" set /a "_GSR_escapecount+=!_GSR_escape_charcount!"
set /a "_GSR_total_char=!_GSR_index!+!_GSR_escapecount!"
if !_GSR_total_char! LSS 8030 if !_GSR_index! LSS !_GSR_count! GoTo :GetRandomString-loop
if "[%_GSR_dontescape%]" NEQ "[true]" if "[%_GSR_escnot_lastdigit%]" NEQ "[true]" for %%a in (0 1 2 3 4 5 6 7 8 9) do (if "[!_GSR_intermediate:~-1!]"=="[%%a]" ( set /a "_GSR_escapecount+=1" & set /a "_GSR_total_char+=1" & set _GSR_intermediate=!_GSR_intermediate:~,-1!^^%%a) )
if "[%debug%]"=="[true]" echo R  !_GSR_index!     !_GSR_intermediate!
if "[%debug%]"=="[true]" echo R  !_GSR_index!     !_GSR_intermediate!>>randomstring.txt
endlocal & set /a "%_GSR_output%.len=%_GSR_index%" & set /a "%_GSR_output%.lentotal=%_GSR_total_char%" & set /a "%_GSR_output%.lenesc=%_GSR_escapecount%/3" & set %_GSR_output%=%_GSR_intermediate%
REM endlocal & if "[%_GSR_nolen%]" NEQ "[true]" ( set /a "%_GSR_output%.len=%_GSR_index%" & set /a "%_GSR_output%.lentotal=%_GSR_total_char%" & set /a "%_GSR_output%.lenesc=%_GSR_escapecount%" ) & set %_GSR_output%=%_GSR_intermediate%
if "[%_GSR_nolen%]" EQU "[true]" set "%_GSR_output%.len=" & set "%_GSR_output%.lentotal=" & set "%_GSR_output%.lenesc="
Call :ClearVariablesByPrefix %_GetRandomString_prefix% _GetRandomString
goto :eof
