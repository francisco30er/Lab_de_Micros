
section .data

I1 DQ 0xffffffff00221820; 


section .bss



section .text

global _start

_start:
	mov r8,rsp
	



Exit:
	mov rax,60
	mov rdi,0
	syscall
