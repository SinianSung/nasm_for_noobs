;gregor luedi
;17.9.2014
;helloWorld.nasm

global: _start

segment .text

_start:

    ; system write
    mov eax,0x04        ; system_write
    mov ebx,0x01        ; write to console
    mov ecx, message    ; what to write, adress of data
    mov edx, mlen       ; how many to write
    int 0x80            ; kernel start doing
        
    ; exit gracefully
    mov eax, 0x01       ; system_exit
    mov ebx, 0x00       ; exit number
    int 0x80            ; kernel start doing
            
segment .data

    message:    db  "Hello World! "
    mlen:       equ $-message
