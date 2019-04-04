	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_CalculatingSquare      ## -- Begin function CalculatingSquare
	.p2align	4, 0x90
_CalculatingSquare:                     ## @CalculatingSquare
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_pointer@GOTPCREL(%rip), %rax
	movq	_sum3@GOTPCREL(%rip), %rcx
	movq	_sum2@GOTPCREL(%rip), %r8
	movq	_sum1@GOTPCREL(%rip), %r9
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, (%r9)
	movl	$0, (%r8)
	movl	$0, (%rcx)
	movq	-8(%rbp), %rcx
	movq	%rcx, (%rax)
	movl	$0, -28(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	movslq	-28(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jge	LBB0_8
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, -32(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jge	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	movq	_sum3@GOTPCREL(%rip), %rax
	movq	_sum2@GOTPCREL(%rip), %rcx
	movq	_sum1@GOTPCREL(%rip), %rdx
	movq	-8(%rbp), %rsi
	movzbl	(%rsi), %edi
	addl	(%rdx), %edi
	movl	%edi, (%rdx)
	movq	-8(%rbp), %rdx
	movzbl	1(%rdx), %edi
	addl	(%rcx), %edi
	movl	%edi, (%rcx)
	movq	-8(%rbp), %rcx
	movzbl	2(%rcx), %edi
	addl	(%rax), %edi
	movl	%edi, (%rax)
	movq	-8(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -8(%rbp)
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=2
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	movq	_real_width@GOTPCREL(%rip), %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	-8(%rbp), %rsi
	imulq	$3, -16(%rbp), %rdi
	subq	%rdi, %rdx
	addq	%rdx, %rsi
	addq	(%rax), %rsi
	movq	%rsi, -8(%rbp)
## %bb.7:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_1
LBB0_8:
	movl	$0, -36(%rbp)
LBB0_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_11 Depth 2
	movslq	-36(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jge	LBB0_16
## %bb.10:                              ##   in Loop: Header=BB0_9 Depth=1
	movl	$0, -40(%rbp)
LBB0_11:                                ##   Parent Loop BB0_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-40(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jge	LBB0_14
## %bb.12:                              ##   in Loop: Header=BB0_11 Depth=2
	movq	_pointer@GOTPCREL(%rip), %rax
	movq	_sum3@GOTPCREL(%rip), %rcx
	movq	_sum2@GOTPCREL(%rip), %rdx
	movq	_sum1@GOTPCREL(%rip), %rsi
	movslq	(%rsi), %rsi
	movq	-16(%rbp), %rdi
	imulq	-24(%rbp), %rdi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rsi, %rax
	movq	%rdx, -56(%rbp)         ## 8-byte Spill
	cqto
	idivq	%rdi
	movb	%al, %r8b
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rsi
	movb	%r8b, (%rsi)
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movslq	(%rsi), %rax
	movq	-16(%rbp), %rdi
	imulq	-24(%rbp), %rdi
	cqto
	idivq	%rdi
	movb	%al, %r8b
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	movb	%r8b, 1(%rdi)
	movslq	(%rcx), %rax
	movq	-16(%rbp), %rcx
	imulq	-24(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %r8b
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movb	%r8b, 2(%rcx)
	movq	(%rax), %rcx
	addq	$3, %rcx
	movq	%rcx, (%rax)
## %bb.13:                              ##   in Loop: Header=BB0_11 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB0_11
LBB0_14:                                ##   in Loop: Header=BB0_9 Depth=1
	movq	_pointer@GOTPCREL(%rip), %rax
	movq	_real_width@GOTPCREL(%rip), %rcx
	xorl	%edx, %edx
	movl	%edx, %esi
	movq	(%rax), %rdi
	imulq	$3, -16(%rbp), %r8
	subq	%r8, %rsi
	addq	%rsi, %rdi
	addq	(%rcx), %rdi
	movq	%rdi, (%rax)
## %bb.15:                              ##   in Loop: Header=BB0_9 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_9
LBB0_16:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bmp_mosaic             ## -- Begin function bmp_mosaic
	.p2align	4, 0x90
_bmp_mosaic:                            ## @bmp_mosaic
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	_real_width@GOTPCREL(%rip), %rax
	movq	_remaining_width@GOTPCREL(%rip), %r8
	movq	_numbers_width@GOTPCREL(%rip), %r9
	movq	_remaining_height@GOTPCREL(%rip), %r10
	movq	_numbers_height@GOTPCREL(%rip), %r11
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rcx, %rax
	cqto
	idivq	-32(%rbp)
	movq	%rax, (%r11)
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, (%r10)
	movq	-16(%rbp), %rcx
	movq	%rcx, %rax
	cqto
	idivq	-32(%rbp)
	movq	%rax, (%r9)
	movq	-16(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, (%r8)
	imulq	$3, -16(%rbp), %rcx
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movq	%rcx, (%rdx)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	$4, %eax
	movl	%eax, %ecx
	movq	_real_width@GOTPCREL(%rip), %rdx
	movq	(%rdx), %rax
	cqto
	idivq	%rcx
	cmpq	$0, %rdx
	je	LBB1_3
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	_real_width@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	addq	$1, %rcx
	movq	%rcx, (%rax)
	jmp	LBB1_1
LBB1_3:
	movl	$0, -36(%rbp)
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	_numbers_width@GOTPCREL(%rip), %rax
	movslq	-36(%rbp), %rcx
	cmpq	(%rax), %rcx
	jge	LBB1_7
## %bb.5:                               ##   in Loop: Header=BB1_4 Depth=1
	movq	_remaining_height@GOTPCREL(%rip), %rax
	movq	-8(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	(%rax), %rdx
	callq	_CalculatingSquare
	imulq	$3, -32(%rbp), %rax
	addq	-8(%rbp), %rax
	movq	%rax, -8(%rbp)
## %bb.6:                               ##   in Loop: Header=BB1_4 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB1_4
LBB1_7:
	movq	_remaining_height@GOTPCREL(%rip), %rax
	movq	_remaining_width@GOTPCREL(%rip), %rcx
	movq	-8(%rbp), %rdi
	movq	(%rcx), %rsi
	movq	(%rax), %rdx
	callq	_CalculatingSquare
	movq	_remaining_height@GOTPCREL(%rip), %rax
	movq	_real_width@GOTPCREL(%rip), %rcx
	xorl	%r8d, %r8d
	movl	%r8d, %edx
	movq	_numbers_width@GOTPCREL(%rip), %rsi
	movq	-8(%rbp), %rdi
	imulq	$3, -32(%rbp), %r9
	imulq	(%rsi), %r9
	subq	%r9, %rdx
	addq	%rdx, %rdi
	movq	(%rcx), %rcx
	imulq	(%rax), %rcx
	addq	%rcx, %rdi
	movq	%rdi, -8(%rbp)
	movl	$0, -40(%rbp)
LBB1_8:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_10 Depth 2
	movq	_numbers_height@GOTPCREL(%rip), %rax
	movslq	-40(%rbp), %rcx
	cmpq	(%rax), %rcx
	jge	LBB1_15
## %bb.9:                               ##   in Loop: Header=BB1_8 Depth=1
	movl	$0, -44(%rbp)
LBB1_10:                                ##   Parent Loop BB1_8 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_numbers_width@GOTPCREL(%rip), %rax
	movslq	-44(%rbp), %rcx
	cmpq	(%rax), %rcx
	jge	LBB1_13
## %bb.11:                              ##   in Loop: Header=BB1_10 Depth=2
	movq	-8(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-32(%rbp), %rdx
	callq	_CalculatingSquare
	imulq	$3, -32(%rbp), %rdx
	addq	-8(%rbp), %rdx
	movq	%rdx, -8(%rbp)
## %bb.12:                              ##   in Loop: Header=BB1_10 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB1_10
LBB1_13:                                ##   in Loop: Header=BB1_8 Depth=1
	movq	_remaining_width@GOTPCREL(%rip), %rax
	movq	-8(%rbp), %rdi
	movq	(%rax), %rsi
	movq	-32(%rbp), %rdx
	callq	_CalculatingSquare
	movq	_real_width@GOTPCREL(%rip), %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movq	_numbers_width@GOTPCREL(%rip), %rsi
	movq	-8(%rbp), %rdi
	imulq	$3, -32(%rbp), %r8
	imulq	(%rsi), %r8
	subq	%r8, %rdx
	addq	%rdx, %rdi
	movq	(%rax), %rax
	imulq	-32(%rbp), %rax
	addq	%rax, %rdi
	movq	%rdi, -8(%rbp)
## %bb.14:                              ##   in Loop: Header=BB1_8 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB1_8
LBB1_15:
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.comm	_sum1,4,2               ## @sum1
	.comm	_sum2,4,2               ## @sum2
	.comm	_sum3,4,2               ## @sum3
	.comm	_pointer,8,3            ## @pointer
	.comm	_real_width,8,3         ## @real_width
	.comm	_numbers_height,8,3     ## @numbers_height
	.comm	_remaining_height,8,3   ## @remaining_height
	.comm	_numbers_width,8,3      ## @numbers_width
	.comm	_remaining_width,8,3    ## @remaining_width

.subsections_via_symbols
