
## How BFW Works: The `IsDrive` Function Example

The Batchfile Framework (BFW) employs a structured approach to handle command-line arguments, execute specific actions based on those arguments, and facilitate the creation of help documentation and demos for batch functions. Using the `IsDrive` function as an illustrative example, this document outlines the operational mechanics of a typical BFW function.

### Structure and Execution Flow

    @echo off
    
    :setup
    :main
    
    for %%a in (%*) do (
        for %%b in (/h /? -h -? help --help) do (
            if "[%%a]" EQU "[%%b]" (
                Call :%~n0-help & exit /b 1
            )
        )
    )
    for %%a in (%*) do (
        if "[%%a]" EQU "[demo]" (
            Call :%~n0-demo & exit /b 1
        )
    )
    if "[%~1]" EQU "[]" (
        echo %~n0 needs at least one argument & exit /b 1
    )
    Call :%~n0 %*
    
    GoTo :EOF

#### Command-Line Argument Handling

The script starts with a loop checking for help-related arguments (`/h`, `/?`, `-h`, `-?`, `help`, `--help`). If any are detected, it calls the help function (`:%~n0-help`) and exits. This pattern ensures that users can easily access help information for any function in the framework.

A similar check is performed for a "demo" argument, which triggers a demonstration (`:%~n0-demo`) of the function's capabilities, illustrating its usage through examples.

If no arguments are provided, or the first argument does not match expected values, an error message is displayed, informing the user that at least one argument is needed.

Finally, the function itself is called with the provided arguments (`Call :%~n0 %*`), executing its core logic.

### The `IsDrive` Function

The `IsDrive` function illustrates a typical BFW function designed to check the existence of specified drive letters. It optionally outputs the result to a variable, enhancing script flexibility and reuse.

    :IsDrive

This portion initializes variables and checks for an optional output variable. It then enters a loop, checking each drive letter argument. The result (`true` or `false`) is either directly returned (via `exit /b`) or stored in the provided output variable.

### Help and Demo Functions

The help (`:IsDrive-help`) and demo (`:IsDrive-demo`) functions demonstrate BFW's commitment to usability and learning. The help function provides detailed usage information, parameters, and examples, making it easier for users to understand and implement the function in their scripts. The demo function showcases the function in action, offering practical examples of its use.

### Conclusion

BFW's structured approach, exemplified by the `IsDrive` function, underscores the framework's emphasis on usability, modularity, and standardization. By incorporating help and demo capabilities, BFW empowers users with the knowledge and tools needed for effective batch scripting.
