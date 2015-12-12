	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_producto
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
	pushq	%r12
	pushq	%rbx
	subq	$4320064, %rsp          ## imm = 0x41EB40
Ltmp6:
	.cfi_offset %rbx, -48
Ltmp7:
	.cfi_offset %r12, -40
Ltmp8:
	.cfi_offset %r14, -32
Ltmp9:
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %r14
	movq	(%r14), %r14
	movq	%r14, -40(%rbp)
	leaq	L_.str(%rip), %rdi
	leaq	L_.str1(%rip), %rsi
	callq	_fopen
	movq	%rax, %r15
	xorl	%r12d, %r12d
	leaq	-4320064(%rbp), %rdi
	xorl	%esi, %esi
	callq	_gettimeofday
	leaq	-1440048(%rbp), %r10
	leaq	-2880048(%rbp), %r8
	movsd	LCPI1_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movsd	LCPI1_1(%rip), %xmm1    ## xmm1 = mem[0],zero
	movq	%r10, %r9
	xorl	%esi, %esi
LBB1_1:                                 ## %.preheader3
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_2 Depth 2
	movl	%esi, %edi
	movq	%r8, %rcx
	movq	%r9, %rdx
	xorl	%ebx, %ebx
LBB1_2:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	leal	(%rsi,%rbx), %eax
	xorps	%xmm2, %xmm2
	cvtsi2sdl	%eax, %xmm2
	xorps	%xmm3, %xmm3
	cvtsi2sdl	%ebx, %xmm3
	movaps	%xmm3, %xmm4
	addsd	%xmm0, %xmm4
	divsd	%xmm4, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	movss	%xmm2, (%rdx)
	xorps	%xmm2, %xmm2
	cvtsi2sdl	%edi, %xmm2
	addsd	%xmm1, %xmm3
	divsd	%xmm3, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	movss	%xmm2, (%rcx)
	incq	%rbx
	addq	$4, %rdx
	addq	$4, %rcx
	decl	%edi
	cmpq	$600, %rbx              ## imm = 0x258
	jne	LBB1_2
## BB#3:                                ##   in Loop: Header=BB1_1 Depth=1
	incq	%rsi
	addq	$2400, %r9              ## imm = 0x960
	addq	$2400, %r8              ## imm = 0x960
	cmpq	$600, %rsi              ## imm = 0x258
	jne	LBB1_1
LBB1_4:                                 ## %.preheader1
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_5 Depth 2
                                        ##       Child Loop BB1_6 Depth 3
	xorl	%ecx, %ecx
LBB1_5:                                 ## %.preheader
                                        ##   Parent Loop BB1_4 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_6 Depth 3
	xorpd	%xmm0, %xmm0
	movq	$-1440000, %rdx         ## imm = 0xFFFFFFFFFFEA0700
	movq	%r10, %rsi
LBB1_6:                                 ##   Parent Loop BB1_4 Depth=1
                                        ##     Parent Loop BB1_5 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movapd	%xmm0, %xmm1
	movss	(%rsi), %xmm0           ## xmm0 = mem[0],zero,zero,zero
	leaq	-2880048(%rbp,%rdx), %rax
	mulss	1440000(%rax,%rcx,4), %xmm0
	addss	%xmm1, %xmm0
	addq	$4, %rsi
	addq	$2400, %rdx             ## imm = 0x960
	jne	LBB1_6
## BB#7:                                ##   in Loop: Header=BB1_5 Depth=2
	imulq	$2400, %r12, %rax       ## imm = 0x960
	leaq	-4320048(%rbp,%rax), %rax
	movss	%xmm0, (%rax,%rcx,4)
	incq	%rcx
	cmpq	$600, %rcx              ## imm = 0x258
	jne	LBB1_5
## BB#8:                                ##   in Loop: Header=BB1_4 Depth=1
	incq	%r12
	addq	$2400, %r10             ## imm = 0x960
	cmpq	$600, %r12              ## imm = 0x258
	jne	LBB1_4
## BB#9:
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
	movsd	%xmm1, -4320088(%rbp)   ## 8-byte Spill
	xorps	%xmm0, %xmm0
	cvtss2sd	-2877648(%rbp), %xmm0
	leaq	L_.str2(%rip), %rsi
	movb	$1, %al
	movq	%r15, %rdi
	callq	_fprintf
	movsd	-4320088(%rbp), %xmm0   ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	mulsd	LCPI1_2(%rip), %xmm0
	leaq	L_.str3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	cmpq	-40(%rbp), %r14
	jne	LBB1_11
## BB#10:
	xorl	%eax, %eax
	addq	$4320064, %rsp          ## imm = 0x41EB40
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_11:
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
