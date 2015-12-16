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
	movl	N(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L3
	movsd	.LC2(%rip), %xmm0
	movl	$0, %esi
	leal	-1(%rcx), %edi
	andl	$7, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sd	%esi, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%rbx,%rsi,8)
	addq	$1, %rsi
	cmpl	%esi, %ecx
	jg	.L52
	jmp	.L62
.L4:
	pxor	%xmm9, %xmm9
	cvtsi2sd	%esi, %xmm9
	mulsd	%xmm0, %xmm9
	movsd	%xmm9, (%rbx,%rsi,8)
	addq	$1, %rsi
	pxor	%xmm10, %xmm10
	cvtsi2sd	%esi, %xmm10
	mulsd	%xmm0, %xmm10
	movsd	%xmm10, (%rbx,%rsi,8)
	leaq	1(%rsi), %r9
	pxor	%xmm11, %xmm11
	cvtsi2sd	%r9d, %xmm11
	mulsd	%xmm0, %xmm11
	movsd	%xmm11, (%rbx,%r9,8)
	leaq	2(%rsi), %r10
	pxor	%xmm12, %xmm12
	cvtsi2sd	%r10d, %xmm12
	mulsd	%xmm0, %xmm12
	movsd	%xmm12, (%rbx,%r10,8)
	leaq	3(%rsi), %r11
	pxor	%xmm13, %xmm13
	cvtsi2sd	%r11d, %xmm13
	mulsd	%xmm0, %xmm13
	movsd	%xmm13, (%rbx,%r11,8)
	leaq	4(%rsi), %rdx
	pxor	%xmm14, %xmm14
	cvtsi2sd	%edx, %xmm14
	mulsd	%xmm0, %xmm14
	movsd	%xmm14, (%rbx,%rdx,8)
	leaq	5(%rsi), %rax
	pxor	%xmm15, %xmm15
	cvtsi2sd	%eax, %xmm15
	mulsd	%xmm0, %xmm15
	movsd	%xmm15, (%rbx,%rax,8)
	leaq	6(%rsi), %rdi
	pxor	%xmm1, %xmm1
	cvtsi2sd	%edi, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%rbx,%rdi,8)
	addq	$7, %rsi
	cmpl	%esi, %ecx
	jg	.L4
.L62:
	movq	%rbx, %rax
	leal	-1(%rcx), %esi
	leaq	8(%rbx,%rsi,8), %rcx
	movsd	.LC3(%rip), %xmm5
	movsd	.LC5(%rip), %xmm2
	movsd	.LC4(%rip), %xmm3
	movq	%rcx, %r8
	subq	%rbx, %r8
	subq	$8, %r8
	shrq	$3, %r8
	andl	$3, %r8d
	movq	%rbx, %r9
	movsd	(%rbx), %xmm0
	ucomisd	%xmm0, %xmm5
	ja	.L13
	jmp	.L63
.L8:
	movq	%rax, %rdi
	movsd	(%rax), %xmm12
	ucomisd	%xmm12, %xmm5
	jbe	.L64
	movapd	%xmm12, %xmm13
	mulsd	%xmm12, %xmm13
	addsd	%xmm3, %xmm13
	jmp	.L7
.L64:
	movapd	%xmm12, %xmm13
	subsd	%xmm2, %xmm13
.L7:
	addsd	%xmm13, %xmm12
	movsd	%xmm12, (%rdi)
	leaq	8(%rax), %rsi
	movsd	8(%rax), %xmm14
	ucomisd	%xmm14, %xmm5
	ja	.L24
	jmp	.L65
.L3:
	movl	$0, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	movq	40(%rsp), %rcx
	subq	24(%rsp), %rcx
	pxor	%xmm5, %xmm5
	cvtsi2sdq	%rcx, %xmm5
	divsd	.LC6(%rip), %xmm5
	movq	32(%rsp), %r8
	subq	16(%rsp), %r8
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%r8, %xmm2
	addsd	%xmm2, %xmm5
	movsd	%xmm5, 8(%rsp)
	movslq	N(%rip), %r9
	movsd	-8(%rbx,%r9,8), %xmm0
	movl	$.LC7, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	__fprintf_chk
	movsd	.LC6(%rip), %xmm3
	mulsd	8(%rsp), %xmm3
	movapd	%xmm3, %xmm0
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
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L63:
	.cfi_restore_state
	movapd	%xmm0, %xmm4
	subsd	%xmm2, %xmm4
	jmp	.L66
.L13:
	movapd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm4
	addsd	%xmm3, %xmm4
.L66:
	addsd	%xmm4, %xmm0
	movsd	%xmm0, (%r9)
	addq	$8, %rax
	cmpq	%rcx, %rax
	je	.L3
	testq	%r8, %r8
	je	.L8
	cmpq	$1, %r8
	je	.L54
	cmpq	$2, %r8
	je	.L55
	movq	%rax, %r10
	movsd	(%rax), %xmm6
	ucomisd	%xmm6, %xmm5
	ja	.L15
	movapd	%xmm6, %xmm7
	subsd	%xmm2, %xmm7
	jmp	.L67
