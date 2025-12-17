	.file	"inline.cpp"
	.text
	.p2align 4
	.globl	_Z12add_noinlineii
	.def	_Z12add_noinlineii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12add_noinlineii
_Z12add_noinlineii:
.LFB2556:
	.seh_endprologue
	leal	(%rcx,%rdx), %eax
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Sum: \0"
.LC4:
	.ascii "\12\0"
.LC5:
	.ascii "Time: \0"
.LC6:
	.ascii " us(microseconds)\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2558:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	movups	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	.seh_endprologue
	movl	$2, %esi
	pxor	%xmm6, %xmm6
	call	__main
	call	_ZNSt6chrono3_V212system_clock3nowEv
	pcmpeqd	%xmm3, %xmm3
	movd	%esi, %xmm2
	movdqu	.LC0(%rip), %xmm0
	movq	%rax, %rbx
	psrld	$31, %xmm3
	xorl	%eax, %eax
	pshufd	$0, %xmm2, %xmm2
	.p2align 5
	.p2align 4
	.p2align 3
.L4:
	movdqa	%xmm0, %xmm1
	addl	$1, %eax
	paddd	%xmm3, %xmm1
	paddd	%xmm0, %xmm1
	paddd	%xmm2, %xmm0
	paddd	%xmm1, %xmm6
	cmpl	$5000000, %eax
	jne	.L4
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	.refptr._ZSt4cout(%rip), %rsi
	movabsq	$2361183241434822607, %rdx
	movl	$5, %r8d
	subq	%rbx, %rax
	movq	%rax, %rcx
	imulq	%rdx
	sarq	$63, %rcx
	sarq	$7, %rdx
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
	movl	$18, %r8d
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
	.long	0
	.long	1
	.long	1
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
