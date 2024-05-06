.global _start
_start:

	mov r0, #30 // taking number 30 in decimal and moving to register 0
	
	mov r7, #1 // move into register 7 value 1 
	SWI 0 //software interrupt