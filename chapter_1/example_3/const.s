	.file	"const_optimization.cpp"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Sum: \0"
.LC1:
	.ascii "\12\0"
	.text
	.p2align 4
	.globl	_Z13process_arrayPKiy
	.def	_Z13process_arrayPKiy;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z13process_arrayPKiy
_Z13process_arrayPKiy:
.LFB2214:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	testq	%rdx, %rdx
	je	.L4
	leaq	(%rcx,%rdx,4), %rax
	xorl	%ebx, %ebx
	.p2align 4
	.p2align 4
	.p2align 3
.L3:
	addl	(%rcx), %ebx
	addq	$4, %rcx
	cmpq	%rax, %rcx
	jne	.L3
.L2:
	movq	.refptr._ZSt4cout(%rip), %rsi
	movl	$5, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rsi, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%ebx, %edx
	movq	%rsi, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%ebx, %ebx
	jmp	.L2
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "Result: \0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2215:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	movups	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	movups	%xmm7, 48(%rsp)
	.seh_savexmm	%xmm7, 48
	.seh_endprologue
	leaq	_ZZ4mainE4data(%rip), %rbx
	call	__main
	movl	$1374389535, %r8d
	movq	%rbx, %rcx
	movl	$4, %r9d
	movd	%r8d, %xmm3
	movd	%r9d, %xmm5
	movq	%rbx, %rax
	movdqu	.LC2(%rip), %xmm2
	pshufd	$0, %xmm3, %xmm3
	movdqa	%xmm3, %xmm4
	pshufd	$0, %xmm5, %xmm5
	leaq	4000000(%rbx), %rdx
	psrad	$31, %xmm4
	.p2align 4
	.p2align 3
.L8:
	movdqa	%xmm2, %xmm1
	movdqa	%xmm4, %xmm6
	movdqa	%xmm2, %xmm0
	addq	$16, %rax
	psrad	$31, %xmm1
	pmuludq	%xmm2, %xmm6
	movdqa	%xmm4, %xmm7
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm3, %xmm0
	paddq	%xmm6, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	psrlq	$32, %xmm1
	movdqa	%xmm1, %xmm6
	pmuludq	%xmm1, %xmm7
	psrad	$31, %xmm6
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm3, %xmm6
	paddq	%xmm7, %xmm6
	psllq	$32, %xmm6
	paddq	%xmm6, %xmm1
	shufps	$221, %xmm1, %xmm0
	pshufd	$216, %xmm0, %xmm0
	psrad	$5, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$1, %xmm1
	paddd	%xmm0, %xmm1
	pslld	$3, %xmm1
	paddd	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	paddd	%xmm5, %xmm2
	pslld	$2, %xmm0
	psubd	%xmm0, %xmm1
	movups	%xmm1, -16(%rax)
	cmpq	%rax, %rdx
	jne	.L8
	movl	$1000000, %edx
	pxor	%xmm6, %xmm6
	call	_Z13process_arrayPKiy
	leaq	4000+_ZZ4mainE4data(%rip), %rax
	movq	%rax, %rdx
	subq	%rbx, %rdx
	andl	$16, %edx
	je	.L9
	movdqu	(%rbx), %xmm6
	addq	$16, %rbx
	cmpq	%rbx, %rax
	je	.L17
	.p2align 5
	.p2align 4
	.p2align 3
.L9:
	paddd	(%rbx), %xmm6
	addq	$32, %rbx
	paddd	-16(%rbx), %xmm6
	cmpq	%rbx, %rax
	jne	.L9
.L17:
	movq	.refptr._ZSt4cout(%rip), %rcx
	leaq	.LC5(%rip), %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movdqa	%xmm6, %xmm0
	psrldq	$8, %xmm0
	movq	%rax, %rcx
	paddd	%xmm0, %xmm6
	movdqa	%xmm6, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm6
	movd	%xmm6, %edx
	call	_ZNSolsEi
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	nop
	movups	32(%rsp), %xmm6
	movups	48(%rsp), %xmm7
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
	ret
	.seh_endproc
.lcomm _ZZ4mainE4data,4000000,32
	.section .rdata,"dr"
	.align 16
.LC2:
	.long	0
	.long	1
	.long	2
	.long	3
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
