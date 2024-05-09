# Logical Shift And Rotations

In ARM Assembly language, logical shifts and rotations are operations used to manipulate the bits of a register by shifting them left or right, or rotating them circularly. These operations are often used for tasks like multiplication or division by powers of two, extracting or inserting specific bit patterns, and bitwise manipulation.

### 1. Logical Shift Left (`LSL`)

- **Syntax:** `LSL Rd, Rn, #shift_amount`
- **Description:** Performs a logical left shift on the value in `Rn` by `shift_amount` bits and stores the result in `Rd`.
- **Effects:** Zeros are shifted into the vacated least significant bits, and the most significant bits are shifted out (can affect the Carry flag).

```armasm
LSL R1, R2, #2    ; Shift the value in R2 left by 2 bits and store the result in R1
```

### 2. Logical Shift Right (`LSR`)

- **Syntax:** `LSR Rd, Rn, #shift_amount`
- **Description:** Performs a logical right shift on the value in `Rn` by `shift_amount` bits and stores the result in `Rd`.
- **Effects:** Zeros are shifted into the vacated most significant bits, and the least significant bits are shifted out (can affect the Carry flag).

```armasm
LSR R3, R4, #3    ; Shift the value in R4 right by 3 bits and store the result in R3

```

### 3. Arithmetic Shift Right (`ASR`)

- **Syntax:** `ASR Rd, Rn, #shift_amount`
- **Description:** Performs an arithmetic right shift on the value in `Rn` by `shift_amount` bits and stores the result in `Rd`.
- **Effect:** Copies the sign bit (the most significant bit) into the vacated most significant bits.

```armasm
ASR R5, R6, #1    ; Arithmetic right shift the value in R6 by 1 bit and store the result in R5
```

### 4. Rotate Right (`ROR`)

- **Syntax:** `ROR Rd, Rn, #rotate_amount`
- **Description:** Performs a circular (or bitwise) right rotation on the value in `Rn` by `rotate_amount` bits and stores the result in `Rd`.
- **Effect:** Bits shifted out on the right are wrapped around and re-enter from the left.

```armasm
ROR R7, R8, #4    ; Rotate the value in R8 right by 4 bits and store the result in R7

```
