# Logical Operations in Assembly Language

In ARM Assembly language, logical operations manipulate data at the bit-level using bitwise operations. These operations include logical AND, OR, XOR, and NOT, and they are commonly used for tasks such as bit manipulation, setting or clearing specific bits, and combining or masking data.

## Logical Operations

### 1. Logical AND (`AND`)

- **Syntax**: `AND Rd, Rn, Operand2`
- **Description:** Performs a bitwise `AND` operation between `Rn` and `Operand2` and stores the result in `Rd`.

```armasm
AND R1, R2, #0xFF    ; Clear all but the lowest byte of R2 and store the result in R1
```
