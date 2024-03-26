
# Coding Style Guide - Batch Functions

This guide outlines the conventions for declaring and organizing functions within our codebase. Adhering to these guidelines ensures that our code remains consistent, readable, and easy to maintain.

## Function Structure

Each function in our codebase is composed of four critical sections: the Preamble, Body, End, and Postscript. These sections are designed to clearly separate the function's purpose, implementation, conclusion, and supplementary information.



### Preamble

-   **Location:** The Preamble begins on the last empty line before the function's label and extends up to the line immediately before the Body.
-   **Purpose:** This section includes the function's usage definition, examples, alternative uses, and a brief help guide. If this information becomes too lengthy, extended details should be moved to the Postscript, keeping the Preamble concise.

### Body

-   **Location:** The Body is identified by the row where the function's label is defined.
-   **Content:** It contains the core logic and implementation of the function.

### End

-   **Location:** The End is the last coding row of the function, typically marked by an exit line.
-   **Exit Strategies:** Functions conclude with an `exit /b`, `goto :eof`, or a similar command to end the function call and return. Functions should not use `GoTo` to jump outside the Body-End scope.
-   **Special Case - End Label:** For functions where the end isn't clear (e.g., aliases or overloaded functions), an `:EndOf_FunctionName` label can be used to explicitly mark the end.

### Postscript

-   **Location:** Follows immediately after the End section.
-   **Content:** This section is reserved for the function card, extensive comments, and should be enclosed in ASCII boxes for clarity.

## Special Cases

### Aliases and Overloaded Functions

-   **Aliases:** Functions may have alternative names or aliases, which are simply different ways to invoke the same functionality. These aliases should be clearly documented.
-   **Overloads:** Functions that share most of their code but differ slightly in behavior (e.g., `lbound` and `ubound`) are considered overloads. Overloaded functions may set specific variables before proceeding into the main function body. They are the exception to the rule that functions must not run into another function's definition label.

## Formatting Rules

-   **Empty Lines Between Functions:** Always leave one empty line between two function declarations to maintain readability.
-   **Naming Conventions:** Use a consistent naming scheme for functions, variables, and labels to ensure clarity and predictability in the codebase.

## Conclusion

This style guide is intended to promote a uniform coding standard within our projects. By adhering to these guidelines, we facilitate easier code review, maintenance, and future development. Remember, the goal of this guide is not to constrain creativity but to harness it in a way that benefits all team members and stakeholders involved in the project.
