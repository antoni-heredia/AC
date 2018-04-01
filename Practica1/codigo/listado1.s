	.file	"listado1.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t Tama\303\261o Vectores:%u\t V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$200, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -164(%rbp)
	movq	%rsi, -176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$1, -164(%rbp)
	jg	.L2
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L2:
	movq	-176(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -156(%rbp)
	movl	-156(%rbp), %eax
	subq	$1, %rax
	movq	%rax, -152(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -208(%rbp)
	movq	$0, -200(%rbp)
	addq	$1, %rax
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -144(%rbp)
	movl	-156(%rbp), %eax
	subq	$1, %rax
	movq	%rax, -136(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -224(%rbp)
	movq	$0, -216(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -240(%rbp)
	movq	$0, -232(%rbp)
	addq	$1, %rax
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -128(%rbp)
	movl	-156(%rbp), %eax
	subq	$1, %rax
	movq	%rax, -120(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	addq	$1, %rax
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -112(%rbp)
	movl	$0, -160(%rbp)
.L8:
	movl	-160(%rbp), %eax
	cmpl	-156(%rbp), %eax
	jnb	.L3
	movl	-156(%rbp), %eax
	testq	%rax, %rax
	js	.L4
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L5
.L4:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L5:
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-160(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-144(%rbp), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	movl	-156(%rbp), %eax
	testq	%rax, %rax
	js	.L6
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L7
.L6:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L7:
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-160(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-128(%rbp), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -160(%rbp)
	jmp	.L8
.L3:
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -160(%rbp)
.L10:
	movl	-160(%rbp), %eax
	cmpl	-156(%rbp), %eax
	jnb	.L9
	movq	-144(%rbp), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	movq	-128(%rbp), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	addsd	%xmm1, %xmm0
	movq	-112(%rbp), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -160(%rbp)
	jmp	.L10
.L9:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-80(%rbp), %rdx
	movq	-96(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-72(%rbp), %rdx
	movq	-88(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	movl	-156(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-112(%rbp), %rax
	movl	%edx, %edx
	movsd	(%rax,%rdx,8), %xmm5
	movl	-156(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-128(%rbp), %rax
	movl	%edx, %edx
	movsd	(%rax,%rdx,8), %xmm4
	movl	-156(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-144(%rbp), %rax
	movl	%edx, %edx
	movsd	(%rax,%rdx,8), %xmm3
	movl	-156(%rbp), %eax
	leal	-1(%rax), %edi
	movl	-156(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-156(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-112(%rbp), %rax
	movsd	(%rax), %xmm2
	movq	-128(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-144(%rbp), %rax
	movsd	(%rax), %xmm0
	movl	-156(%rbp), %esi
	movq	-104(%rbp), %rax
	movapd	%xmm5, %xmm6
	movapd	%xmm4, %xmm5
	movapd	%xmm3, %xmm4
	movl	%edi, %r8d
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, -192(%rbp)
	movsd	-192(%rbp), %xmm0
	movl	$.LC3, %edi
	movl	$7, %eax
	call	printf
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L12
	call	__stack_chk_fail
.L12:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
