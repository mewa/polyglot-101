BITS 64

	mov 	rax, 1
	sub	rsp, 0x06
	mov	word [rsp+4], 0x0a74
	mov 	dword [rsp], 0x69623436
	mov	rdi, 1
	mov 	rsi, rsp
	mov 	rdx, 6
	syscall
	mov 	rax, 60
	mov 	rdi, 123
	syscall
