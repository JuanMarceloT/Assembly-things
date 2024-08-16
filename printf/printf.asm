
.model small
.stack

.data
    print_buffer            DB  "Hello world!"
.code
.startup
    lea		bx,print_buffer	; Load the address of the string into the BX register
	call	Printf			; Call the Printf function, which uses BX as a pointer to the string
.exit

Printf	proc	near

print_2:
	mov		dl,[bx]		; While (*S!='\0') {
	cmp		dl,0
	jnz		print_1
	ret

print_1:
	mov		ah,2		
	int		21H

	inc		bx			; 	++S
	jmp		print_2		
Printf	endp

end
