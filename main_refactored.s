	.intel_syntax noprefix
	.text
	.globl	calculatePi
	.type	calculatePi, @function
calculatePi:
	push	rbp                         #
	mov	rbp, rsp                        #
	sub	rsp, 48                         # пролог функции calculatePi
	push r12                            # регистр r12 для лок. переменной `n`
	movsd	QWORD PTR -40[rbp], xmm0    #
	movsd	xmm0, QWORD PTR .LC0[rip]   # original_pi = 3.1415926535
	movsd	QWORD PTR -32[rbp], xmm0    # original_pi = 3.1415926535
	pxor	xmm0, xmm0                  # calculated_pi = 0
	movsd	QWORD PTR -8[rbp], xmm0     # calculated_pi = 0
	pxor	xmm0, xmm0                  # dz = 0
	movsd	QWORD PTR -16[rbp], xmm0    # dz = 0
	mov	r12d, 1                         # n = 1
	jmp	.L2                             # while (...)
.L3:
	mov	eax, r12d
	imul	eax, eax                    # ---
	cvtsi2sd	xmm1, eax               #
	movsd	xmm0, QWORD PTR .LC2[rip]   #
	divsd	xmm0, xmm1                  # dz += 1.0 / (n * n)
	movsd	xmm1, QWORD PTR -16[rbp]    #
	addsd	xmm0, xmm1                  #
	movsd	QWORD PTR -16[rbp], xmm0    # ---
	movsd	xmm1, QWORD PTR -16[rbp]    #
	movsd	xmm0, QWORD PTR .LC3[rip]   #
	mulsd	xmm0, xmm1                  # calculated_pi = sqrt(6 * dz)
	call	sqrt@PLT                    #
	movq	rax, xmm0                   #
	mov	QWORD PTR -8[rbp], rax          # ---
	add	r12d, 1                         # ++n
.L2:
	movsd	xmm0, QWORD PTR -32[rbp]    #
	subsd	xmm0, QWORD PTR -8[rbp]     #
	comisd	xmm0, QWORD PTR -40[rbp]    #
	ja	.L3                             # original_pi -  calculated_pi > precision ?
	movsd	xmm0, QWORD PTR -8[rbp]     # return calculated_pi
	pop r12                             #
	leave                               # эпилог функции calculatePi
	ret                                 #
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
	push	rbp                         #
	mov	rbp, rsp                        # пролог функции main
	sub	rsp, 16                         #
	lea	rdi, .LC4[rip]                  #
	mov	eax, 0                          #
	call	printf@PLT                  # printf("...")
	lea	rax, -8[rbp]                    # ---
	mov	rsi, rax                        #
	lea	rdi, .LC5[rip]                  # scanf("...", &precision)
	mov	eax, 0                          #
	call	__isoc99_scanf@PLT          # ---
	mov	rax, QWORD PTR -8[rbp]          #
	movq	xmm0, rax                   #
	call	calculatePi                 # printf("...", calculatePi(precision))
	lea	rdi, .LC6[rip]                  #
	mov	eax, 1                          #
	call	printf@PLT                  # ---
	mov	eax, 0                          #
	leave                               # эпилог функции
	ret                                 #
.LC0:
	.long	1413551940
	.long	1074340347
.LC2:
	.long	0
	.long	1072693248
.LC3:
	.long	0
	.long	1075314688
