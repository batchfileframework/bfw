
:Performance-timer-DEMO


Call :ClearVariablesByPrefix "app.timer" _StartTimer _UpdateTimer _PrintTimer _ClearTimer _UpdateTimerAndPrint _GetTimeDifference _UTAP _GTD 

echo.
echo First test, running StartTimer, then UpdateTimer a bunch of time, then PrintTimer
echo then showing the whole app.timer.default structure 
echo then calling ClearTimer, now app.timer.default should not be defined
echo.
Call :StartTimer 
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :UpdateTimer
Call :PrintTimer
echo.
echo.
set app.timer.default
Call :ClearTimer
set app.timer.default
echo.

echo.
echo Same test as previous, but a comment is included on each step 
echo empty variable required to fullfill "semi-optional" argument
echo.
Call :StartTimer "" "This is start timer" 
Call :UpdateTimer "" "This is update 1"
Call :UpdateTimer "" "This is update 2"
Call :UpdateTimer "" "This is update 3"
Call :UpdateTimer "" "This is update 4"
Call :UpdateTimer "" "This is update 5"
Call :UpdateTimer "" "This is update 6"
Call :UpdateTimer "" "This is update 7"
Call :PrintTimer
echo.
echo.
set app.timer.default
Call :ClearTimer
set app.timer.default
echo.


echo.
echo Same test as previous, but with a named timer
echo.
Call :StartTimer NamedTimer1 "This is start timer" 
Call :UpdateTimer NamedTimer1 "This is update 1"
Call :UpdateTimer NamedTimer1 "This is update 2"
Call :UpdateTimer NamedTimer1 "This is update 3"
Call :UpdateTimer NamedTimer1 "This is update 4"
Call :UpdateTimer NamedTimer1 "This is update 5"
Call :UpdateTimer NamedTimer1 "This is update 6"
Call :UpdateTimer "NamedTimer1" "This is update 7"
Call :PrintTimer NamedTimer1
echo.
echo.
set app.timer
Call :ClearTimer NamedTimer1
set app.timer
echo.

echo.
echo Same test as previous, but with two named timers and interlaced updates
echo no longer showing app.timer structure
echo.
Call :StartTimer NamedTimer2 "Th2s is start timer" 
Call :StartTimer NamedTimer3 "Th3s is start timer" 
Call :UpdateTimer NamedTimer2 "Th2s is update 1"
Call :UpdateTimer NamedTimer3 "Th3s is update 1"
Call :UpdateTimer NamedTimer2 "Th2s is update 2"
Call :UpdateTimer NamedTimer3 "Th3s is update 2"
Call :UpdateTimer NamedTimer2 "Th2s is update 3"
Call :UpdateTimer NamedTimer3 "Th3s is update 3"
Call :UpdateTimer NamedTimer2 "Th2s is update 4"
Call :UpdateTimer NamedTimer3 "Th3s is update 4"
Call :UpdateTimer NamedTimer2 "Th2s is update 5"
Call :UpdateTimer NamedTimer3 "Th3s is update 5"
Call :UpdateTimer NamedTimer2 "Th2s is update 6"
Call :UpdateTimer NamedTimer3 "Th3s is update 6"
Call :UpdateTimer "NamedTimer2" "Th2s is update 7"
Call :UpdateTimer "NamedTimer3" "Th3s is update 7"
Call :PrintTimer NamedTimer2
Call :PrintTimer NamedTimer3
Call :ClearTimer NamedTimer2
Call :ClearTimer NamedTimer3
echo.


echo.
echo Single named timer, testing sleep function in between
echo.
Call :StartTimer NamedTimer1 "This is start timer" 
Call :UpdateTimer NamedTimer1 "This is update 1"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 2"
Call :Sleep
Call :Sleep
Call :Sleep
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 3"
Call :Sleep
Call :Sleep
Call :Sleep
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 4"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 5"
Call :Sleep
Call :UpdateTimer NamedTimer1 "This is update 6"
Call :UpdateTimer "NamedTimer1" "This is update 7"
Call :PrintTimer NamedTimer1
Call :ClearTimer NamedTimer1
echo.

GoTo :EOF

