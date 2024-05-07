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
