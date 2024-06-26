# Addressing Modes in ARM Assembly Language

In ARM Assembly language, addressing modes are the different ways in which the operands of an instruction can be specified. These modes determine how the processor calculates the effective address of the data to be accessed. ARM architecture supports several addressing modes which provide flexibility and efficiency in programming. We explore some common addressing modes with examples:

### 1. Immediate Addressing

Immediate addressing involves specifying a constant value directly in the instruction. The operand is a fixed value encoded within the instruction itself.

```armasm
MOV R1, #10      ; Move the immediate value 10 into register R1

```

### 2. Register Addressing

In register addressing, operands are held in registers. The effective address is the content of a register.

```armasm
MOV R2, R1       ; Move the value from R1 into R2
ADD R3, R4, R5   ; Add contents of R4 and R5 and store result in R3

```

### 3. Register Indirect Addressing

Register indirect addressing involves using the value in a register as a pointer to the memory location of the operand.

```armasm
LDR R0, [R1]     ; Load the word from the memory location pointed to by R1 into R0
STR R2, [R3]     ; Store the value in R2 into the memory location pointed to by R3

```

### 4. Pre-indexed Addressing

Pre-indexed addressing is similar to register indirect addressing but includes an offset added to the base register before accessing the memory.

```armasm
LDR R0, [R1, #4]     ; Load the word from the memory location (R1 + 4) into R0
STR R2, [R3, #-8]    ; Store the value in R2 into the memory location (R3 - 8)

```

### 5. Post-indexed Addressing

Post-indexed addressing involves accessing the memory first using a base register and an offset and then updating the base register.

```armasm
LDR R0, [R1], #4     ; Load the word from the memory location pointed to by R1 into R0, then increment R1 by 4
STR R2, [R3], #-8    ; Store the value in R2 into the memory location pointed to by R3, then decrement R3 by 8

```

### 6. Scaled Register Addressing

Scaled register addressing allows multiplication of the register value by a constant factor to access memory.

```armasm
LDR R0, [R1, R2, LSL #2]   ; Load the word from the memory location (R1 + R2*4) into R0
```
