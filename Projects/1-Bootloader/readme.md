# Tiny Bootloader Project in Assembly

A bootloader is a specialized piece of software that is responsible for loading the operating system (OS) when a computer is turned on. It is a critical component of the booting process and plays a vital role in initializing the system and preparing it for use.

### Key Functions of a Bootloader

1. **Initialization**:

   - When the computer is powered on, the processor begins execution from a predefined memory location. This location contains the initial code of the bootloader.
   - The bootloader initializes the hardware, such as setting up the CPU registers, memory controllers, and other low-level components.

2. **Loading the Operating System**:

   - The primary function of the bootloader is to locate the operating system kernel, load it into memory, and then transfer control to it.
   - This process may involve loading additional necessary components and drivers required by the kernel to start up.

3. **Providing User Interface**:

   - Some bootloaders provide a user interface, allowing users to select from multiple operating systems or recovery options. This is common in dual-boot setups where multiple operating systems are installed on the same machine.

4. **Hardware Abstraction**:
   - The bootloader can provide a layer of abstraction between the hardware and the OS, handling hardware-specific details and presenting a more generalized environment for the OS to operate.

### Types of Bootloaders

1. **Primary Bootloader**:

   - This is the first stage bootloader, usually stored in a dedicated sector of the storage device, like the Master Boot Record (MBR) on traditional BIOS systems or the EFI system partition on UEFI systems.
   - It is responsible for loading the secondary bootloader or directly loading the OS in simpler systems.

2. **Secondary Bootloader**:
   - A more complex bootloader that takes over from the primary bootloader. It has more functionality, such as providing a graphical interface, managing multiple boot options, and loading the operating system kernel.

### Common Bootloaders

- **GRUB (GNU GRand Unified Bootloader)**: A popular and widely used bootloader in Unix-like systems, including Linux. It supports multiple operating systems and provides a flexible and powerful booting environment.
- **LILO (Linux Loader)**: An older Linux bootloader, now mostly replaced by GRUB.
- **Windows Boot Manager**: The bootloader used by Microsoft Windows, which handles the loading of Windows operating systems.
- **systemd-boot** (formerly known as gummiboot): A simple UEFI boot manager used in some Linux distributions.
- **U-Boot (Universal Boot Loader)**: Commonly used in embedded systems.

### Bootloader Process (Typical Example)

1. **Power On and POST (Power-On Self Test)**:
   - When the computer is powered on, the BIOS/UEFI firmware performs POST to check the hardware components.
2. **Load Primary Bootloader**:

   - The firmware reads the primary bootloader from a predefined location (e.g., MBR or EFI partition).

3. **Load Secondary Bootloader** (if applicable):

   - The primary bootloader may load a more advanced secondary bootloader.

4. **Load OS Kernel**:

   - The bootloader locates the operating system kernel, loads it into memory, and transfers control to it.

5. **Operating System Takes Over**:
   - The operating system initializes further hardware and system services, eventually leading to the user environment being ready for use.

### Importance of Bootloaders

- **System Startup**: Without a bootloader, the operating system cannot be started, making the computer unusable.
- **Dual-Boot Management**: Bootloaders facilitate the ability to boot multiple operating systems on a single machine, offering flexibility and choice to the user.
- **Recovery and Maintenance**: Bootloaders often provide recovery options, which can be crucial for system maintenance and troubleshooting.

Understanding bootloaders in the context of assembly language provides insight into how low-level code interacts with hardware to initialize and load the operating system. Here’s a detailed overview of bootloaders with an emphasis on assembly language:

## Basic Structure of a Bootloader in Assembly Language

1. **Startup Code**:

   - The bootloader starts executing from the first instruction stored in the boot sector (the first 512 bytes of the storage device).
   - It is typically written in assembly language to directly control the hardware.

2. **Initialization**:

   - The bootloader performs minimal hardware initialization, such as setting the correct video mode, initializing the stack, and checking the system memory.

