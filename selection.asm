global _start

section .text

_start:

    mov eax, 0x10
    mov ebx, 0x12
    cmp eax, ebx
    jg  greater
    
smaller:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg1
    mov edx, len1
    int 0x80
    jmp exit
     
greater:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg2
    mov edx, len2
    int 0x80
    
exit:
    mov eax, 0x1
    mov ebx, 0x5
    int 0x80
    
    
section .data

    msg1    db  "smaller",0xa
    len1    equ $-msg1
    msg2    db  "greater",0xa
    len2    equ $-msg2
    