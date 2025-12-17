	.file	"mutable.cpp"
	.text
	.align 2
	.p2align 4
	.def	_ZNK20ExpensiveCalculation7computeEv.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNK20ExpensiveCalculation7computeEv.isra.0
_ZNK20ExpensiveCalculation7computeEv.isra.0:
.LFB3699:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	movups	%xmm6, 48(%rsp)
	.seh_savexmm	%xmm6, 48
	movups	%xmm7, 64(%rsp)
	.seh_savexmm	%xmm7, 64
	.seh_endprologue
	movq	%rcx, %rsi
	cmpb	$0, 8(%rcx)
	jne	.L1
	movsd	16(%rcx), %xmm7
	leaq	40(%rsp), %rdx
	leaq	32(%rsp), %r8
	movl	$1000000, %ebx
	movapd	%xmm7, %xmm0
	call	sincos
	movsd	40(%rsp), %xmm6
	mulsd	32(%rsp), %xmm6
	.p2align 4
	.p2align 3
.L3:
	movapd	%xmm7, %xmm0
	call	exp
	mulsd	%xmm6, %xmm0
	movsd	%xmm0, (%rsi)
	subl	$1, %ebx
	jne	.L3
	movb	$1, 8(%rsi)
.L1:
	movups	48(%rsp), %xmm6
	movups	64(%rsp), %xmm7
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "First compute: \0"
.LC2:
	.ascii " us\12\0"
.LC3:
	.ascii "Cached compute: \0"
.LC4:
	.ascii "Speedup: \0"
.LC5:
	.ascii "x\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2964:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	call	__main
	movq	.LC0(%rip), %rax
	movb	$0, 40(%rsp)
	movq	%rax, 48(%rsp)
	call	_ZNSt6chrono3_V212system_clock3nowEv
	leaq	32(%rsp), %rcx
	movq	%rax, %rbx
	call	_ZNK20ExpensiveCalculation7computeEv.isra.0
	call	_ZNSt6chrono3_V212system_clock3nowEv
	subq	%rbx, %rax
	movabsq	$2361183241434822607, %rbx
	movq	%rax, %rcx
	imulq	%rbx
	sarq	$63, %rcx
	sarq	$7, %rdx
	movq	%rdx, %rsi
	subq	%rcx, %rsi
	call	_ZNSt6chrono3_V212system_clock3nowEv
	leaq	32(%rsp), %rcx
	movq	%rax, %rbp
	call	_ZNK20ExpensiveCalculation7computeEv.isra.0
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	.refptr._ZSt4cout(%rip), %rdi
	subq	%rbp, %rax
	movq	%rax, %rcx
	imulq	%rbx
	sarq	$63, %rcx
	movq	%rdx, %rbx
	leaq	.LC1(%rip), %rdx
	sarq	$7, %rbx
	subq	%rcx, %rbx
	movq	%rdi, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rsi, %rdx
	movq	%rax, %rcx
	call	_ZNSo9_M_insertIxEERSoT_
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rdi, %rcx
	leaq	.LC3(%rip), %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	_ZNSo9_M_insertIxEERSoT_
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	leaq	.LC4(%rip), %rdx
	movq	%rdi, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbx, %xmm0
	cvtsi2sdq	%rsi, %xmm1
	divsd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1074003968
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	sincos;	.scl	2;	.type	32;	.endef
	.def	exp;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6chrono3_V212system_clock3nowEv;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIxEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
