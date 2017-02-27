section .data

R0 DQ 0x0000000000000000
R1 DQ 0x0000000000000000
R2 DQ 0x0000000000000020
I1 DQ 0xffffffff00000000; ES MUY IMPORTANTE QUE EL ESPACIO DE MEMORIA ESTE DESPUES QUE EL DE LOS REGISTROS

file db "archivo4.txt"; FILE DEBE ESTAR COLOCADO DESPUES DEL ESPACIO DE MEMORIA DE INSTRUCCIONES Y REGISTROS


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

	;SETEA LOS REGISTROS PARA COMPARACIONES
	mov rax, text
	mov r8b, 0x31; ASCII UNO
	mov r9b, 0x30; ASCII CERO
	mov r10b, 0xa; ASCII END OF LINE
	mov r12, I1
	mov r15, 0x0
Loop:
	mov byte cl, [rax]
	cmp cl, r8b; COMPARACION CON UNO
	jne check_zero
	mov r13, [r12]
	rol r13, 1; AGREGA UN UNO A LA DERECHA A LA INSTRUCCION
	mov [r12], r13
	inc rax
	jmp Loop

check_zero:
	mov byte cl, [rax]
	cmp cl, r9b; COMPARACION CON CERO
	jne check_next
	mov r13, [r12]
	sal r13, 1; AGREGA UN CERO A LA DERECHA A LA INSTRUCCION
	mov [r12], r13
	inc rax
	jmp Loop

check_next:
	mov byte cl, [rax]
	cmp cl, r10b; COMPARACION CON SALTO DE LINEA
	jne check_null
	add r12, 8; SE MUEVE A LA SIGUIENTE INSTRUCCION RESERVADA EN MEMORIA
	inc rax
	jmp Loop

check_null:
        mov byte cl, [rax]
        cmp cl, 0; COMPARACION CON NULL
        je Mascara
	inc rax
	jmp Loop

Mascara:
	mov r8, I1; CARGA LA PRIMERA INSTRUCCION
	add r8, r15
Begin:
	mov r9, [r8]
	mov r10, 0xFC000000; MARCARA PARA EL OPCODE
	and r10, r9

	mov r9, 0x0
	cmp r10, r9; COMPARA OPCODE CON CERO, TIPO REGISTER
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
	je Sll

	mov r9, 0x02
	cmp r10, r9
	je Srl

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

Sll:
	;REGISTRO RD
	mov r8, [I1]; CARGA LA INSTRUCCION
	mov r9, 0xf800; MASCARA PARA RD
	and r8, r9; MASCARA
	sar r8, 11; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO
	mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
	mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
	mov r9, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
	add r9, rax; SE LE SUMA EL OFFSET

	;REGISTRO RT
	mov r8, [I1]; CARGA LA INSTRUCCION
        mov r9, 0x1f0000; MASCARA PARA RT
        and r8, r9; MASCARA
        sar r8, 16; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO
        mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
        mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
        mov r10, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
        add r10, rax; SE LE SUMA EL OFFSET
	mov r10, [r10]

	;SHAMT
	mov r8, [I1]; CARGA LA INSTRUCCION
        mov r9, 0x7c0; MASCARA PARA SHAMT
        and r8, r9; MASCARA
        sar r8, 6; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DE CORRIMIENTO
Loop_sll:
	sal r10, 1
	cmp r8, 0x0
	jz Out_sll
	dec r8
	jmp Loop_sll
Out_sll:
	mov [r9], r10
	add r15, 0x8
	jmp Mascara

Srl:
        ;REGISTRO RD
        mov r8, [I1]; CARGA LA INSTRUCCION
        mov r9, 0xf800; MASCARA PARA RD
        and r8, r9; MASCARA
        sar r8, 11; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO
        mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
        mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
        mov r9, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
        add r9, rax; SE LE SUMA EL OFFSET

        ;REGISTRO RT
        mov r8, [I1]; CARGA LA INSTRUCCION
        mov r9, 0x1f0000; MASCARA PARA RT
        and r8, r9; MASCARA
        sar r8, 16; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO
        mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
        mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
        mov r10, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
        add r10, rax; SE LE SUMA EL OFFSET
        mov r10, [r10]

        ;SHAMT
        mov r8, [I1]; CARGA LA INSTRUCCION
        mov r9, 0x7c0; MASCARA PARA SHAMT
        and r8, r9; MASCARA
        sar r8, 6; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DE CORRIMIENTO
Loop_srl:
        sar r10, 1
        cmp r8, 0x0
        jz Out_srl
        dec r8
        jmp Loop_srl
Out_srl:
        mov [r9], r10
	add r15, 0x8
	jmp Mascara


Exit:
	mov rax, 60
	mov rdi, 0
	syscall
