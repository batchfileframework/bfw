
::Usage Call :CreateRandomFile FilePath1 FileSize1 FilePath2 FileSize2 ... FilePathN FileSizeN
:CreateRandomFile
set "_CreateRandomFile_filepath=%~1"
set "_CreateRandomFile_filesize=%~2"
if "[%_CreateRandomFile_filepath%]" EQU "[]" if "[%_CreateRandomFile_filesize%]" EQU "[]" exit /b 1
powershell -command "$bytes = New-Object Byte[] %_CreateRandomFile_filesize%; $random = New-Object System.Random; $random.NextBytes($bytes); [System.IO.File]::WriteAllBytes('%_CreateRandomFile_filepath%', $bytes)"
if "[%~3]" NEQ "[]" if "[%~4]" NEQ "[]" (shift & shift & GoTo :CreateRandomFile)
set "_CreateRandomFile_filepath=" & set "_CreateRandomFile_filesize=" & GoTo :EOF
*******************************************************************************
* Function name : CreateRandomFile
* Aliases : None
*******************************************************************************
* Description : Generates one or more files with specified sizes filled with 
*               random data. This function utilizes PowerShell to create the 
*               random content.
*******************************************************************************
* Parameters :
*   FilePathN : String - The path where the random file will be created.
*   FileSizeN : Integer - The size of the file to be created, in bytes.
*******************************************************************************
* Return Value : None directly from the batch function, but it relies on 
*                PowerShell's execution status.
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
* Dependencies : Requires PowerShell to be available on the system.
* Configuration Files: None
* Environment Variables: None
*******************************************************************************
* Functional state : Working
* Compatible : Tested for Windows 10 version 22H2
* Test Coverage: Functionality tested for creating files of various sizes.
*******************************************************************************
* Usage Examples :
*   1. CreateRandomFile C:\temp\randomFile1.bin 1024
*      Creates a file named 'randomFile1.bin' in C:\temp with 1024 bytes of 
*      random data.
*
*   2. CreateRandomFile D:\docs\randomFile2.bin 2048 D:\docs\randomFile3.bin 4096
*      Creates two files with 2048 and 4096 bytes of random data in D:\docs.
*******************************************************************************
* Theory of Operation :
*   The function takes a pair of arguments for each file to be created: the file 
*   path and the file size in bytes. It then invokes a PowerShell command to 
*   generate an array of random bytes of the specified size and writes this array 
*   to the file path specified. The process repeats for each pair of arguments 
*   provided.
*******************************************************************************
* Function Assumptions :
*   - PowerShell is installed and accessible on the system.
*   - The user has write permissions to the specified file paths.
*******************************************************************************
* Error handling :
*   Errors from PowerShell or file system restrictions (e.g., write permissions, 
*   non-existent directories) are not explicitly handled and may cause the 
*   function to fail silently.
* Side Effects :
*   - Can overwrite existing files without warning.
*   - Generates files with truly random content, which may not be suitable for 
*     all testing purposes.
*******************************************************************************
* Security Considerations :
*   Be cautious when specifying file paths to avoid unintentional overwriting of 
*   important files or creating files in sensitive directories.
* Performance Considerations :
*   Generating and writing large files may take considerable time and system 
*   resources, depending on the system's capabilities.
*******************************************************************************
* Internationalization and Localization: Not applicable
* Accessibility: Not applicable
* Thread Safety: Not inherently thread-safe due to potential concurrent access 
*                to the same files or directories.
* Memory Management: Relies on PowerShell for generating and handling the byte 
*                    array; no specific memory management considerations within 
*                    the batch file itself.
*******************************************************************************
* Related Tools and Libraries: PowerShell
* See Also :
*   - PowerShell documentation for `[System.Random]` and `[System.IO.File]` classes.
*******************************************************************************
* FAQs:
*   Q: What if PowerShell is not available on my system?
*   A: This function will not work without PowerShell. Ensure your system has 
*      PowerShell installed and accessible.
*******************************************************************************
* User Feedback: For feedback or bug reports, please visit the forum thread at 
*                the repository URL.
* Contact Information: Not provided
*******************************************************************************
* Ethical Considerations: Use responsibly, especially when generating large 
*                         amounts of data that may impact system storage.
* License : GPL 3
*******************************************************************************
* Examples Repository: Not available
*******************************************************************************


:CreateRandomFile-help
echo *******************************************************************************
echo * Function Name: CreateRandomFile
echo * Description: Generates files of specified sizes filled with random data.
echo *******************************************************************************
echo * Usage:
echo *   CreateRandomFile FilePath1 FileSize1 [FilePath2 FileSize2] ... [FilePathN FileSizeN]
echo *
echo * Parameters:
echo *   FilePath1 - The path where the first random file will be created.
echo *   FileSize1 - The size of the first file in bytes.
echo *   FilePath2, FileSize2, ... (optional) - Additional file paths and their sizes.
echo *
echo * Options:
echo *   This function does not have specific options. Each file path and size pair
echo *   is required for generating each file.
echo *******************************************************************************
echo * Examples:
echo *   1. CreateRandomFile "C:\temp\randomFile1.txt" 1024
echo *      Creates a file named randomFile1.txt in C:\temp with 1024 bytes of random data.
echo *
echo *   2. CreateRandomFile "C:\temp\randomFile1.txt" 1024 "D:\docs\randomFile2.txt" 2048
echo *      Creates a file named randomFile1.txt in C:\temp with 1024 bytes of random data and
echo *      another file named randomFile2.txt in D:\docs with 2048 bytes of random data.
echo *******************************************************************************
echo * Additional Notes:
echo *   - The function uses PowerShell to generate the random data and requires 
echo *     PowerShell to be available on the system.
echo *   - Ensure there is enough disk space available for the file(s) being created.
echo *   - The function overwrites existing files without warning.
echo *******************************************************************************
echo * See Also:
echo *   - PowerShell documentation on New-Object, System.Random, and [System.IO.File]::WriteAllBytes.
echo *******************************************************************************
goto :EOF


:CreateRandomFile-demo
echo Demonstrating the CreateRandomFile function...

:: Generate a single random file of 1024 bytes
Call :CreateRandomFile "randomFile1.txt" 1024

:: Generate another random file of 2048 bytes
Call :CreateRandomFile "randomFile2.txt" 2048

:: Generate two more files with different sizes
Call :CreateRandomFile "randomFile3.txt" 512 "randomFile4.txt" 1536

goto :EOF