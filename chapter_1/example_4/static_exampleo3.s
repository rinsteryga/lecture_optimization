	.file	"static_example.cpp"
	.text
	.p2align 4
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0:
.LFB3145:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	je	.L4
	movq	%rdx, %rcx
	movq	%rdx, 40(%rsp)
	call	strlen
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	movq	%rax, %r8
	addq	$48, %rsp
	popq	%rbx
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	.p2align 4,,10
	.p2align 3
.L4:
	movq	(%rcx), %rax
	addq	-24(%rax), %rbx
	movl	32(%rbx), %edx
	movq	%rbx, %rcx
	orl	$1, %edx
	addq	$48, %rsp
	popq	%rbx
	jmp	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	.seh_endproc
	.p2align 4
	.globl	_Z17counter_no_staticv
	.def	_Z17counter_no_staticv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z17counter_no_staticv
_Z17counter_no_staticv:
.LFB2556:
	.seh_endprologue
	movl	$1, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z19counter_with_staticv
	.def	_Z19counter_with_staticv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z19counter_with_staticv
_Z19counter_with_staticv:
.LFB2557:
	.seh_endprologue
	movl	_ZZ19counter_with_staticvE5count(%rip), %eax
	addl	$1, %eax
	movl	%eax, _ZZ19counter_with_staticvE5count(%rip)
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z17compute_expensivei
	.def	_Z17compute_expensivei;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z17compute_expensivei
_Z17compute_expensivei:
.LFB2558:
	subq	$56, %rsp
	.seh_stackalloc	56
	movups	%xmm6, (%rsp)
	.seh_savexmm	%xmm6, 0
	movups	%xmm7, 16(%rsp)
	.seh_savexmm	%xmm7, 16
	movups	%xmm8, 32(%rsp)
	.seh_savexmm	%xmm8, 32
	.seh_endprologue
	pxor	%xmm8, %xmm8
	cmpl	$99, %ecx
	jbe	.L14
.L7:
	movapd	%xmm8, %xmm0
	movups	(%rsp), %xmm6
	movups	16(%rsp), %xmm7
	movups	32(%rsp), %xmm8
	addq	$56, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	leaq	_ZZ17compute_expensiveiE8computed(%rip), %r8
	movslq	%ecx, %rdx
	cmpb	$0, (%r8,%rdx)
	jne	.L15
	movd	%ecx, %xmm4
	movdqu	.LC0(%rip), %xmm2
	movl	$4, %ecx
	xorl	%eax, %eax
	pshufd	$0, %xmm4, %xmm4
	movddup	.LC3(%rip), %xmm3
	movdqa	%xmm4, %xmm6
	movd	%ecx, %xmm5
	psrlq	$32, %xmm6
	pshufd	$0, %xmm5, %xmm5
	.p2align 4
	.p2align 3
.L11:
	movdqa	%xmm2, %xmm0
	movdqa	%xmm2, %xmm1
	paddd	%xmm5, %xmm2
	addl	$1, %eax
	psrlq	$32, %xmm0
	pmuludq	%xmm4, %xmm1
	pmuludq	%xmm6, %xmm0
	pshufd	$8, %xmm1, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	cvtdq2pd	%xmm1, %xmm7
	divpd	%xmm3, %xmm7
	pshufd	$238, %xmm1, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm3, %xmm0
	movapd	%xmm7, %xmm1
	unpckhpd	%xmm7, %xmm7
	addsd	%xmm8, %xmm1
	addsd	%xmm7, %xmm1
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm8
	cmpl	$250, %eax
	jne	.L11
	leaq	_ZZ17compute_expensiveiE5cache(%rip), %rax
	movb	$1, (%r8,%rdx)
	movsd	%xmm1, (%rax,%rdx,8)
	jmp	.L7
.L15:
	leaq	_ZZ17compute_expensiveiE5cache(%rip), %rax
	movsd	(%rax,%rdx,8), %xmm8
	jmp	.L7
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "No static (always 1): \0"
.LC6:
	.ascii " \0"
.LC7:
	.ascii "\12\0"
.LC8:
	.ascii "With static (increments): \0"
.LC9:
	.ascii "Cached computation time: \0"
.LC10:
	.ascii " us\12\0"
