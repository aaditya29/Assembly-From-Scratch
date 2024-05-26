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
