	.file	"main.c"
	.text
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"w"
.LC2:
	.string	"/dev/null"
.LC6:
	.string	"%f%f%f\n"
.LC7:
	.string	"%.f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$4320064, %rsp
	.cfi_def_cfa_offset 4320080
	movq	%fs:40, %rax
	movq	%rax, 4320056(%rsp)
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	fopen
	movq	%rax, %rbx
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday
	leaq	48(%rsp), %rdi
	leaq	1440048(%rsp), %r9
	movq	%rdi, %r8
	movl	$0, %esi
	movsd	.LC3(%rip), %xmm4
	movsd	.LC4(%rip), %xmm3
	jmp	.L3
.L4:
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	leal	(%rax,%rsi), %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movapd	%xmm1, %xmm2
	addsd	%xmm4, %xmm2
	divsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	movss	%xmm5, (%r8,%rcx)
	movl	%esi, %edx
	subl	%eax, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	addsd	%xmm3, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, (%r9,%rcx)
	addl	$1, %eax
	addq	$4, %rcx
	cmpl	$600, %eax
	jne	.L4
	addl	$1, %esi
	addq	$2400, %r8
	addq	$2400, %r9
	cmpl	$600, %esi
	jne	.L3
	leaq	2882448(%rsp), %r8
	leaq	1440048(%rsp), %r9
	jmp	.L5
.L3:
	movl	$0, %ecx
	movl	$0, %eax
	jmp	.L4
.L6:
	movss	(%rax), %xmm0
	mulss	(%rdx), %xmm0
	addss	%xmm0, %xmm1
	addq	$2400, %rax
	addq	$4, %rdx
	cmpq	%rax, %rcx
	jne	.L6
	movss	%xmm1, (%rsi)
	addq	$4, %rsi
	addq	$4, %rcx
	cmpq	%rsi, %r8
	je	.L7
.L9:
	leaq	-1440000(%rcx), %rax
	movq	%rdi, %rdx
	pxor	%xmm1, %xmm1
	jmp	.L6
.L7:
	addq	$2400, %r8
	addq	$2400, %rdi
	cmpq	%rdi, %r9
	je	.L8
.L5:
	leaq	-2400(%r8), %rsi
	leaq	2880048(%rsp), %rcx
	jmp	.L9
.L8:
	movl	$0, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC5(%rip), %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	cvtss2sd	1440044(%rsp), %xmm0
	cvtss2sd	4320044(%rsp), %xmm2
	cvtss2sd	2880044(%rsp), %xmm1
	movl	$.LC6, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$3, %eax
	call	__fprintf_chk
	movsd	.LC5(%rip), %xmm3
	mulsd	8(%rsp), %xmm3
	movapd	%xmm3, %xmm0
	movl	$.LC7, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	fclose
	movl	$0, %eax
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
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	2576980378
	.long	1072798105
	.align 8
.LC4:
	.long	3435973837
	.long	1073794252
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
