	.file	"Pregunta_2.c"
	.text
	.globl	_divisores
	.def	_divisores;	.scl	2;	.type	32;	.endef
_divisores:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	cmpl	$1, 8(%ebp)
	je	L2
	movl	$1, -8(%ebp)
	jmp	L3
L5:
	movl	8(%ebp), %eax
	cltd
	idivl	-8(%ebp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L4
	movl	-8(%ebp), %eax
	addl	%eax, -4(%ebp)
L4:
	addl	$1, -8(%ebp)
L3:
	movl	-8(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L5
	jmp	L6
L2:
	movl	$1, -4(%ebp)
L6:
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "El arreglo es: \0"
LC1:
	.ascii "%d \0"
LC2:
	.ascii "%d - Deficiente \12\0"
LC3:
	.ascii "%d - Perfecto \12\0"
LC4:
	.ascii "%d - Abundante \12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$96, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, 92(%esp)
	jmp	L9
L10:
	call	_rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	1(%eax), %edx
	movl	92(%esp), %eax
	movl	%edx, 24(%esp,%eax,4)
	movl	92(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, 92(%esp)
L9:
	cmpl	$14, 92(%esp)
	jle	L10
	movl	$10, (%esp)
	call	_putchar
	movl	$0, 88(%esp)
	jmp	L11
L15:
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, (%esp)
	call	_divisores
	movl	%eax, 84(%esp)
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	cmpl	84(%esp), %eax
	jle	L12
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L13
L12:
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	cmpl	84(%esp), %eax
	jne	L14
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	jmp	L13
L14:
	movl	88(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L13:
	addl	$1, 88(%esp)
L11:
	cmpl	$14, 88(%esp)
	jle	L15
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
