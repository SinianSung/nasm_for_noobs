
global _start

section .text

_start:

	jmp short call_decoder
	
decoder:
	pop esi
	xor ecx, ecx
	mov cl, 2			; laenge des shellcodes
	
decode:
	xor byte [esi], 0xaa
	jz Shellcode
	inc esi
	jmp short decode


call_decoder:
	call decoder
	Shellcode: db 0x9b,0xfa,xaa
