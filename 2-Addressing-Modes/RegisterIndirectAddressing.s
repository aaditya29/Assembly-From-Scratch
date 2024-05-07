.global _start

_start:
    LDR R0, =list
    LDR R1, [R0] //Load at register R1 the value at register R0
    //Square brackets tell we want value associated with the register R0

.data

list:
    .word 1,2,3,-3,4,-4 //32 bit numbers