section .text
    global _start

_start:
    ; Set up the segment registers
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    ; Load the kernel into memory at address 0x1000
    mov ax, 0x1000
    mov es, ax
    mov bx, 0
    mov ah, 0x02 ; BIOS read sector function
    mov al, 1    ; Number of sectors to read
    mov ch, 0    ; Track
    mov cl, 2    ; Sector (use 1-based indexing)
    mov dh, 0    ; Head
    int 0x13     ; Call BIOS interrupt for disk services

    ; Jump to the loaded kernel
    jmp 0x1000:0

    ; Infinite loop (for testing purposes)
    cli          ; Disable interrupts
    hlt          ; Halt the processor

times 510-($-$$) db 0  ; Fill the rest of the 512-byte boot sector with zeros
dw 0xAA55              ; Boot signature (must be present at the end)
