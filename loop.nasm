; description:	simple loop with nasm
; author:		gregor luedi
; date:			8.10.2014
; filename:		loop.nasm

global: _start


section .text

_start:					;entrypoint
	
	mov ecx, 0x10		; number of repetitions in ecx
	jmp printMessage	; only if necessary

printMessage:

	push ecx			; save to stack
						; print the text to the console
	mov eax, 0x04
	mov ebx, 0x01
	mov ecx, message
	mov edx, mlen
	int 0x80
		
	pop ecx				; get countervalue from stack
	dec ecx				; decrement counter
	jnz printMessage	; jump to the top if counter is not zero
	jmp exit			; only if necessary
		

exit:					; exit gracefully
	
	mov eax, 0x01
	mov ebx, 0x10
	int 0x80

section .data

	message: db "Hello World!",0x0a
	mlen: equ $-message