@echo off

:setup
:main

for %%a in ( %* ) do ( for %%b in ( /h /? -h -? help --help ) do ( if "[%%a]" EQU "[%%b]" ( Call :%~n0-help & exit /b 1 ) ) )
for %%a in ( %* ) do ( if "[%%a]" EQU "[demo]" ( Call :%~n0-demo & exit /b 1 ) ) 
if "[%~1]" EQU "[]" ( echo %~n0 needs at least one argument & exit /b 1 )
REM if "[%~1]" EQU "[]" if "[%~2]" EQU "[]" ( echo %~n0 needs at least two argument & exit /b 1 )
Call :%~n0 %*

GoTo :EOF

::Usage Call :IsDrive optional OutputVariable a: b: ... n: && IsDrive || IsNotDrive
:IsDrive
set "_IsDrive_buffer=%~1"
if "[%_IsDrive_buffer:~1,1%]" NEQ "[]" if "[%_IsDrive_buffer:~1,1%]" NEQ "[:]" ( set "_IsDrive_output=%~1" & shift )
set "_IsDrive_buffer="
:IsDrive-loop
set "_IsDrive_drive=%~a1"
if "[%_IsDrive_drive:~0,1%]" EQU "[d]" ( set "_IsDrive_result=true" ) else ( set "_IsDrive_result=false" )
if "[%_IsDrive_output%]" NEQ "[]" set "%_IsDrive_output%=%_IsDrive_result%"
if "[%_IsDrive_result%]" EQU "[true]" if "[%~2]" NEQ "[]" ( shift & GoTo :IsDrive-loop )
set "_IsDrive_drive=" & set "_IsDrive_output=" & set "_IsDrive_result=" & if "[%_IsDrive_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )
*******************************************************************************
* Function name : IsDrive
* Aliases : None
*******************************************************************************
* Description : Checks if the specified drive letters exist on the system and 
*               optionally outputs the result to a specified variable.
*******************************************************************************
* Parameters :
*   OutputVariable (optional) : String - The name of the variable to store the 
*                                result of the drive existence check. If not 
*                                specified, the function directly returns the 
*                                result. (Default: None)
*   DriveLetters : String - One or more drive letters to check for existence, 
*                           formatted as "a:", "b:", ..., "n:".
*******************************************************************************
* Return Value : Exits with 0 (true) if the specified drive exists, or 1 (false) 
*                if it does not. When an OutputVariable is specified, the result 
*                is also stored in that variable as "true" or "false".
* Overloads : None
*******************************************************************************
* Creation Date : 2024-02-27 Last Update : 2024-02-27
* Created by : shodan
*******************************************************************************
* Version : 0.9
* Change History :
*   Date 2024-02-27 : Initial publication V0.9
*******************************************************************************
* Repository : https://www.dostips.com/forum/viewtopic.php?f=3&t=11???
* Dependencies : None
* Configuration Files: None
* Environment Variables: None
*******************************************************************************
* Functional state : Working
* Compatible : Tested for Windows 10 version 22H2
* Test Coverage: Basic functionality tested with various drive letters.
*******************************************************************************
* Usage Examples :
*   1. IsDrive resultVariable a: b: && echo Drive exists || echo Drive does not exist
*      Checks if drives "a:" or "b:" exist and outputs the result to "resultVariable".
*   
*   2. IsDrive a: && echo Drive a: exists || echo Drive a: does not exist
*      Directly checks if drive "a:" exists and echoes the result.
*******************************************************************************
* Theory of Operation :
*   The function iterates over each drive letter argument provided. It checks 
*   if the drive letter exists by a specific criterion (omitted for brevity). 
*   If an OutputVariable is specified, it stores the result ("true"/"false") in 
*   that variable. Otherwise, it exits with 0 or 1 based on the existence of 
*   the drive.
*******************************************************************************
* Function Assumptions :
*   - The drive letters provided are in the correct format (e.g., "a:").
*   - The system's command processor can access and verify drive existence.
*******************************************************************************
* Error handling :
*   Implicitly handles errors by setting the result to "false" if a drive check 
*   fails or if an incorrect parameter is provided.
* Side Effects :
*   None
* Security Considerations :
*   None
* Performance Considerations :
*   Performance impact is minimal, but checking multiple drives in succession 
*   may slightly delay script execution.
*******************************************************************************
* Internationalization and Localization: Not applicable
* Accessibility: Not applicable
* Thread Safety: Not thread-safe due to potential concurrent modifications to 
*                the OutputVariable.
* Memory Management: Not applicable
*******************************************************************************
* Related Tools and Libraries: None
* See Also :
*   None
*******************************************************************************
* FAQs:
*   None
*******************************************************************************
* User Feedback: For feedback or bug reports, please visit the forum thread at 
*                the repository URL.
* Contact Information: Not provided
*******************************************************************************
* Ethical Considerations: Ensure ethical use in scripts where drive existence 
*                         verification is critical.
* License : GPL 3
*******************************************************************************
* Examples Repository: Not available
*******************************************************************************

