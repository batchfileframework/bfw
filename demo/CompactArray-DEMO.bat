
:CompactArray-DEMO

Call :ClearVariablesByPrefix %_CompactArray_prefix% _CompactArray

set myarray[0].suffixA=DOS - Script Snippets 	DOS Batch Script Snippets.
set myarray[1].suffixA=DOS - String Manipulation 	Basic string manipulation in batch like you are used to from other programming languages.
set myarray[2].suffixA=DOS - String Operations 	Basic string operations in batch like you are used to from other programming languages.
set myarray[3].suffixA=DOS - XCopy Copy Tips 	Use XCopy for more than copy. I.e. check if a file is open and more...
set myarray[4].suffixA=DOS Batch - Date and Time 	Using date and time functions in DOS.
set myarray[5].suffixA=Conception conviviale: Le système de culture en eau profonde à recirculation est économe en eau, 
set myarray[6].suffixA=économe en main-d'œuvre et à haut rendement. Il comporte des joints étanches pour garantir l'absence 
set myarray[7].suffixA=de fuites et des clapets anti-retour en ligne pour éviter les inversions de flux. De plus, il y a un 
set myarray[8].suffixA=dispositif de niveau d'eau sur le côté du seau pour vous 
set myarray[9].suffixA=permettre d'observer l'état de l'eau à tout moment.
set myarray[0]=Open Source, light and extremely simple,
set myarray[1]=It is a single executable file with no dependencies.
set myarray[2]=Just download it and add it to your PATH
set myarray[3]=Create, edit, copy, move, download your files easily,
set myarray[4]=everywhere, every time. Use it as your personal cloud.
set myarray[5]=I have done the following Steps:
set myarray[6]=1 - Import the Barcodes Fonts to the Memory off the Printer
set myarray[7]=2- Configured the Device type in SAP, According to the Xerox Document, for version 4.0 (I'm using ECC 5.0).
set myarray[8]=3 - Print the Production Order. But no barcodes appears. I'm i'm using barcodes CD__00 e CD__01 in the Sapscript.
set myarray[9]=Does any one know way the barcodes are no Printed.
set myarray.ubound=9

set /a "__CompactArray_step+=1"

GoTo :CompactArray-DEMO-%__CompactArray_step%

:CompactArray-DEMO-1

echo.&echo Printing original array, myarray and myarray[].suffixA&echo.
Call :EchoArray myarray LINENUMBERS
echo.
Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-2

echo.&echo Delete Object 5, print array, then run compact array&echo.
Call :DeleteObject myarray[5]
Call :EchoArray myarray LINENUMBERS
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-3

echo.&echo Delete Object 5+6, print array, then run compact array&echo.
Call :DeleteObject myarray[5]
Call :DeleteObject myarray[6]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-4

echo.&echo Delete Object 5+6, print array, then run compact array&echo.
Call :DeleteObject myarray[5]
Call :DeleteObject myarray[6]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS


GoTo :CompactArray-DEMO
:CompactArray-DEMO-5

echo.&echo Delete Object 3,5+6, print array, then run compact array&echo.
Call :DeleteObject myarray[3]
Call :DeleteObject myarray[5]
Call :DeleteObject myarray[6]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-6

echo.&echo Delete Object 0, print array, then run compact array&echo.
Call :DeleteObject myarray[0]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

GoTo :CompactArray-DEMO
:CompactArray-DEMO-7

echo.&echo Delete Object 9, print array, then run compact array&echo.
Call :DeleteObject myarray[9]
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
GoTo :CompactArray-DEMO
:CompactArray-DEMO-8

echo.&echo Array with no gaps&echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS
echo.&echo Running compact array
Call :CompactArray myarray
echo.
Call :EchoArray myarray LINENUMBERS
echo.
REM Call :EchoArray myarray .suffixA LINENUMBERS

Call :ClearVariablesByPrefix myarray __CompactArray_step

GoTo :EOF

