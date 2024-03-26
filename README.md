
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


    curl --location --fail https://github.com/batchfileframework/BatchfileFrameWork/raw/master/bfw/bfw.bat -o bfw.bat & bfw.bat install

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


### Documentation

For comprehensive documentation, including a list of available functions, coding style guidelines, and best practices, refer to the Wiki.

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

### Contact

For questions, suggestions, or contributions, please contact the project maintainer at your.email@example.com.

BFW is continually evolving, with the goal of becoming the go-to framework for batch file development on Windows. Your feedback and contributions are highly appreciated to help make BFW even better!
