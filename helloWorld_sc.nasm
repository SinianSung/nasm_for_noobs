; description:	hello world as shellcode, using jump call pop
; author:		gregor luedi
; date:			8.10.2014
; filename:		helloWorld_sc.nasm


global _start

section .text

_start:

	xor eax, eax
	mov al, 0x4
	xor ebx, ebx
	mov bl, 0x1

	jmp short message

execute:
	pop ecx
	mov dl, 0xc
	int 0x80

	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	mov bl, 0x7
	int 0x80

message:
	call execute
	msg db "Hello World!",0xa