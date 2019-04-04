.section    __TEXT,__text,regular,pure_instructions
.macosx_version_min 10, 13
.globl    _CalculatingSquare      ## -- Begin function CalculatingSquare
.p2align    4, 0x90
_CalculatingSquare:                     ## @CalculatingSquare
.cfi_startproc
## %bb.0:
pushq    %rbp
.cfi_def_cfa_offset 16
.cfi_offset %rbp, -16
movq    %rsp, %rbp
.cfi_def_cfa_register %rbp
pushq    %r15
pushq    %r14
pushq    %r13
pushq    %r12
pushq    %rbx
.cfi_offset %rbx, -56
.cfi_offset %r12, -48
.cfi_offset %r13, -40
.cfi_offset %r14, -32
.cfi_offset %r15, -24
movq    %rdx, %r8
movq    _sum1@GOTPCREL(%rip), %r9
movl    $0, (%r9)
movq    _sum2@GOTPCREL(%rip), %r10
movl    $0, (%r10)
movq    _sum3@GOTPCREL(%rip), %r11
movl    $0, (%r11)
movq    _pointer@GOTPCREL(%rip), %rcx
movq    %rdi, (%rcx)
testq    %r8, %r8
jle    LBB0_10
## %bb.1:
leaq    (%rsi,%rsi,2), %r12
movq    %r12, %r15
negq    %r15
xorl    %r13d, %r13d
movq    _real_width@GOTPCREL(%rip), %r14
.p2align    4, 0x90
LBB0_2:                                 ## =>This Loop Header: Depth=1
##     Child Loop BB0_3 Depth 2
movq    %rsi, %rbx
movq    %rdi, %rax
testq    %rsi, %rsi
jle    LBB0_5
.p2align    4, 0x90
LBB0_3:                                 ##   Parent Loop BB0_2 Depth=1
## =>  This Inner Loop Header: Depth=2
movzbl    (%rax), %edx
addl    %edx, (%r9)
movzbl    1(%rax), %edx
addl    %edx, (%r10)
movzbl    2(%rax), %edx
addl    %edx, (%r11)
addq    $3, %rax
decq    %rbx
jne    LBB0_3
## %bb.4:                               ##   in Loop: Header=BB0_2 Depth=1
addq    %r12, %rdi
LBB0_5:                                 ##   in Loop: Header=BB0_2 Depth=1
addq    %r15, %rdi
addq    (%r14), %rdi
incq    %r13
cmpq    %r8, %r13
jne    LBB0_2
## %bb.6:
testq    %r8, %r8
jle    LBB0_10
## %bb.7:
movq    %r8, %rdi
imulq    %rsi, %rdi
xorl    %r12d, %r12d
.p2align    4, 0x90
LBB0_8:                                 ## =>This Loop Header: Depth=1
##     Child Loop BB0_11 Depth 2
movq    %rsi, %rbx
testq    %rsi, %rsi
jle    LBB0_9
.p2align    4, 0x90
LBB0_11:                                ##   Parent Loop BB0_8 Depth=1
## =>  This Inner Loop Header: Depth=2
movslq    (%r9), %rax
cqto
idivq    %rdi
movq    (%rcx), %rdx
movb    %al, (%rdx)
movslq    (%r10), %rax
cqto
idivq    %rdi
movq    (%rcx), %rdx
movb    %al, 1(%rdx)
movslq    (%r11), %rax
cqto
idivq    %rdi
movq    (%rcx), %rdx
movb    %al, 2(%rdx)
addq    $3, (%rcx)
decq    %rbx
jne    LBB0_11
LBB0_9:                                 ##   in Loop: Header=BB0_8 Depth=1
movq    (%rcx), %rax
addq    %r15, %rax
addq    (%r14), %rax
movq    %rax, (%rcx)
incq    %r12
cmpq    %r8, %r12
jne    LBB0_8
LBB0_10:
popq    %rbx
popq    %r12
popq    %r13
popq    %r14
popq    %r15
popq    %rbp
retq
.cfi_endproc
## -- End function
.globl    _bmp_mosaic             ## -- Begin function bmp_mosaic
.p2align    4, 0x90
_bmp_mosaic:                            ## @bmp_mosaic
.cfi_startproc
## %bb.0:
pushq    %rbp
.cfi_def_cfa_offset 16
.cfi_offset %rbp, -16
movq    %rsp, %rbp
.cfi_def_cfa_register %rbp
pushq    %r15
pushq    %r14
pushq    %r13
pushq    %r12
pushq    %rbx
subq    $56, %rsp
.cfi_offset %rbx, -56
.cfi_offset %r12, -48
.cfi_offset %r13, -40
.cfi_offset %r14, -32
.cfi_offset %r15, -24
movq    %rcx, %rbx
movq    %rdx, %r12
movq    %rdx, -32(%rbp)
movq    %rdi, %r14
movq    %rdi, -16(%rbp)
leaq    (%rsi,%rsi,2), %rax
movq    _real_width@GOTPCREL(%rip), %rcx
movq    %rax, (%rcx)
testb    $3, %al
je    LBB1_4
## %bb.1:
movq    _real_width@GOTPCREL(%rip), %rax
movq    (%rax), %rax
testb    $3, %al
je    LBB1_4
.p2align    4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
incq    %rax
testb    $3, %al
jne    LBB1_2
## %bb.3:
movq    _real_width@GOTPCREL(%rip), %rcx
movq    %rax, (%rcx)
LBB1_4:
movq    %rsi, %rax
cqto
idivq    %rbx
movq    %rdx, -72(%rbp)         ## 8-byte Spill
testq    %rax, %rax
movq    %rax, -64(%rbp)         ## 8-byte Spill
jle    LBB1_8
## %bb.5:
movq    %r14, %r13
leaq    (%rbx,%rbx,2), %r14
movq    %rax, %rcx
imulq    %rbx, %rcx
leaq    (%rcx,%rcx,2), %rcx
movq    %rcx, -56(%rbp)         ## 8-byte Spill
movq    %rax, %r15
movq    %r13, -48(%rbp)         ## 8-byte Spill
.p2align    4, 0x90
LBB1_6:                                 ## =>This Inner Loop Header: Depth=1
movq    %r12, %rax
cqto
idivq    %rbx
movq    %r13, %rdi
movq    %rbx, %rsi
callq    _CalculatingSquare
addq    %r14, %r13
decq    %r15
jne    LBB1_6
## %bb.7:
movq    -48(%rbp), %r14         ## 8-byte Reload
addq    -56(%rbp), %r14         ## 8-byte Folded Reload
LBB1_8:
movq    %r12, %rax
cqto
idivq    %rbx
movq    %rdx, %r13
movq    %rax, %r15
movq    %r14, %rdi
movq    -72(%rbp), %rsi         ## 8-byte Reload
callq    _CalculatingSquare
movq    %r15, -56(%rbp)         ## 8-byte Spill
testq    %r15, %r15
movq    -64(%rbp), %rcx         ## 8-byte Reload
jle    LBB1_14
## %bb.9:
leaq    (%rbx,%rbx,2), %r12
movq    %rbx, %rax
imulq    %rcx, %rax
leaq    (%rax,%rax,2), %rax
movq    %rax, -80(%rbp)         ## 8-byte Spill
negq    %rax
movq    %rax, -88(%rbp)         ## 8-byte Spill
addq    %rax, %r14
movq    _real_width@GOTPCREL(%rip), %rax
imulq    (%rax), %r13
addq    %r14, %r13
xorl    %r14d, %r14d
.p2align    4, 0x90
LBB1_10:                                ## =>This Loop Header: Depth=1
##     Child Loop BB1_11 Depth 2
movq    %r14, -48(%rbp)         ## 8-byte Spill
movq    %rcx, %r15
movq    %r13, %r14
testq    %rcx, %rcx
jle    LBB1_13
.p2align    4, 0x90
LBB1_11:                                ##   Parent Loop BB1_10 Depth=1
## =>  This Inner Loop Header: Depth=2
movq    %r14, %rdi
movq    %rbx, %rsi
movq    %rbx, %rdx
callq    _CalculatingSquare
addq    %r12, %r14
decq    %r15
jne    LBB1_11
## %bb.12:                              ##   in Loop: Header=BB1_10 Depth=1
addq    -80(%rbp), %r13         ## 8-byte Folded Reload
LBB1_13:                                ##   in Loop: Header=BB1_10 Depth=1
movq    -48(%rbp), %r14         ## 8-byte Reload
movq    %r13, %rdi
movq    -72(%rbp), %rsi         ## 8-byte Reload
movq    %rbx, %rdx
callq    _CalculatingSquare
addq    -88(%rbp), %r13         ## 8-byte Folded Reload
movq    _real_width@GOTPCREL(%rip), %rax
movq    (%rax), %rax
imulq    %rbx, %rax
addq    %rax, %r13
incq    %r14
cmpq    -56(%rbp), %r14         ## 8-byte Folded Reload
movq    -64(%rbp), %rcx         ## 8-byte Reload
jne    LBB1_10
LBB1_14:
addq    $56, %rsp
popq    %rbx
popq    %r12
popq    %r13
popq    %r14
popq    %r15
popq    %rbp
retq
.cfi_endproc
## -- End function
.comm    _sum1,4,2               ## @sum1
.comm    _sum2,4,2               ## @sum2
.comm    _sum3,4,2               ## @sum3
.comm    _pointer,8,3            ## @pointer
.comm    _real_width,8,3         ## @real_width

.subsections_via_symbols

