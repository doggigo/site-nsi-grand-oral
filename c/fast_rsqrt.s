	.file	"fast_rsqrt.c"
	.text
	.globl	q_rsqrt
	.type	q_rsqrt, @function
q_rsqrt:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -36(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-36(%rbp), %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-36(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	leaq	-20(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	sarq	%rax
	movq	%rax, %rdx
	movl	$1597463007, %eax
	subq	%rdx, %rax
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-8(%rbp), %xmm1
	movss	-20(%rbp), %xmm0
	movaps	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	movss	-4(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	movss	-20(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	q_rsqrt, .-q_rsqrt
	.globl	q_rsqrt_2
	.type	q_rsqrt_2, @function
q_rsqrt_2:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -36(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-36(%rbp), %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-36(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	leaq	-20(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	sarq	%rax
	movq	%rax, %rdx
	movl	$1597463007, %eax
	subq	%rdx, %rax
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-8(%rbp), %xmm1
	movss	-20(%rbp), %xmm0
	movaps	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	movss	-4(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	movss	-20(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-8(%rbp), %xmm1
	movss	-20(%rbp), %xmm0
	movaps	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	movss	-4(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	%xmm2, %xmm1
	movss	-20(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	q_rsqrt_2, .-q_rsqrt_2
	.globl	inverse_sqrt
	.type	inverse_sqrt, @function
inverse_sqrt:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movss	%xmm0, -4(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-4(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	inverse_sqrt, .-inverse_sqrt
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	.LC3(%rip), %eax
	movd	%eax, %xmm0
	call	q_rsqrt
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movl	.LC3(%rip), %eax
	movd	%eax, %xmm0
	call	q_rsqrt_2
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movl	.LC3(%rip), %eax
	movd	%eax, %xmm0
	call	inverse_sqrt
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1069547520
	.align 4
.LC1:
	.long	1056964608
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 4
.LC3:
	.long	1110704128
	.ident	"GCC: (Debian 13.2.0-7) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
