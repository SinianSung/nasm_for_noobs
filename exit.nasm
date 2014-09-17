; gregor luedi
; 10.9.2014
 
 
global: main
 
segment .text   ; code of the programm
 
main:
    mov eax, 0x01   ; system_exit number
    mov ebx, 0x0    ; exit parameter 0 = no errors
    int 0x80        ; kernel do
    
segment .data   ; for initialised Data
