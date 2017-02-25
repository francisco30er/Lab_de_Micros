section .data

I1 DQ 0xffffffff00000000

file db "archivo4.txt"


section .bss

text resb 100

section .text

global _start

_start:

	mov rax, 2
	mov rdi, file
	mov rsi, 0
	mov rdx, 0
	syscall

	push rax
	mov rdi, rax
	mov rax, 0
	mov rsi, text
	mov rdx, 100
	syscall

	mov rax, 3
	pop rdi
	syscall


	mov rax, text
	mov rbx, 0
	mov r8b, 0x31
	mov r9b, 0x30
	mov r10b, 0xa
	mov r12, I1
	mov r14, 0x0
printLoop:
	mov byte cl, [rax]
	cmp cl, r8b
	jne check_zero
	mov r13, [r12]
	rol r13, 1
	mov [r12], r13
	inc rbx
	inc rax
	jmp printLoop

check_zero:
	mov byte cl, [rax]
	cmp cl, r9b
	jne check_next
	mov r13, [r12]
	sal r13, 1
	mov [r12], r13
	inc rbx
	inc rax
	jmp printLoop

check_next:
	mov byte cl, [rax]
	cmp cl, r10b
	jne check_null
	add r12, 8
	inc r14
	inc rax
	inc rbx
	jmp printLoop

check_null:
        mov byte cl, [rax]
        cmp cl, 0
        je endPrintLoop
	inc rax
	jmp printLoop

endPrintLoop:
	mov rax, 1
	mov rdi, 0
	mov rsi, text
	mov rdx, rbx
	syscall
Exit:
	mov rax, 60
	mov rdi, 0
	syscall
