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
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movss	-4(%rbp), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	mulss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rdi
	movss	%xmm0, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI1_0:
	.quad	4696837146684686336     ## double 1.0E+6
LCPI1_1:
	.quad	4611911198408756429     ## double 2.1000000000000001
LCPI1_2:
	.quad	4607632778762754458     ## double 1.1000000000000001
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
	subq	$4320112, %rsp          ## imm = 0x41EB70
	leaq	L_.str(%rip), %rdi
	leaq	L_.str1(%rip), %rsi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -4320020(%rbp)
	callq	_fopen
	leaq	-4320040(%rbp), %rdi
	xorl	%ecx, %ecx
	movl	%ecx, %esi
	movq	%rax, -4320096(%rbp)
	callq	_gettimeofday
	movl	$0, -4320068(%rbp)
	movl	%eax, -4320100(%rbp)    ## 4-byte Spill
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	cmpl	$600, -4320068(%rbp)    ## imm = 0x258
	jge	LBB1_8
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	$0, -4320072(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$600, -4320072(%rbp)    ## imm = 0x258
	jge	LBB1_6
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=2
	leaq	-2880016(%rbp), %rax
	movsd	LCPI1_1(%rip), %xmm0    ## xmm0 = mem[0],zero
	leaq	-1440016(%rbp), %rcx
	movsd	LCPI1_2(%rip), %xmm1    ## xmm1 = mem[0],zero
	movl	-4320068(%rbp), %edx
	addl	-4320072(%rbp), %edx
	cvtsi2sdl	%edx, %xmm2
	cvtsi2sdl	-4320072(%rbp), %xmm3
	addsd	%xmm1, %xmm3
	divsd	%xmm3, %xmm2
	cvtsd2ss	%xmm2, %xmm1
	movslq	-4320072(%rbp), %rsi
	movslq	-4320068(%rbp), %rdi
	imulq	$2400, %rdi, %rdi       ## imm = 0x960
	addq	%rdi, %rcx
	movss	%xmm1, (%rcx,%rsi,4)
	movl	-4320068(%rbp), %edx
	subl	-4320072(%rbp), %edx
	cvtsi2sdl	%edx, %xmm1
	cvtsi2sdl	-4320072(%rbp), %xmm2
	addsd	%xmm0, %xmm2
	divsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movslq	-4320072(%rbp), %rcx
	movslq	-4320068(%rbp), %rsi
	imulq	$2400, %rsi, %rsi       ## imm = 0x960
	addq	%rsi, %rax
	movss	%xmm0, (%rax,%rcx,4)
## BB#5:                                ##   in Loop: Header=BB1_3 Depth=2
	movl	-4320072(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4320072(%rbp)
	jmp	LBB1_3
LBB1_6:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_7
LBB1_7:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-4320068(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4320068(%rbp)
	jmp	LBB1_1
LBB1_8:
	movl	$0, -4320068(%rbp)
LBB1_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_11 Depth 2
                                        ##       Child Loop BB1_13 Depth 3
	cmpl	$600, -4320068(%rbp)    ## imm = 0x258
	jge	LBB1_20
## BB#10:                               ##   in Loop: Header=BB1_9 Depth=1
	movl	$0, -4320072(%rbp)
LBB1_11:                                ##   Parent Loop BB1_9 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_13 Depth 3
	cmpl	$600, -4320072(%rbp)    ## imm = 0x258
	jge	LBB1_18
## BB#12:                               ##   in Loop: Header=BB1_11 Depth=2
	xorps	%xmm0, %xmm0
	movss	%xmm0, -4320080(%rbp)
	movl	$0, -4320076(%rbp)
LBB1_13:                                ##   Parent Loop BB1_9 Depth=1
                                        ##     Parent Loop BB1_11 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	$600, -4320076(%rbp)    ## imm = 0x258
	jge	LBB1_16
## BB#14:                               ##   in Loop: Header=BB1_13 Depth=3
	leaq	-4320084(%rbp), %rdi
	leaq	-2880016(%rbp), %rax
	leaq	-1440016(%rbp), %rcx
	movslq	-4320076(%rbp), %rdx
	movslq	-4320068(%rbp), %rsi
	imulq	$2400, %rsi, %rsi       ## imm = 0x960
	addq	%rsi, %rcx
	movss	(%rcx,%rdx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movslq	-4320072(%rbp), %rcx
	movslq	-4320076(%rbp), %rdx
	imulq	$2400, %rdx, %rdx       ## imm = 0x960
	addq	%rdx, %rax
	movss	(%rax,%rcx,4), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	callq	_producto
	movss	-4320084(%rbp), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	addss	-4320080(%rbp), %xmm0
	movss	%xmm0, -4320080(%rbp)
## BB#15:                               ##   in Loop: Header=BB1_13 Depth=3
	movl	-4320076(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4320076(%rbp)
	jmp	LBB1_13
LBB1_16:                                ##   in Loop: Header=BB1_11 Depth=2
	leaq	-4320016(%rbp), %rax
	movss	-4320080(%rbp), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movslq	-4320072(%rbp), %rcx
	movslq	-4320068(%rbp), %rdx
	imulq	$2400, %rdx, %rdx       ## imm = 0x960
	addq	%rdx, %rax
	movss	%xmm0, (%rax,%rcx,4)
## BB#17:                               ##   in Loop: Header=BB1_11 Depth=2
	movl	-4320072(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4320072(%rbp)
	jmp	LBB1_11
LBB1_18:                                ##   in Loop: Header=BB1_9 Depth=1
	jmp	LBB1_19
LBB1_19:                                ##   in Loop: Header=BB1_9 Depth=1
	movl	-4320068(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4320068(%rbp)
	jmp	LBB1_9
LBB1_20:
	leaq	-4320056(%rbp), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	_gettimeofday
	leaq	L_.str2(%rip), %rsi
	leaq	-4320016(%rbp), %rdi
	movsd	LCPI1_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	-4320056(%rbp), %rcx
	subq	-4320040(%rbp), %rcx
	cvtsi2sdq	%rcx, %xmm1
	movl	-4320048(%rbp), %edx
	subl	-4320032(%rbp), %edx
	cvtsi2sdl	%edx, %xmm2
	divsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, -4320064(%rbp)
	movq	-4320096(%rbp), %rcx
	movslq	-4320072(%rbp), %r8
	movslq	-4320068(%rbp), %r9
	imulq	$2400, %r9, %r9         ## imm = 0x960
	addq	%r9, %rdi
	cvtss2sd	(%rdi,%r8,4), %xmm0
	movq	%rcx, %rdi
	movl	%eax, -4320104(%rbp)    ## 4-byte Spill
	movb	$1, %al
	callq	_fprintf
	leaq	L_.str3(%rip), %rdi
	movsd	LCPI1_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	mulsd	-4320064(%rbp), %xmm0
	movl	%eax, -4320108(%rbp)    ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-8(%rbp), %rcx
	movl	%eax, -4320112(%rbp)    ## 4-byte Spill
	jne	LBB1_22
## BB#21:                               ## %SP_return
	xorl	%eax, %eax
	addq	$4320112, %rsp          ## imm = 0x41EB70
	popq	%rbp
	retq
LBB1_22:                                ## %CallStackCheckFailBlk
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
