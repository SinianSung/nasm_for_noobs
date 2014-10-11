; description:	simple shellcode nasm
; author:		gregor luedi
; date:			8.10.2014
; filename:		exit_sc.nasm


global _start

section .text

	xor eax, eax		;clear eax
	xor ebx, ebx		;clear ebx
	mov al,	0x01 		;write 1 in the lowest byte
	mov bl, 0x10		; write 10 in the lowest byte, no 0x000000 for higher bytes
	int 0x80			; call the kernel

