section .text
    global _start

_start:
    ; Print the OS name
    mov ah, 0x0E ; BIOS teletype function
    mov al, 'B'  ; ASCII character for 'B'
    int 0x10     ; Call BIOS interrupt for video services

    mov al, 'u'  ; ASCII character for 'u'
    int 0x10

    mov al, 'r'  ; ASCII character for 'r'
    int 0x10

    mov al, 'n'  ; ASCII character for 'n'
    int 0x10

    mov al, 'i'  ; ASCII character for 'i'
    int 0x10

    mov al, 'n'  ; ASCII character for 'n'
    int 0x10

    mov al, 'g'  ; ASCII character for 'g'
    int 0x10

    mov al, 'E'  ; ASCII character for 'E'
    int 0x10

    mov al, 'm'  ; ASCII character for 'm'
    int 0x10

    mov al, 'b'  ; ASCII character for 'b'
    int 0x10

    mov al, 'e'  ; ASCII character for 'e'
    int 0x10

    mov al, 'r'  ; ASCII character for 'r'
    int 0x10

    mov al, 'O'  ; ASCII character for 'O'
    int 0x10

    mov al, 'S'  ; ASCII character for 'S'
    int 0x10

    ; Infinite loop (for testing purposes)
    cli          ; Disable interrupts
    hlt          ; Halt the processor
