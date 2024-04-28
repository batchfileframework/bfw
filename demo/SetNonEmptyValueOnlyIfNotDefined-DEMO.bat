
:SetNonEmptyValueOnlyIfNotDefined-DEMO

echo expected results
echo emptyvalue  / variable not set +                 SetNonEmptyValue = do nothing
echo emptyvalue  / variable     set +                 SetNonEmptyValue = do nothing
echo filledvalue / variable not set +                 SetNonEmptyValue = do it
echo filledvalue / variable     set +                 SetNonEmptyValue = do it
echo emptyvalue  / variable not set +                  SetIfNotDefined = do it
echo emptyvalue  / variable     set +                  SetIfNotDefined = do nothing
echo filledvalue / variable not set +                  SetIfNotDefined = do it
echo filledvalue / variable     set +                  SetIfNotDefined = do nothing
echo emptyvalue  / variable not set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo emptyvalue  / variable     set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo filledvalue / variable not set + SetNonEmptyValueOnlyIfNotDefined = do it
echo filledvalue / variable     set + SetNonEmptyValueOnlyIfNotDefined = do nothing
echo.

echo doing :SetNonEmptyValue-DEMO-start 
Call :SetNonEmptyValue-DEMO-start
echo.
echo doing :SetIfNotDefined-DEMO-start
Call :SetIfNotDefined-DEMO-start
echo.
echo doing :SetNonEmptyValueOnlyIfNotDefined-DEMO-start
Call :SetNonEmptyValueOnlyIfNotDefined-DEMO-start

Call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset
echo.
echo For all these functions you can perform multiple one the same line
echo example Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable "%AFilledValue%" ADefinedVariable
echo.
set AnUndefinedVariable
set ADefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable "%AFilledValue%" ADefinedVariable
set AnUndefinedVariable
set ADefinedVariable


GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO-reset
set "AFilledValue=fillercontent"
set "AnEmptyValue="
set "AnUndefinedVariable="
set "ADefinedVariable=Old value in ADefinedVariable"
GoTo :EOF

:SetNonEmptyValue-DEMO-start

echo.
echo Calling :SetNonEmptyValue with AnEmptyValue to AnUndefinedVariable
Call :SetNonEmptyValue "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AnEmptyValue to ADefinedVariable
Call :SetNonEmptyValue "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AFilledValue to AnUndefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValue with AFilledValue to ADefinedVariable
Call :SetNonEmptyValue "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetIfNotDefined-DEMO-start

echo.
echo Calling :SetIfNotDefined with AnEmptyValue to AnUndefinedVariable
Call :SetIfNotDefined "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AnEmptyValue to ADefinedVariable
Call :SetIfNotDefined "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AFilledValue to AnUndefinedVariable
Call :SetIfNotDefined "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetIfNotDefined with AFilledValue to ADefinedVariable
Call :SetIfNotDefined "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

:SetNonEmptyValueOnlyIfNotDefined-DEMO-start

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AnEmptyValue to AnUndefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AnEmptyValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AnEmptyValue to ADefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AnEmptyValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AFilledValue to AnUndefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AFilledValue%" AnUndefinedVariable
set AnUndefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

echo.
echo Calling :SetNonEmptyValueOnlyIfNotDefined with AFilledValue to ADefinedVariable
Call :SetNonEmptyValueOnlyIfNotDefined "%AFilledValue%" ADefinedVariable
set ADefinedVariable & call :SetNonEmptyValueOnlyIfNotDefined-DEMO-reset

GoTo :EOF

