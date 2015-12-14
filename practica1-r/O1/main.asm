	.file	"main.c"
	.text
	.globl	producto
	.type	producto, @function
producto:
.LFB39:
	.cfi_startproc
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%rdi)
	ret
	.cfi_endproc
.LFE39:
	.size	producto, .-producto
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"w"
.LC2:
	.string	"/dev/null"
.LC6:
	.string	"%f\n"
.LC7:
	.string	"%.f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$4320048, %rsp
	.cfi_def_cfa_offset 4320064
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	fopen
	movq	%rax, %rbx
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday
	movl	$0, %r10d
	movl	$0, %eax
	movsd	.LC3(%rip), %xmm4
	movsd	.LC4(%rip), %xmm3
	jmp	.L3
.L7:
	cvtsi2sd	%edx, %xmm0
	leaq	48(%rsp), %rsi
	leal	(%rax,%rdx), %ecx
	cvtsi2sd	%ecx, %xmm1
	movapd	%xmm0, %xmm2
	addsd	%xmm4, %xmm2
	divsd	%xmm2, %xmm1
	unpcklpd	%xmm1, %xmm1
	cvtpd2ps	%xmm1, %xmm5
	movss	%xmm5, (%r9,%rdx,4)
	leaq	1440048(%rsp), %rdi
	movl	%eax, %ecx
	subl	%edx, %ecx
	cvtsi2sd	%ecx, %xmm1
	addsd	%xmm3, %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm6
	movss	%xmm6, (%r8,%rdx,4)
	addq	$1, %rdx
	cmpq	$600, %rdx
	jne	.L7
	addl	$1, %eax
	addq	$2400, %r10
	cmpl	$600, %eax
	jne	.L3
	leaq	2880048(%rsp), %rax
	leaq	4320048(%rsp), %r9
	xorps	%xmm2, %xmm2
	jmp	.L6
.L3:
	movl	$0, %edx
	leaq	48(%rsp), %rdi
	leaq	(%r10,%rdi), %r9
	leaq	1440048(%rsp), %rdi
	leaq	(%r10,%rdi), %r8
	jmp	.L7
.L10:
	movss	(%rcx), %xmm1
	mulss	(%rsi,%rdx), %xmm1
	addss	%xmm1, %xmm0
	addq	$2400, %rcx
	addq	$4, %rdx
	cmpq	$2400, %rdx
	jne	.L10
	movss	%xmm0, (%rax,%r8)
	addq	$4, %r8
	cmpq	$2400, %r8
	je	.L9
.L12:
	leaq	(%rdi,%r8), %rcx
	movl	$0, %edx
	movaps	%xmm2, %xmm0
	jmp	.L10
.L9:
	addq	$2400, %rax
	addq	$2400, %rsi
	cmpq	%r9, %rax
	je	.L11
.L6:
	movl	$0, %r8d
	jmp	.L12
.L11:
	movl	$0, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	movss	4322448(%rsp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC6, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$1, %eax
	call	__fprintf_chk
	movsd	.LC5(%rip), %xmm0
	mulsd	8(%rsp), %xmm0
	movl	$.LC7, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$4320048, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
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
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
