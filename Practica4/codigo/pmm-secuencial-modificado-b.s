	.file	"pmm-secuencial-modificado-b.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\nIntroduce el tama\303\261o de la matriz cuadrada: "
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC2:
	.string	"Error: "
.LC4:
	.string	"Primero:%d Ultimo:%d %f \n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC0, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	__printf_chk
	leaq	44(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	44(%rsp), %rdi
	salq	$3, %rdi
	call	malloc
	movslq	44(%rsp), %rdi
	movq	%rax, %rbx
	salq	$3, %rdi
	call	malloc
	movslq	44(%rsp), %rdi
	movq	%rax, %r13
	movq	%rax, 24(%rsp)
	salq	$3, %rdi
	call	malloc
	movslq	44(%rsp), %rdx
	movq	%rax, %rbp
	testl	%edx, %edx
	jle	.L2
	xorl	%r12d, %r12d
.L4:
	leaq	0(,%rdx,4), %rdi
	call	malloc
	movslq	44(%rsp), %rdi
	movq	%rax, 0(%rbp,%r12,8)
	movq	%rax, %r14
	salq	$2, %rdi
	call	malloc
	movslq	44(%rsp), %rdi
	movq	%rax, (%rbx,%r12,8)
	salq	$2, %rdi
	call	malloc
	testq	%r14, %r14
	movq	%rax, 0(%r13,%r12,8)
	je	.L31
.L3:
	movslq	44(%rsp), %rdx
	leal	1(%r12), %eax
	addq	$1, %r12
	cmpl	%eax, %edx
	jg	.L4
	testl	%edx, %edx
	jle	.L2
	movq	24(%rsp), %r9
	xorl	%r8d, %r8d
.L7:
	movq	0(%rbp,%r8,8), %rdi
	movq	(%rbx,%r8,8), %rsi
	xorl	%eax, %eax
	movq	(%r9,%r8,8), %rcx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$2, (%rdi,%rax,4)
	movl	$3, (%rsi,%rax,4)
	movl	$0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %edx
	jg	.L6
	addq	$1, %r8
	cmpl	%r8d, %edx
	jg	.L7
.L2:
	leal	3(%rdx), %eax
	testl	%edx, %edx
	leaq	48(%rsp), %rsi
	cmovs	%eax, %edx
	xorl	%edi, %edi
	sarl	$2, %edx
	movl	%edx, 8(%rsp)
	call	clock_gettime
	movl	44(%rsp), %eax
	testl	%eax, %eax
	movl	%eax, 4(%rsp)
	jle	.L9
	movl	8(%rsp), %ecx
	xorl	%r13d, %r13d
	movl	%ecx, %eax
	sall	$2, %eax
	movl	%eax, %edi
	movl	%eax, 12(%rsp)
	movl	%ecx, %eax
	movslq	%edi, %r15
	movl	4(%rsp), %edi
	subl	$1, %eax
	salq	$4, %rax
	addq	$20, %rax
	leal	-1(%rdi), %r11d
	movq	%rax, 16(%rsp)
	movq	%r15, %rax
	salq	$2, %r15
	subl	%eax, %r11d
	addq	$1, %r11
.L17:
	movq	24(%rsp), %rax
	xorl	%r12d, %r12d
	movq	(%rax,%r13,8), %r14
	.p2align 4,,10
	.p2align 3
.L12:
	movl	8(%rsp), %eax
	testl	%eax, %eax
	jle	.L19
	movq	(%rbx,%r13,8), %r10
	movq	0(%rbp,%r12,8), %rdi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	leaq	4(%r10), %rax
	addq	16(%rsp), %r10
	leaq	4(%rdi), %rdx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L10:
	movl	-4(%rax), %esi
	addq	$16, %rax
	addq	$16, %rdx
	imull	-20(%rdx), %esi
	addl	%esi, %ecx
	movl	-16(%rax), %esi
	imull	-16(%rdx), %esi
	addl	%esi, %edi
	movl	-12(%rax), %esi
	imull	-12(%rdx), %esi
	addl	%esi, %r8d
	movl	-8(%rax), %esi
	imull	-8(%rdx), %esi
	addl	%esi, %r9d
	cmpq	%r10, %rax
	jne	.L10
	addl	%edi, %ecx
	addl	%ecx, %r8d
	addl	%r8d, %r9d
.L16:
	movl	12(%rsp), %edi
	cmpl	%edi, 4(%rsp)
	movl	%r9d, (%r14,%r12,4)
	jle	.L15
	movq	%r15, %rsi
	movq	%r15, %rcx
	addq	(%rbx,%r13,8), %rsi
	addq	0(%rbp,%r12,8), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L14:
	movl	(%rsi,%rax,4), %edx
	imull	(%rcx,%rax,4), %edx
	addq	$1, %rax
	addl	%edx, %r9d
	cmpq	%r11, %rax
	jne	.L14
	movl	%r9d, (%r14,%r12,4)
.L15:
	addq	$1, %r12
	cmpl	%r12d, 4(%rsp)
	jg	.L12
	addq	$1, %r13
	cmpl	%r13d, 4(%rsp)
	jg	.L17
.L9:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	movl	$.LC4, %esi
	pxor	%xmm0, %xmm0
	movslq	44(%rsp), %rdx
	movq	24(%rsp), %r15
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC3(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	-8(%r15,%rdx,8), %rax
	movl	-4(%rax,%rdx,4), %ecx
	movq	(%r15), %rax
	movl	(%rax), %edx
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	xorl	%eax, %eax
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L32
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	xorl	%r9d, %r9d
	jmp	.L16
.L31:
	movl	$.LC2, %edi
	call	perror
	jmp	.L3
.L32:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
