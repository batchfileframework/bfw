
::Usage Call :trim "%inputstring%" outputstring
:trim
set "_trim_tab=	"
set "_trim_space= "
set "_trim_inputstring=%~1"
:trim-leading-char-loop
set "_trim_char=%_trim_inputstring:~0,1%"
set "_trim_this="
if "[%_trim_char%]"=="[%_trim_space%]" set "_trim_this=true"
if "[%_trim_char%]"=="[%_trim_tab%]" set "_trim_this=true"
if "[%_trim_this%]"=="[true]" set "_trim_inputstring=%_trim_inputstring:~1%"
if "[%_trim_this%]"=="[true]" GoTo :trim-leading-char-loop
:trim-trailing-char-loop
set "_trim_char=%_trim_inputstring:~-1%"
set "_trim_this="
if "[%_trim_char%]"=="[%_trim_space%]" set "_trim_this=true"
if "[%_trim_char%]"=="[%_trim_tab%]" set "_trim_this=true"
if "[%_trim_this%]"=="[true]" set "_trim_inputstring=%_trim_inputstring:~,-1%"
if "[%_trim_this%]"=="[true]" GoTo :trim-trailing-char-loop
set "%~2=%_trim_inputstring%"
Call :ClearVariablesByPrefix _trim
GoTo :EOF

