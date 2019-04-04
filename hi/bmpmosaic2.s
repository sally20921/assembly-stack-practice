	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
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
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, -48(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, %rax
	cqto
	idivq	-32(%rbp)
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, -64(%rbp)
	imulq	$3, -16(%rbp), %rcx
	movq	%rcx, -72(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	$4, %eax
	movl	%eax, %ecx
	movq	-72(%rbp), %rax
	cqto
	idivq	%rcx
	cmpq	$0, %rdx
	je	LBB0_3
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-72(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -72(%rbp)
	jmp	LBB0_1
LBB0_3:
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -100(%rbp)
	movl	$0, -104(%rbp)
LBB0_4:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_6 Depth 2
                                        ##       Child Loop BB0_8 Depth 3
                                        ##     Child Loop BB0_14 Depth 2
                                        ##       Child Loop BB0_16 Depth 3
	movslq	-104(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jge	LBB0_23
## %bb.5:                               ##   in Loop: Header=BB0_4 Depth=1
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -108(%rbp)
LBB0_6:                                 ##   Parent Loop BB0_4 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_8 Depth 3
	movslq	-108(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jge	LBB0_13
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=2
	movl	$0, -112(%rbp)
LBB0_8:                                 ##   Parent Loop BB0_4 Depth=1
                                        ##     Parent Loop BB0_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movslq	-112(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_11
## %bb.9:                               ##   in Loop: Header=BB0_8 Depth=3
	movq	-80(%rbp), %rax
	movzbl	(%rax), %ecx
	addl	-92(%rbp), %ecx
	movl	%ecx, -92(%rbp)
	movq	-80(%rbp), %rax
	movzbl	1(%rax), %ecx
	addl	-96(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movq	-80(%rbp), %rax
	movzbl	2(%rax), %ecx
	addl	-100(%rbp), %ecx
	movl	%ecx, -100(%rbp)
	movq	-80(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -80(%rbp)
## %bb.10:                              ##   in Loop: Header=BB0_8 Depth=3
	movl	-112(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -112(%rbp)
	jmp	LBB0_8
LBB0_11:                                ##   in Loop: Header=BB0_6 Depth=2
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-80(%rbp), %rdx
	imulq	$3, -32(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -80(%rbp)
## %bb.12:                              ##   in Loop: Header=BB0_6 Depth=2
	movl	-108(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -108(%rbp)
	jmp	LBB0_6
LBB0_13:                                ##   in Loop: Header=BB0_4 Depth=1
	movl	$0, -116(%rbp)
LBB0_14:                                ##   Parent Loop BB0_4 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_16 Depth 3
	movslq	-116(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jge	LBB0_21
## %bb.15:                              ##   in Loop: Header=BB0_14 Depth=2
	movl	$0, -120(%rbp)
LBB0_16:                                ##   Parent Loop BB0_4 Depth=1
                                        ##     Parent Loop BB0_14 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movslq	-120(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_19
## %bb.17:                              ##   in Loop: Header=BB0_16 Depth=3
	movslq	-92(%rbp), %rax
	movq	-32(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, (%rax)
	movslq	-96(%rbp), %rax
	movq	-32(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 1(%rax)
	movslq	-100(%rbp), %rax
	movq	-32(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 2(%rax)
	movq	-88(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -88(%rbp)
## %bb.18:                              ##   in Loop: Header=BB0_16 Depth=3
	movl	-120(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -120(%rbp)
	jmp	LBB0_16
LBB0_19:                                ##   in Loop: Header=BB0_14 Depth=2
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rdx
	imulq	$3, -32(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -88(%rbp)
## %bb.20:                              ##   in Loop: Header=BB0_14 Depth=2
	movl	-116(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -116(%rbp)
	jmp	LBB0_14
LBB0_21:                                ##   in Loop: Header=BB0_4 Depth=1
	imulq	$3, -32(%rbp), %rax
	addq	-8(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -100(%rbp)
## %bb.22:                              ##   in Loop: Header=BB0_4 Depth=1
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
	jmp	LBB0_4
LBB0_23:
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -124(%rbp)
LBB0_24:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_26 Depth 2
	movslq	-124(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jge	LBB0_31
## %bb.25:                              ##   in Loop: Header=BB0_24 Depth=1
	movl	$0, -128(%rbp)
LBB0_26:                                ##   Parent Loop BB0_24 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-128(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jge	LBB0_29
## %bb.27:                              ##   in Loop: Header=BB0_26 Depth=2
	movq	-80(%rbp), %rax
	movzbl	(%rax), %ecx
	addl	-92(%rbp), %ecx
	movl	%ecx, -92(%rbp)
	movq	-80(%rbp), %rax
	movzbl	1(%rax), %ecx
	addl	-96(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movq	-80(%rbp), %rax
	movzbl	2(%rax), %ecx
	addl	-100(%rbp), %ecx
	movl	%ecx, -100(%rbp)
	movq	-80(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -80(%rbp)
## %bb.28:                              ##   in Loop: Header=BB0_26 Depth=2
	movl	-128(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -128(%rbp)
	jmp	LBB0_26
LBB0_29:                                ##   in Loop: Header=BB0_24 Depth=1
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-80(%rbp), %rdx
	imulq	$3, -64(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -80(%rbp)
## %bb.30:                              ##   in Loop: Header=BB0_24 Depth=1
	movl	-124(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -124(%rbp)
	jmp	LBB0_24
LBB0_31:
	movl	$0, -132(%rbp)
LBB0_32:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_34 Depth 2
	movslq	-132(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jge	LBB0_39
## %bb.33:                              ##   in Loop: Header=BB0_32 Depth=1
	movl	$0, -136(%rbp)
LBB0_34:                                ##   Parent Loop BB0_32 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-136(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jge	LBB0_37
## %bb.35:                              ##   in Loop: Header=BB0_34 Depth=2
	movslq	-92(%rbp), %rax
	movq	-64(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, (%rax)
	movslq	-96(%rbp), %rax
	movq	-64(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 1(%rax)
	movslq	-100(%rbp), %rax
	movq	-64(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 2(%rax)
	movq	-88(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -88(%rbp)
## %bb.36:                              ##   in Loop: Header=BB0_34 Depth=2
	movl	-136(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -136(%rbp)
	jmp	LBB0_34
LBB0_37:                                ##   in Loop: Header=BB0_32 Depth=1
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rdx
	imulq	$3, -64(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -88(%rbp)
## %bb.38:                              ##   in Loop: Header=BB0_32 Depth=1
	movl	-132(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -132(%rbp)
	jmp	LBB0_32
LBB0_39:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-8(%rbp), %rdx
	imulq	$3, -32(%rbp), %rsi
	imulq	-56(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	movq	-72(%rbp), %rcx
	imulq	-48(%rbp), %rcx
	addq	%rcx, %rdx
	movq	%rdx, -8(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -100(%rbp)
	movl	$0, -140(%rbp)
LBB0_40:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_42 Depth 2
                                        ##       Child Loop BB0_44 Depth 3
                                        ##         Child Loop BB0_46 Depth 4
                                        ##       Child Loop BB0_52 Depth 3
                                        ##         Child Loop BB0_54 Depth 4
                                        ##     Child Loop BB0_62 Depth 2
                                        ##       Child Loop BB0_64 Depth 3
                                        ##     Child Loop BB0_70 Depth 2
                                        ##       Child Loop BB0_72 Depth 3
	movslq	-140(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jge	LBB0_79
## %bb.41:                              ##   in Loop: Header=BB0_40 Depth=1
	movl	$0, -144(%rbp)
LBB0_42:                                ##   Parent Loop BB0_40 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_44 Depth 3
                                        ##         Child Loop BB0_46 Depth 4
                                        ##       Child Loop BB0_52 Depth 3
                                        ##         Child Loop BB0_54 Depth 4
	movslq	-144(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jge	LBB0_61
## %bb.43:                              ##   in Loop: Header=BB0_42 Depth=2
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	$0, -148(%rbp)
LBB0_44:                                ##   Parent Loop BB0_40 Depth=1
                                        ##     Parent Loop BB0_42 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB0_46 Depth 4
	movslq	-148(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_51
## %bb.45:                              ##   in Loop: Header=BB0_44 Depth=3
	movl	$0, -152(%rbp)
LBB0_46:                                ##   Parent Loop BB0_40 Depth=1
                                        ##     Parent Loop BB0_42 Depth=2
                                        ##       Parent Loop BB0_44 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movslq	-152(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_49
## %bb.47:                              ##   in Loop: Header=BB0_46 Depth=4
	movq	-80(%rbp), %rax
	movzbl	(%rax), %ecx
	addl	-92(%rbp), %ecx
	movl	%ecx, -92(%rbp)
	movq	-80(%rbp), %rax
	movzbl	1(%rax), %ecx
	addl	-96(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movq	-80(%rbp), %rax
	movzbl	2(%rax), %ecx
	addl	-100(%rbp), %ecx
	movl	%ecx, -100(%rbp)
	movq	-80(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -80(%rbp)
## %bb.48:                              ##   in Loop: Header=BB0_46 Depth=4
	movl	-152(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -152(%rbp)
	jmp	LBB0_46
LBB0_49:                                ##   in Loop: Header=BB0_44 Depth=3
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-80(%rbp), %rdx
	imulq	$3, -32(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -80(%rbp)
## %bb.50:                              ##   in Loop: Header=BB0_44 Depth=3
	movl	-148(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
	jmp	LBB0_44
LBB0_51:                                ##   in Loop: Header=BB0_42 Depth=2
	movq	-8(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -156(%rbp)
LBB0_52:                                ##   Parent Loop BB0_40 Depth=1
                                        ##     Parent Loop BB0_42 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB0_54 Depth 4
	movslq	-156(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_59
## %bb.53:                              ##   in Loop: Header=BB0_52 Depth=3
	movl	$0, -160(%rbp)
LBB0_54:                                ##   Parent Loop BB0_40 Depth=1
                                        ##     Parent Loop BB0_42 Depth=2
                                        ##       Parent Loop BB0_52 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movslq	-160(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_57
## %bb.55:                              ##   in Loop: Header=BB0_54 Depth=4
	movslq	-92(%rbp), %rax
	movq	-32(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, (%rax)
	movslq	-96(%rbp), %rax
	movq	-32(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 1(%rax)
	movslq	-100(%rbp), %rax
	movq	-32(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 2(%rax)
	movq	-88(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -88(%rbp)
## %bb.56:                              ##   in Loop: Header=BB0_54 Depth=4
	movl	-160(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -160(%rbp)
	jmp	LBB0_54
LBB0_57:                                ##   in Loop: Header=BB0_52 Depth=3
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rdx
	imulq	$3, -32(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -88(%rbp)
## %bb.58:                              ##   in Loop: Header=BB0_52 Depth=3
	movl	-156(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -156(%rbp)
	jmp	LBB0_52
LBB0_59:                                ##   in Loop: Header=BB0_42 Depth=2
	imulq	$3, -32(%rbp), %rax
	addq	-8(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -100(%rbp)
## %bb.60:                              ##   in Loop: Header=BB0_42 Depth=2
	movl	-144(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -144(%rbp)
	jmp	LBB0_42
LBB0_61:                                ##   in Loop: Header=BB0_40 Depth=1
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	$0, -164(%rbp)
LBB0_62:                                ##   Parent Loop BB0_40 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_64 Depth 3
	movslq	-164(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_69
## %bb.63:                              ##   in Loop: Header=BB0_62 Depth=2
	movl	$0, -168(%rbp)
LBB0_64:                                ##   Parent Loop BB0_40 Depth=1
                                        ##     Parent Loop BB0_62 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movslq	-168(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jge	LBB0_67
## %bb.65:                              ##   in Loop: Header=BB0_64 Depth=3
	movq	-80(%rbp), %rax
	movzbl	(%rax), %ecx
	addl	-92(%rbp), %ecx
	movl	%ecx, -92(%rbp)
	movq	-80(%rbp), %rax
	movzbl	1(%rax), %ecx
	addl	-96(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movq	-80(%rbp), %rax
	movzbl	2(%rax), %ecx
	addl	-100(%rbp), %ecx
	movl	%ecx, -100(%rbp)
	movq	-80(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -80(%rbp)
## %bb.66:                              ##   in Loop: Header=BB0_64 Depth=3
	movl	-168(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -168(%rbp)
	jmp	LBB0_64
LBB0_67:                                ##   in Loop: Header=BB0_62 Depth=2
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-80(%rbp), %rdx
	imulq	$3, -64(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -80(%rbp)
## %bb.68:                              ##   in Loop: Header=BB0_62 Depth=2
	movl	-164(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -164(%rbp)
	jmp	LBB0_62
LBB0_69:                                ##   in Loop: Header=BB0_40 Depth=1
	movq	-8(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -172(%rbp)
LBB0_70:                                ##   Parent Loop BB0_40 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_72 Depth 3
	movslq	-172(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	LBB0_77
## %bb.71:                              ##   in Loop: Header=BB0_70 Depth=2
	movl	$0, -176(%rbp)
LBB0_72:                                ##   Parent Loop BB0_40 Depth=1
                                        ##     Parent Loop BB0_70 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movslq	-176(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jge	LBB0_75
## %bb.73:                              ##   in Loop: Header=BB0_72 Depth=3
	movslq	-92(%rbp), %rax
	movq	-64(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, (%rax)
	movslq	-96(%rbp), %rax
	movq	-64(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 1(%rax)
	movslq	-100(%rbp), %rax
	movq	-64(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	cqto
	idivq	%rcx
	movb	%al, %sil
	movq	-88(%rbp), %rax
	movb	%sil, 2(%rax)
	movq	-88(%rbp), %rax
	addq	$3, %rax
	movq	%rax, -88(%rbp)
## %bb.74:                              ##   in Loop: Header=BB0_72 Depth=3
	movl	-176(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -176(%rbp)
	jmp	LBB0_72
LBB0_75:                                ##   in Loop: Header=BB0_70 Depth=2
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rdx
	imulq	$3, -64(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	addq	-72(%rbp), %rdx
	movq	%rdx, -88(%rbp)
## %bb.76:                              ##   in Loop: Header=BB0_70 Depth=2
	movl	-172(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -172(%rbp)
	jmp	LBB0_70
LBB0_77:                                ##   in Loop: Header=BB0_40 Depth=1
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-8(%rbp), %rdx
	imulq	$3, -32(%rbp), %rsi
	imulq	-56(%rbp), %rsi
	subq	%rsi, %rcx
	addq	%rcx, %rdx
	movq	-72(%rbp), %rcx
	imulq	-32(%rbp), %rcx
	addq	%rcx, %rdx
	movq	%rdx, -8(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -100(%rbp)
## %bb.78:                              ##   in Loop: Header=BB0_40 Depth=1
	movl	-140(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -140(%rbp)
	jmp	LBB0_40
LBB0_79:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
