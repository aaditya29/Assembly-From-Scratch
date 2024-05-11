# Condition And Branches

## Comparators in ARM Assembly

In ARM Assembly language, comparators are used to perform comparisons between two operands or values. These comparisons typically set the CPSR (Current Program Status Register) flags based on the result of the comparison, which can then be used in conditional branching or other decision-making instructions. The most commonly used comparators are `CMP` (Compare) and `TST` (Test).

### 1. CMP (Compare)

The CMP instruction compares two values and sets the appropriate condition flags based on the result of the comparison. It does not store the result in a register.

```armasm
CMP R0, R1 ; Compare the values in R0 and R1
```

### 2. CMN (Compare Negative)

The CMN instruction is similar to CMP, but it adds the two operands before performing the comparison.

```armasm
CMN R2, #0x10 ; Compare the value in R2 with 0x10
```

### 3. TST (Test)

The TST instruction performs a bitwise AND operation on the two operands and sets the condition flags based on the result.

```armasm
TST R3, #0x80 ; Test if the highest bit of R3 is set
```

### 4. TEQ (Test Equivalence)

The TEQ instruction performs a bitwise XOR operation on the two operands and sets the condition flags based on the result.

```armasm
TEQ R4, R5 ; Test if the values in R4 and R5 are equal
```

After executing a comparator instruction, the condition flags are set as follows:

- **Z (Zero):** Set if the result is zero.
- **N (Negative):** Set if the result is negative.
- **C (Carry):** Set if the operation caused a carry or a borrow.
- **V (Overflow):** Set if the operation caused an overflow or underflow.

These condition flags can then be used in conditional execution of instructions or conditional branching.

#### Example: Comparing which number is bigger between two numbers.

```armasm
    .text
    .global main

main:
    MOV R0, #10       ; Set R0 to a sample number (e.g., 10)
    MOV R1, #20       ; Set R1 to another sample number (e.g., 20)

    CMP R0, R1        ; Compare R0 and R1
    BGE greater       ; Branch if R0 >= R1 (Greater than or Equal)

    @ If R0 < R1
    MOV R2, #1        ; Load R2 with 1 (indicating R1 is greater)
    B print_result    ; Branch to print_result

greater:
    @ If R0 >= R1
    MOV R2, #0        ; Load R2 with 0 (indicating R0 is greater)

print_result:
    CMP R2, #0        ; Compare R2 with 0
    BEQ r0

```

## Loops With Branches

In ARM Assembly language, loops can be implemented using conditional branching instructions. The most common way to create a loop is by using a combination of a conditional branch instruction and a branch instruction that jumps back to the beginning of the loop.
