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
	push ebx					;terminating zeros on the stack
	mov bl, 0x1

	push 0x0a646c72		; hello world in hex
	push 0x6f57206f			; in reverse order
	push 0x6c6c6548		; on the stack
	
	mov ecx,esp				; pointer to the string in ecx
	mov dl, 0xc
	int 0x80

	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	mov bl, 0x7
	int 0x80

