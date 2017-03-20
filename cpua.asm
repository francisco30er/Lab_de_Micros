global main
extern system

section .data


;a: db 'lscpu | grep ID;lscpu | grep Model;lscpu | grep Familia',0xA
a: db 'top -bn1 | grep "Cpu(s)"',0xA   ;
section .text
	
;global _start

main:
        push   rbp
	mov  rbp, rsp
	mov  rdi, a
	call system

Exit:
	mov rax, 60
	mov rdi, 0
	syscall

