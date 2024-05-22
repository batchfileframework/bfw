@echo off

:Shift-demo

set "shift-demo-helper="
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/0"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/1"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/2"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/3"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/4"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/5"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/6"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/7"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/8"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/9"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L
echo.
set "shift-demo-helper=/10"
Call :shift-demo-helper urg1A urg2B urg3C urg4D urg5E urg6F urg7G urg8H urg9I urg10J urg11K urg12L

GoTo :EOF

:shift-demo-helper
echo shift arguments : shift "%shift-demo-helper%" "%shift-demo-helper2%"
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo 0:%~0:0  1:%~1:1 2:%~2:2 3:%~3:3 4:%~4:4 5:%~5:5 6:%~6:6 7:%~7:7 8:%~8:8 9:%~9:9 10:%~10:10 11:%~11:11 12:%~12:12
shift %shift-demo-helper% %shift-demo-helper2%
echo All arguments %%^*
echo %*

GoTo :EOF