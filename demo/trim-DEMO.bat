
:trim-DEMO
set "string[0]=a normal trim string"
set "string[1]= a string with a leading space"
set "string[2]=  a string with two leading spaces"
set "string[3]=a string with two trailing spaces  "
set "string[4]=              a string with too many leading spaces"
set "string[5]=a string with too many trailing spaces              "
set "string[6]=	a string with a leading tab"
set "string[7]=a string with a trailing tab	"
set "string[8]=              a string with too many leading and trailing spaces              "
set "string[9]=      	   	   a string with many mixed leading and trailing tabs spaces      	   	   "
set "string[10]=  
   	   	   a string with spaces tabs and a CR character on each side  
   	   	   "
set /a _trim_DEMO_index=0
:trim-DEMO-internal-loop
set "outputval="
call echo input FF%%string[%_trim_DEMO_index%]%%FF
call :trim "%%string[%_trim_DEMO_index%]%%" outputval
echo output %_trim_DEMO_index% UU%outputval%UU
set /a _trim_DEMO_index+=1
if %_trim_DEMO_index% LEQ 10 GoTo :trim-DEMO-internal-loop
GoTo :EOF

