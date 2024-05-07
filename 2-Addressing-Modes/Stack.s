.global _start

_start:
    //Retrieving where the list is located in the memory
    //We look for first entry in the list and everything is gonna fall sequentially from there
    //We use 'LDR' loads data from stacks into registers
    LDR R0, =list//finds out where the list is located and places in register R0. It is called direct addressing

.data

list:
    .word 1,2,3,-3,4,-4 //32 bit numbers