
### Handling Arrays in Batch Scripting: A Style Guide

In batch scripting, true array structures as found in higher-level programming languages do not exist. However, with a bit of ingenuity, we can simulate array-like behavior using a convention-based approach. This section of the style guide outlines the recommended practices for creating and manipulating array-like constructs in batch files, enhancing readability and maintainability.

#### Array Naming and Structure

When simulating arrays, you should follow a clear naming convention to make the array-like nature of the variables apparent. Use a base name followed by an index in square brackets for individual elements. Additionally, manage array metadata with special suffixes like `.lbound`, `.ubound`, and `.count`.

##### Example:

batch

    set arrayname[0]=value1
    set arrayname[1]=value2
    set arrayname.lbound=0
    set arrayname.ubound=1
    set arrayname.count=2` 

#### Lower Bound (`.lbound`)

By convention, arrays in batch scripting start at an index of 0, mirroring the behavior of many programming languages. If your array does not start with 0, explicitly define the lower bound using the `.lbound` suffix. Assume a lower bound of 0 if it's not explicitly defined.

#### Upper Bound (`.ubound`)

The upper bound (`.ubound`) indicates the highest index used in the array. This is crucial for iterating over the array and should be accurately maintained as elements are added or removed.

#### Count (`.count`)

While optional, maintaining a count (`.count`) of the elements can simplify certain operations, such as adding an element at the end of the array or checking if the array is empty. The count should reflect the total number of elements in the array.

#### Best Practices for Array Usage

-   **Initialization**: Clearly define your array at the beginning of its usage scope, setting up `.lbound`, `.ubound`, and optionally, `.count`.
-   **Access and Iteration**: When accessing array elements or iterating over them, use the `.lbound` and `.ubound` to define your loop boundaries. This practice ensures your code remains clear and adaptable to changes in the array size.
-   **Modification**: Whenever you add or remove elements, update the `.ubound` and `.count` accordingly to keep the array metadata accurate. Failure to do so can lead to incorrect behavior or data loss.
-   **Comments**: Comment liberally when manipulating arrays, especially if the logic involves non-trivial calculations or adjustments to `.lbound`, `.ubound`, or `.count`. This can significantly aid in code readability and maintenance.

#### Sample Loop Over an Array

To iterate over an array from its lower bound to its upper bound, use a loop structure like the following:


    :ExampleFunction-DEMO
    
    set "testarray[0]=marry"
    set "testarray[1]=had"
    set "testarray[2]=a"
    set "testarray[3]=little"
    set "testarray[4]=lamb"
    set /a testarray.ubound=4
    
    Call :ExampleFunction testarray Argument1 Argument2 
    
    echo.& echo with lbound specified
    set /a testarray.lbound=3
    
    Call :ExampleFunction testarray Argument1 Argument2 
    
    GoTo :EOF
    
    ::Usage Call :ExampleFunction InputArray Argument1 Argument2 ... ArgumentN
    :ExampleFunction
    set "_ExampleFunction_prefix=_EF"
    set "_EF_InputArray=%~1"
    call set /a _EF_InputArray_lbound=%%%_EF_InputArray%.lbound%% 2>nul
    call set /a _EF_InputArray_ubound=%%%_EF_InputArray%.ubound%% 2>nul
    if not defined _EF_InputArray_lbound set /a _EF_InputArray_lbound=0
    if not defined _EF_InputArray_ubound ( echo Array ubound missing, quitting & GoTo :EOF )
    shift 
    :ExampleFunction-args
    set "_EF_Current_Argument=%~1"
    set /a _EF_InputArray_index=%_EF_InputArray_lbound%
    :ExampleFunction-loop
    call echo This is element %_EF_InputArray%[%_EF_InputArray_index%] : %%%_EF_InputArray%[%_EF_InputArray_index%]%% , with argument : %_EF_Current_Argument%
    set /a _EF_InputArray_index+=1
    if %_EF_InputArray_index% LEQ %_EF_InputArray_ubound% GoTo :ExampleFunction-loop
    if "[%~2]" NEQ "[]" ( shift & GoTo :ExampleFunction-args )
    GoTo :EOF

Here is a sample of the output

    This is element testarray[0] : marry , with argument : Argument1
    This is element testarray[1] : had , with argument : Argument1
    This is element testarray[2] : a , with argument : Argument1
    This is element testarray[3] : little , with argument : Argument1
    This is element testarray[4] : lamb , with argument : Argument1
    This is element testarray[0] : marry , with argument : Argument2
    This is element testarray[1] : had , with argument : Argument2
    This is element testarray[2] : a , with argument : Argument2
    This is element testarray[3] : little , with argument : Argument2
    This is element testarray[4] : lamb , with argument : Argument2
    
    with lbound specified
    This is element testarray[3] : little , with argument : Argument1
    This is element testarray[4] : lamb , with argument : Argument1
    This is element testarray[3] : little , with argument : Argument2
    This is element testarray[4] : lamb , with argument : Argument2

#### Conclusion

While batch scripting does not natively support arrays, following the conventions outlined in this style guide allows for the simulation of array-like structures in a consistent and understandable manner. Adhering to these practices will make your batch scripts more robust, easier to read, and maintain over time.
