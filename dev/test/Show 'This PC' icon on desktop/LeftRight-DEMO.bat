
:LeftRight-DEMO

set "myteststring1=this is a regular string"
set "myteststring2=  this is a regular string with two spaces in front"
set "myteststring3=  this is a regular string with two spaces in front and at the end  "
set "myteststring3=this is a regular string with two spaces at the end  "

echo. 
echo Test left function 
echo.

Call :Left "%myteststring1%" OutputVariable 1
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 2
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 12
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 24
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 25
echo %OutputVariable%
Call :Left "%myteststring1%" OutputVariable 26
echo %OutputVariable% (lenght longer than the variable is fine)

Call :Left "%myteststring2%" OutputVariable 1
echo "%OutputVariable%" echo will return echo off if you only give it spaces
Call :Left "%myteststring2%" OutputVariable 2
echo "%OutputVariable%"
Call :Left "%myteststring2%" OutputVariable 12
echo %OutputVariable%
Call :Left "%myteststring2%" OutputVariable 24
echo %OutputVariable%
Call :Left "%myteststring2%" OutputVariable 25
echo %OutputVariable%
Call :Left "%myteststring2%" OutputVariable 26
echo %OutputVariable%

Call :Left "%myteststring3%" OutputVariable 1
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 2
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 12
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 24
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 25
echo %OutputVariable%
Call :Left "%myteststring3%" OutputVariable 26
echo %OutputVariable%

echo. 
echo Test right function 
echo.

Call :Right "%myteststring1%" OutputVariable 1
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 2
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 12
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 24
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 25
echo %OutputVariable%
Call :Right "%myteststring1%" OutputVariable 26
echo %OutputVariable% (lenght longer than the variable is fine)

Call :Right "%myteststring2%" OutputVariable 1
echo %OutputVariable% 
Call :Right "%myteststring2%" OutputVariable 2
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 12
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 24
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 25
echo %OutputVariable%
Call :Right "%myteststring2%" OutputVariable 26
echo %OutputVariable%

Call :Right "%myteststring3%" OutputVariable 1
echo "%OutputVariable%" echo will return echo off if you only give it spaces
Call :Right "%myteststring3%" OutputVariable 2
echo "%OutputVariable%"
Call :Right "%myteststring3%" OutputVariable 12
echo %OutputVariable%
Call :Right "%myteststring3%" OutputVariable 24
echo %OutputVariable%
Call :Right "%myteststring3%" OutputVariable 25
echo %OutputVariable%
Call :Right "%myteststring3%" OutputVariable 26
echo %OutputVariable%

echo. 
echo Test mid function 
echo.

Call :Mid "%myteststring1%" OutputVariable 1
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 4
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 2 5
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 1 8
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 7 10
echo %OutputVariable%
Call :Mid "%myteststring1%" OutputVariable 6 18
echo %OutputVariable%

echo. 
echo Test replace function 
echo.

Call :Replace "%myteststring1%" OutputVariable This That
echo %OutputVariable%
Call :Replace "%myteststring1%" OutputVariable is was
echo %OutputVariable% (it will match every instance of the search string)
Call :Replace "%myteststring1%" OutputVariable a TWO
echo %OutputVariable%
Call :Replace "%myteststring1%" OutputVariable REGULAR spécial
echo %OutputVariable% (this should be e-acute in UTF-8)
Call :Replace "%myteststring1%" OutputVariable STRing double
echo %OutputVariable%

echo. 
echo Test count function 
echo.

Call :Count "%myteststring1%" OutputVariable This
echo %OutputVariable% (should be 1)
Call :Count "%myteststring1%" OutputVariable is
echo %OutputVariable% (should be 2)
Call :Count "%myteststring1%" OutputVariable "This is"
echo %OutputVariable% (should be 1)
Call :Count "%myteststring1%" OutputVariable "i"
echo %OutputVariable% (should be 3)
Call :Count "%myteststring1%" OutputVariable " "
echo %OutputVariable% (should be 4)
Call :Count "%myteststring1%" OutputVariable "this is a regular string"
echo %OutputVariable% (should be 1)

GoTo :EOF