:IsDrive-help
echo *******************************************************************************
echo * Function Name: IsDrive
echo * Description: Checks if the specified drive letters exist on the system and 
echo *               optionally outputs the result to a specified variable.
echo *******************************************************************************
echo * Usage:
echo *   IsDrive [OutputVariable] DriveLetter1 DriveLetter2 ... DriveLetterN
echo *
echo * Parameters:
echo *   OutputVariable (optional) - The name of the variable to store the 
echo *                                result. If not specified, the function 
echo *                                directly returns the result.
echo *   DriveLetters - One or more drive letters to check, formatted as "a:", "b:", etc.
echo *
echo * Options:
echo *   There are no specific options for this function. Parameters must be 
echo *   provided directly as arguments.
echo *******************************************************************************
echo * Examples:
echo *   1. IsDrive resultVar a:
echo *      Checks if drive "a:" exists and stores the result in "resultVar".
echo *
echo *   2. IsDrive a: && echo Drive a: exists || echo Drive a: does not exist
echo *      Directly checks if drive "a:" exists and echoes the result.
echo *******************************************************************************
echo * Additional Notes:
echo *   - This function uses conditional logic to determine the existence of 
echo *     specified drives and does not output detailed error messages.
echo *   - The function is tested and working on Windows 10 version 22H2.
echo *******************************************************************************
echo * See Also:
echo *   - None
echo *******************************************************************************
goto :EOF


:IsDrive-demo

echo test without outputvalue

Call :IsDrive  A: && echo a IsDrive || echo a IsNotDrive
Call :IsDrive  B: && echo b IsDrive || echo b IsNotDrive
Call :IsDrive  C: && echo c IsDrive || echo c IsNotDrive
Call :IsDrive  D: && echo d IsDrive || echo d IsNotDrive
Call :IsDrive  E: && echo e IsDrive || echo e IsNotDrive
Call :IsDrive  F: && echo f IsDrive || echo f IsNotDrive
Call :IsDrive  G: && echo g IsDrive || echo g IsNotDrive
Call :IsDrive  H: && echo h IsDrive || echo h IsNotDrive
Call :IsDrive  I: && echo i IsDrive || echo i IsNotDrive

echo second group

Call :IsDrive  A: A: && echo a IsDrive || echo a IsNotDrive
Call :IsDrive  B: A: && echo b IsDrive || echo b IsNotDrive
Call :IsDrive  C: A: && echo c IsDrive || echo c IsNotDrive
Call :IsDrive  D: A: && echo d IsDrive || echo d IsNotDrive
Call :IsDrive  E: A: && echo e IsDrive || echo e IsNotDrive
Call :IsDrive  F: A: && echo f IsDrive || echo f IsNotDrive
Call :IsDrive  G: A: && echo g IsDrive || echo g IsNotDrive
Call :IsDrive  H: A: && echo h IsDrive || echo h IsNotDrive
Call :IsDrive  I: A: && echo i IsDrive || echo i IsNotDrive

echo third group

Call :IsDrive  A: A: && echo a IsDrive || echo a IsNotDrive
Call :IsDrive  A: B: && echo b IsDrive || echo b IsNotDrive
Call :IsDrive  A: C: && echo c IsDrive || echo c IsNotDrive
Call :IsDrive  A: D: && echo d IsDrive || echo d IsNotDrive
Call :IsDrive  A: E: && echo e IsDrive || echo e IsNotDrive
Call :IsDrive  A: F: && echo f IsDrive || echo f IsNotDrive
Call :IsDrive  A: G: && echo g IsDrive || echo g IsNotDrive
Call :IsDrive  A: H: && echo h IsDrive || echo h IsNotDrive
Call :IsDrive  A: I: && echo i IsDrive || echo i IsNotDrive

