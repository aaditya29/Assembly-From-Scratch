bits 16 //using 16 bit real mode


mov ax, 07C0H// loading the value 0x07C0 into the AX register, which is the address where the BIOS loads the bootloader
mov ds, ax//sets the Data Segment (DS) register to 0x07C0, which is necessary for accessing memory addresses
//loading the value 0x07E0 into the AX register, which is the beginning of the stack segment (0x07C0 + 0x0200)
mov ax, 07E0h//beginning of stack segment
mov ss, ax//setting the Stack Segment (SS) register to 0x07E0
mov sp, 2000h //setting the Stack Pointer (SP) to 0x2000, allocating 8 KB of stack space.

call clearscreen//calling clearscreen procedure which clears the screen when we scroll down

push 0000h//the value 0x0000 onto the stack, representing the cursor position (row 0, column 0)
call movecursor //invokes the movecursor procedure, which moves the cursor to the specified position
push msg
call print
add sp, 2

cli
hlt
