; description:	hello world as shellcode, using stack
; author:		gregor luedi
; date:			12.10.2014
; filename:		helloWorld_sc_stack.nasm


global _start

section .text

_start:

	xor eax, eax
	mov al, 0x4
	xor ebx, ebx
	push ebx
	mov bl, 0x1

	push 0x0a646c72
	push 0x6f57206f
	push 0x6c6c6548
	
	push 0x0a646c72
	push 0x6f57206f
	push 0x6c6c6548
	mov ecx,esp
	mov dl, 0xc
	int 0x80

	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	mov bl, 0x7
	int 0x80

