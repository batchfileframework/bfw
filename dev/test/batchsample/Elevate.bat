
:: Perform self-elevation, passing all arguments through.
:ElevateAndWait
set _ElevateAndWait=-Wait
:Elevate
  if defined args set args=%args:^=^^%
  if defined args set args=%args:<=^<%
  if defined args set args=%args:>=^>%
  if defined args set args=%args:&=^&%
  if defined args set args=%args:|=^|%
  if defined args set "args=%args:"=\"\"%"
  :: Note:  
  ::  * To keep the elevated session open until explicitly exited by the user,
  ::    use /k instead of /c
  powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    " Start-Process %_ElevateAndWait% -Verb RunAs -FilePath cmd -ArgumentList \"/c \"\" cd /d \"\"%CD% \"\" ^&^& \"\"%~f0\"\" %args% \"\" \" "
goto :EOF
REM https://stackoverflow.com/questions/76040676/batch-file-auto-elevation-using-powershell-and-not-mangling-the-arguments-but-pr/76055486?noredirect=1#comment134178642_76055486

