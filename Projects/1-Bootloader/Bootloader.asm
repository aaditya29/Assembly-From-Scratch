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

cli//clearing the interrupt flag
hlt//halting the processor stopping execution

clearscreen:
    push bp
    mov bp, sp
    pusha

    mov ah, 07h//telling the BIOS to scroll down window
    mov al, 00h// clear entire window
    mov bh, 07h//puts white on blacl
    mov cx, 00h//specifies top left of screen as (0,0)
	mov dh, 18h//18h = 24 rows of chars
	mov dl, 4fh//4fh = 79 cols of chars
	int 10h//calls video interrupt

	popa
	mov sp, bp
	pop bp
	ret


movecursor:
	push bp
	mov bp, sp
	pusha

	mov dx, [bp+4] //getting the argument from the stack. |bp| = 2, |arg| = 2
	mov ah, 02h//setting cursor position
	mov bh, 00h//page 0 - doesn't matter, we're not using double-buffering

	int 10h

	popa
	mov sp, bp
	pop bp
	ret

print:
	push bp
	mov bp, sp
	pusha
	mov si, [bp+4]	//grab the pointer to the data
	mov bh, 00h	 //page number, 0 again
	mov bl, 00h//foreground color, irrelevant - in text mode
	mov ah, 0Eh//print character to TTY

.char:
	mov al, [si] //getting the current char from our pointer position
	add si, 1//keep incrementing si until we see a null char
	or al, 0
	je .return //end if the string is done
	int 10h  //print the character if we're not done
	jmp .char//keep looping
 .return:
	popa
	mov sp, bp
	pop bp
	ret

msg:
    db "Hello World! I am tiny Bootloader built in Assembly", 0//terminating by null

    //added padding
	times 510-($-$$) db 0
	dw 0xAA55