echo fourth group

Call :IsDrive  B: A: && echo a IsDrive || echo a IsNotDrive
Call :IsDrive  B: B: && echo b IsDrive || echo b IsNotDrive
Call :IsDrive  B: C: && echo c IsDrive || echo c IsNotDrive
Call :IsDrive  B: D: && echo d IsDrive || echo d IsNotDrive
Call :IsDrive  B: E: && echo e IsDrive || echo e IsNotDrive
Call :IsDrive  B: F: && echo f IsDrive || echo f IsNotDrive
Call :IsDrive  B: G: && echo g IsDrive || echo g IsNotDrive
Call :IsDrive  B: H: && echo h IsDrive || echo h IsNotDrive
Call :IsDrive  B: I: && echo i IsDrive || echo i IsNotDrive

echo fifth group

Call :IsDrive  B: A: && echo a IsDrive || echo a IsNotDrive
Call :IsDrive  B: B: && echo b IsDrive || echo b IsNotDrive
Call :IsDrive  B: C: && echo c IsDrive || echo c IsNotDrive
Call :IsDrive  B: D: && echo d IsDrive || echo d IsNotDrive
Call :IsDrive  B: E: && echo e IsDrive || echo e IsNotDrive
Call :IsDrive  B: F: && echo f IsDrive || echo f IsNotDrive
Call :IsDrive  B: G: && echo g IsDrive || echo g IsNotDrive
Call :IsDrive  B: H: && echo h IsDrive || echo h IsNotDrive
Call :IsDrive  B: I: && echo i IsDrive || echo i IsNotDrive

echo test with outputvalue

Call :IsDrive OutputValue A: && echo a IsDrive || echo a IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: && echo b IsDrive || echo b IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue C: && echo c IsDrive || echo c IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue D: && echo d IsDrive || echo d IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue E: && echo e IsDrive || echo e IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue F: && echo f IsDrive || echo f IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue G: && echo g IsDrive || echo g IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue H: && echo h IsDrive || echo h IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue I: && echo i IsDrive || echo i IsNotDrive

echo second group

Call :IsDrive OutputValue A: A: && echo a IsDrive || echo a IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: A: && echo b IsDrive || echo b IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue C: A: && echo c IsDrive || echo c IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue D: A: && echo d IsDrive || echo d IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue E: A: && echo e IsDrive || echo e IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue F: A: && echo f IsDrive || echo f IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue G: A: && echo g IsDrive || echo g IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue H: A: && echo h IsDrive || echo h IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue I: A: && echo i IsDrive || echo i IsNotDrive

echo third group

Call :IsDrive OutputValue A: A: && echo a IsDrive || echo a IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: B: && echo b IsDrive || echo b IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: C: && echo c IsDrive || echo c IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: D: && echo d IsDrive || echo d IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: E: && echo e IsDrive || echo e IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: F: && echo f IsDrive || echo f IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: G: && echo g IsDrive || echo g IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: H: && echo h IsDrive || echo h IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue A: I: && echo i IsDrive || echo i IsNotDrive

echo fourth group

Call :IsDrive OutputValue B: A: && echo a IsDrive || echo a IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: B: && echo b IsDrive || echo b IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: C: && echo c IsDrive || echo c IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: D: && echo d IsDrive || echo d IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: E: && echo e IsDrive || echo e IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: F: && echo f IsDrive || echo f IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: G: && echo g IsDrive || echo g IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: H: && echo h IsDrive || echo h IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: I: && echo i IsDrive || echo i IsNotDrive

echo fifth group

Call :IsDrive OutputValue B: A: && echo a IsDrive || echo a IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: B: && echo b IsDrive || echo b IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: C: && echo c IsDrive || echo c IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: D: && echo d IsDrive || echo d IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: E: && echo e IsDrive || echo e IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: F: && echo f IsDrive || echo f IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: G: && echo g IsDrive || echo g IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: H: && echo h IsDrive || echo h IsNotDrive
echo %OutputValue%
Call :IsDrive OutputValue B: I: && echo i IsDrive || echo i IsNotDrive


GoTo :EOF