.LC11:
	.ascii "Total: \0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2559:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	movups	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	movups	%xmm7, 48(%rsp)
	.seh_savexmm	%xmm7, 48
	movups	%xmm8, 64(%rsp)
	.seh_savexmm	%xmm8, 64
	movups	%xmm9, 80(%rsp)
	.seh_savexmm	%xmm9, 80
	.seh_endprologue
	movl	$5, %esi
	call	__main
	movq	.refptr._ZSt4cout(%rip), %rbx
	leaq	.LC5(%rip), %rdx
	movq	%rbx, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
.L17:
	movl	$1, %edx
	movq	%rbx, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	subl	$1, %esi
	jne	.L17
	leaq	.LC7(%rip), %rdx
	movq	%rbx, %rcx
	movl	$5, %esi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	leaq	.LC8(%rip), %rdx
	movq	%rbx, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
.L18:
	movl	_ZZ19counter_with_staticvE5count(%rip), %eax
	movq	%rbx, %rcx
	leal	1(%rax), %edx
	movl	%edx, _ZZ19counter_with_staticvE5count(%rip)
	call	_ZNSolsEi
	movl	$1, %r8d
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	subl	$1, %esi
	jne	.L18
	leaq	.LC7(%rip), %rdx
	movq	%rbx, %rcx
	pxor	%xmm7, %xmm7
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movddup	.LC3(%rip), %xmm4
	xorl	%edx, %edx
	leaq	_ZZ17compute_expensiveiE8computed(%rip), %r8
	movq	%rax, %rsi
	movl	$4, %eax
	leaq	_ZZ17compute_expensiveiE5cache(%rip), %r10
	movl	$3435973837, %r9d
	movd	%eax, %xmm6
	pshufd	$0, %xmm6, %xmm6
	jmp	.L22
.L28:
	movsd	(%r10,%rcx,8), %xmm9
	addl	$1, %edx
	addsd	%xmm9, %xmm7
	cmpl	$10000, %edx
	je	.L27
.L22:
	movl	%edx, %eax
	imulq	%r9, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %ecx
	movl	%edx, %eax
	addl	%ecx, %ecx
	subl	%ecx, %eax
	movslq	%eax, %rcx
	cmpb	$0, (%r8,%rcx)
	jne	.L28
	movd	%eax, %xmm5
	movdqu	.LC0(%rip), %xmm3
	xorl	%eax, %eax
	pxor	%xmm9, %xmm9
	pshufd	$0, %xmm5, %xmm5
	movdqa	%xmm5, %xmm1
	psrlq	$32, %xmm1
	.p2align 4
	.p2align 3
.L21:
	movdqa	%xmm3, %xmm0
	movdqa	%xmm3, %xmm2
	paddd	%xmm6, %xmm3
	addl	$1, %eax
	psrlq	$32, %xmm0
	pmuludq	%xmm5, %xmm2
	pmuludq	%xmm1, %xmm0
	pshufd	$8, %xmm2, %xmm2
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm2
	cvtdq2pd	%xmm2, %xmm8
	divpd	%xmm4, %xmm8
	pshufd	$238, %xmm2, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm4, %xmm0
	movapd	%xmm8, %xmm2
	unpckhpd	%xmm8, %xmm8
	addsd	%xmm9, %xmm2
	addsd	%xmm8, %xmm2
	addsd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm9
	cmpl	$250, %eax
	jne	.L21
	addl	$1, %edx
	movb	$1, (%r8,%rcx)
	addsd	%xmm9, %xmm7
	movsd	%xmm2, (%r10,%rcx,8)
	cmpl	$10000, %edx
	jne	.L22
.L27:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movl	$25, %r8d
	movabsq	$2361183241434822607, %rdx
	subq	%rsi, %rax
	movq	%rax, %rcx
	imulq	%rdx
	sarq	$63, %rcx
	sarq	$7, %rdx
	movq	%rdx, %rsi
	leaq	.LC9(%rip), %rdx
	subq	%rcx, %rsi
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	_ZNSo9_M_insertIxEERSoT_
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$7, %r8d
	leaq	.LC11(%rip), %rdx
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movapd	%xmm7, %xmm1
	movq	%rbx, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	nop
	movups	32(%rsp), %xmm6
	movups	48(%rsp), %xmm7
	xorl	%eax, %eax
	movups	64(%rsp), %xmm8
	movups	80(%rsp), %xmm9
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
.lcomm _ZZ17compute_expensiveiE8computed,100,32
.lcomm _ZZ17compute_expensiveiE5cache,800,32
.lcomm _ZZ19counter_with_staticvE5count,4,4
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 8
.LC3:
	.long	0
	.long	1083129856
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6chrono3_V212system_clock3nowEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIxEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
