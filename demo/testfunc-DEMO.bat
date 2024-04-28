
:testfunc-DEMO
call :testfunc 1test"test
echo.
call :testfunc "1test"test"
echo.
call :testfunc 2test""test
echo.
call :testfunc "2test""test"
echo.
call :testfunc 3test"""test
echo.
call :testfunc "3test"""test"
echo.
call :testfunc 4test""""test
echo.
call :testfunc "4test""""test"
echo.
call :testfunc 5test"""""test
echo.
call :testfunc "5test"""""test"
echo.
call :testfunc 1test^"test
echo.
call :testfunc "1test^"test"
echo.
call :testfunc 2test^"^"test
echo.
call :testfunc "2test^"^"test"
echo.
call :testfunc 3test^"^"^"test
echo.
call :testfunc "3test^"^"^"test"
echo.
call :testfunc 4test^"^"^"^"test
echo.
call :testfunc "4test^"^"^"^"test"
echo.
call :testfunc 5test^"^"^"^"^"test
echo.
call :testfunc "5test^"^"^"^"^"test"

goto :eof

