#--------------------------------------------------------------
#
#  4190.308 Computer Architecture (Fall 2018)
#
#  Project #3: Image Pixelization
#
#  November 6, 2018
#
#  Jin-Soo Kim (jinsoo.kim@snu.ac.kr)
#  Systems Software & Architecture Laboratory
#  Dept. of Computer Science and Engineering
#  Seoul National University
#  http://csl.snu.ac.kr
#
#--------------------------------------------------------------

.text
.align 4
.globl bmp_mosaic
.type bmp_mosaic,@function

bmp_mosaic:

#------------------------------------------------------------
# Use %rax, %rbx, %rcx, %rdx, %rsi, and %rdi registers only
#    imgptr is in %rdi
#    width  is in %rsi
#    height is in %rdx
#    size   is in %rcx
#------------------------------------------------------------


# --> FILL HERE <--
    movq %rdi, -96(%rsp) //imgptr
    movq %rsi, -104(%rsp) //width
    movq %rdx, -112(%rsp) //height
    movq %rcx, -64(%rsp)  //size
    movq -112(%rsp), %rax //height
    cqto
    idivq -64(%rsp)
    movq %rax, -64(%rsp)
    movq -112(%rsp), %rax
    cqto
    idivq -64(%rsp)
    movq %rdx, -72(%rsp)
    movq -104(%rsp), %rax
    cqto
    idivq -64(%rsp)
    movq %rax, -80(%rsp)
    movq -104(%rsp), %rax
    cqto
    idivq -64(%rsp)
    movq %rdx, -88(%rsp)
    movq -104(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    movq %rax, 48(%rsp)
    jmp .L2
.L3:
    addq $1, 48(%rsp)
.L2:
    movq 48(%rsp), %rax
    andl $3, %rax
    testq %rax, %rax
    jne .L3
    movq -96(%rsp), %rax
    movq %rax, 40(%rsp)
    movq -96(%rsp), %rax
    movq %rax, 32(%rsp)
    movl $0, 28(%rsp)
    movl $0, 24(%rsp)
    movl $0, 20(%rsp)
    movl $0, 16(%rsp)
    jmp .L4
.L13:
    movq -96(%rsp), %rax
    movq %rax, 40(%rsp)
    movq -96(%rsp), %rax
    movq %rax, 32(%rsp)
    movl $0, 12(%rsp)
    jmp .L5
.L8:
    movl $0, 8(%rsp)
    jmp .L6
.L7:
    movq 40(%rsp), %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 28(%rsp)
    movq 40(%rsp), %rax
    addq $1, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 24(%rsp)
    movq 40(%rsp), %rax
    addq $2, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 20(%rsp)
    addq $3, 40(%rsp)
    addl $1, 8(%rsp)
.L6:
    movl 8(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L7
    movq 48(%rsp), %rcx
    movq -64(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 40(%rsp)
    addl $1, 12(%rsp)
.L5:
    movl 12(%rsp), %rax
    cltq
    cmpq %rax, -72(%rsp)
    jg .L8
    movl $0, 4(%rsp)
    jmp .L9
.L12:
    movl $0, 16(%rsp)
    jmp .L10
.L11:
    movl 28(%rsp), %rax
    cltq
    movq -64(%rsp), %rdx
    movq %rdx, %rsi
    imulq -72(%rsp), %rsi
    cqto
    idivq %rsi
    movl %rax, %edx
    movq 32(%rsp), %rax
    movb %dl, (%rax)
    movl 24(%rsp), %rax
    cltq
    movq -64(%rsp), %rdx
    movq %rdx, %rdi
    imulq -72(%rsp), %rdi
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movl 20(%rsp), %rax
    cltq
    movq -64(%rsp), %rdx
    movq %rdx, %rsi
    imulq -72(%rsp), %rsi
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 32(%rsp)
    addl $1, 16(%rsp)
.L10:
    movl 16(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L11
    movq 48(%rsp), %rcx
    movq -64(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 32(%rsp)
    addl $1, 4(%rsp)
.L9:
    movl 4(%rsp), %rax
    cltq
    cmpq %rax, -72(%rsp)
    jg .L12
    movq -64(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -96(%rsp)
    movl $0, 28(%rsp)
    movl $0, 24(%rsp)
    movl $0, 20(%rsp)
    addl $1, 16(%rsp)
.L4:
    movl 16(%rsp), %rax
    cltq
    cmpq %rax, -80(%rsp)
    jg .L13
    movq -96(%rsp), %rax
    movq %rax, 40(%rsp)
    movq -96(%rsp), %rax
    movq %rax, 32(%rsp)
    movl $0, -4(%rsp)
    jmp .L14
.L17:
    movl $0, -8(%rsp)
    jmp .L15
.L16:
    movq 40(%rsp), %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 28(%rsp)
    movq 40(%rsp), %rax
    addq $1, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 24(%rsp)
    movq 40(%rsp), %rax
    addq $2, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 20(%rsp)
    addq $3, 40(%rsp)
    addl $1, -8(%rsp)
.L15:
    movl -8(%rsp), %rax
    cltq
    cmpq %rax, -88(%rsp)
    jg .L16
    movq 48(%rsp), %rcx
    movq -88(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 40(%rsp)
    addl $1, -4(%rsp)
.L14:
    movl -4(%rsp), %rax
    cltq
    cmpq %rax, -72(%rsp)
    jg .L17
    movl $0, -12(%rsp)
    jmp .L18
.L21:
    movl $0, -16(%rsp)
    jmp .L19
.L20:
    movl 28(%rsp), %rax
    cltq
    movq -88(%rsp), %rdx
    movq %rdx, %rdi
    imulq -72(%rsp), %rdi
    cqto
    idivq %rdi
    movl %rax, %edx
    movq 32(%rsp), %rax
    movb %dl, (%rax)
    movl 24(%rsp), %rax
    cltq
    movq -88(%rsp), %rdx
    movq %rdx, %rsi
    imulq -72(%rsp), %rsi
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movl 20(%rsp), %rax
    cltq
    movq -88(%rsp), %rdx
    movq %rdx, %rdi
    imulq -72(%rsp), %rdi
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 32(%rsp)
    addl $1, -16(%rsp)
.L19:
    movl -16(%rsp), %rax
    cltq
    cmpq %rax, -88(%rsp)
    jg .L20
    movq 48(%rsp), %rcx
    movq -88(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 32(%rsp)
    addl $1, -12(%rsp)
.L18:
    movl -12(%rsp), %rax
    cltq
    cmpq %rax, -72(%rsp)
    jg .L21
    movq 48(%rsp), %rax
    imulq -72(%rsp), %rax
    movq %rax, %rcx
    movq -64(%rsp), %rax
    imulq -80(%rsp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -96(%rsp)
    movl $0, 28(%rsp)
    movl $0, 24(%rsp)
    movl $0, 20(%rsp)
    movl $0, -20(%rsp)
    jmp .L22
.L41:
    movl $0, -80(%rsp)
    jmp .L23
.L32:
    movq -96(%rsp), %rax
    movq %rax, 40(%rsp)
    movl $0, -84(%rsp)
    jmp .L24
.L27:
    movl $0, -88(%rsp)
    jmp .L25
.L26:
    movq 40(%rsp), %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 28(%rsp)
    movq 40(%rsp), %rax
    addq $1, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 24(%rsp)
    movq 40(%rsp), %rax
    addq $2, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 20(%rsp)
    addq $3, 40(%rsp)
    addl $1, -88(%rsp)
    .L25:
    movl -88(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L26
    movq 48(%rsp), %rcx
    movq -64(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 40(%rsp)
    addl $1, -84(%rsp)
.L24:
    movl -84(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L27
    movq -96(%rsp), %rax
    movq %rax, 32(%rsp)
    movl $0, -92(%rsp)
    jmp .L28
.L31:
    movl $0, -96(%rsp)
    jmp .L29
.L30:
    movl 28(%rsp), %rax
    cltq
    movq -64(%rsp), %rdx
    movq %rdx, %rsi
    imulq -64(%rsp), %rsi
    cqto
    idivq %rsi
    movl %rax, %edx
    movq 32(%rsp), %rax
    movb %dl, (%rax)
    movl 24(%rsp), %rax
    cltq
    movq -64(%rsp), %rdx
    movq %rdx, %rdi
    imulq -64(%rsp), %rdi
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movl 20(%rsp), %rax
    cltq
    movq -64(%rsp), %rdx
    movq %rdx, %rsi
    imulq -64(%rsp), %rsi
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 32(%rsp)
    addl $1, -96(%rsp)
.L29:
    movl -96(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L30
    movq 48(%rsp), %rcx
    movq -64(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 32(%rsp)
    addl $1, -92(%rsp)
.L28:
    movl -92(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L31
    movq -64(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -96(%rsp)
    movl $0, 28(%rsp)
    movl $0, 24(%rsp)
    movl $0, 20(%rsp)
    addl $1, -80(%rsp)
.L23:
    movl -80(%rsp), %rax
    cltq
    cmpq %rax, -80(%rsp)
    jg .L32
    movq -96(%rsp), %rax
    movq %rax, 40(%rsp)
    movl $0, -100(%rsp)
    jmp .L33
.L36:
    movl $0, -104(%rsp)
    jmp .L34
.L35:
    movq 40(%rsp), %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 28(%rsp)
    movq 40(%rsp), %rax
    addq $1, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 24(%rsp)
    movq 40(%rsp), %rax
    addq $2, %rax
    movzbl (%rax), %rax
    movzbl %al, %rax
    addl %rax, 20(%rsp)
    addq $3, 40(%rsp)
    addl $1, -104(%rsp)
.L34:
    movl -104(%rsp), %rax
    cltq
    cmpq %rax, -88(%rsp)
    jg .L35
    movq 48(%rsp), %rcx
    movq -88(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 40(%rsp)
    addl $1, -100(%rsp)
.L33:
    movl -100(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L36
    movq -96(%rsp), %rax
    movq %rax, 32(%rsp)
    movl $0, -108(%rsp)
    jmp .L37
.L40:
    movl $0, -112(%rsp)
    jmp .L38
.L39:
    movl 28(%rsp), %rax
    cltq
    movq -88(%rsp), %rdx
    movq %rdx, %rdi
    imulq -64(%rsp), %rdi
    cqto
    idivq %rdi
    movl %rax, %edx
    movq 32(%rsp), %rax
    movb %dl, (%rax)
    movl 24(%rsp), %rax
    cltq
    movq -88(%rsp), %rdx
    movq %rdx, %rsi
    imulq -64(%rsp), %rsi
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movl 20(%rsp), %rax
    cltq
    movq -88(%rsp), %rdx
    movq %rdx, %rdi
    imulq -64(%rsp), %rdi
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 32(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 32(%rsp)
    addl $1, -112(%rsp)
.L38:
    movl -112(%rsp), %rax
    cltq
    cmpq %rax, -88(%rsp)
    jg .L39
    movq 48(%rsp), %rcx
    movq -88(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 32(%rsp)
    addl $1, -108(%rsp)
.L37:
    movl -108(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L40
    movq 48(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rcx
    movq -64(%rsp), %rax
    imulq -80(%rsp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -96(%rsp)
    movl $0, 28(%rsp)
    movl $0, 24(%rsp)
    movl $0, 20(%rsp)
    addl $1, -20(%rsp)
.L22:
    movl -20(%rsp), %rax
    cltq
    cmpq %rax, -64(%rsp)
    jg .L41
    nop
    leave
#------------------------------------------------------------
ret
