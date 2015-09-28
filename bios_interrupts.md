# list #

| Interrupt  | Description |
|:-----------|:------------|
| INT 00h--  | CPU: Executed after an attempt to divide by zero or when the quotient does not fit in the destination |
| INT 01h    | CPU: Executed after every instruction while the trace flag is set |
| INT 02h    | CPU: NMI, used e.g. by POST for memory errors |
| INT 03h    | CPU: The lowest non-reserved interrupt, it is used exclusively for debugging, and the INT 03 handler is always implemented by a debugging program |
| INT 04h    | CPU: Numeric Overflow. Usually caused by the INTO instruction when the overflow flag is set. |
| INT 05h    | Executed when Shift-PrintScreen is pressed, as well as when the BOUND instruction detects a bound failure. |
| INT 06h    | CPU: Called when the Undefined Opcode (invalid instruction) exception occurs. Usually installed by the operating system. |
| INT 07h    | CPU: Called when an attempt was made to execute a floating-point instruction and no numeric coprocessor was available. |
| INT 08h    | IRQ0: Implemented by the system timing component; called 18.2 times per second (once every 55 ms) by the PIC |
| INT 09h    | IRQ1: Called after every key press and release (as well as during the time when a key is being held) |
| INT 0Bh    | IRQ3: Called by serial ports 2 and 4 (COM2/4) when in need of attention |
| INT 0Ch    | IRQ4: Called by serial ports 1 and 3 (COM1/3) when in need of attention |
| INT 0Dh    | IRQ5: Called by hard disk controller (PC/XT) or 2nd parallel port LPT2 (AT) when in need of attention |
| INT 0Eh    | IRQ6: Called by floppy disk controller when in need of attention |
| INT 0Fh    | IRQ7: Called by 1st parallel port LPT1 (printer) when in need of attention |
| INT 10h    | Video Services - installed by the BIOS or operating system; called by software programs |
|            | AH=00h   Set Video Mode |
|            | AH=01h   Set Cursor Shape |
|            | AH=02h   Set Cursor Position |
|            | AH=03h   Get Cursor Position And Shape |
|            | AH=04h   Get Light Pen Position |
|            | AH=05h   Set Display Page |
|            | AH=06h   Clear/Scroll Screen Up |
|            | AH=07h   Clear/Scroll Screen Down |
|            | AH=08h   Read Character and Attribute at Cursor |
|            | AH=09h   Write Character and Attribute at Cursor |
|            | AH=0Ah   Write Character at Cursor |
|            | AH=0Bh   Set Border Color |
|            | AH=0Eh   Write Character in TTY Mode |
|            | AH=0Fh   Get Video Mode |
|            | AH=13h   Write String |
| INT 11h    | Installed by the BIOS; returns equipment list |
| INT 12h    | Installed by the BIOS or operating system; returns Conventional Memory Size |
| **INT 13h**  | Low Level Disk Services; installed by the BIOS or operating system; called by software programs |
|            | AH=00h   Reset Disk Drives |
|            | AH=01h   Check Drive Status |
|            | AH=02h   Read Sectors From Drive |
|            | AH=03h   Write Sectors To Drive |
|            | AH=04h   Verifies Sectors On Drive |
|            | AH=05h   Format Track On Drive |
|            | AH=08h   Get Drive Parameters |
|            | AH=09h   Init Fixed Drive Parameters |
|            | AH=0Ch   Seek To Specified Track |
|            | AH=0Dh   Reset Fixed Disk Controller |
|            | AH=15h   Get Drive Type |
|            | AH=16h   Get Floppy Drive Media Change Status |
| INT 14h    | Routines for communicating via the serial port. Used by software programs. |
|            | AH=00h   Serial Port Initialization |
|            | AH=01h   Transmit Character |
|            | AH=02h   Receive Character |
|            | AH=03h   Status |
| INT 15h    | Miscellaneous (System services support routines) |
|            | AH=4FH   Keyboard Intercept |
|            | AH=83H   Event Wait |
|            | AH=84H   Read Joystick |
|            | AH=85H   Sysreq Key Callout |
|            | AH=86H   Wait |
|            | AH=87H   Move Block |
|            | AH=88H   Get Extended Memory Size |
|            | AH=C0H   Get System Parameters |
|            | AH=C1H   Get Extended BIOS Data Area Segment |
|            | AH=C2H   Pointing Device Functions |
|            | AH=0E8h, AL=01h (AX = 0E801h)   Get Extended Memory Size(Newer function, since 1994). Gives results for memory size above 64 Mb. |
| INT 16h    | Implemented by the BIOS or operating system. Provides routines to be called by software programs which communicate with the keyboard. |
|            | AH=00h   Read Character |
|            | AH=01h   Read Input Status |
|            | AH=02h   Read Keyboard Shift Status |
|            | AH=10h   Read Character Extended |
|            | AH=11h   Read Input Status Extended |
|            | AH=12h   Read Keyboard Shift Status Extended |
| INT 17h    | Print Services - used by software programs to communicate with the printer |
|            | AH=00h   Print Character to Printer |
|            | AH=01h   Initialize Printer |
|            | AH=02h   Check Printer Status |
| INT 18h    | Execute Cassette BASIC: True IBM computers contain BASIC in the ROM to be interpreted and executed by this routine in the event of a boot failure (called by the BIOS) |
| INT 19h    | After POST this interrupt is used by BIOS to load the operating system. |
| INT 1Ah    | Real Time Clock Services - called by software programs to communicate with the RTC |
|            | AH=00h   Read RTC |
|            | AH=01h   Set RTC |
|            | AH=02h   Read RTC Time |
|            | AH=03h   Set RTC Time |
|            | AH=04h   Read RTC Date |
|            | AH=05h   Set RTC Date |
|            | AH=06h   Set RTC Alarm |
|            | AH=07h   Reset RTC Alarm |
| INT 1Bh    | Installed by the operating system; automatically called by INT 9 when Ctrl-Break has been pressed |
| INT 1Ch    | Called automatically by INT 08; available for use by software programs when a routine needs to be executed regularly |
| INT 1Dh    | Not to be called; simply a pointer to the VPT (Video Parameter Table), which contains data on video modes |
| INT 1Eh    | Not to be called; simply a pointer to the DPT (Diskette Parameter Table), containing a variety of information concerning the diskette drives |
| INT 1Fh    | Not to be called; simply a pointer to the VGCT (Video Graphics Character Table), which contains the data for ASCII characters 80h to FFh |
| INT 41h    | Address pointer: FDPT = Fixed Disk Parameter Table (1st hard drive) |
| INT 46h    | Address pointer: FDPT = Fixed Disk Parameter Table (2nd hard drive) |
| INT 4Ah    | Called by RTC for alarm |
| INT 70h    | IRQ8: Called by RTC |
| INT 74h    | IRQ12: Called by mouse |
| INT 75h    | IRQ13: Called by math coprocessor |
| INT 76h    | IRQ14: Called by primary IDE controller |
| INT 77h    | IRQ15: Called by secondary IDE controller |