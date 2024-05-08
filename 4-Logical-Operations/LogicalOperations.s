 .global _start

 _start:   
    
    MOV R1, #0b10101010    ; Initialize R1 with binary value 10101010 (0xAA)
    MOV R2, #0b11001100    ; Initialize R2 with binary value 11001100 (0xCC)

    AND R3, R1, #0xF0      ; Clear the lower nibble of R1 (1010xxxx) and store in R3
    ORR R4, R2, #0x0F      ; Set the lower nibble of R2 (xxxx1100) to 1111 and store in R4
    EOR R5, R1, R2         ; Perform XOR between R1 and R2 and store in R5
    MVN R6, R1             ; Invert all bits of R1 and store in R6

// AND R3, R1, #0xF0 clears the lower nibble of R1 (1010xxxx) and stores the result in R3
// ORR R4, R2, #0x0F sets the lower nibble of R2 (xxxx1100) to 1111 and stores the result in R4
// EOR R5, R1, R2 performs an XOR between R1 (10101010) and R2 (11001100) and stores the result in R5
// MVN R6, R1 inverts all bits of R1 (10101010) and stores the result in R6