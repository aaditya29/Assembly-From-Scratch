# Functions in ARM Assembly

In ARM Assembly language, functions are used to encapsulate blocks of code that perform specific tasks, allowing for modularity and reusability in programs. Functions are typically defined with a label and are called using a `BL` (Branch with Link) instruction. They can have parameters passed via registers and return values using specific conventions. Let's explore how functions are implemented in ARM Assembly with examples.

## Anatomy of a Function

A typical function in ARM Assembly consists of the following components:

- **Function Label:** Defines the entry point of the function.
- **Function Body:** Contains the code that performs the specific task.
- **Function Prologue:** Sets up the stack frame (if needed) and saves any necessary registers.
- **Function Epilogue:** Restores any modified registers and cleans up the stack frame before returning.

### Example: Function to Add Two Numbers

Let's write a simple function in ARM Assembly that adds two numbers (`R0` and `R1`) and returns the result (`R0`).

```armasm
    .text
    .global main

    @ Function to add two numbers (R0 and R1)
add_numbers:
    ADD R0, R0, R1    @ Add R0 and R1, result in R0
    BX LR             @ Return from function (Branch to Link Register)

main:
    MOV R0, #10       @ First number (e.g., 10)
    MOV R1, #20       @ Second number (e.g., 20)

    BL add_numbers    @ Call the add_numbers function

    @ After returning from the function, R0 contains the sum
    @ Print the result (not shown, assume a system call)

    MOV R0, #0        @ Exit status (0 for success)
    SWI 0             @ Exit the program (system call)

```

In this example:

- The `add_numbers` function adds the values in `R0` and `R1` and stores the result in `R0`.
- `BX LR` is used to return from the function, branching to the address stored in the Link Register (`LR`).
