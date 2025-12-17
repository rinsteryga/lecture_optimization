	.file	"optimization_levels.cpp"
	.text
	.p2align 4
	.globl	_Z7computei
	.def	_Z7computei;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7computei
_Z7computei:
.LFB2556:
	.seh_endprologue
	movl	%ecx, %edx
	testl	%ecx, %ecx
	jle	.L7
	leal	-1(%rcx), %eax
	cmpl	$5, %eax
	jbe	.L8
	movl	$4, %r9d
	shrl	$2, %ecx
	xorl	%eax, %eax
	pxor	%xmm3, %xmm3
	movdqu	.LC0(%rip), %xmm2
	movd	%r9d, %xmm4
	pshufd	$0, %xmm4, %xmm4
	.p2align 6
	.p2align 4
	.p2align 3
.L4:
	movdqa	%xmm2, %xmm0
	movdqa	%xmm2, %xmm1
	addl	$1, %eax
	psrlq	$32, %xmm0
	pmuludq	%xmm2, %xmm1
	paddd	%xmm4, %xmm2
	pmuludq	%xmm0, %xmm0
	pshufd	$8, %xmm1, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	paddd	%xmm1, %xmm3
	cmpl	%ecx, %eax
	jne	.L4
	movdqa	%xmm3, %xmm0
	movl	%edx, %ecx
	psrldq	$8, %xmm0
	andl	$-4, %ecx
	paddd	%xmm0, %xmm3
	movdqa	%xmm3, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm3
	movd	%xmm3, %eax
	testb	$3, %dl
	je	.L1
.L3:
	movl	%ecx, %r8d
	imull	%ecx, %r8d
	addl	%r8d, %eax
	leal	1(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	imull	%r8d, %r8d
	addl	%r8d, %eax
	leal	2(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	imull	%r8d, %r8d
	addl	%r8d, %eax
	leal	3(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	imull	%r8d, %r8d
	addl	%r8d, %eax
	leal	4(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	imull	%r8d, %r8d
	addl	$5, %ecx
	addl	%r8d, %eax
	movl	%ecx, %r8d
	imull	%ecx, %r8d
	addl	%eax, %r8d
	cmpl	%ecx, %edx
	cmovg	%r8d, %eax
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	ret
.L8:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L3
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Result: \0"
.LC4:
	.ascii "\12\0"
.LC5:
	.ascii "Time: \0"
.LC6:
	.ascii " ms\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2557:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	movups	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	.seh_endprologue
	pxor	%xmm6, %xmm6
	call	__main
	call	_ZNSt6chrono3_V212system_clock3nowEv
	pcmpeqd	%xmm4, %xmm4
	xorl	%edx, %edx
	movq	%rax, %rbx
	psrld	$31, %xmm4
	.p2align 4
	.p2align 3
.L12:
	pxor	%xmm3, %xmm3
	movl	$10000, %eax
	movdqa	%xmm3, %xmm2
	.p2align 6
	.p2align 4
	.p2align 3
.L13:
	movdqa	%xmm2, %xmm0
	movdqa	%xmm2, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm2, %xmm1
	paddd	%xmm4, %xmm2
	pmuludq	%xmm0, %xmm0
	pshufd	$8, %xmm1, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	paddd	%xmm1, %xmm3
	subl	$1, %eax
	jne	.L13
	addl	$1, %edx
	paddd	%xmm3, %xmm6
	cmpl	$250, %edx
	jne	.L12
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	.refptr._ZSt4cout(%rip), %rsi
	movabsq	$4835703278458516699, %rdx
	movl	$8, %r8d
	subq	%rbx, %rax
	movq	%rax, %rcx
	imulq	%rdx
	sarq	$63, %rcx
	sarq	$18, %rdx
	movq	%rdx, %rbx
	leaq	.LC3(%rip), %rdx
	subq	%rcx, %rbx
	movq	%rsi, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movdqa	%xmm6, %xmm0
	movq	%rsi, %rcx
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm6
	movdqa	%xmm6, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm6
	movd	%xmm6, %edx
	call	_ZNSolsEi
	movl	$1, %r8d
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$6, %r8d
	movq	%rsi, %rcx
	leaq	.LC5(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	_ZNSo9_M_insertIxEERSoT_
	movl	$4, %r8d
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	nop
	movups	32(%rsp), %xmm6
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	_ZNSt6chrono3_V212system_clock3nowEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIxEERSoT_;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
