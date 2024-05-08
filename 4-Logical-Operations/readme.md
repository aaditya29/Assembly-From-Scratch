# Logical Operations in Assembly Language

In ARM Assembly language, logical operations manipulate data at the bit-level using bitwise operations. These operations include logical AND, OR, XOR, and NOT, and they are commonly used for tasks such as bit manipulation, setting or clearing specific bits, and combining or masking data.

## Logical Operations

### 1. Logical AND (`AND`)

- **Syntax**: `AND Rd, Rn, Operand2`
- **Description:** Performs a bitwise `AND` operation between `Rn` and `Operand2` and stores the result in `Rd`.

```armasm
AND R1, R2, #0xFF    ; Clear all but the lowest byte of R2 and store the result in R1
```

### 2. Logical OR (`ORR`)

- **Syntax:** `ORR Rd, Rn, Operand2`
- **Description:** Performs a bitwise `OR` operation between `Rn` and `Operand2` and stores the result in `Rd`.

```armasm
ORR R3, R4, #0x80    ; Set bit 7 of R4 (logical OR with 0x80) and store the result in R3

```

### 3. Logical Exclusive OR (XOR) (`EOR`)

- **Syntax:** `EOR Rd, Rn, Operand2`
- **Description:** Performs a bitwise exclusive XOR `EOR` operation between `Rn` and `Operand2` and stores the result in `Rd`.

```armasm
EOR R5, R6, R7       ; Perform XOR between R6 and R7 and store the result in R5
```

### 4. Bitwise NOT (`MVN`)

- **Syntax:** `MVN Rd, Operand2`
- **Description:** Performs a bitwise `NOT` operation on `Operand2` and stores the result in `Rd`.

```armasm
MVN R8, #0xFF        ; Invert all bits of 0xFF and store the result in R8

```
