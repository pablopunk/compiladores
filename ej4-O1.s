	.file	"ej4.c"
	.intel_syntax noprefix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"resultado= %e\n"
.LC7:
	.string	"\n-> Tiempo: %f\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	rsp, 64
	.cfi_def_cfa_offset 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rsp+56], rax
	xor	eax, eax
	mov	ebx, 10
	pxor	xmm6, xmm6
	movsd	QWORD PTR [rsp+8], xmm6
.L7:
	mov	esi, 0
	lea	rdi, [rsp+16]
	call	gettimeofday
	mov	eax, 0
.L2:
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+rax*8], xmm0
	add	rax, 1
	cmp	rax, 100
	jne	.L2
	mov	eax, OFFSET FLAT:res
	mov	ecx, OFFSET FLAT:res+800
	movsd	xmm2, QWORD PTR .LC2[rip]
	movsd	xmm4, QWORD PTR .LC3[rip]
	movsd	xmm3, QWORD PTR .LC1[rip]
.L6:
	mov	rdx, rax
	movsd	xmm0, QWORD PTR [rax]
	ucomisd	xmm2, xmm0
	jbe	.L13
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	addsd	xmm1, xmm3
	jmp	.L5
.L13:
	movapd	xmm1, xmm0
	subsd	xmm1, xmm4
.L5:
	addsd	xmm0, xmm1
	movsd	QWORD PTR [rdx], xmm0
	add	rax, 8
	cmp	rax, rcx
	jne	.L6
	movsd	xmm0, QWORD PTR res[rip+792]
	mov	esi, OFFSET FLAT:.LC4
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk
	mov	esi, 0
	lea	rdi, [rsp+32]
	call	gettimeofday
	mov	rax, QWORD PTR [rsp+32]
	sub	rax, QWORD PTR [rsp+16]
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, rax
	mov	rax, QWORD PTR [rsp+40]
	sub	rax, QWORD PTR [rsp+24]
	pxor	xmm0, xmm0
	cvtsi2sdq	xmm0, rax
	divsd	xmm0, QWORD PTR .LC5[rip]
	addsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR [rsp+8]
	movsd	QWORD PTR [rsp+8], xmm0
	sub	ebx, 1
	jne	.L7
	divsd	xmm0, QWORD PTR .LC6[rip]
	mov	esi, OFFSET FLAT:.LC7
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk
	mov	rbx, QWORD PTR [rsp+56]
	xor	rbx, QWORD PTR fs:40
	je	.L8
	call	__stack_chk_fail
.L8:
	add	rsp, 64
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.comm	res,800,64
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	3539053052
	.long	1061184077
	.align 8
.LC2:
	.long	0
	.long	1097011920
	.align 8
.LC3:
	.long	0
	.long	1083129856
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.align 8
.LC6:
	.long	0
	.long	1076101120
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
