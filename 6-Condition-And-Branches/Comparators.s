.data
num1:   .word 10        ; First number (10)
num2:   .word 20        ; Second number (20)
msg1:   .asciz "First number is bigger\n"
msg2:   .asciz "Second number is bigger\n"

    .text
    .global main
    .align 2

main:
    ldr r0, =num1       ; Load the address of num1 into r0
    ldr r1, [r0]        ; Load the value of num1 into r1
    ldr r0, =num2       ; Load the address of num2 into r0
    ldr r2, [r0]        ; Load the value of num2 into r2

    cmp r1, r2          ; Compare num1 and num2
    bgt greater_first   ; Branch to greater_first if num1 is greater
    blt greater_second  ; Branch to greater_second if num2 is greater

    b end               ; If numbers are equal, go to end

greater_first:
    ldr r0, =msg1       ; Load the address of msg1 into r0
    bl printf           ; Call printf to print msg1
    b end               ; Go to end

greater_second:
    ldr r0, =msg2       ; Load the address of msg2 into r0
    bl printf           ; Call printf to print msg2
    b end               ; Go to end

end:
    mov r7, #1          ; Exit status code 1
    svc 0               ; Exit the program

//The .data section defines two word values (num1 and num2) and two string constants (msg1 and msg2).
//The .text section contains the main code.
//The main label marks the entry point of the program.
//The values of num1 and num2 are loaded into registers r1 and r2, respectively.
//The cmp instruction compares the values in r1 and r2.
//Based on the result of the comparison, the program branches to the appropriate label (greater_first or greater_second) using the bgt (branch if greater than) and blt (branch if less than) instructions.
//If the numbers are equal, the program skips the printing and goes directly to the end label.
//In the greater_first block, the address of msg1 is loaded into r0, and the printf function is called to print the message "First number is bigger".
//In the greater_second block, the address of msg2 is loaded into r0, and the printf function is called to print the message "Second number is bigger".
//After printing the appropriate message or skipping the printing if the numbers are equal, the program exits by setting the exit status code to 1 and executing the svc 0 (software interrupt) instruction.