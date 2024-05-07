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
