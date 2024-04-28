
:LTrim-RTrim-DEMO

set myvalue=

echo.
echo ltrim with various amounts of spaces and tabs before the word Hello.
Call :ltrim myvalue " Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "  Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "   Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "      Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "	Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "				Hello."
echo output:%myvalue%^|
Call :ltrim myvalue "	 	 	 	 	  	 	 	 	 Hello."
echo output:%myvalue%^|

echo.
echo The same thing but ByRef instead of ByVal

set myinput= Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=  Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=   Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=      Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=	Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=				Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|
set myinput=	 	 	 	 	  	 	 	 	 Hello.
Call :ltrim myvalue myinput
echo output:%myvalue%^|

echo.
echo rtrim with various amounts of spaces and tabs after the word Hello.
Call :rtrim myvalue "Hello. "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.  "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.   "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.      "
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.	"
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.				"
echo output:%myvalue%^|
Call :rtrim myvalue "Hello.	 	 	 	 	  	 	 	 	 "
echo output:%myvalue%^|

echo.
echo The same thing but ByRef instead of ByVal

set myinput=Hello. 
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.  
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.   
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.      
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.				
Call :rtrim myvalue myinput
echo output:%myvalue%^|
set myinput=Hello.	 	 	 	 	  	 	 	 	 
Call :rtrim myvalue myinput
echo output:%myvalue%^|



GoTo :EOF

