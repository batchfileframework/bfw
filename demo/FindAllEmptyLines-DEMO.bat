
:FindAllEmptyLines-DEMO


REM del FindAllEmptyLines-DEMO.txt 2>nul
if not exist FindAllEmptyLines.txt Call :RunMultipleTimes 15 "call :GetRandomString 30 myoutput[%%%%_RunMultipleTimes_index%%%%] USEALLCHARS" "Call :len myoutput[%%%%_RunMultipleTimes_index%%%%].len2 myoutput[%%%%_RunMultipleTimes_index%%%%]" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%" "call call echo R %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%].len2%%%%%%%% %%%%%%%%myoutput[%%%%_RunMultipleTimes_index%%%%]%%%%%%%%>>FindAllEmptyLines.txt"

Call :FindAllEmptyLines "FindAllEmptyLines.txt" EmptyLinesArray

GoTo :EOF
