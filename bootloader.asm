section .text
    global _start

_start:
    ; Set up the segment registers
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    ; Call the main function
    call main

    ; Infinite loop (for testing purposes)
    cli          ; Disable interrupts
    hlt          ; Halt the processor

main:
    ; Display a character on the screen
    mov ah, 0x0E ; BIOS teletype function
    mov al, 'H'  ; ASCII character to print
    int 0x10     ; Call BIOS interrupt for video services

    ; Infinite loop
    hlt

times 510-($-$$) db 0  ; Fill the rest of the 512-byte boot sector with zeros
dw 0xAA55              ; Boot signature (must be present at the end)
