@echo off

:HelloWorldPS
powershell -command "Add-Type -TypeDefinition \"Imports System:Public Module HelloWorld`nSub Main()`nConsole.WriteLine(\"\"Hello, World!\"\")`nEnd Sub:End Module\" -Language VisualBasic; [HelloWorld]::Main()"
GoTo :EOF