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


    movq %rdi, -248(%rsp)
    movq %rsi, -256(%rsp)
    movq %rdx, -264(%rsp)
    movq %rcx, -272(%rsp)


    movq -264(%rsp), %rax
    cqto
    idivq -272(%rsp)
    movq %rax, -208(%rsp)


    movq -264(%rsp), %rax
    cqto
    idivq -272(%rsp)
    movq %rdx, -216(%rsp)


    movq -256(%rsp), %rax
    cqto
    idivq -272(%rsp)
    movq %rax, -224(%rsp)


    movq -256(%rsp), %rax
    cqto
    idivq -272(%rsp)
    movq %rdx, -232(%rsp)


    movq -256(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    movq %rax, -8(%rsp)
    jmp .L2
.L3:
    addq $1, -8(%rsp)
.L2:
    movq -8(%rsp), %rax
    andq $3, %rax
    testq %rax, %rax
    jne .L3


    movq -248(%rsp), %rax
    movq %rax, -16(%rsp)
    movq -248(%rsp), %rax
    movq %rax, -24(%rsp)

    movq $0, -32(%rsp)
    movq $0, -40(%rsp)
    movq $0, -48(%rsp)
    movq $0, -56(%rsp)
    jmp .L4
.L13:
    movq -248(%rsp), %rax
    movq %rax, -16(%rsp)
    movq -248(%rsp), %rax
    movq %rax, -24(%rsp)

    movq $0, -64(%rsp)
    jmp .L5
.L8:
    movq $0, -72(%rsp)
    jmp .L6
.L7:
    movq -16(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -32(%rsp)

    movq -16(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -40(%rsp)

    movq -16(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -48(%rsp)

    addq $3, -16(%rsp)
    addq $1, -72(%rsp)
.L6:
    movq -72(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L7
    movq -8(%rsp), %rcx
    movq -272(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rsp)
    addq $1, -64(%rsp)
.L5:
    movq -64(%rsp), %rax
    cmpq -216(%rsp), %rax
    jl .L8
    movq $0, -80(%rsp)
    jmp .L9
.L12:
    movq $0, -88(%rsp)
    jmp .L10
.L11:
    movq -272(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rsi

    movq -32(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    movb %dl, (%rax)
    movq -272(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rdi

    movq -40(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -272(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rsi
    movq -48(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rsp)
    addq $1, -88(%rsp)
.L10:
    movq -88(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L11
    movq -8(%rsp), %rcx
    movq -272(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rsp)
    addq $1, -80(%rsp)
.L9:
    movq -80(%rsp), %rax
    cmpq -216(%rsp), %rax
    jl .L12
    movq -272(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -248(%rsp)
    movq $0, -32(%rsp)
    movq $0, -40(%rsp)
    movq $0, -48(%rsp)
    addq $1, -56(%rsp)
.L4:
    movq -56(%rsp), %rax
    cmpq -224(%rsp), %rax
    jl .L13
    movq -248(%rsp), %rax
    movq %rax, -16(%rsp)
    movq -248(%rsp), %rax
    movq %rax, -24(%rsp)
    movq $0, -96(%rsp)
    jmp .L14
.L17:
    movq $0, -104(%rsp)
    jmp .L15
.L16:
    movq -16(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -32(%rsp)
    movq -16(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -40(%rsp)
    movq -16(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -48(%rsp)
    addq $3, -16(%rsp)
    addq $1, -104(%rsp)
.L15:
    movq -104(%rsp), %rax
    cmpq -232(%rsp), %rax
    jl .L16
    movq -8(%rsp), %rcx
    movq -232(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rsp)
    addq $1, -96(%rsp)
.L14:
    movq -96(%rsp), %rax
    cmpq -216(%rsp), %rax
    jl .L17
    movq $0, -112(%rsp)
    jmp .L18
.L21:
    movq $0, -120(%rsp)
    jmp .L19
.L20:
    movq -232(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rdi
    movq -32(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    movb %dl, (%rax)
    movq -232(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rsi
    movq -40(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -232(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rdi
    movq -48(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rsp)
    addq $1, -120(%rsp)
.L19:
    movq -120(%rsp), %rax
    cmpq -232(%rsp), %rax
    jl .L20
    movq -8(%rsp), %rcx
    movq -232(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rsp)
    addq $1, -112(%rsp)
.L18:
    movq -112(%rsp), %rax
    cmpq -216(%rsp), %rax
    jl .L21
    movq -8(%rsp), %rax
    imulq -216(%rsp), %rax
    movq %rax, %rcx
    movq -272(%rsp), %rax
    imulq -224(%rsp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -248(%rsp)
    movq $0, -32(%rsp)
    movq $0, -40(%rsp)
    movq $0, -48(%rsp)
    movq $0, -128(%rsp)
    jmp .L22
.L41:
    movq $0, -136(%rsp)
    jmp .L23
.L32:
    movq -248(%rsp), %rax
    movq %rax, -16(%rsp)
    movq $0, -144(%rsp)
    jmp .L24
.L27:
    movq $0, -152(%rsp)
    jmp .L25
.L26:
    movq -16(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -32(%rsp)
    movq -16(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -40(%rsp)
    movq -16(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -48(%rsp)
    addq $3, -16(%rsp)
    addq $1, -152(%rsp)
.L25:
    movq -152(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L26
    movq -8(%rsp), %rcx
    movq -272(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rsp)
    addq $1, -144(%rsp)
.L24:
    movq -144(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L27
    movq -248(%rsp), %rax
    movq %rax, -24(%rsp)
    movq $0, -160(%rsp)
    jmp .L28
.L31:
    movq $0, -168(%rsp)
    jmp .L29
.L30:
    movq -272(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rsi
    movq -32(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    movb %dl, (%rax)
    movq -272(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rdi
    movq -40(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -272(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rsi
    movq -48(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rsp)
    addq $1, -168(%rsp)
.L29:
    movq -168(%rsp), %rax
    cmpq -272(%rsp), %rax
jl .L30
    movq -8(%rsp), %rcx
    movq -272(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rsp)
    addq $1, -160(%rsp)
.L28:
    movq -160(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L31
    movq -272(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -248(%rsp)
    movq $0, -32(%rsp)
    movq $0, -40(%rsp)
    movq $0, -48(%rsp)
    addq $1, -136(%rsp)
.L23:
    movq -136(%rsp), %rax
    cmpq -224(%rsp), %rax
    jl .L32
    movq -248(%rsp), %rax
    movq %rax, -16(%rsp)
    movq $0, -176(%rsp)
    jmp .L33
.L36:
    movq $0, -184(%rsp)
    jmp .L34
.L35:
    movq -16(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -32(%rsp)
    movq -16(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -40(%rsp)
    movq -16(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, -48(%rsp)
    addq $3, -16(%rsp)
    addq $1, -184(%rsp)
.L34:
    movq -184(%rsp), %rax
    cmpq -232(%rsp), %rax
    jl .L35
    movq -8(%rsp), %rcx
    movq -232(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rsp)
    addq $1, -176(%rsp)
.L33:
    movq -176(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L36
    movq -248(%rsp), %rax
    movq %rax, -24(%rsp)
    movq $0, -192(%rsp)
    jmp .L37
.L40:
    movq $0, -200(%rsp)
    jmp .L38
.L39:
    movq -232(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rdi
    movq -32(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    movb %dl, (%rax)
    movq -232(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rsi
    movq -40(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -232(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rdi
    movq -48(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rsp)
    addq $1, -200(%rsp)
.L38:
    movq -200(%rsp), %rax
    cmpq -232(%rsp), %rax
    jl .L39
    movq -8(%rsp), %rcx
    movq -232(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rsp)
    addq $1, -192(%rsp)
.L37:
    movq -192(%rsp), %rax
    cmpq -272(%rsp), %rax
    jl .L40
    movq -8(%rsp), %rax
    imulq -272(%rsp), %rax
    movq %rax, %rcx
    movq -272(%rsp), %rax
    imulq -224(%rsp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -248(%rsp)
    movq $0, -32(%rsp)
    movq $0, -40(%rsp)
    movq $0, -48(%rsp)
    addq $1, -128(%rsp)
.L22:
    movq -128(%rsp), %rax
    cmpq -208(%rsp), %rax
    jl .L41
    nop
    leave

#------------------------------------------------------------
ret
