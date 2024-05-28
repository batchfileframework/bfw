
# Batchfile Framework (BFW)

## What is THIS ?

A self-contained library of batch functions

You can call them directly from the console

Or from your batch scripts 

## Why is this a thing ?

To help making batch script easier

Because there was no single big repository of standalone batch functions

## How do I get it right now ?

    curl https://github.com/batchfileframework/BatchfileFrameWork/raw/main/bfw/bfw.bat -o bfw.bat & bfw.bat install

## What can I do with it ?

stuff

## How does it work ?

dunno

k


## Previous explanation

Is a batch file that helps you create other batch files
It is also a set of conventions (yet unwritten) on how to create re-usable batch functions

The first part of this is the bfw function library

This function library contains a function switcher (similar to how busybox works)
and an array of function which you can call upon in two ways

1. bfw FUNCTIONNAME arg1 arg2 argN

If you give a valid function name as the first parameter, that function will be called and will receive the rest of the parameters

2. functionname.bat arg1 arg2 arg3

If the file is renamed to the name of a function, this function will be called and will receive the rest of the parameters, as if you has celled the function directly

current version can be found here

https://github.com/batchfileframework/BatchfileFrameWork/blob/main/bfw/bfw.minimal.bat

This bfw batch function library, contains all functions necessary to copy batch functions from one batch to another.

Therefore you can ask it to create a copy of itself to demonstrate the functionality

First ask it to listfunctions of itself

    bfw listfunctions bfw.bat

    ShiftedArgumentCaller AddFunctionToBatch IsFile GetFunctionRows GetLabelRow GetFunctionExit GetFunctionPreambleRow GetFunctionPostscriptRow ClearVariablesByPrefix GetFunctionName GetBatchCore GetNextExitRow ListFunctions GetNextFunctionName GetNextFunctionRow GetPreviousExitRow GetEOFrow countLines IsFunctionLabelExcluded AppendFileLineToFile GetPreviousEmptyRow GetNextEmptyRow

Now you can create a new version as follows

    bfw AddFunctionToBatch test\bfw.bat bfw.bat ShiftedArgumentCaller AddFunctionToBatch IsFile GetFunctionRows GetLabelRow GetFunctionExit GetFunctionPreambleRow GetFunctionPostscriptRow ClearVariablesByPrefix GetFunctionName GetBatchCore GetNextExitRow ListFunctions GetNextFunctionName GetPreviousExitRow GetEOFrow countLines IsFunctionLabelExcluded AppendFileLineToFile GetPreviousEmptyRow GetNextEmptyRow

This will create file test\bfw.bat, which should be identical to the first one. 

https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/media/bfwdemo1.png


You could shuffle around the functions, it would be then a different file, but with the same functionnality

Next objectives

when a function is called, search %userprofile%\bfw\lib for more source batch

create function which can read a function in a batch, and determine all function it needs to run standalone

create a function which find REM import FunctionName  in a file, and then adds all such dependencies from bfw\lib or named local files

    REM import IsFile
    REM import localfile.bat:IsDate
    REM import IsFolder localfile.bat:GetYear localfile.bat:GetDay localfolder\localfile.bat:FormatDate

A function that can find each type of function call

    Call :internal
    Call external.bat
    Call %:macrocall% 

Create a function that can change any one type of function call, into another

Create a function that finds all macrocalls, and fulfills the macro variables

Create a proper installer, which downloads bfw.bat standard version as well as the function library and copies them to %userprofile%\bfw , and adds this folder to the user %PATH%

Create a more complete version of bfw with all the best functions out there

Create function which creates shortcuts or symlink or hardlink, with the name of all supplied bfw functions and point these to bfw.bat. So that all function can be called directly from the command line.



### now the AI fluff explanation

# Batchfile Framework (BFW)

The Batchfile Framework (BFW) is an extensive collection aimed at centralizing and documenting the myriad of batch files available for Windows. This project focuses on achieving several core objectives:

- **Comprehensive Documentation:** We strive to provide thorough documentation on the usage of each batch file within the framework, ensuring users can easily understand and implement them in their workflows.
- **Consistent Writing Style:** Uniformity is key to our approach. We maintain a consistent writing style across all scripts to facilitate readability and ease of use.
- **Minimal Dependencies:** Our scripts are designed to be as independent as possible. They are fully operational on a fresh install of Windows 22H2 without requiring any updates or internet connection. Compatibility extends back to Windows 2000, ensuring broad usability.
- **Utility and Accessibility:** BFW serves as a repository of ready-to-use batch files for a wide range of tasks—from administrative duties to general computer usage. Moreover, it includes a variety of pre-made batch functions aimed at simplifying the development of new, complex, yet easily readable batch scripts.

