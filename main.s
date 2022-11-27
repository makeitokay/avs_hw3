	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	calculatePi
	.type	calculatePi, @function
calculatePi:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0
	mov	DWORD PTR -20[rbp], 1
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -20[rbp]
	imul	eax, eax
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -16[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm1, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	call	sqrt@PLT
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -20[rbp], 1
.L2:
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR -40[rbp]
	ja	.L3
	movsd	xmm0, QWORD PTR -8[rbp]
	leave
	ret
	.size	calculatePi, .-calculatePi
	.section	.rodata
	.align 8
.LC4:
	.string	"Input precision (not less than 0.0001): "
.LC5:
	.string	"%lf"
.LC6:
	.string	"Calculated pi = %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -8[rbp]
	mov	rsi, rax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	call	calculatePi
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	1413551940
	.long	1074340347
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1075314688
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
