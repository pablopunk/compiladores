	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_producto
	.align	4, 0x90
_producto:                              ## @producto
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI1_0:
	.quad	4607632778762754458     ## double 1.1000000000000001
LCPI1_1:
	.quad	4611911198408756429     ## double 2.1000000000000001
LCPI1_2:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$4320056, %rsp          ## imm = 0x41EB38
Ltmp6:
	.cfi_offset %rbx, -40
Ltmp7:
	.cfi_offset %r14, -32
Ltmp8:
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %r14
	movq	(%r14), %r14
	movq	%r14, -32(%rbp)
	leaq	L_.str(%rip), %rdi
	leaq	L_.str1(%rip), %rsi
	callq	_fopen
	movq	%rax, %r15
	xorl	%ebx, %ebx
	leaq	-4320048(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	leaq	-1440028(%rbp), %r8
	leaq	-2880028(%rbp), %r9
	movsd	LCPI1_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movsd	LCPI1_1(%rip), %xmm1    ## xmm1 = mem[0],zero
	.align	4, 0x90
LBB1_1:                                 ## %vector.ph
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_2 Depth 2
	leaq	-1(%rbx), %r10
	movq	%r9, %rsi
	xorl	%edi, %edi
	movq	%r8, %rax
	xorl	%ecx, %ecx
	.align	4, 0x90
LBB1_2:                                 ## %vector.body
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	(%rbx,%rcx), %edx
	xorps	%xmm2, %xmm2
	cvtsi2sdl	%edx, %xmm2
	leal	1(%rbx,%rcx), %edx
	xorps	%xmm3, %xmm3
	cvtsi2sdl	%edx, %xmm3
	cvtsi2sdl	%ecx, %xmm4
	leal	1(%rcx), %edx
	cvtsi2sdl	%edx, %xmm5
	movaps	%xmm4, %xmm6
	addsd	%xmm0, %xmm6
	movaps	%xmm5, %xmm7
	addsd	%xmm0, %xmm7
	divsd	%xmm6, %xmm2
	divsd	%xmm7, %xmm3
	cvtsd2ss	%xmm2, %xmm2
	cvtsd2ss	%xmm3, %xmm3
	movss	%xmm2, -4(%rax)
	movss	%xmm3, (%rax)
	leal	(%rbx,%rdi), %edx
	xorps	%xmm2, %xmm2
	cvtsi2sdl	%edx, %xmm2
	leal	(%r10,%rdi), %edx
	xorps	%xmm3, %xmm3
	cvtsi2sdl	%edx, %xmm3
	addsd	%xmm1, %xmm4
	addsd	%xmm1, %xmm5
	divsd	%xmm4, %xmm2
	divsd	%xmm5, %xmm3
	cvtsd2ss	%xmm2, %xmm2
	cvtsd2ss	%xmm3, %xmm3
	movss	%xmm2, -4(%rsi)
	movss	%xmm3, (%rsi)
	addq	$2, %rcx
	addq	$8, %rax
	addq	$-2, %rdi
	addq	$8, %rsi
	cmpq	$600, %rcx              ## imm = 0x258
	jne	LBB1_2
## BB#3:                                ## %middle.block
                                        ##   in Loop: Header=BB1_1 Depth=1
	incq	%rbx
	addq	$2400, %r8              ## imm = 0x960
	addq	$2400, %r9              ## imm = 0x960
	cmpq	$600, %rbx              ## imm = 0x258
	jne	LBB1_1
## BB#4:                                ## %.preheader1.preheader
	leaq	-1440024(%rbp), %rax
	xorl	%ecx, %ecx
	.align	4, 0x90
LBB1_5:                                 ## %.preheader1
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_6 Depth 2
                                        ##       Child Loop BB1_7 Depth 3
	xorl	%edx, %edx
	.align	4, 0x90
LBB1_6:                                 ## %.preheader
                                        ##   Parent Loop BB1_5 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_7 Depth 3
	xorpd	%xmm0, %xmm0
	movl	$4800, %esi             ## imm = 0x12C0
	movq	%rax, %rdi
	.align	4, 0x90
LBB1_7:                                 ##   Parent Loop BB1_5 Depth=1
                                        ##     Parent Loop BB1_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leaq	-2880032(%rbp,%rsi), %rbx
	movss	-8(%rdi), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	movss	-4(%rdi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	mulss	-4800(%rbx,%rdx,4), %xmm1
	addss	%xmm0, %xmm1
	mulss	-2400(%rbx,%rdx,4), %xmm2
	addss	%xmm1, %xmm2
	movss	(%rdi), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	mulss	(%rbx,%rdx,4), %xmm0
	addss	%xmm2, %xmm0
	addq	$12, %rdi
	addq	$7200, %rsi             ## imm = 0x1C20
	cmpq	$1444800, %rsi          ## imm = 0x160BC0
	jne	LBB1_7
## BB#8:                                ##   in Loop: Header=BB1_6 Depth=2
	imulq	$2400, %rcx, %rsi       ## imm = 0x960
	leaq	-4320032(%rbp,%rsi), %rsi
	movss	%xmm0, (%rsi,%rdx,4)
	incq	%rdx
	cmpq	$600, %rdx              ## imm = 0x258
	jne	LBB1_6
## BB#9:                                ##   in Loop: Header=BB1_5 Depth=1
	incq	%rcx
	addq	$2400, %rax             ## imm = 0x960
	cmpq	$600, %rcx              ## imm = 0x258
	jne	LBB1_5
## BB#10:
	leaq	-4320064(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	movq	-4320064(%rbp), %rax
	subq	-4320048(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	-4320056(%rbp), %eax
	subl	-4320040(%rbp), %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	LCPI1_2(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -4320072(%rbp)   ## 8-byte Spill
	movss	-2877632(%rbp), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str2(%rip), %rsi
	movb	$1, %al
	movq	%r15, %rdi
	callq	_fprintf
	movsd	-4320072(%rbp), %xmm0   ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	mulsd	LCPI1_2(%rip), %xmm0
	leaq	L_.str3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	cmpq	-32(%rbp), %r14
	jne	LBB1_12
## BB#11:
	xorl	%eax, %eax
	addq	$4320056, %rsp          ## imm = 0x41EB38
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_12:
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"/dev/null"

L_.str1:                                ## @.str1
	.asciz	"w"

L_.str2:                                ## @.str2
	.asciz	"%f\n"

L_.str3:                                ## @.str3
	.asciz	"%.f"


.subsections_via_symbols
