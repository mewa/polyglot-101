BITS 32
	
	xor	eax, eax
	db	0x40
	mov	bh, 1
	test	eax, eax
	jz	near x64
x86:
	nop			; x86-86 relevant code
x64:
	nop			; x86-64 relevant code
