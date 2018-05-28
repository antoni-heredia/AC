	.file	"pmm-secuencial.c"
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
	.string	"La matriz2 inicializada es:"
.LC5:
	.string	"El matriz1 inicializado es:"
.LC6:
	.string	"%d,"
.LC7:
	.string	"%d]\n"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"El resultado de multiplicarlo es:"
	.section	.rodata.str1.1
.LC9:
	.string	"El tiempo usado es%f:\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB10:
	.section	.text.startup,"ax",@progbits
.LHOTB10:
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	__printf_chk
	leaq	28(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movslq	28(%rsp), %rdi
	salq	$3, %rdi
	call	malloc
	movslq	28(%rsp), %rdi
	movq	%rax, %rbx
	salq	$3, %rdi
	call	malloc
	movslq	28(%rsp), %rdi
	movq	%rax, %rbp
	salq	$3, %rdi
	call	malloc
	movslq	28(%rsp), %rdx
	movq	%rax, %r12
	testl	%edx, %edx
	jle	.L2
	xorl	%r13d, %r13d
.L4:
	leaq	0(,%rdx,4), %rdi
	call	malloc
	movslq	28(%rsp), %rdi
	movq	%rax, %r14
	movq	%rax, (%r12,%r13,8)
	salq	$2, %rdi
	call	malloc
	movslq	28(%rsp), %rdi
	movq	%rax, (%rbx,%r13,8)
	salq	$2, %rdi
	call	malloc
	testq	%r14, %r14
	movq	%rax, 0(%rbp,%r13,8)
	je	.L48
.L3:
	movslq	28(%rsp), %rdx
	leal	1(%r13), %eax
	addq	$1, %r13
	cmpl	%eax, %edx
	jg	.L4
	testl	%edx, %edx
	jle	.L2
	xorl	%r8d, %r8d
.L7:
	movq	(%r12,%r8,8), %rdi
	movq	(%rbx,%r8,8), %rsi
	xorl	%eax, %eax
	movq	0(%rbp,%r8,8), %rcx
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
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	28(%rsp), %edi
	testl	%edi, %edi
	jle	.L9
	leal	-1(%rdi), %eax
	xorl	%r11d, %r11d
	leaq	4(,%rax,4), %r10
.L12:
	movq	0(%rbp,%r11,8), %r9
	movq	(%rbx,%r11,8), %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%r9,%rsi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r12,%rax,8), %rdx
	movl	(%rdx,%rsi), %edx
	imull	(%r8,%rax,4), %edx
	addq	$1, %rax
	addl	%edx, %ecx
	cmpl	%eax, %edi
	jg	.L10
	movl	%ecx, (%r9,%rsi)
	addq	$4, %rsi
	cmpq	%r10, %rsi
	jne	.L13
	addq	$1, %r11
	cmpl	%r11d, %edi
	jg	.L12
.L9:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	movq	%r12, %r15
	call	clock_gettime
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movl	$.LC4, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	puts
	movl	28(%rsp), %ecx
	movl	$0, 4(%rsp)
	testl	%ecx, %ecx
	jle	.L20
.L32:
	movl	$91, %edi
	call	putchar
	movslq	28(%rsp), %rax
	cmpl	$1, %eax
	jle	.L17
	movq	(%r15), %r14
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L18:
	movl	(%r14), %edx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	movl	$1, %edi
	addl	$1, %r13d
	addq	$4, %r14
	call	__printf_chk
	movslq	28(%rsp), %rax
	leal	-1(%rax), %edx
	cmpl	%r13d, %edx
	jg	.L18
.L17:
	movq	-8(%r12,%rax,8), %rdx
	movl	$.LC7, %esi
	movl	$1, %edi
	addq	$8, %r15
	movl	-4(%rdx,%rax,4), %edx
	xorl	%eax, %eax
	call	__printf_chk
	addl	$1, 4(%rsp)
	movl	4(%rsp), %eax
	cmpl	%eax, 28(%rsp)
	jg	.L32
.L20:
	movl	$.LC5, %edi
	movq	%rbx, %r15
	call	puts
	movl	28(%rsp), %edx
	movl	$0, 4(%rsp)
	testl	%edx, %edx
	jle	.L16
.L31:
	movl	$91, %edi
	call	putchar
	movslq	28(%rsp), %rax
	cmpl	$1, %eax
	jle	.L23
	movq	(%r15), %r14
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L24:
	movl	(%r14), %edx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	movl	$1, %edi
	addl	$1, %r13d
	addq	$4, %r14
	call	__printf_chk
	movslq	28(%rsp), %rax
	leal	-1(%rax), %edx
	cmpl	%r13d, %edx
	jg	.L24
.L23:
	movq	-8(%rbx,%rax,8), %rdx
	movl	$.LC7, %esi
	movl	$1, %edi
	addq	$8, %r15
	movl	-4(%rdx,%rax,4), %edx
	xorl	%eax, %eax
	call	__printf_chk
	addl	$1, 4(%rsp)
	movl	4(%rsp), %eax
	cmpl	%eax, 28(%rsp)
	jg	.L31
.L16:
	movl	$.LC8, %edi
	movq	%rbp, %r15
	call	puts
	movl	28(%rsp), %eax
	movl	$0, 4(%rsp)
	testl	%eax, %eax
	jle	.L22
.L30:
	movl	$91, %edi
	call	putchar
	movslq	28(%rsp), %rax
	cmpl	$1, %eax
	jle	.L26
	movq	(%r15), %r14
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L27:
	movl	(%r14), %edx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	movl	$1, %edi
	addl	$1, %r13d
	addq	$4, %r14
	call	__printf_chk
	movslq	28(%rsp), %rax
	leal	-1(%rax), %edx
	cmpl	%r13d, %edx
	jg	.L27
.L26:
	movq	-8(%rbp,%rax,8), %rdx
	movl	$.LC7, %esi
	movl	$1, %edi
	addq	$8, %r15
	movl	-4(%rdx,%rax,4), %edx
	xorl	%eax, %eax
	call	__printf_chk
	addl	$1, 4(%rsp)
	movl	4(%rsp), %eax
	cmpl	%eax, 28(%rsp)
	jg	.L30
.L22:
	movsd	8(%rsp), %xmm0
	movl	$.LC9, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%r12, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L49
	addq	$88, %rsp
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
.L48:
	.cfi_restore_state
	movl	$.LC2, %edi
	call	perror
	jmp	.L3
.L49:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE10:
	.section	.text.startup
.LHOTE10:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
