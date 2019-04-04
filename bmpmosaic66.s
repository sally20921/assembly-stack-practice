CalculatingSquare:
    pushq   %rbp
    movq    %rsp, %rbp
    movq    %rdi, -24(%rbp)
    movq    %rsi, -32(%rbp)
    movq    %rdx, -40(%rbp)
    movl    $0, sum1(%rip)
    movl    $0, sum2(%rip)
    movl    $0, sum3(%rip)
movq    -24(%rbp), %rax
movq    %rax, pointer(%rip)
movl    $0, -4(%rbp)
jmp     .L2
.L5:
movl    $0, -8(%rbp)
jmp     .L3
.L4:
movq    -24(%rbp), %rax
movzbl  (%rax), %eax
movzbl  %al, %edx
movl    sum1(%rip), %eax
addl    %edx, %eax
movl    %eax, sum1(%rip)
movq    -24(%rbp), %rax
addq    $1, %rax
movzbl  (%rax), %eax
movzbl  %al, %edx
movl    sum2(%rip), %eax
addl    %edx, %eax
movl    %eax, sum2(%rip)
movq    -24(%rbp), %rax
addq    $2, %rax
movzbl  (%rax), %eax
movzbl  %al, %edx
movl    sum3(%rip), %eax
addl    %edx, %eax
movl    %eax, sum3(%rip)
addq    $3, -24(%rbp)
addl    $1, -8(%rbp)
.L3:
movl    -8(%rbp), %eax
cltq
cmpq    %rax, -32(%rbp)
jg      .L4
movq    real_width(%rip), %rax
movq    %rax, %rcx
movq    -32(%rbp), %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
subq    %rax, %rcx
movq    %rcx, %rax
addq    %rax, -24(%rbp)
addl    $1, -4(%rbp)
.L2:
movl    -4(%rbp), %eax
cltq
cmpq    %rax, -40(%rbp)
jg      .L5
movl    $0, -12(%rbp)
jmp     .L6
.L9:
movl    $0, -16(%rbp)
jmp     .L7
.L8:
movl    sum1(%rip), %eax
cltq
movq    -32(%rbp), %rdx
movq    %rdx, %rdi
imulq   -40(%rbp), %rdi
cqto
idivq   %rdi
movq    %rax, %rdx
movq    pointer(%rip), %rax
movb    %dl, (%rax)
movl    sum2(%rip), %eax
cltq
movq    -32(%rbp), %rdx
movq    %rdx, %rdi
imulq   -40(%rbp), %rdi
cqto
idivq   %rdi
movq    %rax, %rdx
movq    pointer(%rip), %rax
addq    $1, %rax
movb    %dl, (%rax)
movl    sum3(%rip), %eax
cltq
movq    -32(%rbp), %rdx
movq    %rdx, %rdi
imulq   -40(%rbp), %rdi
cqto
idivq   %rdi
movq    %rax, %rdx
movq    pointer(%rip), %rax
addq    $2, %rax
movb    %dl, (%rax)
movq    pointer(%rip), %rax
addq    $3, %rax
movq    %rax, pointer(%rip)
addl    $1, -16(%rbp)
.L7:
movl    -16(%rbp), %eax
cltq
cmpq    %rax, -32(%rbp)
jg      .L8
movq    pointer(%rip), %rcx
movq    real_width(%rip), %rax
movq    %rax, %rsi
movq    -32(%rbp), %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
subq    %rax, %rsi
movq    %rsi, %rax
addq    %rcx, %rax
movq    %rax, pointer(%rip)
addl    $1, -12(%rbp)
.L6:
movl    -12(%rbp), %eax
cltq
cmpq    %rax, -40(%rbp)
jg      .L9
nop
popq    %rbp
ret
bmp_mosaic:
pushq   %rbp
movq    %rsp, %rbp
subq    $48, %rsp
movq    %rdi, -24(%rbp)
movq    %rsi, -32(%rbp)
movq    %rdx, -40(%rbp)
movq    %rcx, -48(%rbp)
movq    -40(%rbp), %rax
cqto
idivq   -48(%rbp)
movq    %rax, numbers_height(%rip)
movq    -40(%rbp), %rax
cqto
idivq   -48(%rbp)
movq    %rdx, %rax
movq    %rax, remaining_height(%rip)
movq    -32(%rbp), %rax
cqto
idivq   -48(%rbp)
movq    %rax, numbers_width(%rip)
movq    -32(%rbp), %rax
cqto
idivq   -48(%rbp)
movq    %rdx, %rax
movq    %rax, remaining_width(%rip)
movq    -32(%rbp), %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
movq    %rax, real_width(%rip)
jmp     .L11
.L12:
movq    real_width(%rip), %rax
addq    $1, %rax
movq    %rax, real_width(%rip)
.L11:
movq    real_width(%rip), %rax
andl    $3, %eax
testq   %rax, %rax
jne     .L12
movl    $0, -4(%rbp)
jmp     .L13
.L14:
movq    remaining_height(%rip), %rdx
movq    -48(%rbp), %rcx
movq    -24(%rbp), %rax
movq    %rcx, %rsi
movq    %rax, %rdi
call    CalculatingSquare
movq    -48(%rbp), %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
addq    %rax, -24(%rbp)
addl    $1, -4(%rbp)
.L13:
movl    -4(%rbp), %eax
movslq  %eax, %rdx
movq    numbers_width(%rip), %rax
cmpq    %rax, %rdx
jl      .L14
movq    remaining_height(%rip), %rdx
movq    remaining_width(%rip), %rcx
movq    -24(%rbp), %rax
movq    %rcx, %rsi
movq    %rax, %rdi
call    CalculatingSquare
movq    real_width(%rip), %rdx
movq    remaining_height(%rip), %rax
imulq   %rdx, %rax
movq    %rax, %rcx
movq    numbers_width(%rip), %rax
imulq   -48(%rbp), %rax
movq    %rax, %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
subq    %rax, %rcx
movq    %rcx, %rax
addq    %rax, -24(%rbp)
movl    $0, -8(%rbp)
jmp     .L15
.L18:
movl    $0, -12(%rbp)
jmp     .L16
.L17:
movq    -48(%rbp), %rdx
movq    -48(%rbp), %rcx
movq    -24(%rbp), %rax
movq    %rcx, %rsi
movq    %rax, %rdi
call    CalculatingSquare
movq    -48(%rbp), %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
addq    %rax, -24(%rbp)
addl    $1, -12(%rbp)
.L16:
movl    -12(%rbp), %eax
movslq  %eax, %rdx
movq    numbers_width(%rip), %rax
cmpq    %rax, %rdx
jl      .L17
movq    remaining_width(%rip), %rcx
movq    -48(%rbp), %rdx
movq    -24(%rbp), %rax
movq    %rcx, %rsi
movq    %rax, %rdi
call    CalculatingSquare
movq    real_width(%rip), %rax
imulq   -48(%rbp), %rax
movq    %rax, %rcx
movq    numbers_width(%rip), %rax
imulq   -48(%rbp), %rax
movq    %rax, %rdx
movq    %rdx, %rax
addq    %rax, %rax
addq    %rdx, %rax
subq    %rax, %rcx
movq    %rcx, %rax
addq    %rax, -24(%rbp)
addl    $1, -8(%rbp)
.L15:
movl    -8(%rbp), %eax
movslq  %eax, %rdx
movq    numbers_height(%rip), %rax
cmpq    %rax, %rdx
jl      .L18
nop
leave
ret
