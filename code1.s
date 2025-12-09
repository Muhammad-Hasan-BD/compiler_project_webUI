	.file	"code1.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter a string to check for regex ab*: "
.LC1:
	.string	"%s"
	.align 8
.LC2:
	.string	"String matches the pattern ab*"
	.align 8
.LC3:
	.string	"String does not match the pattern ab*"
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
	cmp	al, 97
	jne	.L2
	add	DWORD PTR -116[rbp], 1
	jmp	.L3
.L4:
	add	DWORD PTR -116[rbp], 1
.L3:
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	cmp	al, 98
	je	.L4
	mov	eax, DWORD PTR -116[rbp]
	cdqe
	movzx	eax, BYTE PTR -112[rbp+rax]
	test	al, al
	jne	.L2
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L6
.L2:
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
.L6:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
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