By consolidating these resources, BFW aspires to be the go-to framework for both novice and experienced batch file users, promoting efficiency, standardization, and innovation in script development.


## Getting Started

### Installation

Installing BFW is straightforward and can be accomplished with a single command. This process not only downloads the latest version of BFW but also sets it up for immediate use. Follow these steps to get started:

Open a command prompt and enter the following command:


    curl --location --fail https://github.com/batchfileframework/BatchfileFrameWork/raw/main/bfw/bfw.bat -o bfw.bat & bfw.bat install

This command performs several actions to set up BFW on your system:

1. **Download:** Fetches the latest version of `bfw.bat` from the official repository.
2. **Install:** Executes `bfw.bat` with the install argument, which:
   - Creates a new directory at `%userprofile%\bfw` to store the framework files.
   - Copies `bfw.bat` into this directory for centralized access.
   - Adds the `%userprofile%\bfw` directory to your system's `%PATH%`, making BFW accessible from any command prompt.
   - For each function in `bfw.bat` designed for external use, it creates a hard link to `bfw.bat` within the `%userprofile%\bfw` directory. This allows direct invocation of BFW functions by name from the command line.

After completing these steps, BFW will be installed and ready to use on your system. You can begin utilizing its features and functions to streamline your batch file projects and scripting tasks.

You will have to restart your console to reset your %PATH%, or you can update it immediately with 

    set PATH=%path%%USERPROFILE%\bfw;



## Usage

Utilizing BFW is designed to be intuitive and straightforward, enabling you to harness the power of its functionality directly from the console or within your batch scripts. Here’s how to interact with BFW and its suite of features.

### Basic Command Structure

To execute a BFW function, you can use the following syntax in your console or script:


bfw functionname

This command invokes the specified `functionname` function from within BFW.

### Utilizing Hard Links/Shortcuts

After installation, BFW creates hard links (or shortcuts) for its externally usable functions. This means you can directly call any such function by its name without needing to prefix it with `bfw`. For example:


    GetCodePage OutputVariable
    FileToArray Filename ArrayName
    Copyfile SourceFile DestinationFile

These commands directly utilize the hard links created during the installation, making script writing cleaner and more intuitive.

### BFW for Administration

While BFW allows for the direct invocation of its functions, it also includes several administrative commands that facilitate its management on your system. These include:

- **System-Wide Installation:**

`
    bfw admininstall
`

This command installs BFW system-wide, enhancing accessibility.

- **Update BFW:**

`
    bfw update
`

Executes an update, downloading the latest version of BFW to ensure you have access to all the latest features and fixes.

- **Uninstall BFW:**

`
    bfw uninstall
`

Removes BFW from your system, including the deletion of any hard links or shortcuts created during installation.

By following these guidelines, you can effectively leverage BFW to enhance your scripting tasks, ensuring efficient and organized batch file development and management.


------------


## Table of Contents

1.  **[Coding Style Guide - Batch Functions](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/Function-Structure.md)**
    -   Overview of conventions for declaring and organizing batch functions.
2.  **[Handling Pseudo-Arrays in Batch Scripting](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/Pseudo-Arrays.md)**
    -   Guidelines for simulating arrays in batch scripts for enhanced data manipulation.
3.  **[Advanced Coding Style and Practices](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/Coding-Style.md)**
    -   Deep dive into variable management, function structure, and naming conventions.
4.  **[Understanding the Function Call Mechanism in BFW](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/How-bfd-works.md)**
    -   Detailed explanation of BFW's dynamic function calling system based on script names and arguments.
5.  **[Explained with `IsDrive`: A BFW Function Example](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/BFW-Explained-With-IsDrive.md)**
    -   A practical example illustrating how BFW functions are structured and executed, using `IsDrive` as a case study.
6.  **[Documenting Functions with Function Cards](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/Function-Cards.md)**
    -   How to create detailed function cards for comprehensive documentation and easy reference.
