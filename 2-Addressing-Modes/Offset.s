.global _start

_start:
    LDR R0, =list
    LDR R1, [R0]
    LDR R2, [R0, #4]//Acquiring the value from R0, adding 4 and then retrieves 

.data

list:
    .word 1,2,3,-3,4,-4 //32 bit numbers