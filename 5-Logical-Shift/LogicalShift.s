.global _start
_start:
    MOV R1, #0b10010000    ; Initialize R1 with binary value 10010000 (0x90)

    LSL R2, R1, #2         ; Shift R1 left by 2 bits (0x90 << 2)
    LSR R3, R1, #3         ; Shift R1 right by 3 bits (0x90 >> 3)
    ASR R4, R1, #1         ; Arithmetic right shift R1 by 1 bit
    ROR R5, R1, #4         ; Rotate R1 right by 4 bits

// LSL R2, R1, #2 shifts the value in R1 (0x90) left by 2 bits, resulting in R2 = 0x240.
// LSR R3, R1, #3 shifts the value in R1 (0x90) right by 3 bits, resulting in R3 = 0x12.
// ASR R4, R1, #1 performs an arithmetic right shift on R1 (0x90) by 1 bit, preserving the sign, resulting in R4 = 0xC8.
//ROR R5, R1, #4 rotates the value in R1 (0x90) right by 4 bits, wrapping the shifted-out bits back to the left, resulting in R5 = 0x09.