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
    subq $152, %rsp
    movq %rdi, -96(%rsp)
    movq %rsi, -104(%rsp)
    movq %rdx, -112(%rsp)
    movq %rcx, -120(%rsp)


    movq -112(%rsp), %rax
    cqto
    idivq -120(%rsp)
    movq %rax, -56(%rsp)


    movq -112(%rsp), %rax
    cqto
    idivq -120(%rsp)
    movq %rdx, -64(%rsp)


    movq -104(%rsp), %rax
    cqto
    idivq -120(%rsp)
    movq %rax, -72(%rsp)


    movq -104(%rsp), %rax
    cqto
    idivq -120(%rsp)
    movq %rdx, -80(%rsp)


    movq -104(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    movq %rax, 144(%rsp)
    jmp .L2
.L3:
    addq $1, 144(%rsp)
.L2:
    movq 144(%rsp), %rax
    andq $3, %rax
    testq %rax, %rax
    jne .L3


    movq -96(%rsp), %rax
    movq %rax, 136(%rsp)
    movq -96(%rsp), %rax
    movq %rax, 128(%rsp)

    movq $0, 120(%rsp)
    movq $0, 112(%rsp)
    movq $0, 104(%rsp)
    movq $0, 96(%rsp)
    jmp .L4
.L13:
    movq -96(%rsp), %rax
    movq %rax, 136(%rsp)
    movq -96(%rsp), %rax
    movq %rax, 128(%rsp)

    movq $0, 88(%rsp)
    jmp .L5
.L8:
    movq $0, 80(%rsp)
    jmp .L6
.L7:
    movq 136(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 120(%rsp)

    movq 136(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 112(%rsp)

    movq 136(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 104(%rsp)

    addq $3, 136(%rsp)
    addq $1, 80(%rsp)
.L6:
    movq 80(%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L7
    movq 144(%rsp), %rcx
    movq -120(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 136(%rsp)
    addq $1, 88(%rsp)
.L5:
    movq 88(%rsp), %rax
    cmpq -64(%rsp), %rax
    jl .L8
    movq $0, 72(%rsp)
    jmp .L9
.L12:
    movq $0, 64(%rsp)
    jmp .L10
.L11:
    movq -120(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rsi

    movq 120(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    movb %dl, (%rax)
    movq -120(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rdi

    movq 112(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -120(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rsi
    movq 104(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 128(%rsp)
    addq $1, 64(%rsp)
.L10:
    movq 64(%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L11
    movq 144(%rsp), %rcx
    movq -120(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 128(%rsp)
    addq $1, 72(%rsp)
.L9:
    movq 72(%rsp), %rax
    cmpq -64(%rsp), %rax
    jl .L12
    movq -120(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -96(%rsp)
    movq $0, 120(%rsp)
    movq $0, 112(%rsp)
    movq $0, 104(%rsp)
    addq $1, 96(%rsp)
.L4:
    movq 96(%rsp), %rax
    cmpq -72(%rsp), %rax
    jl .L13
    movq -96(%rsp), %rax
    movq %rax, 136(%rsp)
    movq -96(%rsp), %rax
    movq %rax, 128(%rsp)
    movq $0, 56(%rsp)
    jmp .L14
.L17:
    movq $0, 48(%rsp)
    jmp .L15
.L16:
    movq 136(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 120(%rsp)
    movq 136(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 112(%rsp)
    movq 136(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 104(%rsp)
    addq $3, 136(%rsp)
    addq $1, 48(%rsp)
.L15:
    movq 48(%rsp), %rax
    cmpq -80(%rsp), %rax
    jl .L16
    movq 144(%rsp), %rcx
    movq -80(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 136(%rsp)
    addq $1, 56(%rsp)
.L14:
    movq 56(%rsp), %rax
    cmpq -64(%rsp), %rax
    jl .L17
    movq $0, 40(%rsp)
    jmp .L18
.L21:
    movq $0, 32(%rsp)
    jmp .L19
.L20:
    movq -80(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rdi
    movq 120(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    movb %dl, (%rax)
    movq -80(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rsi
    movq 112(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -80(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rdi
    movq 104(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 128(%rsp)
    addq $1, 32(%rsp)
.L19:
    movq 32(%rsp), %rax
    cmpq -80(%rsp), %rax
    jl .L20
    movq 144(%rsp), %rcx
    movq -80(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 128(%rsp)
    addq $1, 40(%rsp)
.L18:
    movq 40(%rsp), %rax
    cmpq -64(%rsp), %rax
    jl .L21
    movq 144(%rsp), %rax
    imulq -64(%rsp), %rax
    movq %rax, %rcx
    movq -120(%rsp), %rax
    imulq -72(%rsp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -96(%rsp)
    movq $0, 120(%rsp)
    movq $0, 112(%rsp)
    movq $0, 104(%rsp)
    movq $0, 24(%rsp)
    jmp .L22
.L41:
    movq $0, 16(%rsp)
    jmp .L23
.L32:
    movq -96(%rsp), %rax
    movq %rax, 136(%rsp)
    movq $0, 8(%rsp)
    jmp .L24
.L27:
    movq $0, (%rsp)
    jmp .L25
.L26:
    movq 136(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 120(%rsp)
    movq 136(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 112(%rsp)
    movq 136(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 104(%rsp)
    addq $3, 136(%rsp)
    addq $1, (%rsp)
.L25:
    movq (%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L26
    movq 144(%rsp), %rcx
    movq -120(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 136(%rsp)
    addq $1, 8(%rsp)
.L24:
    movq 8(%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L27
    movq -96(%rsp), %rax
    movq %rax, 128(%rsp)
    movq $0, -8(%rsp)
    jmp .L28
.L31:
    movq $0, -16(%rsp)
    jmp .L29
.L30:
    movq -120(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rsi
    movq 120(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    movb %dl, (%rax)
    movq -120(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rdi
    movq 112(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -120(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rsi
    movq 104(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 128(%rsp)
    addq $1, -16(%rsp)
.L29:
    movq -16(%rsp), %rax
    cmpq -120(%rsp), %rax
jl .L30
    movq 144(%rsp), %rcx
    movq -120(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 128(%rsp)
    addq $1, -8(%rsp)
.L28:
    movq -8(%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L31
    movq -120(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -96(%rsp)
    movq $0, 120(%rsp)
    movq $0, 112(%rsp)
    movq $0, 104(%rsp)
    addq $1, 16(%rsp)
.L23:
    movq 16(%rsp), %rax
    cmpq -72(%rsp), %rax
    jl .L32
    movq -96(%rsp), %rax
    movq %rax, 136(%rsp)
    movq $0, -24(%rsp)
    jmp .L33
.L36:
    movq $0, -32(%rsp)
    jmp .L34
.L35:
    movq 136(%rsp), %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 120(%rsp)
    movq 136(%rsp), %rax
    addq $1, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 112(%rsp)
    movq 136(%rsp), %rax
    addq $2, %rax
    movzbq (%rax), %rax
    movzbq %al, %rax
    addq %rax, 104(%rsp)
    addq $3, 136(%rsp)
    addq $1, -32(%rsp)
.L34:
    movq -32(%rsp), %rax
    cmpq -80(%rsp), %rax
    jl .L35
    movq 144(%rsp), %rcx
    movq -80(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 136(%rsp)
    addq $1, -24(%rsp)
.L33:
    movq -24(%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L36
    movq -96(%rsp), %rax
    movq %rax, 128(%rsp)
    movq $0, -40(%rsp)
    jmp .L37
.L40:
    movq $0, -48(%rsp)
    jmp .L38
.L39:
    movq -80(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rdi
    movq 120(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    movb %dl, (%rax)
    movq -80(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rsi
    movq 112(%rsp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -80(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rdi
    movq 104(%rsp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq 128(%rsp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, 128(%rsp)
    addq $1, -48(%rsp)
.L38:
    movq -48(%rsp), %rax
    cmpq -80(%rsp), %rax
    jl .L39
    movq 144(%rsp), %rcx
    movq -80(%rsp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, 128(%rsp)
    addq $1, -40(%rsp)
.L37:
    movq -40(%rsp), %rax
    cmpq -120(%rsp), %rax
    jl .L40
    movq 144(%rsp), %rax
    imulq -120(%rsp), %rax
    movq %rax, %rcx
    movq -120(%rsp), %rax
    imulq -72(%rsp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -96(%rsp)
    movq $0, 120(%rsp)
    movq $0, 112(%rsp)
    movq $0, 104(%rsp)
    addq $1, 24(%rsp)
.L22:
    movq 24(%rsp), %rax
    cmpq -56(%rsp), %rax
    jl .L41
    addq $152, %rsp
    nop


#------------------------------------------------------------
ret