7.  **[Incorporating Help Functions in Your Tools](https://github.com/batchfileframework/BatchfileFrameWork/blob/main/doc/Help-Function.md)**
    -   Best practices for designing informative help functions for command-line tools.

### Contributing

Contributions are welcome! If you'd like to improve BFW, please follow these steps:

    Fork the repository.
    Create a new branch for your feature or fix.
    Commit your changes with clear, descriptive messages.
    Submit a pull request against the main branch.

Please ensure your code adheres to the BFW coding standards and includes adequate documentation and tests where applicable.

### License

BFW is released under the GPL-3.0 license. See the LICENSE file for more details.

### Acknowledgments

    Special thanks to the batch file community for valuable insights and contributions.
    This project is inspired by the need for standardized practices in batch file development.

    https://ss64.com/nt/
    https://www.dostips.com/
    https://www.tutorialspoint.com/batch_script/index.htm
    https://stackoverflow.com/questions/tagged/batch-file
    https://www.robvanderwoude.com/batchfiles.php
    https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-xp/bb490869(v=technet.10)?redirectedfrom=MSDN
    https://rosettacode.org/wiki/Category:Batch_File
    https://groups.google.com/g/alt.msdos.batch
    https://groups.google.com/g/alt.msdos.batch.nt
    https://alt.msdos.batch.nt.narkive.com/
    http://www.ericphelps.com/batch/
    https://home.csulb.edu/~murdock/dosindex.html
    https://web.archive.org/web/20240000000000*/https://www.fpschultze.de/batstuff.html
    https://web.archive.org/web/20240000000000*/http://purl.oclc.org/net/Batfiles/
    https://www.computerhope.com/batch.htm
    https://www.geeksforgeeks.org/writing-windows-batch-script/
    https://en.wikipedia.org/wiki/Batch_file
    https://en.wikipedia.org/wiki/List_of_DOS_commands
    https://web.archive.org/web/20120419153526/http://www.netikka.net/tsneti/http/tsnetihttpprog.php#cmdscript
    https://www.geoffdoesstuff.com/windows-batch-scripts
    https://www.trytoprogram.com/batch-file-commands/
    https://jpsoft.com/batch-debugging.html
    https://community.spiceworks.com/t/help-me-to-create-batch-file/582612
    https://fossbytes.com/complete-windows-cmd-commands-list-index/
    https://fossbytes.com/what-is-a-batch-file-in-windows-how-to-create-a-batch-file/
    https://github.com/Justin-Lund/IT-Support-Batch-Files
    https://learn.openwaterfoundation.org/owf-learn-windows-shell/useful-batch-files/useful-batch-files/
    https://www.makeuseof.com/tag/use-windows-batch-file-commands-automate-repetitive-tasks/
    https://study.com/academy/lesson/batch-file-comments-arguments.html
    https://medium.com/@rjaloudi/mastering-automation-a-comprehensive-guide-to-creating-10-powerful-batch-files-on-windows-ad626d2b3b15
    https://learn.openwaterfoundation.org/owf-learn-windows-shell/best-practices/best-practices/
    https://en.wikipedia.org/wiki/List_of_DOS_commands
    https://technet.microsoft.com/en-us/library/cc749839.aspx
    http://www.drdos.com/dosdoc/
    https://www.mdgx.com/secrets.htm
    https://github.com/microsoft/MS-DOS
    https://web.archive.org/web/20130612114615/http://fd-doc.sourceforge.net/wiki/index.php
    http://www.computerhope.com/msdos.htm
    http://www.windows-commandline.com/windows-cmd-commands-reference/
    http://www.textfiles.com/hacking/MICROSOFT/dosundoc.txt
    https://stackoverflow.com/questions/48420074/was-echo-on-or-off-when-my-windows-bat-was-called
    https://www.youtube.com/watch?v=JbAyxKjUPs0&list=PL69BE3BF7D0BB69C4
    https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands
    https://discord.gg/GSVrHag
    REPL.BAT https://stackoverflow.com/questions/60034/how-can-you-find-and-replace-text-in-a-file-using-the-windows-command-line-envir/16735079#16735079
    https://theasciicode.com.ar
    https://www.bttr-software.de/
    https://stackoverflow.com/questions/36176267/calling-function-from-included-batch-file-with-a-parameter#comment59988363_36176267
    https://ss64.com/nt/call.html
    https://www.dostips.com/forum/viewtopic.php?f=3&t=5311
    https://superuser.com/questions/1569594/how-does-delayed-expansion-work-in-a-batch-script
    
### Contact

For questions, suggestions, or contributions, please contact the project maintainer at your.email@example.com.

BFW is continually evolving, with the goal of becoming the go-to framework for batch file development on Windows. Your feedback and contributions are highly appreciated to help make BFW even better!
