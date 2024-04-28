
:IsInString-DEMO

set "mytestvar=this is a cat"

set "mytestsearch=cat"
echo searching for "%mytestsearch%" in "%mytestvar%", it is in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set "mytestsearch=this is a cat"
echo searching for "%mytestsearch%" in "%mytestvar%", it is in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set "mytestsearch=this is a cat "
echo searching for "%mytestsearch%" in "%mytestvar%", it is not in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set mytestsearch=this
echo searching for "%mytestsearch%" in "%mytestvar%", it is in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set mytestsearch=Calculon
echo searching for "%mytestsearch%" in "%mytestvar%", it is not in
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

set "mytestsearch="
echo searching for "%mytestsearch%" in "%mytestvar%", it is in, I think
Call :IsInString "%mytestvar%" "%mytestsearch%" OutputBool && echo is was in the string || echo it was not in the string
echo result %OutputBool% 
echo.

GoTo :EOF

