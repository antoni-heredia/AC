	.file	"pmm-secuencial-modificado-a.c"
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	call	__printf_chk
	leaq	60(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	60(%rsp), %rdi
	salq	$3, %rdi
	call	malloc
	movslq	60(%rsp), %rdi
	movq	%rax, %rbx
	salq	$3, %rdi
	call	malloc
	movslq	60(%rsp), %rdi
	movq	%rax, %r13
	movq	%rax, 40(%rsp)
	salq	$3, %rdi
	call	malloc
	movslq	60(%rsp), %rdx
	movq	%rax, %rbp
	testl	%edx, %edx
	jle	.L2
	xorl	%r12d, %r12d
.L4:
	leaq	0(,%rdx,4), %rdi
	call	malloc
	movslq	60(%rsp), %rdi
	movq	%rax, 0(%rbp,%r12,8)
	movq	%rax, %r14
	salq	$2, %rdi
	call	malloc
	movslq	60(%rsp), %rdi
	movq	%rax, (%rbx,%r12,8)
	salq	$2, %rdi
	call	malloc
	testq	%r14, %r14
	movq	%rax, 0(%r13,%r12,8)
	je	.L31
.L3:
	movslq	60(%rsp), %rdx
	leal	1(%r12), %eax
	addq	$1, %r12
	cmpl	%eax, %edx
	jg	.L4
	testl	%edx, %edx
	jle	.L2
	movq	40(%rsp), %r9
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
	leaq	64(%rsp), %rsi
	cmovs	%eax, %edx
	xorl	%edi, %edi
	sarl	$2, %edx
	movl	%edx, %r15d
	call	clock_gettime
	movl	60(%rsp), %eax
	testl	%eax, %eax
	movl	%eax, 8(%rsp)
	jle	.L9
	movl	%r15d, %eax
	xorl	%r14d, %r14d
	movq	%rbp, 16(%rsp)
	sall	$2, %eax
	movl	%eax, %esi
	movl	%eax, 12(%rsp)
	movl	8(%rsp), %eax
	leal	-1(%rax), %edx
	movq	%rdx, %rax
	leaq	4(,%rdx,4), %rdx
	subl	%esi, %eax
	movq	%rdx, (%rsp)
	movl	%r15d, %edx
	leaq	1(%rax), %r12
	subl	$1, %edx
	salq	$4, %rdx
	addq	$20, %rdx
	movq	%rdx, 24(%rsp)
	movslq	%esi, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	0(%rbp,%rdx,8), %r13
	movq	%rcx, 32(%rsp)
.L17:
	movq	40(%rsp), %rax
	movq	(%rax,%r14,8), %rbp
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	testl	%r15d, %r15d
	jle	.L19
	movq	(%rbx,%r14,8), %r11
	movq	16(%rsp), %rsi
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	leaq	4(%r11), %rdx
	addq	24(%rsp), %r11
	leaq	8(%rsi), %rcx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L10:
	movq	-8(%rcx), %rdi
	addq	$16, %rdx
	addq	$32, %rcx
	movl	(%rdi,%rax), %edi
	imull	-20(%rdx), %edi
	addl	%edi, %esi
	movq	-32(%rcx), %rdi
	movl	(%rdi,%rax), %edi
	imull	-16(%rdx), %edi
	addl	%edi, %r8d
	movq	-24(%rcx), %rdi
	movl	(%rdi,%rax), %edi
	imull	-12(%rdx), %edi
	addl	%edi, %r9d
	movq	-16(%rcx), %rdi
	movl	(%rdi,%rax), %edi
	imull	-8(%rdx), %edi
	addl	%edi, %r10d
	cmpq	%r11, %rdx
	jne	.L10
	addl	%r8d, %esi
	addl	%r9d, %esi
	addl	%esi, %r10d
.L16:
	movl	12(%rsp), %edx
	cmpl	%edx, 8(%rsp)
	movl	%r10d, 0(%rbp,%rax)
	jle	.L15
	movq	32(%rsp), %rsi
	addq	(%rbx,%r14,8), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L14:
	movq	0(%r13,%rdx,8), %rcx
	movl	(%rcx,%rax), %ecx
	imull	(%rsi,%rdx,4), %ecx
	addq	$1, %rdx
	addl	%ecx, %r10d
	cmpq	%r12, %rdx
	jne	.L14
	movl	%r10d, 0(%rbp,%rax)
.L15:
	addq	$4, %rax
	cmpq	(%rsp), %rax
	jne	.L12
	addq	$1, %r14
	cmpl	%r14d, 8(%rsp)
	jg	.L17
	movq	16(%rsp), %rbp
.L9:
	leaq	80(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	88(%rsp), %rax
	subq	72(%rsp), %rax
	movl	$.LC4, %esi
	pxor	%xmm0, %xmm0
	movslq	60(%rsp), %rdx
	movq	40(%rsp), %r15
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	80(%rsp), %rax
	subq	64(%rsp), %rax
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
	movq	104(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L32
	addq	$120, %rsp
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
	xorl	%r10d, %r10d
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