3. **Loading the Kernel**:

   - The bootloader must locate the operating system kernel (or a secondary bootloader), load it into memory, and then transfer control to it.

4. **Transfer Control**:
   - The final step is to jump to the loaded kernel code, passing control from the bootloader to the operating system.

### Example of a Simple Bootloader in Assembly Language

Here's a simplified example of a bootloader written in x86 assembly language. This example will just print "Hello, World!" to the screen and then halt the system.

```assembly
; bootloader.asm
; A simple bootloader that prints "Hello, World!" and halts.

BITS 16                  ; We are in 16-bit real mode
ORG 0x7C00               ; Origin, BIOS loads the bootloader at address 0x7C00

start:
    mov si, hello        ; Load the address of the string to SI
    call print_string    ; Call the function to print the string

hang:
    jmp hang             ; Hang the system

print_string:
    mov ah, 0x0E         ; BIOS teletype function
.loop:
    lodsb                ; Load next character from string
    cmp al, 0            ; Check if end of string (null terminator)
    je .done             ; If zero, end of string
    int 0x10             ; BIOS interrupt to print character
    jmp .loop            ; Repeat for next character
.done:
    ret                  ; Return from function

hello db 'Hello, World!', 0  ; The string to print, null-terminated

times 510 - ($ - $$) db 0    ; Fill the rest of the sector with zeros
dw 0xAA55                    ; Boot sector signature

```

### Explanation of the Code

1. **BITS 16**:

   - Specifies that the code is 16-bit, suitable for the real mode that the x86 BIOS starts in.

2. **ORG 0x7C00**:

   - Sets the origin to 0x7C00, the address where the BIOS loads the bootloader.

3. **start**:

   - Entry point of the bootloader.
   - Moves the address of the `hello` string into the `SI` register and calls `print_string`.

4. **hang**:

   - An infinite loop to halt the system after printing the string.

5. **print_string**:

   - A function to print a string using BIOS interrupt 0x10.
   - `lodsb` loads the next byte from the string pointed to by `SI` into `AL`.
   - `cmp al, 0` checks for the null terminator of the string.
   - `int 0x10` invokes BIOS interrupt to print the character in `AL`.

6. **hello db 'Hello, World!', 0**:

   - The string to be printed, null-terminated.

7. **times 510 - ($ - $$) db 0**:

   - Fills the remainder of the 512-byte boot sector with zeros.

8. **dw 0xAA55**:
   - The boot sector signature. The BIOS requires the last two bytes of the boot sector to be 0xAA55 to recognize it as a valid boot sector.

### Assembly Language Concepts in the Bootloader

1. **Interrupts**:

   - BIOS interrupts (like `int 0x10` for video services) provide essential services during the boot process before the operating system takes over.

2. **Registers**:

   - The bootloader makes extensive use of CPU registers for operations, such as `SI` for string indexing and `AH`/`AL` for interrupt parameters.

3. **Memory Addressing**:

   - The `ORG` directive and address manipulation are crucial for correctly placing the bootloader code and data.

4. **Loops and Control Flow**:
   - Simple loops (like the one in `print_string`) and infinite loops (like `hang`) manage the flow of execution.

### Bootloader Development Considerations

1. **Size Constraint**:

   - The bootloader must fit within the first 512 bytes of the storage device. This constraint requires efficient use of space.

2. **Direct Hardware Access**:

   - The bootloader directly interacts with hardware using low-level instructions and BIOS interrupts.

3. **Transition to Protected Mode**:
   - More advanced bootloaders might switch the CPU from real mode to protected mode or long mode to support modern operating systems.

In summary, writing a bootloader in assembly language involves understanding low-level system details, including hardware initialization, direct memory access, and BIOS services. This example demonstrates the fundamental steps a bootloader performs and illustrates the simplicity and direct hardware interaction afforded by assembly language.
