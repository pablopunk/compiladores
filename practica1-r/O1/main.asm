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
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4320072, %rsp          ## imm = 0x41EB48
Ltmp6:
	.cfi_offset %rbx, -56
Ltmp7:
	.cfi_offset %r12, -48
Ltmp8:
	.cfi_offset %r13, -40
Ltmp9:
	.cfi_offset %r14, -32
Ltmp10:
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	L_.str(%rip), %rdi
	leaq	L_.str1(%rip), %rsi
	callq	_fopen
	movq	%rax, -4320112(%rbp)    ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -4320104(%rbp)    ## 8-byte Spill
	leaq	-4320064(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	leaq	-1440048(%rbp), %r12
	leaq	-2880048(%rbp), %r8
	movsd	LCPI1_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movsd	LCPI1_1(%rip), %xmm1    ## xmm1 = mem[0],zero
	movq	%r12, %r9
	xorl	%edx, %edx
	.align	4, 0x90
LBB1_1:                                 ## %.preheader3
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_2 Depth 2
	movl	%edx, %esi
	movq	%r8, %rdi
	movq	%r9, %rcx
	xorl	%eax, %eax
	.align	4, 0x90
LBB1_2:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	(%rdx,%rax), %ebx
	xorps	%xmm2, %xmm2
	cvtsi2sdl	%ebx, %xmm2
	xorps	%xmm3, %xmm3
	cvtsi2sdl	%eax, %xmm3
	movaps	%xmm3, %xmm4
	addsd	%xmm0, %xmm4
	divsd	%xmm4, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	movss	%xmm2, (%rcx)
	xorps	%xmm2, %xmm2
	cvtsi2sdl	%esi, %xmm2
	addsd	%xmm1, %xmm3
	divsd	%xmm3, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	movss	%xmm2, (%rdi)
	incq	%rax
	addq	$4, %rcx
	addq	$4, %rdi
	decl	%esi
	cmpq	$600, %rax              ## imm = 0x258
	jne	LBB1_2
## BB#3:                                ##   in Loop: Header=BB1_1 Depth=1
	incq	%rdx
	addq	$2400, %r9              ## imm = 0x960
	addq	$2400, %r8              ## imm = 0x960
	cmpq	$600, %rdx              ## imm = 0x258
	jne	LBB1_1
## BB#4:
	leaq	-4320084(%rbp), %rbx
	.align	4, 0x90
LBB1_5:                                 ## %.preheader1
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_6 Depth 2
                                        ##       Child Loop BB1_7 Depth 3
	xorl	%r15d, %r15d
	.align	4, 0x90
LBB1_6:                                 ## %.preheader
                                        ##   Parent Loop BB1_5 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_7 Depth 3
	xorpd	%xmm0, %xmm0
	movq	$-1440000, %r14         ## imm = 0xFFFFFFFFFFEA0700
	movq	%r12, %r13
	.align	4, 0x90
LBB1_7:                                 ##   Parent Loop BB1_5 Depth=1
                                        ##     Parent Loop BB1_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movss	%xmm0, -4320096(%rbp)   ## 4-byte Spill
	movss	(%r13), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	leaq	-2880048(%rbp,%r14), %rax
	movss	1440000(%rax,%r15,4), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	_producto
	movss	-4320096(%rbp), %xmm0   ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	addss	-4320084(%rbp), %xmm0
	addq	$4, %r13
	addq	$2400, %r14             ## imm = 0x960
	jne	LBB1_7
## BB#8:                                ##   in Loop: Header=BB1_6 Depth=2
	imulq	$2400, -4320104(%rbp), %rax ## 8-byte Folded Reload
                                        ## imm = 0x960
	leaq	-4320048(%rbp,%rax), %rax
	movss	%xmm0, (%rax,%r15,4)
	incq	%r15
	cmpq	$600, %r15              ## imm = 0x258
	jne	LBB1_6
## BB#9:                                ##   in Loop: Header=BB1_5 Depth=1
	movq	-4320104(%rbp), %rax    ## 8-byte Reload
	incq	%rax
	movq	%rax, -4320104(%rbp)    ## 8-byte Spill
	addq	$2400, %r12             ## imm = 0x960
	cmpq	$600, %rax              ## imm = 0x258
	jne	LBB1_5
## BB#10:
	leaq	-4320080(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	movq	-4320080(%rbp), %rax
	subq	-4320064(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	-4320072(%rbp), %eax
	subl	-4320056(%rbp), %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	LCPI1_2(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -4320096(%rbp)   ## 8-byte Spill
	movss	-2877648(%rbp), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str2(%rip), %rsi
	movb	$1, %al
	movq	-4320112(%rbp), %rdi    ## 8-byte Reload
	callq	_fprintf
	movsd	-4320096(%rbp), %xmm0   ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	mulsd	LCPI1_2(%rip), %xmm0
	leaq	L_.str3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB1_12
## BB#11:
	xorl	%eax, %eax
	addq	$4320072, %rsp          ## imm = 0x41EB48
	popq	%rbx
	popq	%r12
	popq	%r13
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
