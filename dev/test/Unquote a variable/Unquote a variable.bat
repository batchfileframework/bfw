@echo off
setlocal EnableDelayedExpansion

set "quoted_var="This is a quoted string.""
echo Original variable: %quoted_var%

set "unquoted_var=%~quoted_var%"
echo Unquoted variable: %unquoted_var%