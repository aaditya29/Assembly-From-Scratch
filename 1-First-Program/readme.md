# Emulation and Memory Layout

## Registers in ARM Assembly

Registers are a fundamental component of computer architecture and are closely tied to assembly language programming. Registers are small storage locations within the CPU (Central Processing Unit) that hold data temporarily during processing. Here’s a breakdown of key aspects of registers and their role in assembly language:

1. **Purpose of Registers:**

- **Data Storage:** Registers store operands (data) for arithmetic/logical operations.
- **Addressing:** They hold memory addresses for data access.
- **Control and Status:** Some registers are used for CPU control and to store status flags (e.g., zero, carry, overflow) that reflect the outcome of previous operations.

2. **Types of Registers:**

- **General-Purpose Registers:** These are used to store data during program execution. Examples include `AX`, `BX`, `CX`, `DX` (16-bit registers), `EAX`, `EBX`, `ECX`, `EDX` (32-bit registers) on x86 architectures.

- **Special-Purpose Registers:**
  - _Instruction Pointer (IP):_ Points to the memory location of the next instruction to be executed.
  - _Stack Pointer (SP):_ Points to the top of the stack in memory.
  - _Base Pointer (BP):_ Used in stack-based addressing modes.
  - _Index Registers (SI, DI):_ Used for indexed addressing.
  - _Flags Register:_ Holds status flags that indicate the result of arithmetic or logical operations (e.g., zero flag, carry flag).

3. **Assembly Language Usage:**

- Assembly language instructions directly manipulate registers.
- Registers are accessed using mnemonics corresponding to their names (e.g., `MOV AX, 10` moves the value **10** into the `AX` register).
- Registers are used for arithmetic operations **(ADD, SUB, MUL, DIV)**, logical operations **(AND, OR, NOT, XOR)**, data movement **(MOV)**, and control flow **(JMP, CALL, RET)**.

4. **Register Size and Architecture:**

- Register sizes depend on the CPU architecture (e.g., 16-bit, 32-bit, 64-bit).
- Modern processors have a mix of general-purpose and specialized registers optimized for performance.

5. **Register Constraints:**

- Limited number of registers necessitates efficient usage.
- Registers are faster to access than memory, making them essential for performance-critical code.

6. **Context Switching:**

   Registers may need to be saved/restored during context switches (e.g., when switching between processes or threads) to preserve program state.

## Registers w.r.t. ARM Assembly Language

ARM architecture, like other CPU architectures, includes various types of registers that play specific roles in assembly language programming. Here are the key types of registers in ARM assembly language along with their typical usage:

1. **General-Purpose Registers:**

- **Purpose:** Used for general data storage and arithmetic/logical operations.
- **Examples:** `R0`, `R1`, `R2`, ..., `R15` (or `r0`, `r1`, `r2`, ..., `r15` in lowercase).
- **Usage:**
  - Store function arguments and return values.
  - Hold intermediate values during computations.
  - Used as loop counters and pointers.
  - Source and destination operands for data movement **(MOV, ADD, SUB, etc.)**.

2. **Program Counter (PC):**

- **Purpose:** Holds the memory address of the current instruction being executed.
- **Usage:**
  - Controls program flow by pointing to the next instruction to be fetched and executed.
  - Automatically incremented after fetching an instruction, unless modified explicitly (e.g., by branching instructions).

3. **Stack Pointer (SP):**

- **Purpose:** Points to the top of the stack.
- **Usage:**
  - Facilitates stack-based memory operations (e.g., pushing/popping values, function call management).
  - Helps allocate and deallocate memory dynamically.

4. **Link Register (LR):**

- **Purpose:** Stores the return address when executing a subroutine (function).
- **Usage:**

  - Saves the address to return to after completing a function call.
  - Automatically used by `BL` (branch with link) instruction to store the return address.

  5. **Status Registers:**

- **Purpose:** Store status flags and control bits.
- **Examples:** `CPSR` (Current Program Status Register) in ARM, `APSR` (Application Program Status Register) in ARMv7 and later.
- **Usage:**
  - Hold condition flags (e.g., zero flag, carry flag) that reflect the result of arithmetic/logical operations.
  - Control execution modes and privilege levels.

6. **Control Registers:**

- **Purpose:** Control processor operation and configuration.
- **Examples:** `SPSR` (Saved Program Status Register) in ARM.
- **Usage:**
  - Hold status information during exception handling or mode changes.
  - Manage processor modes and interrupts.

### CPSR and SPSR Registers

In ARM architecture, the `CPSR` (Current Program Status Register) and `SPSR` (Saved Program Status Register) are special-purpose registers that store status flags and control bits related to program execution and exception handling. Here's an overview of these registers:

### CPSR (Current Program Status Register):

- **Purpose:** The CPSR is the primary status register in ARM processors, holding important flags and mode bits that reflect the current state of the processor during normal program execution.
- **Key Contents:**
  - **Condition Flags:**
    - `Zero Flag (Z)`: Set when the result of an operation is zero.
    - `Negative Flag (N)`: Set when the result of an operation is negative.
    - `Carry Flag (C)`: Used for carry-out or borrow in arithmetic operations.
    - `Overflow Flag (V)`: Indicates signed overflow in arithmetic operations.
  - **Processor Mode:**<br>
    - Specifies the current execution mode (e.g., User, Supervisor, IRQ, FIQ).
  - **Control Bits:**
    - Various control bits for interrupts, endianess, and other processor configurations.
  - **Usage:**
    - Condition flags are updated based on the result of arithmetic and logical operations.
    - The processor mode bits indicate the current mode of operation (e.g., User mode for regular program execution, Supervisor mode for handling interrupts and exceptions).
    - CPSR is automatically saved to SPSR when an exception (e.g., IRQ, FIQ) occurs to preserve the previous execution state.

#### SPSR (Saved Program Status Register):

- **Purpose:** The SPSR is used to save the CPSR of the current execution mode when an exception (e.g., `IRQ`, `FIQ`) occurs. This allows the processor to return to the original execution state after handling the exception.
- **Usage:**
  - When an exception occurs, the processor automatically saves the CPSR of the current mode to the corresponding SPSR.
  - After handling the exception, the SPSR is used to restore the original execution state (including condition flags and mode) before returning to normal program execution.

#### Example Usage Scenario:

1. **Exception Handling:**

- When an interrupt (e.g., `IRQ`) occurs during normal program execution, the processor switches to the IRQ mode.
- The `CPSR` of the current mode (e.g., User mode) is automatically saved into the corresponding SPSR_IRQ.
- The CPSR is then updated to reflect the IRQ mode (e.g., with IRQ mode bit set).
- After handling the interrupt, the processor restores the CPSR from SPSR_IRQ to return to the previous execution state (e.g., User mode) and resumes normal program execution.
