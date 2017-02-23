;lee el archivo y almecena las instrucciones en el espacio de memoria

section .data

	I1 DD 0xffff

	file db "file.txt"

	cons_hola: db 'Fine'
	cons_tamano: equ $-cons_hola

section .bss

	text resb 100

section .text

global _start

_start:

	;OPEN FILE
	mov rax, 2
	mov rdi, file
	mov rsi, 0
	mov rdx, 0
	syscall

	;READ FILE
	push rax
	mov rdi, rax
	mov rax, 0
	mov rsi, text
	mov rdx, 100
	syscall


	;CLOSE FILE
	mov rax, 3
	pop rdi
	syscall


	mov rbx, text
	mov r9, I1
Loop:
	;COMPARACION CON 0
	mov cl, [rbx]
	cmp cl, 0x0
	je check_one
	mov r10, [r9]
	sal r10, 1
	mov [r9], r10
	inc rbx
	jmp Loop

check_one:
	;COMPARACION CON 1
	mov cl, [rbx]
	cmp cl, 0x1
	jne check_null
	mov r10, [r9]
	rol r10, 1
	mov [r9], r10
	inc rbx
	jmp Loop

check_null:
	;COMPARACION CON NULL
	mov cl, [rbx]
        cmp cl, 0
        je Exit

        ;COMPARACION CON SALTO DE LINEA
	inc rbx
        cmp cl, 0x3 ; verificar el valor ascii
        jne Loop
        add r9, 8; cambia la direccion de r9, I1 + 8
	jmp Loop


Exit:
	mov rax, 60
	mov rdi, 0
	syscall

