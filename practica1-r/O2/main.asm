	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	producto
	.type	producto, @function
producto:
.LFB39:
	.cfi_startproc
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rdi)
	ret
	.cfi_endproc
.LFE39:
	.size	producto, .-producto
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"/dev/null"
.LC3:
	.string	"%f\n"
.LC4:
	.string	"%.f"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	subq	$1440048, %rsp
	.cfi_def_cfa_offset 1440064
	call	fopen
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movq	%rax, %rbx
	call	gettimeofday
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	32(%rsp), %rdx
	subq	16(%rsp), %rdx
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$1, %eax
	cvtsi2sdq	%rdx, %xmm1
	movq	40(%rsp), %rdx
	subq	24(%rsp), %rdx
	cvtsi2sdq	%rdx, %xmm0
	movl	$.LC3, %edx
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movss	1442448(%rsp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm1, 8(%rsp)
	call	__fprintf_chk
	movsd	8(%rsp), %xmm1
	movl	$.LC4, %esi
	movsd	.LC2(%rip), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	mulsd	%xmm1, %xmm0
	call	__printf_chk
	addq	$1440048, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
