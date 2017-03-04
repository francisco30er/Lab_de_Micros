
section .data

I1 DQ 0xffffffff00221820; EN ESTOS DATOS SE SIMULA QUE EL REGISTRO RD ES EL NUMERO DOS ...0001 0000 0001 0001,
R0 DQ 0x0000000000000000
R1 DQ 0xfffffffffffffffe
R2 DQ 0x0000000000000001
R3 DQ 0X0000000000000000
file db "archivo4.txt"


section .bss

text resb 100

section .text

global _start

_start:
	mov r8, [I1]
	mov r9, 0x3f
	and r8, r9
	cmp r8,0x20
	je Add
	

Add:

	;REGISTRO RD
	mov r8, [I1]; CARGA LA INSTRUCCION
	mov r9, 0xf800; MASCARA PARA RD
	and r8, r9; MASCARA
	sar r8, 11; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO

	mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
	mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
	mov r9, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
	add r9, rax; SE LE SUMA EL OFFSET
	mov r12,[r9]; SE CARGA EL VALOR EN ESE REGISTRO
	;mov r13, [R2]; SE CARGA EL VALOR DIRECTO DESDE LA DIRECCION DE MEMORIA

	;REGISTRO RT
	mov r8, [I1]; CARGA LA INSTRUCCION
        mov r10, 0x1f0000; MASCARA PARA RT
        and r8, r10; MASCARA
        sar r8, 16; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO

        mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
        mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
        mov r10, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
        add r10, rax; SE LE SUMA EL OFFSET
        mov r13,[r10]; SE CARGA EL VALOR EN ESE REGISTRO
        ;mov r15, [R3]; SE CARGA EL VALOR DIRECTO DESDE LA DIRECCION DE MEMORIA


	;REGISTRO RS

	mov r8, [I1]; CARGA LA INSTRUCCION
        mov r11, 0x03e00000; MASCARA PARA RS
        and r8, r11; MASCARA
        sar r8, 21; CORRIMIENTO A LA DERECHA PARA OBTENER EL NUMERO DEL REGISTRO

        mov rax, 0x8; PARA MOVERSE EN MEMORIA DEBE SER DE OCHO EN OCHO
        mul r8; SE MULTIPLICA EL NUMERO DE REGISTRO POR OCHO, EL RESULTADO SE GUARDA EN RAX
        mov r11, R0; SE CARGA LA DIRECCION DEL REGISTRO BASE EN MEMORIA
        add r11, rax; SE LE SUMA EL OFFSET
        mov r14,[r11]; SE CARGA EL VALOR EN ESE REGISTRO
        ;mov r13, [R2]; SE CARGA EL VALOR DIRECTO DESDE LA DIRECCION DE MEMORIA

	;OPERACION DE SUMA
	mov r8,0x0;LIMPIA EL REGISTRO R8
	adcx r14,r13
	mov [r9],r14
	mov r9, [r9]


Exit:
	mov rax,60
	mov rdi,0
	syscall
