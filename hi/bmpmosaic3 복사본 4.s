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


    movq %rdi, -168(%rbp) //imgptr
    movq %rsi, -176(%rbp) //width
    movq %rdx, -184(%rbp) //height
    movq %rcx, -192(%rbp) //size

    //numbers_height
    movq -184(%rbp), %rax
    cqto
    idivq -192(%rbp)
    movq %rax, -136(%rbp)//numbers_height

    //remaining_height
    movq -184(%rbp), %rax
    cqto
    idivq -192(%rbp)
    movq %rdx, -144(%rbp)//remaining_height

    //numbers_width
    movq -176(%rbp), %rax
    cqto
    idivq -192(%rbp)
    movq %rax, -152(%rbp)//numbers_width

    //remaining_width
    movq -176(%rbp), %rax
    cqto
    idivq -192(%rbp)
    movq %rdx, -160(%rbp)//remaining_width

    //real_width
    movq -176(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    movq %rax, -8(%rbp)
    jmp .L2
.L3:
    addq $1, -8(%rbp) //real_width
.L2:
    movq -8(%rbp), %rax
    andq $3, %rax
    testq %rax, %rax
    jne .L3


    movq -168(%rbp), %rax
    movq %rax, -16(%rbp) // pointer1
    movq -168(%rbp), %rax
    movq %rax, -24(%rbp) //pointer2

    movq $0, -32(%rbp) //sum1
    movq $0, -40(%rbp) //sum2
    movq $0, -48(%rbp) //sum3

    movl $0, -52(%rbp)
    jmp .L4
.L13:
    movq -168(%rbp), %rax
    movq %rax, -16(%rbp) //first loop pointer1 = imgptr
    movq -168(%rbp), %rax
    movq %rax, -24(%rbp) //first loop pointer2 = imgptr
    movl $0, -56(%rbp)
    jmp .L5
.L8:
    movl $0, -60(%rbp)
    jmp .L6
.L7:
    movq -16(%rbp), %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -32(%rbp)
    movq -16(%rbp), %rax
    addq $1, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -40(%rbp)
    movq -16(%rbp), %rax
    addq $2, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -48(%rbp)
    addq $3, -16(%rbp)
    addl $1, -60(%rbp)
.L6:
    movl -60(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L7
    movq -8(%rbp), %rcx
    movq -192(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rbp)
    addl $1, -56(%rbp)
.L5:
    movl -56(%rbp), %eax
    cltq
    cmpq %rax, -144(%rbp)
    jg .L8
    movl $0, -64(%rbp)
    jmp .L9
.L12:
    movl $0, -68(%rbp)
    jmp .L10
.L11:
    movq -192(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rsi
    movq -32(%rbp), %rax
    cqto
    idivq %rsi
    movl %eax, %edx
    movq -24(%rbp), %rax
    movb %dl, (%rax)
    movq -192(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rdi
    movq -40(%rbp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -192(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rsi
    movq -48(%rbp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rbp)
    addl $1, -68(%rbp)
.L10:
    movl -68(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L11
    movq -8(%rbp), %rcx
    movq -192(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rbp)
    addl $1, -64(%rbp)
.L9:
    movl -64(%rbp), %eax
    cltq
    cmpq %rax, -144(%rbp)
    jg .L12
    movq -192(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -168(%rbp)
    movq $0, -32(%rbp)
    movq $0, -40(%rbp)
    movq $0, -48(%rbp)
    addl $1, -52(%rbp)
.L4:
    movq -52(%rbp), %rax
    cltq
    cmpq %rax, -152(%rbp)
    jg .L13
    movq -168(%rbp), %rax
    movq %rax, -16(%rbp)
    movq -168(%rbp), %rax
    movq %rax, -24(%rbp)
    movl $0, -72(%rbp)
    jmp .L14
.L17:
    movl $0, -76(%rbp)
    jmp .L15
.L16:
    movq -16(%rbp), %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -32(%rbp)
    movq -16(%rbp), %rax
    addq $1, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -40(%rbp)
    movq -16(%rbp), %rax
    addq $2, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -48(%rbp)
    addq $3, -16(%rbp)
    addl $1, -76(%rbp)
.L15:
    movl -76(%rbp), %eax
    cltq
    cmpq %rax, -160(%rbp)
    jg .L16
    movq -8(%rbp), %rcx
    movq -160(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rbp)
    addl $1, -72(%rbp)
.L14:
    movl -72(%rbp), %eax
    cltq
    cmpq %rax, -144(%rbp)
    jg .L17
    movl $0, -80(%rbp)
    jmp .L18
.L21:
    movl $0, -84(%rbp)
    jmp .L19
.L20:
    movq -160(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rdi
    movq -32(%rbp), %rax
    cqto
    idivq %rdi
    movl %eax, %edx
    movq -24(%rbp), %rax
    movb %dl, (%rax)
    movq -160(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rsi
    movq -40(%rbp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -160(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rdi
    movq -48(%rbp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rbp)
    addl $1, -84(%rbp)
.L19:
    movl -84(%rbp), %eax
    cltq
    cmpq %rax, -160(%rbp)
    jg .L20
    movq -8(%rbp), %rcx
    movq -160(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rbp)
    addl $1, -80(%rbp)
.L18:
    movl -80(%rbp), %eax
    cltq
    cmpq %rax, -144(%rbp)
    jg .L21
    movq -8(%rbp), %rax
    imulq -144(%rbp), %rax
    movq %rax, %rcx
    movq -192(%rbp), %rax
    imulq -152(%rbp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -168(%rbp)
    movq $0, -32(%rbp)
    movq $0, -40(%rbp)
    movq $0, -48(%rbp)
    movl $0, -88(%rbp)
    jmp .L22
.L41:
    movl $0, -92(%rbp)
    jmp .L23
.L32:
    movq -168(%rbp), %rax
    movq %rax, -16(%rbp)
    movl $0, -96(%rbp)
    jmp .L24
.L27:
    movl $0, -100(%rbp)
    jmp .L25
.L26:
    movq -16(%rbp), %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -32(%rbp)
    movq -16(%rbp), %rax
    addq $1, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -40(%rbp)
    movq -16(%rbp), %rax
    addq $2, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -48(%rbp)
    addq $3, -16(%rbp)
    addl $1, -100(%rbp)
.L25:
    movl -100(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L26
    movq -8(%rbp), %rcx
    movq -192(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rbp)
    addl $1, -96(%rbp)
.L24:
    movl -96(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L27
    movq -168(%rbp), %rax
    movq %rax, -24(%rbp)
    movl $0, -104(%rbp)
    jmp .L28
.L31:
    movl $0, -108(%rbp)
    jmp .L29
.L30:
    movq -192(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rsi
    movq -32(%rbp), %rax
    cqto
    idivq %rsi
    movl %eax, %edx
    movq -24(%rbp), %rax
    movb %dl, (%rax)
    movq -192(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rdi
    movq -40(%rbp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -192(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rsi
    movq -48(%rbp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rbp)
    addl $1, -108(%rbp)
.L29:
    movl -108(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L30
    movq -8(%rbp), %rcx
    movq -192(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rbp)
    addl $1, -104(%rbp)
.L28:
    movl -104(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L31
    movq -192(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    addq %rax, -168(%rbp)
    movq $0, -32(%rbp)
    movq $0, -40(%rbp)
    movq $0, -48(%rbp)
    addl $1, -92(%rbp)
.L23:
    movl -92(%rbp), %eax
    cltq
    cmpq %rax, -152(%rbp)
    jg .L32
    movq -168(%rbp), %rax
    movq %rax, -16(%rbp)
    movl $0, -112(%rbp)
    jmp .L33
.L36:
    movl $0, -116(%rbp)
    jmp .L34
.L35:
    movq -16(%rbp), %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -32(%rbp)
    movq -16(%rbp), %rax
    addq $1, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -40(%rbp)
    movq -16(%rbp), %rax
    addq $2, %rax
    movzbl (%rax), %eax
    movzbl %al, %eax
    addq %rax, -48(%rbp)
    addq $3, -16(%rbp)
    addl $1, -116(%rbp)
.L34:
    movl -116(%rbp), %eax
    cltq
    cmpq %rax, -160(%rbp)
    jg .L35
    movq -8(%rbp), %rcx
    movq -160(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -16(%rbp)
    addl $1, -112(%rbp)
.L33:
    movl -112(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L36
    movq -168(%rbp), %rax
    movq %rax, -24(%rbp)
    movl $0, -120(%rbp)
    jmp .L37
.L40:
    movl $0, -124(%rbp)
    jmp .L38
.L39:
    movq -160(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rdi
    movq -32(%rbp), %rax
    cqto
    idivq %rdi
    movl %eax, %edx
    movq -24(%rbp), %rax
    movb %dl, (%rax)
    movq -160(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rsi
    movq -40(%rbp), %rax
    cqto
    idivq %rsi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $1, %rax
    movb %dl, (%rax)
    movq -160(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rdi
    movq -48(%rbp), %rax
    cqto
    idivq %rdi
    movq %rax, %rdx
    movq -24(%rbp), %rax
    addq $2, %rax
    movb %dl, (%rax)
    addq $3, -24(%rbp)
    addl $1, -124(%rbp)
.L38:
    movl -124(%rbp), %eax
    cltq
    cmpq %rax, -160(%rbp)
    jg .L39
    movq -8(%rbp), %rcx
    movq -160(%rbp), %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -24(%rbp)
    addl $1, -120(%rbp)
.L37:
    movl -120(%rbp), %eax
    cltq
    cmpq %rax, -192(%rbp)
    jg .L40
    movq -8(%rbp), %rax
    imulq -192(%rbp), %rax
    movq %rax, %rcx
    movq -192(%rbp), %rax
    imulq -152(%rbp), %rax
    movq %rax, %rdx
    movq %rdx, %rax
    addq %rax, %rax
    addq %rdx, %rax
    subq %rax, %rcx
    movq %rcx, %rax
    addq %rax, -168(%rbp)
    movq $0, -32(%rbp)
    movq $0, -40(%rbp)
    movq $0, -48(%rbp)
    addl $1, -88(%rbp)
.L22:
    movl -88(%rbp), %eax
    cltq
    cmpq %rax, -136(%rbp)
    jg .L41
    nop
    leave
#------------------------------------------------------------
ret
