section .data

I1 DQ 0xffffffff00000000

file db "archivo4.txt"


section .bss

text resb 100

section .text

global _start

_start:


Mascara:
	mov r8, I1
Begin:
	mov r9, [r8]
	mov r10, 0xFC000000
	and r10, r9

	mov r9, 0x0
	cmp r10, r9
	je check_function


	mov r9, 0x20000000
	cmp r10, r9
	;je Addi

	mov r9, 0x24000000
        cmp r10, r9
        ;je Addu

	mov r9, 0x30000000
        cmp r10, r9
        ;je Andi

	mov r9, 0x10000000
        cmp r10, r9
        ;je Be

	mov r9, 0x14000000
        cmp r10, r9
        ;je Bne

	mov r9, 0x08000000
        cmp r10, r9
        ;je J

	mov r9, 0x0c000000
        cmp r10, r9
        ;je Jal

	mov r9, 0x8c000000
        cmp r10, r9
        ;je Lw

	mov r9, 0x34000000
        cmp r10, r9
        ;je Ori

	mov r9, 0x28000000
        cmp r10, r9
        ;je Slti

	mov r9, 0x2c000000
        cmp r10, r9
        ;je Sltiu

	mov r9, 0xac000000
	cmp r10, r9
	;je Sw

	;add r8, 8
	jmp Begin

check_function:
	mov r9, [r8]
	mov r10, 0x3F
	and r10, r9

	mov r9, 0x20
	cmp r10, r9
	;je Add

	mov r9, 0x24
	cmp r10, r9
	;je And

	mov r9, 0x08
	cmp r10, r9
	;je Jr

	mov r9, 0x27
	cmp r10, r9
	;je Nor

	mov r9, 0x25
	cmp r10, r9
	;je Or

	mov r9, 0x2a
	cmp r10, r9
	;je Slt

	mov r9, 0x2b
	cmp r10, r9
	;je Sltu

	mov r9, 0x00
	cmp r10, r9
	;je Sll

	mov r9, 0x02
	cmp r10, r9
	;je Srl

	mov r9, 0x22
	cmp r10, r9
	;je Sub

	mov r9, 0x23
	cmp r10, r9
	;je Subu

	mov r9, 0x18
	cmp r10, r9
	;je Mult

	;jmp Error
	jmp Begin

Exit:
	mov rax, 60
	mov rdi, 0
	syscall
