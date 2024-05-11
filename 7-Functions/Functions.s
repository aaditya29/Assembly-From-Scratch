.text
    .global main
    .align 2

main:
    mov r0, #10         ; Set the first argument (r0 = 10)
    mov r1, #20         ; Set the second argument (r1 = 20)
    bl add_numbers      ; Call the add_numbers function
    mov r7, #1          ; Exit status code 1
    svc 0               ; Exit the program

add_numbers:
    push {lr}           ; Save the link register (return address)
    add r2, r0, r1      ; Add the arguments (r2 = r0 + r1)
    ldr r0, =result     ; Load the address of result into r0
    str r2, [r0]        ; Store the result
    pop {lr}            ; Restore the link register
    bx lr               ; Return from the function

    .data
result: .word 0         ; Storage for the result