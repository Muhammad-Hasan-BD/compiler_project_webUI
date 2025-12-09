	.file	"code2.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter a string to check if it's a valid C identifier: "
.LC1:
	.string	"%s"
.LC2:
	.string	"Not a valid C identifier"
.LC3:
	.string	"Valid C identifier"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -112[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -116[rbp], 0
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	cmp	al, 95
	je	.L2
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 1024
	test	eax, eax
	je	.L3
.L2:
	add	DWORD PTR -116[rbp], 1
	jmp	.L4
.L8:
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	cmp	al, 95
	je	.L5
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 8
	test	eax, eax
	je	.L6
.L5:
	add	DWORD PTR -116[rbp], 1
	jmp	.L4
.L6:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L9
.L4:
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	test	al, al
	jne	.L8
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L9
.L3:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
.L9:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
