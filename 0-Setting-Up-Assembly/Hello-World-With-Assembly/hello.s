//
//hello world
//

.global _start
.align 2


//main

_start:
    b _printf
    b _terminate //branch

_printf:
    mov X0, #1//stdout
    adr X1, helloworld //address of hello world string
    mov X2, #12 //length of hello world string
    mov X16, #4 //write to stdout
    svc 0//syscall


_terminate:
    mov X0, #0
    mov X16, #1
    svc 0//syscall

helloworld: .ascii "Hello World\n"