section .data

R0 DQ 0x0000000000000000
R1 DQ 0x0000000000000001
R2 DQ 0x0000000000000001
R3 DQ 0x0000000000000000
R4 DQ 0x0000000000000010
R5 DQ 0x0000000000000000
R6 DQ 0x0000000000000000



Ix DQ 0xffffffff00000000
I1 DQ 0xffffffff00000000
I2 DQ 0xffffffff00000000
I3 DQ 0xffffffff00000000
I4 DQ 0xffffffff00000000
I5 DQ 0xffffffff00000000
I6 DQ 0xffffffff00000000
I7 DQ 0xffffffff00000000
I8 DQ 0xffffffff00000000
I9 DQ 0xffffffff00000000
I10 DQ 0xffffffff00000000

file db "archivo5.txt"


section .bss

text resb 300

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
	mov rdx, 300
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
	mov r15, 0x0
Loop:
	mov byte cl, [rax]
	cmp cl, r8b
	jne check_zero
	mov r13, [r12]
	rol r13, 1
	mov [r12], r13
	inc rbx
	inc rax
	jmp Loop

check_zero:
	mov byte cl, [rax]
	cmp cl, r9b
	jne check_next
	mov r13, [r12]
	sal r13, 1
	mov [r12], r13
	inc rbx
	inc rax
	jmp Loop

check_next:
	mov byte cl, [rax]
	cmp cl, r10b
	jne check_null
	add r12, 0x8
	inc r14
	inc rax
	jmp Loop

check_null:
        mov byte cl, [rax]
        cmp cl, 0
        je Mascara
	inc rax
	jmp Loop
	
Mascara:

	mov r15, I1
	
Begin:
	mov r8, 0xfc000000
	and r8, [r15]
	sar r8, 26; OPCODE
	
	mov r13, 0x0
	cmp r8, r13
	je Function

	;INMEDIATE
	mov r11, 0xFFFF
	and r11, [r15]
	
	;RT
	mov r9,0x1f0000
	and r9, [r15]
	sar r9, 16
	mov rax, 0x8
	mul r9
	mov r9, R0
	add r9, rax

	;RS
	mov r10,0x3e00000
	and r10, [r15]
	sar r10, 21
	mov rax, 0x8
	mul r10
	mov r10, R0
	add r10, rax
	mov r10, [r10]

	;SLTI
	mov r13, 0xa
	cmp r8, r13
	je Slti

	;SLTIU
	mov r13, 0xb
	cmp r8, r13
	je Sltiu
	
	jmp Exit
	

Function:
	;RD
	mov r8,0xf800
	and r8, [r15]
	sar r8, 11
	mov rax, 0x8
	mul r8
	mov r8, R0
	add r8, rax

	;RT
	mov r9,0x1f0000
	and r9, [r15]
	sar r9, 16
	mov rax, 0x8
	mul r9
	mov r9, R0
	add r9, rax
	mov r9, [r9]

	;RS
	mov r10,0x3e00000
	and r10, [r15]
	sar r10, 21
	mov rax, 0x8
	mul r10
	mov r10, R0
	add r10, rax
	mov r10, [r10]

	;Function
	mov r12, 0x3f
	and r12, [r15]

	;ADD
	mov r13, 0x20
	cmp r12, r13
	je Add

	;SLL
	mov r13, 0x00
	cmp r12, r13
	je Sll

	;SRL
	mov r13, 0x02
	cmp r12, r13
	je Srl

	;SLT
	mov r13, 0x2a
	cmp r12, r13
	je Slt

	;SLTU
	mov r13, 0x2b
	cmp r12, r13
	je Sltu

	;MUL
	mov r13, 0x18
	cmp r12, r13
	je Mul

	;SUBU
	mov r13, 0x23
	cmp r12, r13
	je Subu

	jmp Exit

Add:
	add r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Subu:
	sal r9, 31
	sar r9, 31
	sal r10, 31
	sar r10, 31
	sub r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Sll:
	;SHAMT
        mov r11, [r15];
        mov r13, 0x7c0;
        and r11, r13; MASCARA
        sar r11, 6; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DE CORRIMIENTO
Loop_sll:
        cmp r11, 0x0
        jz Out_sll
	sal r9, 1
        dec r11
        jmp Loop_sll
Out_sll:
        mov [r8], r9
	add r15, 0x8
	jmp Begin


Srl:
	;SHAMT
        mov r11, [r15];
        mov r13, 0x7c0;
        and r11, r13; MASCARA
        sar r11, 6; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DE CORRIMIENTO
Loop_srl:
        cmp r11, 0x0
        jz Out_srl
	sar r9, 1
        dec r11
        jmp Loop_srl
Out_srl:
        mov [r8], r9
	add r15, 0x8
	jmp Begin

Slt:
	cmp r10, r9
	jg Greater
	mov rax, 0x1
	mov [r8], rax
	add r15, 0x8
	jmp Begin
Greater:
	mov rax, 0x0
	mov [r8], rax
	add r15, 0x8
	jmp Begin

Sltu:
	sal r9, 31
	sar r9, 31
	sal r10, 31
	sar r10, 31
	cmp r10, r9
	jg Greateru
	mov rax, 0x1
	mov [r8], rax
	add r15, 0x8
	jmp Begin
Greateru:
	mov rax, 0x0
	mov [r8], rax
	add r15, 0x8
	jmp Begin
	

Slti:
	cmp r10, r11
	jg GreaterI
	mov rax, 0x1
	mov [r9], rax
	add r15, 0x8
	jmp Begin
GreaterI:
	mov rax, 0x0
	mov [r9], rax
	add r15, 0x8
	jmp Begin

Sltiu:
	sal r10, 31
	sar r10, 31
	sal r11, 31
	sar r11, 31
	cmp r10, r11
	jg GreaterIu
	mov rax, 0x1
	mov [r9], rax
	add r15, 0x8
	jmp Begin
GreaterIu:
	mov rax, 0x0
	mov [r9], rax
	add r15, 0x8
	jmp Begin

Mul:
	mov rax, r9
	imul r10
	mov [r8], rax
	add r15, 0x8
	jmp Begin


Exit:
	mov r8, [R0]
	mov r9, [R1]
	mov r10, [R2]
	mov r11, [R3]
	mov r12, [I1]
	mov r13, [I2]
C:
	mov rax, 60
	mov rdi, 0
	syscall

