
:EchoSingleArgumentTest-DEMO

echo How argument with ampersand in them work
echo result : no argument with ampersand allowed byval

echo argument with ^& ( )
Call :EchoSingleArgumentTest A1rgum&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest A2rgum^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest A3rgum^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest A4rgum^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A5rgum^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A6rgum^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A7rgum^^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest A8rgum^^^^^^^&ent1 Argument2 ArgumentN
echo.

echo argument with ^& ( )
Call :EchoSingleArgumentTest "A1rgum&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest "A2rgum^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest "A3rgum^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest "A4rgum^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A5rgum^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A6rgum^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A7rgum^^^^^^&ent1 Argument2 ArgumentN
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A8rgum^^^^^^^&ent1 Argument2 ArgumentN
echo.

echo argument with ^& ( )
Call :EchoSingleArgumentTest "A1rgum&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^& ( )
Call :EchoSingleArgumentTest "A2rgum^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^& ( )
Call :EchoSingleArgumentTest "A3rgum^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^& ( )
Call :EchoSingleArgumentTest "A4rgum^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A5rgum^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A6rgum^^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A7rgum^^^^^^&ent1 Argument2 ArgumentN"
echo.
echo argument with ^^^^^^^^^^^^^^^& ( )
Call :EchoSingleArgumentTest "A8rgum^^^^^^^&ent1 Argument2 ArgumentN"
echo.

GoTo :EOF
