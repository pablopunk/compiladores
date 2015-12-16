	.file	"main3.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"/dev/null"
.LC7:
	.string	"%f\n"
.LC8:
	.string	"%.f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	movq	%rsi, %rbx
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, %rbp
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L2
	call	__ctype_b_loc
	movsbq	(%rbx), %rdx
	movq	(%rax), %rax
	testb	$8, 1(%rax,%rdx,2)
	je	.L2
	movl	$10, %edx
	movl	$0, %esi
	movq	%rbx, %rdi
	call	strtol
	movl	%eax, N(%rip)
.L2:
	movslq	N(%rip), %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, %rbx
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday
	movl	N(%rip), %edx
	testl	%edx, %edx
	jle	.L3
	movl	$0, %eax
	movsd	.LC2(%rip), %xmm1
.L4:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %edx
	jg	.L4
	movq	%rbx, %rax
	leal	-1(%rdx), %edx
	leaq	8(%rbx,%rdx,8), %rcx
	movsd	.LC3(%rip), %xmm2
	movsd	.LC5(%rip), %xmm4
	movsd	.LC4(%rip), %xmm3
.L8:
	movq	%rax, %rdx
	movsd	(%rax), %xmm0
	ucomisd	%xmm0, %xmm2
	jbe	.L13
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	addsd	%xmm3, %xmm1
	jmp	.L7
.L13:
	movapd	%xmm0, %xmm1
	subsd	%xmm4, %xmm1
.L7:
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L8
.L3:
	movl	$0, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC6(%rip), %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	movslq	N(%rip), %rax
	movsd	-8(%rbx,%rax,8), %xmm0
	movl	$.LC7, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	__fprintf_chk
	movsd	.LC6(%rip), %xmm6
	mulsd	8(%rsp), %xmm6
	movapd	%xmm6, %xmm0
	movl	$.LC8, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%rbp, %rdi
	call	fclose
	movl	$0, %eax
	movq	56(%rsp), %rsi
	xorq	%fs:40, %rsi
	je	.L9
	call	__stack_chk_fail
.L9:
	addq	$72, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.globl	N
	.data
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.long	10000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2377693895
	.long	1061613574
	.align 8
.LC3:
	.long	0
	.long	1097011920
	.align 8
.LC4:
	.long	3539053052
	.long	1061184077
	.align 8
.LC5:
	.long	0
	.long	1083129856
	.align 8
.LC6:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
