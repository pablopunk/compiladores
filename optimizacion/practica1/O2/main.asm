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
.LC7:
	.string	"%f%f%f\n"
.LC8:
	.string	"%.f"
	.section	.text.unlikely
.LCOLDB9:
	.section	.text.startup,"ax",@progbits
.LHOTB9:
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
	leaq	48(%rsp), %r8
	leaq	1440048(%rsp), %r9
	xorl	%esi, %esi
	movsd	.LC4(%rip), %xmm4
	movsd	.LC5(%rip), %xmm3
	movq	%r8, %rdi
.L3:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm1, %xmm1
	leal	(%rax,%rsi), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sd	%eax, %xmm1
	pxor	%xmm6, %xmm6
	cvtsi2sd	%edx, %xmm0
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %eax
	movapd	%xmm1, %xmm2
	addsd	%xmm3, %xmm1
	addsd	%xmm4, %xmm2
	divsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movss	%xmm5, (%rdi,%rcx)
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, (%r9,%rcx)
	addq	$4, %rcx
	cmpl	$600, %eax
	jne	.L4
	addl	$1, %esi
	addq	$2400, %rdi
	addq	$2400, %r9
	cmpl	$600, %esi
	jne	.L3
	pxor	%xmm2, %xmm2
	leaq	2882448(%rsp), %rdi
	leaq	1440048(%rsp), %r9
.L5:
	leaq	-2400(%rdi), %rsi
	leaq	2880048(%rsp), %rcx
	.p2align 4,,10
	.p2align 3
.L9:
	leaq	-1440000(%rcx), %rax
	movaps	%xmm2, %xmm1
	movq	%r8, %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movss	(%rax), %xmm0
	addq	$2400, %rax
	addq	$4, %rdx
	mulss	-4(%rdx), %xmm0
	cmpq	%rax, %rcx
	addss	%xmm0, %xmm1
	jne	.L6
	movss	%xmm1, (%rsi)
	addq	$4, %rsi
	addq	$4, %rcx
	cmpq	%rsi, %rdi
	jne	.L9
	addq	$2400, %r8
	addq	$2400, %rdi
	cmpq	%r8, %r9
	jne	.L5
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC7, %edx
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
	divsd	.LC6(%rip), %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	2880044(%rsp), %xmm1
	movsd	%xmm0, 8(%rsp)
	pxor	%xmm0, %xmm0
	cvtss2sd	1440044(%rsp), %xmm0
	call	__fprintf_chk
	movsd	.LC6(%rip), %xmm3
	movl	$.LC8, %esi
	movl	$1, %edi
	movl	$1, %eax
	mulsd	8(%rsp), %xmm3
	movapd	%xmm3, %xmm0
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
