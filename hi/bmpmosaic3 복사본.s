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

















bmp_mosaic:
pushq %rbp
movq %rsp, %rbp
subq $56, %rsp
movq %rdi, -152(%rbp)
movq %rsi, -160(%rbp)
movq %rdx, -168(%rbp)
movq %rcx, -176(%rbp)
movq -168(%rbp), %rax
cqto
idivq -176(%rbp)
movq %rax, -120(%rbp)
movq -168(%rbp), %rax
cqto
idivq -176(%rbp)
movq %rdx, -128(%rbp)
movq -160(%rbp), %rax
cqto
idivq -176(%rbp)
movq %rax, -136(%rbp)
movq -160(%rbp), %rax
cqto
idivq -176(%rbp)
movq %rdx, -144(%rbp)
movq -160(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
movq %rax, -8(%rbp)
jmp .L2
.L3:
addq $1, -8(%rbp)
.L2:
movq -8(%rbp), %rax
andl $3, %eax
testq %rax, %rax
jne .L3
movq -152(%rbp), %rax
movq %rax, -16(%rbp)
movq -152(%rbp), %rax
movq %rax, -24(%rbp)
movl $0, -28(%rbp)
movl $0, -32(%rbp)
movl $0, -36(%rbp)
movl $0, -40(%rbp)
jmp .L4
.L13:
movq -152(%rbp), %rax
movq %rax, -16(%rbp)
movq -152(%rbp), %rax
movq %rax, -24(%rbp)
movl $0, -44(%rbp)
jmp .L5
.L8:
movl $0, -48(%rbp)
jmp .L6
.L7:
movq -16(%rbp), %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -28(%rbp)
movq -16(%rbp), %rax
addq $1, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -32(%rbp)
movq -16(%rbp), %rax
addq $2, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -36(%rbp)
addq $3, -16(%rbp)
addl $1, -48(%rbp)
.L6:
movl -48(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L7
movq -8(%rbp), %rcx
movq -176(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -16(%rbp)
addl $1, -44(%rbp)
.L5:
movl -44(%rbp), %eax
cltq
cmpq %rax, -128(%rbp)
jg .L8
movl $0, -52(%rbp)
jmp .L9
.L12:
movl $0, -56(%rbp)
jmp .L10
.L11:
movl -28(%rbp), %eax
cltq
movq -176(%rbp), %rdx
movq %rdx, %rsi
imulq -128(%rbp), %rsi
cqto
idivq %rsi
movl %eax, %edx
movq -24(%rbp), %rax
movb %dl, (%rax)
movl -32(%rbp), %eax
cltq
movq -176(%rbp), %rdx
movq %rdx, %rdi
imulq -128(%rbp), %rdi
cqto
idivq %rdi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $1, %rax
movb %dl, (%rax)
movl -36(%rbp), %eax
cltq
movq -176(%rbp), %rdx
movq %rdx, %rsi
imulq -128(%rbp), %rsi
cqto
idivq %rsi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $2, %rax
movb %dl, (%rax)
addq $3, -24(%rbp)
addl $1, -56(%rbp)
.L10:
movl -56(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L11
movq -8(%rbp), %rcx
movq -176(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -24(%rbp)
addl $1, -52(%rbp)
.L9:
movl -52(%rbp), %eax
cltq
cmpq %rax, -128(%rbp)
jg .L12
movq -176(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
addq %rax, -152(%rbp)
movl $0, -28(%rbp)
movl $0, -32(%rbp)
movl $0, -36(%rbp)
addl $1, -40(%rbp)
.L4:
movl -40(%rbp), %eax
cltq
cmpq %rax, -136(%rbp)
jg .L13
movq -152(%rbp), %rax
movq %rax, -16(%rbp)
movq -152(%rbp), %rax
movq %rax, -24(%rbp)
movl $0, -60(%rbp)
jmp .L14
.L17:
movl $0, -64(%rbp)
jmp .L15
.L16:
movq -16(%rbp), %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -28(%rbp)
movq -16(%rbp), %rax
addq $1, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -32(%rbp)
movq -16(%rbp), %rax
addq $2, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -36(%rbp)
addq $3, -16(%rbp)
addl $1, -64(%rbp)
.L15:
movl -64(%rbp), %eax
cltq
cmpq %rax, -144(%rbp)
jg .L16
movq -8(%rbp), %rcx
movq -144(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -16(%rbp)
addl $1, -60(%rbp)
.L14:
movl -60(%rbp), %eax
cltq
cmpq %rax, -128(%rbp)
jg .L17
movl $0, -68(%rbp)
jmp .L18
.L21:
movl $0, -72(%rbp)
jmp .L19
.L20:
movl -28(%rbp), %eax
cltq
movq -144(%rbp), %rdx
movq %rdx, %rdi
imulq -128(%rbp), %rdi
cqto
idivq %rdi
movl %eax, %edx
movq -24(%rbp), %rax
movb %dl, (%rax)
movl -32(%rbp), %eax
cltq
movq -144(%rbp), %rdx
movq %rdx, %rsi
imulq -128(%rbp), %rsi
cqto
idivq %rsi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $1, %rax
movb %dl, (%rax)
movl -36(%rbp), %eax
cltq
movq -144(%rbp), %rdx
movq %rdx, %rdi
imulq -128(%rbp), %rdi
cqto
idivq %rdi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $2, %rax
movb %dl, (%rax)
addq $3, -24(%rbp)
addl $1, -72(%rbp)
.L19:
movl -72(%rbp), %eax
cltq
cmpq %rax, -144(%rbp)
jg .L20
movq -8(%rbp), %rcx
movq -144(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -24(%rbp)
addl $1, -68(%rbp)
.L18:
movl -68(%rbp), %eax
cltq
cmpq %rax, -128(%rbp)
jg .L21
movq -8(%rbp), %rax
imulq -128(%rbp), %rax
movq %rax, %rcx
movq -176(%rbp), %rax
imulq -136(%rbp), %rax
movq %rax, %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -152(%rbp)
movl $0, -28(%rbp)
movl $0, -32(%rbp)
movl $0, -36(%rbp)
movl $0, -76(%rbp)
jmp .L22
.L41:
movl $0, -80(%rbp)
jmp .L23
.L32:
movq -152(%rbp), %rax
movq %rax, -16(%rbp)
movl $0, -84(%rbp)
jmp .L24
.L27:
movl $0, -88(%rbp)
jmp .L25
.L26:
movq -16(%rbp), %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -28(%rbp)
movq -16(%rbp), %rax
addq $1, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -32(%rbp)
movq -16(%rbp), %rax
addq $2, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -36(%rbp)
addq $3, -16(%rbp)
addl $1, -88(%rbp)
.L25:
movl -88(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L26
movq -8(%rbp), %rcx
movq -176(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -16(%rbp)
addl $1, -84(%rbp)
.L24:
movl -84(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L27
movq -152(%rbp), %rax
movq %rax, -24(%rbp)
movl $0, -92(%rbp)
jmp .L28
.L31:
movl $0, -96(%rbp)
jmp .L29
.L30:
movl -28(%rbp), %eax
cltq
movq -176(%rbp), %rdx
movq %rdx, %rsi
imulq -176(%rbp), %rsi
cqto
idivq %rsi
movl %eax, %edx
movq -24(%rbp), %rax
movb %dl, (%rax)
movl -32(%rbp), %eax
cltq
movq -176(%rbp), %rdx
movq %rdx, %rdi
imulq -176(%rbp), %rdi
cqto
idivq %rdi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $1, %rax
movb %dl, (%rax)
movl -36(%rbp), %eax
cltq
movq -176(%rbp), %rdx
movq %rdx, %rsi
imulq -176(%rbp), %rsi
cqto
idivq %rsi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $2, %rax
movb %dl, (%rax)
addq $3, -24(%rbp)
addl $1, -96(%rbp)
.L29:
movl -96(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L30
movq -8(%rbp), %rcx
movq -176(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -24(%rbp)
addl $1, -92(%rbp)
.L28:
movl -92(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L31
movq -176(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
addq %rax, -152(%rbp)
movl $0, -28(%rbp)
movl $0, -32(%rbp)
movl $0, -36(%rbp)
addl $1, -80(%rbp)
.L23:
movl -80(%rbp), %eax
cltq
cmpq %rax, -136(%rbp)
jg .L32
movq -152(%rbp), %rax
movq %rax, -16(%rbp)
movl $0, -100(%rbp)
jmp .L33
.L36:
movl $0, -104(%rbp)
jmp .L34
.L35:
movq -16(%rbp), %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -28(%rbp)
movq -16(%rbp), %rax
addq $1, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -32(%rbp)
movq -16(%rbp), %rax
addq $2, %rax
movzbl (%rax), %eax
movzbl %al, %eax
addl %eax, -36(%rbp)
addq $3, -16(%rbp)
addl $1, -104(%rbp)
.L34:
movl -104(%rbp), %eax
cltq
cmpq %rax, -144(%rbp)
jg .L35
movq -8(%rbp), %rcx
movq -144(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -16(%rbp)
addl $1, -100(%rbp)
.L33:
movl -100(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L36
movq -152(%rbp), %rax
movq %rax, -24(%rbp)
movl $0, -108(%rbp)
jmp .L37
.L40:
movl $0, -112(%rbp)
jmp .L38
.L39:
movl -28(%rbp), %eax
cltq
movq -144(%rbp), %rdx
movq %rdx, %rdi
imulq -176(%rbp), %rdi
cqto
idivq %rdi
movl %eax, %edx
movq -24(%rbp), %rax
movb %dl, (%rax)
movl -32(%rbp), %eax
cltq
movq -144(%rbp), %rdx
movq %rdx, %rsi
imulq -176(%rbp), %rsi
cqto
idivq %rsi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $1, %rax
movb %dl, (%rax)
movl -36(%rbp), %eax
cltq
movq -144(%rbp), %rdx
movq %rdx, %rdi
imulq -176(%rbp), %rdi
cqto
idivq %rdi
movq %rax, %rdx
movq -24(%rbp), %rax
addq $2, %rax
movb %dl, (%rax)
addq $3, -24(%rbp)
addl $1, -112(%rbp)
.L38:
movl -112(%rbp), %eax
cltq
cmpq %rax, -144(%rbp)
jg .L39
movq -8(%rbp), %rcx
movq -144(%rbp), %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -24(%rbp)
addl $1, -108(%rbp)
.L37:
movl -108(%rbp), %eax
cltq
cmpq %rax, -176(%rbp)
jg .L40
movq -8(%rbp), %rax
imulq -176(%rbp), %rax
movq %rax, %rcx
movq -176(%rbp), %rax
imulq -136(%rbp), %rax
movq %rax, %rdx
movq %rdx, %rax
addq %rax, %rax
addq %rdx, %rax
subq %rax, %rcx
movq %rcx, %rax
addq %rax, -152(%rbp)
movl $0, -28(%rbp)
movl $0, -32(%rbp)
movl $0, -36(%rbp)
addl $1, -76(%rbp)
.L22:
movl -76(%rbp), %eax
cltq
cmpq %rax, -120(%rbp)
jg .L41
nop
leave
ret
