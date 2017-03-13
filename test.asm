extern system

section .data

info: db 'lscpu | grep Arquitectura',0xA
infot: equ $-info

 
section .text
    global _start
_start:
	
;push rax
	push rax
	mov rdi, rsi
	mov rsi, rax
	mov rsi, info	
	mov rdx, infot
	syscall

	mov rax, 60
	mov rdi, 0
	syscall



