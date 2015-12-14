	.file	"main.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.globl	producto
	.type	producto, @function
producto:
.LFB20:
	.cfi_startproc
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%rdi)
	ret
	.cfi_endproc
.LFE20:
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
.LC7:
	.string	"%f%f%f\n"
.LC8:
	.string	"%.f"
	.section	.text.unlikely
.LCOLDB9:
	.section	.text.startup,"ax",@progbits
.LHOTB9:
	.globl	main
	.type	main, @function
main:
.LFB21:
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
	leaq	24(%rsp), %rdi
	xorl	%esi, %esi
	movq	%rax, %rbx
	call	gettimeofday
	leaq	56(%rsp), %rsi
	leaq	1440056(%rsp), %rdi
	xorl	%edx, %edx
	movsd	.LC4(%rip), %xmm2
	movsd	.LC5(%rip), %xmm3
	movq	%rsi, %r8
	movq	%rdi, %r9
.L3:
	xorl	%eax, %eax
.L4:
	cvtsi2sd	%eax, %xmm1
	leal	(%rdx,%rax), %ecx
	cvtsi2sd	%ecx, %xmm0
	movl	%edx, %ecx
	subl	%eax, %ecx
	movapd	%xmm1, %xmm4
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm4
	divsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	cvtsi2sd	%ecx, %xmm0
	movss	%xmm5, (%r8,%rax,4)
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, (%rdi,%rax,4)
	incq	%rax
	cmpq	$600, %rax
	jne	.L4
	incl	%edx
	addq	$2400, %r8
	addq	$2400, %rdi
	cmpl	$600, %edx
	jne	.L3
	leaq	2880056(%rsp), %rdx
	leaq	1440000(%rdx), %rdi
.L5:
	xorl	%eax, %eax
.L9:
	xorps	%xmm0, %xmm0
	leaq	(%r9,%rax), %r8
	xorl	%ecx, %ecx
.L6:
	imulq	$600, %rcx, %r10
	movss	(%r8,%r10), %xmm1
	mulss	(%rsi,%rcx), %xmm1
	addq	$4, %rcx
	cmpq	$2400, %rcx
	addss	%xmm1, %xmm0
	jne	.L6
	movss	%xmm0, (%rdx,%rax)
	addq	$4, %rax
	cmpq	$2400, %rax
	jne	.L9
	addq	$2400, %rdx
	addq	$2400, %rsi
	cmpq	%rdx, %rdi
	jne	.L5
	leaq	40(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movl	$.LC7, %edx
	cvtss2sd	4320052(%rsp), %xmm2
	movq	%rbx, %rdi
	movl	$1, %esi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$3, %al
	divsd	.LC6(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvtss2sd	2880052(%rsp), %xmm1
	movsd	%xmm0, 8(%rsp)
	cvtss2sd	1440052(%rsp), %xmm0
	call	__fprintf_chk
	movsd	.LC6(%rip), %xmm0
	movl	$.LC8, %esi
	movl	$1, %edi
	movb	$1, %al
	mulsd	8(%rsp), %xmm0
	call	__printf_chk
	movq	%rbx, %rdi
	call	fclose
	xorl	%eax, %eax
	movq	4320056(%rsp), %rbx
	xorq	%fs:40, %rbx
	je	.L10
	call	__stack_chk_fail
.L10:
	addq	$4320064, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE9:
	.section	.text.startup
.LHOTE9:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	2576980378
	.long	1072798105
	.align 8
.LC5:
	.long	3435973837
	.long	1073794252
	.align 8
.LC6:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
