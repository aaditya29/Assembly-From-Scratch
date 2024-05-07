# Arithmetic Operations and CPSR Flags

In ARM Assembly language, arithmetic operations involve manipulating data using various instructions like `ADD`, `SUB`, `MUL`, etc., and these operations can affect the CPSR (Current Program Status Register) flags. The CPSR flags are special bits in the processor status register that reflect the outcome of arithmetic and logical operations.<br>
Here's a breakdown of arithmetic operations and how they interact with CPSR flags, along with examples:

## Arithmetic Operations

### 1. ADD (Addition):

- **Syntax**: `ADD Rd, Rn, Operand2`
- **Description:** Adds `Operand2` to the value in `Rn` and stores the result in `Rd`.
- **CPSR Flags Affected:**

  - **N (Negative):** Set if the result is negative.
  - **Z (Zero):** Set if the result is zero.
  - **C (Carry):** Set if the addition resulted in a carry (unsigned overflow).
  - **V (Overflow):** Set if the addition resulted in a signed overflow.

  ```armasm
  ADD R1, R2, #10     ; R1 = R2 + 10
  ```

### 2. SUB (Subtraction):

- **Syntax**: `SUB Rd, Rn, Operand2`
- **Description:** Subtracts `Operand2` to the value in `Rn` and stores the result in `Rd`.
- **CPSR Flags Affected:**

  - **N (Negative):** Set if the result is negative.
  - **Z (Zero):** Set if the result is zero.
  - **C (Carry):** Set if there is no borrow (unsigned overflow).
  - **V (Overflow):** Set if the subtraction resulted in a signed overflow.

  ```armasm
  SUB R3, R4, #20     ; R3 = R4 - 20

  ```

### 3. MUL (Multiplication):

- **Syntax**: `MUL Rd, Rn, Rm`
- **Description:** Multiplies the values in `Rn` and `Rm` and stores the 32-bit result in `Rd`.
- **CPSR Flags:** The CPSR flags are not directly affected by the MUL instruction.

```armasm
MUL R5, R6, R7      ; R5 = R6 * R7
```

## CPSR Flags Usage in Conditional Instructions

The CPSR flags can be used in conditional instructions (`BEQ`, `BNE`, `BGT`, etc.) to control program flow based on the result of previous arithmetic or logical operations.

#### For Example:

- ### BEQ (Branch if Equal):

```armasm
CMP R1, R2          ; Compare R1 and R2 (updates CPSR flags)
BEQ Label           ; Branch to 'Label' if R1 equals R2 (Z flag set)

```

- ### BNE (Branch if Not Equal):

```armasm
CMP R3, #0          ; Compare R3 with zero (updates CPSR flags)
BNE NotZeroLabel    ; Branch to 'NotZeroLabel' if R3 is not zero (Z flag not set)

```

### Example: Using Arithmetic and CPSR Flags Together

```armasm
    MOV R1, #10       ; Initialize R1 with 10
    MOV R2, #5        ; Initialize R2 with 5

    ADD R3, R1, R2    ; R3 = R1 + R2 (R3 = 10 + 5 = 15)

    CMP R3, #20       ; Compare R3 with 20
    BGT Greater       ; Branch to 'Greater' if R3 > 20
    BLE LessEqual     ; Branch to 'LessEqual' if R3 <= 20

Greater:
    ; Code for R3 > 20
    ; (CPSR flags: N=0, Z=0, C=0, V=0)

LessEqual:
    ; Code for R3 <= 20
    ; (CPSR flags: N=0, Z=0, C=1, V=0)

```
