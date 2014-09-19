; gregor luedi
; 19.9.2014

; arithmetic

SYS_WRITE EQU 4
SYS_EXIT  EQU 1
SYS_READ  EQU 3
STDIN     EQU 0
STDOUT    EQU 1


segment .text

  global main
  
main:
  ;print give me a number
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, msg1
  mov edx, len1
  int 0x80
  
  ;read the number
  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num1
  mov edx, 2
  int 0x80
  
  ;print give me a second number
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, msg2
  mov edx, len2
  int 0x80
  
  ;read the second number
  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num2
  mov edx, 2
  int 0x80
  
  ; here the arithmetic starts
  mov eax, [num1]
  sub eax, '0'        ; convert to decimal number
  mov ebx, [num2]
  sub ebx, '0'        ; convert to decimal number
  
  add eax, ebx
  add eax, '0'
  
  mov [res], eax
  
  ; print the sum is
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, msg3
  mov edx, len2
  int 0x80
  
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, res
  mov edx, 1
  int 0x80
  
  ; exit gracefully
  mov eax, SYS_EXIT
  xor ebx,ebx
  int 0x80
  
  
  
segment .data

  msg1  db  "Enter a digit: ",0xa,0xd
  len1  equ $-msg1
  
  msg2  db  "Enter a second digit: ",0xa,0xd
  len2  equ $-msg2
  
  msg3  db  "The sum is: ",0xa,0xd
  len3  equ $-msg3


segment .bss

  num1  resb  2
  num2  resb  2
  res   resb  1
  
  
