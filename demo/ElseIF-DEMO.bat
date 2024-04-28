
:ElseIF-DEMO

set "_mychar=a"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)

set "_mychar=b"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)

set "_mychar=c"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)

set "_mychar=%%"

if "%_mychar%"=="b" ( echo it was b) else if "%_mychar%"=="c" ( echo it was c ) else if "%_mychar%"=="a" ( echo it was a ) else ( echo it was else )

	if "%_mychar%"=="b" ( 
		echo it was b
		) else if "%_mychar%"=="c" ( 
		echo it was c 
		) else if "%_mychar%"=="a" ( 
		echo it was a 
		) else ( 
		echo it was else 
		)
GoTo :EOF

