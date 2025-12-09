	.file	"LeapYear.c"
	.intel_syntax noprefix
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Enter a year: \0"
.LC1:
	.ascii "%d\0"
.LC2:
	.ascii "%d is a leap year.\0"
.LC3:
	.ascii "%d is not a leap year.\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -4[rbp]
	mov	rdx, rax
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	scanf
	mov	edx, DWORD PTR -4[rbp]
	movsx	rax, edx
	imul	rax, rax, 1374389535
	shr	rax, 32
	sar	eax, 7
	mov	ecx, edx
	sar	ecx, 31
	sub	eax, ecx
	imul	ecx, eax, 400
	mov	eax, edx
	sub	eax, ecx
	test	eax, eax
	jne	.L2
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	jmp	.L3
.L2:
	mov	edx, DWORD PTR -4[rbp]
	movsx	rax, edx
	imul	rax, rax, 1374389535
	shr	rax, 32
	sar	eax, 5
	mov	ecx, edx
	sar	ecx, 31
	sub	eax, ecx
	imul	ecx, eax, 100
	mov	eax, edx
	sub	eax, ecx
	test	eax, eax
	jne	.L4
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	lea	rax, .LC3[rip]
	mov	rcx, rax
	call	printf
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp]
	and	eax, 3
	test	eax, eax
	jne	.L5
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	jmp	.L3
.L5:
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	lea	rax, .LC3[rip]
	mov	rcx, rax
	call	printf
.L3:
	mov	eax, 0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r3) 14.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
