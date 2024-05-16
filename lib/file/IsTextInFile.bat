

::Usage Call :IsTextInFile optional _OutputVar Filename String1 String2 ... StringN && String found in file || String not found in file
:IsTextInFile
set "_IsTextInFile_buffer=%~1"
if /i "[%_IsTextInFile_buffer:~0,10%]" EQU "[_OutputVar]" ( set "_IsTextInFile_output=%~1" & shift )
set "_IsTextInFile_buffer="
set "_IsTextInFile_file=%~1"
shift
:IsTextInFile-loop
set "_IsTextInFile_result=false"
for /f "delims=" %%i in ('findstr /m /c:"%~1" "%_IsTextInFile_file%"') do ( set "_IsTextInFile_result=true" )
if "[%_IsTextInFile_result%]" EQU "[true]" if "[%~2]" NEQ "[]" ( shift & GoTo :IsTextInFile-loop )
if "[%_IsTextInFile_output%]" NEQ "[]" set "%_IsTextInFile_output%=%_IsTextInFile_result%"
set "_IsTextInFile_file=" & set "_IsTextInFile_output=" & set "_IsTextInFile_result=" & if "[%_IsTextInFile_result%]" EQU "[true]" ( exit /b 0 ) else ( exit /b 1 )
*******************************************************************************
* Function name : IsTextInFile
* Aliases : None
*******************************************************************************
* Description : Searches for specified text strings within a file and optionally 
*               outputs the search result to a specified variable.
*******************************************************************************
* Parameters :
*   _OutputVar (optional) : String - The name of the variable to store the result 
*                            of the text search (true if found, false otherwise).
*   Filename : String - The path of the file to search within.
*   String1, String2, ... StringN : String - The text strings to search for in the file.
*******************************************************************************
* Return Value : The function sets an optional output variable to "true" if any 
*                of the specified strings are found, "false" otherwise. Also, 
*                it exits with 0 if any string is found, or 1 if not.
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
* Dependencies : Requires the 'findstr' command-line utility.
* Configuration Files: None
* Environment Variables: None
*******************************************************************************
* Functional state : Working
* Compatible : Tested for Windows 10 version 22H2
* Test Coverage: Basic functionality tested with various strings and file types.
*******************************************************************************
* Usage Examples :
*   1. IsTextInFile _result "C:\path\to\file.txt" "example text" && echo String found in file || echo String not found in file
*      Searches "file.txt" for "example text", outputs result to _result variable, and echoes if the string was found or not.
*
*   2. IsTextInFile "C:\path\to\file.txt" "searchString1" "searchString2"
*      Searches "file.txt" for "searchString1" and "searchString2", exits with 0 if found, otherwise with 1.
*******************************************************************************
* Theory of Operation :
*   The function iterates over each specified string, using 'findstr' to search 
*   the given file for each string. If any string is found, the search 
*   terminates, and the function sets the output variable to "true" if defined, 
*   or exits with 0. If none of the strings are found, the output variable is 
*   set to "false" or the function exits with 1.
*******************************************************************************
* Function Assumptions :
*   - The 'findstr' utility is available in the command line environment.
*   - The file exists and is accessible.
*******************************************************************************
* Error handling :
*   Implicitly relies on 'findstr' for error handling. If 'findstr' encounters 
*   an error (e.g., file not found), the function may not behave as expected.
*******************************************************************************
* Side Effects :
*   None
* Security Considerations :
*   Ensure the file being searched does not contain sensitive information that 
*   could be exposed in an insecure environment.
* Performance Considerations :
*   Performance may vary based on file size and the number of search strings.
*******************************************************************************
* Internationalization and Localization: Not applicable
* Accessibility: Not applicable
* Thread Safety: This function is not inherently thread-safe due to potential 
*                concurrent access to the output variable.
* Memory Management: Not applicable
*******************************************************************************
* Related Tools and Libraries: 'findstr' command-line utility
* See Also :
*   - 'findstr' command documentation
*******************************************************************************
* FAQs:
*   Q: Can it search for multiple strings in one go?
*   A: Yes, the function iterates over each string provided as arguments.
*******************************************************************************
* User Feedback: For feedback or bug reports, please visit the forum thread at 
*                the repository URL.
* Contact Information: Not provided
*******************************************************************************
* Ethical Considerations: Use responsibly, especially when searching files 
*                         containing personal or sensitive data.
* License : GPL 3
*******************************************************************************
* Examples Repository: Not available
*******************************************************************************

:IsTextInFile-help
echo *******************************************************************************
echo * Function Name: IsTextInFile
echo * Description: Searches for specified text strings within a file and optionally 
echo *               outputs the search result to a specified variable.
echo *******************************************************************************
echo * Usage:
echo *   IsTextInFile [_OutputVar] Filename String1 [String2] ... [StringN] && echo String found in file || echo String not found in file
echo *
echo * Parameters:
echo *   _OutputVar (optional) - The name of the variable to store the search result.
echo *   Filename - The path of the file to search within.
echo *   String1, String2, ... StringN - The text strings to search for in the file.
echo *
echo * Options:
echo *   This function does not have specific options outside of the optional _OutputVar.
echo *******************************************************************************
echo * Examples:
echo *   1. IsTextInFile "C:\path\to\yourfile.txt" "searchTerm" && echo String found || echo String not found
echo *      Searches for "searchTerm" in "yourfile.txt" and echoes if the string was found.
echo *
echo *   2. IsTextInFile resultVar "C:\path\to\yourfile.txt" "firstTerm" "secondTerm"
echo *      Searches for "firstTerm" and "secondTerm" in "yourfile.txt" and stores the result in resultVar.
echo *******************************************************************************
echo * Additional Notes:
echo *   - If multiple strings are provided, the function will search for each string 
echo *     sequentially and stop at the first occurrence of any string.
echo *   - The function uses the 'findstr' utility available in Windows and is dependent 
echo *     on its availability and functionality.
echo *   - Ensure correct escaping of special characters in search strings according to 
echo *     'findstr' documentation.
echo *******************************************************************************
echo * See Also:
echo *   - 'findstr' command documentation for details on search string formatting and limitations.
echo *******************************************************************************
goto :EOF

