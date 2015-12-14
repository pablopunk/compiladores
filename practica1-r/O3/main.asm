	.file	"main.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	producto
	.type	producto, @function
producto:
.LFB38:
	.cfi_startproc
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%rdi)
	ret
	.cfi_endproc
.LFE38:
	.size	producto, .-producto
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"w"
.LC3:
	.string	"/dev/null"
.LC8:
	.string	"%f%f%f\n"
.LC9:
	.string	"%.f"
	.section	.text.unlikely
.LCOLDB10:
	.section	.text.startup,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC2, %esi
	movl	$.LC3, %edi
	subq	$4320064, %rsp
	.cfi_def_cfa_offset 4320080
	movq	%fs:40, %rax
	movq	%rax, 4320056(%rsp)
	xorl	%eax, %eax
	call	fopen
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movq	%rax, %rbx
	call	gettimeofday
	leaq	48(%rsp), %r9
	leaq	1440048(%rsp), %rsi
	xorl	%edx, %edx
	movdqa	.LC4(%rip), %xmm5
	movq	%r9, %rcx
	movapd	.LC5(%rip), %xmm3
	movapd	.LC6(%rip), %xmm2
	movdqa	.LC1(%rip), %xmm6
.L3:
	movl	%edx, 8(%rsp)
	movdqa	%xmm6, %xmm1
	movd	8(%rsp), %xmm4
	xorl	%eax, %eax
	pshufd	$0, %xmm4, %xmm4
	.p2align 4,,10
	.p2align 3
.L4:
	cvtdq2pd	%xmm1, %xmm9
	movapd	%xmm9, %xmm10
	pshufd	$238, %xmm1, %xmm8
	movdqa	%xmm4, %xmm0
	addpd	%xmm3, %xmm10
	paddd	%xmm1, %xmm0
	cvtdq2pd	%xmm8, %xmm8
	cvtdq2pd	%xmm0, %xmm7
	pshufd	$238, %xmm0, %xmm0
	addpd	%xmm2, %xmm9
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm10, %xmm7
	movapd	%xmm8, %xmm10
	addpd	%xmm2, %xmm8
	addpd	%xmm3, %xmm10
	divpd	%xmm10, %xmm0
	cvtpd2ps	%xmm7, %xmm7
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm7
	movdqa	%xmm4, %xmm0
	movaps	%xmm7, (%rcx,%rax)
	psubd	%xmm1, %xmm0
	cvtdq2pd	%xmm0, %xmm7
	pshufd	$238, %xmm0, %xmm0
	paddd	%xmm5, %xmm1
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm9, %xmm7
	divpd	%xmm8, %xmm0
	cvtpd2ps	%xmm7, %xmm7
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm7
	movaps	%xmm7, (%rsi,%rax)
	addq	$16, %rax
	cmpq	$2400, %rax
	jne	.L4
	addl	$1, %edx
	addq	$2400, %rcx
	addq	$2400, %rsi
	cmpl	$600, %edx
	jne	.L3
	pxor	%xmm2, %xmm2
	leaq	2880048(%rsp), %r10
	leaq	1440048(%rsp), %r8
	leaq	1442448(%rsp), %r11
.L5:
	leaq	1440048(%rsp), %rsi
	movq	%r10, %rdi
	.p2align 4,,10
	.p2align 3
.L9:
	pxor	%xmm1, %xmm1
	leaq	1440000(%rsi), %rcx
	movq	%rsi, %rax
	movq	%r9, %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movss	(%rdx), %xmm0
	addq	$2400, %rax
	addq	$4, %rdx
	shufps	$0, %xmm0, %xmm0
	mulps	-2400(%rax), %xmm0
	cmpq	%rax, %rcx
	addps	%xmm0, %xmm1
	jne	.L6
	addps	%xmm2, %xmm1
	addq	$16, %rsi
	addq	$16, %rdi
	movaps	%xmm1, -16(%rdi)
	cmpq	%r11, %rsi
	jne	.L9
	addq	$2400, %r9
	addq	$2400, %r10
	cmpq	%r8, %r9
	jne	.L5
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC8, %edx
	pxor	%xmm0, %xmm0
	movq	%rbx, %rdi
	pxor	%xmm1, %xmm1
	movl	$1, %esi
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtss2sd	4320044(%rsp), %xmm2
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC7(%rip), %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	2880044(%rsp), %xmm1
	movsd	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	cvtss2sd	1440044(%rsp), %xmm0
	call	__fprintf_chk
	movsd	.LC7(%rip), %xmm5
	movl	$.LC9, %esi
	movl	$1, %edi
	movl	$1, %eax
	mulsd	8(%rsp), %xmm5
	movapd	%xmm5, %xmm0
	call	__printf_chk
	movq	%rbx, %rdi
	call	fclose
	xorl	%eax, %eax
	movq	4320056(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L16
	addq	$4320064, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE10:
	.section	.text.startup
.LHOTE10:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC4:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC5:
	.long	2576980378
	.long	1072798105
	.long	2576980378
	.long	1072798105
	.align 16
.LC6:
	.long	3435973837
	.long	1073794252
	.long	3435973837
	.long	1073794252
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
