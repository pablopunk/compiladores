	.file	"main.c"
	.text
	.globl	producto
	.type	producto, @function
producto:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	producto, .-producto
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"/dev/null"
.LC6:
	.string	"%f%f%f\n"
.LC7:
	.string	"%.f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4320112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, -4320064(%rbp)
	leaq	-4320048(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	$0, -4320080(%rbp)
	jmp	.L3
.L6:
	movl	$0, -4320076(%rbp)
	jmp	.L4
.L5:
	movl	-4320080(%rbp), %edx
	movl	-4320076(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-4320076(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm2
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	-4320076(%rbp), %eax
	cltq
	movl	-4320080(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	%xmm0, -4320016(%rbp,%rax,4)
	movl	-4320080(%rbp), %eax
	subl	-4320076(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-4320076(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm2
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	-4320076(%rbp), %eax
	cltq
	movl	-4320080(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	%xmm0, -2880016(%rbp,%rax,4)
	addl	$1, -4320076(%rbp)
.L4:
	cmpl	$599, -4320076(%rbp)
	jle	.L5
	addl	$1, -4320080(%rbp)
.L3:
	cmpl	$599, -4320080(%rbp)
	jle	.L6
	movl	$0, -4320080(%rbp)
	jmp	.L7
.L12:
	movl	$0, -4320076(%rbp)
	jmp	.L8
.L11:
	pxor	%xmm0, %xmm0
	movss	%xmm0, -4320068(%rbp)
	movl	$0, -4320072(%rbp)
	jmp	.L9
.L10:
	movl	-4320076(%rbp), %eax
	cltq
	movl	-4320072(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-2880016(%rbp,%rax,4), %xmm0
	movl	-4320072(%rbp), %eax
	cltq
	movl	-4320080(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movl	-4320016(%rbp,%rax,4), %eax
	leaq	-4320084(%rbp), %rdx
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movl	%eax, -4320100(%rbp)
	movss	-4320100(%rbp), %xmm0
	call	producto
	movss	-4320084(%rbp), %xmm0
	movss	-4320068(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4320068(%rbp)
	addl	$1, -4320072(%rbp)
.L9:
	cmpl	$599, -4320072(%rbp)
	jle	.L10
	movl	-4320076(%rbp), %eax
	cltq
	movl	-4320080(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-4320068(%rbp), %xmm0
	movss	%xmm0, -1440016(%rbp,%rax,4)
	addl	$1, -4320076(%rbp)
.L8:
	cmpl	$599, -4320076(%rbp)
	jle	.L11
	addl	$1, -4320080(%rbp)
.L7:
	cmpl	$599, -4320080(%rbp)
	jle	.L12
	leaq	-4320032(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-4320032(%rbp), %rdx
	movq	-4320048(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-4320024(%rbp), %rdx
	movq	-4320040(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -4320056(%rbp)
	movl	-4320080(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4320076(%rbp), %eax
	subl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-1440016(%rbp,%rax,4), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movl	-4320080(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4320076(%rbp), %eax
	subl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-2880016(%rbp,%rax,4), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movl	-4320080(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4320076(%rbp), %eax
	subl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-4320016(%rbp,%rax,4), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	-4320064(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$3, %eax
	call	fprintf
	movsd	-4320056(%rbp), %xmm1
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	movq	-4320064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L14
	call	__stack_chk_fail
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	2576980378
	.long	1072798105
	.align 8
.LC3:
	.long	3435973837
	.long	1073794252
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
