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
