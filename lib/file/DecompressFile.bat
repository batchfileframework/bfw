

::Usage Call :DecompressFile Filename
:DecompressFile
set "_Decompress_File=%~1"
set "_Decompress_Filename=%~n1"
set "_Decompress_Filepath=%~dp1"
if "[%_Decompress_Filepath:~0,-1%]" EQU "[\]" set "_Decompress_Filepath=%_Decompress_Filepath:~0,-1%"
set "_Decompress_ExtraFiles="
for /f "tokens=*" %%a in ('tar -tf "%_Decompress_File%" --exclude "%_Decompress_Filename%"') do ( set "_Decompress_ExtraFiles=true" )
if "[%_Decompress_ExtraFiles%]" EQU "[true]" md "%_Decompress_Filepath%%_Decompress_Filename%" 2>nul
if "[%_Decompress_ExtraFiles%]" EQU "[true]" tar -xf "%_Decompress_File%" -C "%_Decompress_Filepath%%_Decompress_Filename%"
if "[%_Decompress_Filepath:~-1%]" EQU "[\]" set "_Decompress_Filepath=%_Decompress_Filepath:~0,-1%"
if "[%_Decompress_ExtraFiles%]" NEQ "[true]" tar -xf "%_Decompress_File%" -C "%_Decompress_Filepath%"
if "[%~2]" NEQ "[]" ( shift & GoTo :DecompressFile )
set "_Decompress_File=" & set "_Decompress_Filename=" & set "_Decompress_ExtraFiles="
GoTo :EOF
*******************************************************************************
* Function name : DecompressFile
* Aliases : None
*******************************************************************************
* Description : Decompresses a specified file using the 'tar' command, handling 
*               both single and multiple file archives by extracting them into 
*               their respective directories.
*******************************************************************************
* Parameters :
*   Filename : String - The name of the file to be decompressed.
*******************************************************************************
* Return Value : None
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
* Dependencies : Requires the 'tar' command-line utility.
* Configuration Files: None
* Environment Variables: None
*******************************************************************************
* Functional state : Working
* Compatible : Tested on Windows 10 version 22H2
* Test Coverage: Basic functionality tested with single and multiple file archives.
*******************************************************************************
* Usage Examples :
*   DecompressFile archive.tar.gz
*   DecompressFile package.tar
*******************************************************************************
* Theory of Operation :
*   The function first determines the full path, name, and directory of the file 
*   to be decompressed. It checks for extra files within the archive. If extra 
*   files are present, it creates a directory named after the file and extracts 
*   all contents into this directory. If no extra files are found, it extracts 
*   the contents into the current directory. The function supports decompression 
*   of both types of tar archives (with or without extra files) by utilizing 
*   conditional logic and the 'tar' utility.
*******************************************************************************
* Function Assumptions :
*   - The 'tar' utility is available and functional in the command line environment.
*   - The file to be decompressed is a tar archive.
*******************************************************************************
* Error handling :
*   Errors from the 'tar' command are redirected to null, and the function does 
*   not explicitly handle errors. Users should verify successful decompression.
* Side Effects :
*   May create a new directory for the decompressed files.
* Security Considerations :
*   Ensure that the source of the tar archives is trusted, as decompressing files 
*   can potentially extract harmful content.
* Performance Considerations :
*   Decompression time and performance depend on the size of the archive and the 
*   speed of the host system.
*******************************************************************************
* Internationalization and Localization: Not applicable
* Accessibility: Not applicable
* Thread Safety: Not thread-safe due to potential concurrent write operations 
*                to the same directory or files.
* Memory Management: Not applicable, relies on the 'tar' utility for file operations.
*******************************************************************************
* Related Tools and Libraries: tar command-line utility
* See Also :
*   tar(1) - manual page for the tar command
*******************************************************************************
* FAQs:
*   Q: Can it decompress other types of archives?
*   A: No, it is specifically designed for tar archives.
*******************************************************************************
* User Feedback: For feedback or bug reports, please visit the forum thread at 
*                the repository URL.
* Contact Information: Not provided
*******************************************************************************
* Ethical Considerations: Use responsibly when decompressing files from 
*                         untrusted sources.
* License : GPL 3
*******************************************************************************
* Examples Repository: Not available
*******************************************************************************



:DecompressFile-help
echo *******************************************************************************
echo * Function Name: DecompressFile
echo * Description: Decompresses a specified file using the 'tar' command, handling 
echo *               both single and multiple file archives by extracting them into 
echo *               their respective directories.
echo *******************************************************************************
echo * Usage:
echo *   DecompressFile Filename
echo *
echo * Parameters:
echo *   Filename - The name of the file to be decompressed. This is a required parameter.
echo *
echo * Options:
echo *   There are no options for this function. It strictly requires a filename as input.
echo *******************************************************************************
echo * Examples:
echo *   1. DecompressFile archive.tar.gz
echo *      This example decompresses the 'archive.tar.gz' file into the current directory or into a 
echo *      new directory named after the archive if it contains multiple files.
echo *
echo *   2. DecompressFile package.tar
echo *      This example decompresses the 'package.tar' archive, extracting its contents into the 
echo *      current directory or a new directory if the archive contains multiple items.
echo *******************************************************************************
echo * Additional Notes:
echo *   - Ensure that the 'tar' utility is available in your command line environment before using 
echo *     this function.
echo *   - The function is designed to work on Windows 10 version 22H2 and might not be compatible 
echo *     with other versions or operating systems without modification.
echo *   - Errors during decompression are not explicitly handled by this function and should be 
echo *     manually checked.
echo *******************************************************************************
echo * See Also:
echo *   - tar(1) - manual page for the tar command
echo *******************************************************************************
goto :EOF

