section .data
    user_input db 256  ; Buffer to store user input
    os_name db 'BurningEmberOS', 0  ; Null-terminated OS name

section .text
    global _start

_start:
    ; Print the OS name
    mov edi, os_name  ; Source buffer
print_os_name:
    lodsb           ; Load the next byte from the buffer into AL
    cmp al, 0       ; Check for the null terminator (end of string)
    je os_name_done ; If null terminator, exit the loop
    mov ah, 0x0E    ; BIOS teletype function
    int 0x10        ; Print the character
    jmp print_os_name ; Repeat for the next character
os_name_done:

    ; Print a prompt
    mov ah, 0x0E
    mov al, '>'
    int 0x10

    ; Read user input
    mov ah, 0       ; BIOS keyboard input function
    int 0x16        ; Call BIOS interrupt for keyboard input
    mov [user_input], al ; Store the entered character in user_input

    ; Print the user input
    mov ah, 0x0E
    mov al, [user_input] ; Move the character to AL
    int 0x10        ; Print the character

    ; Infinite loop (for testing purposes)
    cli          ; Disable interrupts
    hlt          ; Halt the processor
