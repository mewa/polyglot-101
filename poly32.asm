BITS 32

	xor 	eax, eax
	db	0x40
	mov	bh, 1
	test 	eax, eax
	jz	near x64
	
	mov 	eax, 4
	push 	word 0x0a74
	push 	dword 0x69623233
	mov 	ebx, 1
	mov 	ecx, esp
	mov 	edx, 6
	int 	0x80
	mov	eax, 1
	mov 	ebx, 123
	int 	0x80
x64:
