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
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mulsd	xmm1, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+rax*8], xmm1
	lea	rcx, [rax+1]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, ecx
	mulsd	xmm2, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+rcx*8], xmm2
	lea	rsi, [rax+2]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, esi
	mulsd	xmm3, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+rsi*8], xmm3
	lea	rdi, [rax+3]
	pxor	xmm4, xmm4
	cvtsi2sd	xmm4, edi
	mulsd	xmm4, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+rdi*8], xmm4
	lea	r8, [rax+4]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm5, r8d
	mulsd	xmm5, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+r8*8], xmm5
	lea	r9, [rax+5]
	pxor	xmm7, xmm7
	cvtsi2sd	xmm7, r9d
	mulsd	xmm7, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+r9*8], xmm7
	lea	r10, [rax+6]
	pxor	xmm8, xmm8
	cvtsi2sd	xmm8, r10d
	mulsd	xmm8, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+r10*8], xmm8
	lea	r11, [rax+7]
	pxor	xmm9, xmm9
	cvtsi2sd	xmm9, r11d
	mulsd	xmm9, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+r11*8], xmm9
	lea	rdx, [rax+8]
	pxor	xmm10, xmm10
	cvtsi2sd	xmm10, edx
	mulsd	xmm10, QWORD PTR .LC1[rip]
	movsd	QWORD PTR res[0+rdx*8], xmm10
	add	rax, 9
	cmp	rax, 100
	jne	.L2
	mov	ecx, OFFSET FLAT:res+800
	movsd	xmm11, QWORD PTR .LC2[rip]
	movsd	xmm12, QWORD PTR .LC3[rip]
	movsd	xmm13, QWORD PTR .LC1[rip]
	movsd	xmm14, QWORD PTR res[rip]
	ucomisd	xmm11, xmm14
	ja	.L13
	jmp	.L38
.L6:
	mov	rax, rdi
	movsd	xmm1, QWORD PTR [rdi]
	ucomisd	xmm11, xmm1
	jbe	.L39
	movapd	xmm2, xmm1
	mulsd	xmm2, xmm1
	addsd	xmm2, xmm13
	jmp	.L5
.L39:
	movapd	xmm2, xmm1
	subsd	xmm2, xmm12
.L5:
	addsd	xmm1, xmm2
	movsd	QWORD PTR [rax], xmm1
	lea	rsi, [rdi+8]
	movsd	xmm3, QWORD PTR [rdi+8]
	ucomisd	xmm11, xmm3
	ja	.L17
	jmp	.L40
.L49:
	movsd	xmm0, QWORD PTR res[rip+792]
	mov	esi, OFFSET FLAT:.LC4
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk
	mov	esi, 0
	lea	rdi, [rsp+32]
	call	gettimeofday
	mov	r8, QWORD PTR [rsp+32]
	sub	r8, QWORD PTR [rsp+16]
	pxor	xmm11, xmm11
	cvtsi2sdq	xmm11, r8
	mov	r9, QWORD PTR [rsp+40]
	sub	r9, QWORD PTR [rsp+24]
	pxor	xmm0, xmm0
	cvtsi2sdq	xmm0, r9
	divsd	xmm0, QWORD PTR .LC5[rip]
	addsd	xmm0, xmm11
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
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	movapd	xmm15, xmm14
	subsd	xmm15, xmm12
	jmp	.L41
.L13:
	movapd	xmm15, xmm14
	mulsd	xmm15, xmm14
	addsd	xmm15, xmm13
.L41:
	addsd	xmm14, xmm15
	movsd	QWORD PTR res[rip], xmm14
	mov	edi, OFFSET FLAT:res+8
	movsd	xmm6, QWORD PTR res[rip+8]
	ucomisd	xmm11, xmm6
	ja	.L15
	movapd	xmm0, xmm6
	subsd	xmm0, xmm12
	jmp	.L42
.L15:
	movapd	xmm0, xmm6
	mulsd	xmm0, xmm6
	addsd	xmm0, xmm13
.L42:
	addsd	xmm6, xmm0
	movsd	QWORD PTR res[rip+8], xmm6
	add	rdi, 8
	jmp	.L6
.L40:
	movapd	xmm4, xmm3
	subsd	xmm4, xmm12
	jmp	.L43
.L17:
	movapd	xmm4, xmm3
	mulsd	xmm4, xmm3
	addsd	xmm4, xmm13
.L43:
	addsd	xmm3, xmm4
	movsd	QWORD PTR [rsi], xmm3
	movsd	xmm5, QWORD PTR [rsi+8]
	ucomisd	xmm11, xmm5
	ja	.L19
	movapd	xmm7, xmm5
	subsd	xmm7, xmm12
	jmp	.L44
.L19:
	movapd	xmm7, xmm5
	mulsd	xmm7, xmm5
	addsd	xmm7, xmm13
.L44:
	addsd	xmm5, xmm7
	movsd	QWORD PTR [rsi+8], xmm5
	movsd	xmm8, QWORD PTR [rsi+16]
	ucomisd	xmm11, xmm8
	ja	.L21
	movapd	xmm9, xmm8
	subsd	xmm9, xmm12
	jmp	.L45
.L21:
	movapd	xmm9, xmm8
	mulsd	xmm9, xmm8
	addsd	xmm9, xmm13
.L45:
	addsd	xmm8, xmm9
	movsd	QWORD PTR [rsi+16], xmm8
	movsd	xmm10, QWORD PTR [rsi+24]
	ucomisd	xmm11, xmm10
	ja	.L23
	movapd	xmm14, xmm10
	subsd	xmm14, xmm12
	jmp	.L46
.L23:
	movapd	xmm14, xmm10
	mulsd	xmm14, xmm10
	addsd	xmm14, xmm13
.L46:
	addsd	xmm10, xmm14
	movsd	QWORD PTR [rsi+24], xmm10
	movsd	xmm15, QWORD PTR [rsi+32]
	ucomisd	xmm11, xmm15
	ja	.L25
	movapd	xmm6, xmm15
	subsd	xmm6, xmm12
	jmp	.L47
.L25:
	movapd	xmm6, xmm15
	mulsd	xmm6, xmm15
	addsd	xmm6, xmm13
.L47:
	addsd	xmm15, xmm6
	movsd	QWORD PTR [rsi+32], xmm15
	movsd	xmm0, QWORD PTR [rsi+40]
	ucomisd	xmm11, xmm0
	ja	.L27
	movapd	xmm1, xmm0
	subsd	xmm1, xmm12
	jmp	.L48
.L27:
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	addsd	xmm1, xmm13
.L48:
	addsd	xmm0, xmm1
	movsd	QWORD PTR [rsi+40], xmm0
	lea	rdi, [rsi+48]
	cmp	rdi, rcx
	jne	.L6
	jmp	.L49
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
