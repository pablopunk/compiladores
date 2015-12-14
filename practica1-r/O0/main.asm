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
	.string	"%f\n"
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
	subq	$4320096, %rsp
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, -4320048(%rbp)
	leaq	-4320032(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	$0, -4320064(%rbp)
	jmp	.L3
.L6:
	movl	$0, -4320060(%rbp)
	jmp	.L4
.L5:
	movl	-4320060(%rbp), %eax
	movl	-4320064(%rbp), %edx
	addl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	cvtsi2sd	-4320060(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm2
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movl	-4320060(%rbp), %eax
	cltq
	movl	-4320064(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	%xmm0, -4320000(%rbp,%rax,4)
	movl	-4320060(%rbp), %eax
	movl	-4320064(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	cvtsi2sd	-4320060(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm2
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movl	-4320060(%rbp), %eax
	cltq
	movl	-4320064(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	%xmm0, -2880000(%rbp,%rax,4)
	addl	$1, -4320060(%rbp)
.L4:
	cmpl	$599, -4320060(%rbp)
	jle	.L5
	addl	$1, -4320064(%rbp)
.L3:
	cmpl	$599, -4320064(%rbp)
	jle	.L6
	movl	$0, -4320064(%rbp)
	jmp	.L7
.L12:
	movl	$0, -4320060(%rbp)
	jmp	.L8
.L11:
	movl	.LC4(%rip), %eax
	movl	%eax, -4320052(%rbp)
	movl	$0, -4320056(%rbp)
	jmp	.L9
.L10:
	movl	-4320060(%rbp), %eax
	cltq
	movl	-4320056(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movl	-2880000(%rbp,%rax,4), %edx
	movl	-4320056(%rbp), %eax
	cltq
	movl	-4320064(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$600, %rcx, %rcx
	addq	%rcx, %rax
	movl	-4320000(%rbp,%rax,4), %eax
	leaq	-4320068(%rbp), %rcx
	movq	%rcx, %rdi
	movl	%edx, -4320084(%rbp)
	movss	-4320084(%rbp), %xmm1
	movl	%eax, -4320084(%rbp)
	movss	-4320084(%rbp), %xmm0
	call	producto
	movss	-4320068(%rbp), %xmm0
	movss	-4320052(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4320052(%rbp)
	addl	$1, -4320056(%rbp)
.L9:
	cmpl	$599, -4320056(%rbp)
	jle	.L10
	movl	-4320060(%rbp), %eax
	cltq
	movl	-4320064(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rax, %rdx
	movl	-4320052(%rbp), %eax
	movl	%eax, -1440000(%rbp,%rdx,4)
	addl	$1, -4320060(%rbp)
.L8:
	cmpl	$599, -4320060(%rbp)
	jle	.L11
	addl	$1, -4320064(%rbp)
.L7:
	cmpl	$599, -4320064(%rbp)
	jle	.L12
	leaq	-4320016(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-4320016(%rbp), %rdx
	movq	-4320032(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-4320008(%rbp), %rdx
	movq	-4320024(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -4320040(%rbp)
	movl	-4320060(%rbp), %eax
	cltq
	movl	-4320064(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-1440000(%rbp,%rax,4), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movq	-4320048(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf
	movsd	-4320040(%rbp), %xmm1
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
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
	.align 4
.LC4:
	.long	0
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