.L15:
	movapd	%xmm6, %xmm7
	mulsd	%xmm6, %xmm7
	addsd	%xmm3, %xmm7
.L67:
	addsd	%xmm7, %xmm6
	movsd	%xmm6, (%r10)
	addq	$8, %rax
.L55:
	movq	%rax, %r11
	movsd	(%rax), %xmm8
	ucomisd	%xmm8, %xmm5
	ja	.L18
	movapd	%xmm8, %xmm9
	subsd	%xmm2, %xmm9
	jmp	.L68
.L18:
	movapd	%xmm8, %xmm9
	mulsd	%xmm8, %xmm9
	addsd	%xmm3, %xmm9
.L68:
	addsd	%xmm9, %xmm8
	movsd	%xmm8, (%r11)
	addq	$8, %rax
.L54:
	movq	%rax, %rdx
	movsd	(%rax), %xmm10
	ucomisd	%xmm10, %xmm5
	ja	.L21
	movapd	%xmm10, %xmm11
	subsd	%xmm2, %xmm11
	jmp	.L69
.L21:
	movapd	%xmm10, %xmm11
	mulsd	%xmm10, %xmm11
	addsd	%xmm3, %xmm11
.L69:
	addsd	%xmm11, %xmm10
	movsd	%xmm10, (%rdx)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L8
	jmp	.L3
.L65:
	movapd	%xmm14, %xmm15
	subsd	%xmm2, %xmm15
	jmp	.L70
.L24:
	movapd	%xmm14, %xmm15
	mulsd	%xmm14, %xmm15
	addsd	%xmm3, %xmm15
.L70:
	addsd	%xmm15, %xmm14
	movsd	%xmm14, (%rsi)
	movsd	8(%rsi), %xmm1
	ucomisd	%xmm1, %xmm5
	ja	.L26
	movapd	%xmm1, %xmm0
	subsd	%xmm2, %xmm0
	jmp	.L71
.L26:
	movapd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	addsd	%xmm3, %xmm0
.L71:
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsi)
	movsd	16(%rsi), %xmm6
	ucomisd	%xmm6, %xmm5
	ja	.L28
	movapd	%xmm6, %xmm4
	subsd	%xmm2, %xmm4
	jmp	.L72
.L28:
	movapd	%xmm6, %xmm4
	mulsd	%xmm6, %xmm4
	addsd	%xmm3, %xmm4
.L72:
	addsd	%xmm4, %xmm6
	movsd	%xmm6, 16(%rsi)
	leaq	24(%rsi), %rax
	cmpq	%rcx, %rax
	jne	.L8
	jmp	.L3
.L52:
	testl	%edi, %edi
	je	.L4
	cmpl	$1, %edi
	je	.L56
	cmpl	$2, %edi
	je	.L57
	cmpl	$3, %edi
	je	.L58
	cmpl	$4, %edi
	je	.L59
	cmpl	$5, %edi
	je	.L60
	cmpl	$6, %edi
	je	.L61
	pxor	%xmm2, %xmm2
	cvtsi2sd	%esi, %xmm2
	mulsd	%xmm0, %xmm2
	movsd	%xmm2, (%rbx,%rsi,8)
	addq	$1, %rsi
.L61:
	pxor	%xmm3, %xmm3
	cvtsi2sd	%esi, %xmm3
	mulsd	%xmm0, %xmm3
	movsd	%xmm3, (%rbx,%rsi,8)
	addq	$1, %rsi
.L60:
	pxor	%xmm4, %xmm4
	cvtsi2sd	%esi, %xmm4
	mulsd	%xmm0, %xmm4
	movsd	%xmm4, (%rbx,%rsi,8)
	addq	$1, %rsi
.L59:
	pxor	%xmm5, %xmm5
	cvtsi2sd	%esi, %xmm5
	mulsd	%xmm0, %xmm5
	movsd	%xmm5, (%rbx,%rsi,8)
	addq	$1, %rsi
.L58:
	pxor	%xmm6, %xmm6
	cvtsi2sd	%esi, %xmm6
	mulsd	%xmm0, %xmm6
	movsd	%xmm6, (%rbx,%rsi,8)
	addq	$1, %rsi
.L57:
	pxor	%xmm7, %xmm7
	cvtsi2sd	%esi, %xmm7
	mulsd	%xmm0, %xmm7
	movsd	%xmm7, (%rbx,%rsi,8)
	addq	$1, %rsi
.L56:
	pxor	%xmm8, %xmm8
	cvtsi2sd	%esi, %xmm8
	mulsd	%xmm0, %xmm8
	movsd	%xmm8, (%rbx,%rsi,8)
	addq	$1, %rsi
	cmpl	%esi, %ecx
	jg	.L4
	jmp	.L62
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
