section .data

error_uno: db 'La instruccion presenta un OPcode erroneo', 0xa
e1_tamano: equ $-error_uno

error_dos: db 'La instruccion presenta un function incorrecto', 0xa
e2_tamano: equ $-error_dos

error_tres: db 'La instruccion contiene una direccion de memoria no valida', 0xa
e3_tamano: equ $-error_tres

error_cuatro: db 'La instruccion contiene un registro invalido', 0xa
e4_tamano: equ $-error_cuatro

linea_uno: db 'APRETE ENTER'
l1_tamano: equ $-linea_uno

bienvenida: db 'EL4313-Lab. Estructura de Microprocesadores - 1S-2017', 0xa
bienvenida_tamano: equ $-bienvenida

buscando: db 'Buscando ROM.txt', 0xa
buscando_tamano: equ $-buscando

encontrado: db 'Archivo ROM.txt encontrado', 0xa
encontrado_tamano: equ $-encontrado

no_encontrado: db 'Archivo ROM.txt no encontrado', 0xa
no_encontrado_tamano: equ $-no_encontrado

exitosa: db 'Ejecucion Exitosa', 0xa
exitosa_tamano: equ $-exitosa

fallida: db 'Ejecucion Fallida', 0xa
fallida_tamano: equ $-fallida

finalizar: db 'Presione Enter para finalizar'
finalizar_tamano: equ $-finalizar

nombres: db 'Randall Duran 2013, Francisco Elizondo 2013, Freddy Salazar 2013116449, Eduardo Zuniga 2013',0xa
nombres_tamano: equ $-nombres


Re0 DQ 0x0000000000000000
Re1 DQ 0x0000000000000001
Re2 DQ 0x0000000000000001
Re3 DQ 0x0000000000000000
Re4 DQ 0x0000000000000010
Re5 DQ 0x0000000000000000
Re6 DQ 0x0000000000000000
Re7 DQ 0x0000000000000000
Re8 DQ 0x0000000000000001
Re9 DQ 0x0000000000000001
Re10 DQ 0x0000000000000000
Re11 DQ 0x0000000000000010
Re12 DQ 0x0000000000000000
Re13 DQ 0x0000000000000000
Re14 DQ 0x0000000000000010
Re15 DQ 0x0000000000000000
Re16 DQ 0x0000000000000000
Re17 DQ 0x0000000000000000
Re18 DQ 0x0000000000000001
Re19 DQ 0x0000000000000001
Re20 DQ 0x0000000000000000
Re21 DQ 0x0000000000000001
Re22 DQ 0x0000000000000001
Re23 DQ 0x0000000000000000
Re24 DQ 0x0000000000000010
Re25 DQ 0x0000000000000000
Re26 DQ 0x0000000000000000
Re27 DQ 0x0000000000000000
Re28 DQ 0x0000000000000001
Re29 DQ 0x0000000000000001
Re30 DQ 0x0000000000000000
Re31 DQ 0x0000000000000001


I0 DQ 0xffffffff00000000
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
I11 DQ 0xffffffff00000000
I12 DQ 0xffffffff00000000
I13 DQ 0xffffffff00000000
I14 DQ 0xffffffff00000000
I15 DQ 0xffffffff00000000
I16 DQ 0xffffffff00000000
I17 DQ 0xffffffff00000000
I18 DQ 0xffffffff00000000
I19 DQ 0xffffffff00000000
I20 DQ 0xffffffff00000000
I21 DQ 0xffffffff00000000
I22 DQ 0xffffffff00000000
I23 DQ 0xffffffff00000000
I24 DQ 0xffffffff00000000
I25 DQ 0xffffffff00000000
I26 DQ 0xffffffff00000000
I27 DQ 0xffffffff00000000
I28 DQ 0xffffffff00000000
I29 DQ 0xffffffff00000000
I30 DQ 0xffffffff00000000
I31 DQ 0xffffffff00000000
I32 DQ 0xffffffff00000000
I33 DQ 0xffffffff00000000
I34 DQ 0xffffffff00000000
I35 DQ 0xffffffff00000000
I36 DQ 0xffffffff00000000
I37 DQ 0xffffffff00000000
I38 DQ 0xffffffff00000000
I39 DQ 0xffffffff00000000
I40 DQ 0xffffffff00000000
I41 DQ 0xffffffff00000000
I42 DQ 0xffffffff00000000
I43 DQ 0xffffffff00000000
I44 DQ 0xffffffff00000000
I45 DQ 0xffffffff00000000
I46 DQ 0xffffffff00000000
I47 DQ 0xffffffff00000000
I48 DQ 0xffffffff00000000
I49 DQ 0xffffffff00000000
I50 DQ 0xffffffff00000000
I51 DQ 0xffffffff00000000
I52 DQ 0xffffffff00000000
I53 DQ 0xffffffff00000000
I54 DQ 0xffffffff00000000
I55 DQ 0xffffffff00000000
I56 DQ 0xffffffff00000000
I57 DQ 0xffffffff00000000
I58 DQ 0xffffffff00000000
I59 DQ 0xffffffff00000000
I60 DQ 0xffffffff00000000
I61 DQ 0xffffffff00000000
I62 DQ 0xffffffff00000000
I63 DQ 0xffffffff00000000
I64 DQ 0xffffffff00000000
I65 DQ 0xffffffff00000000
I66 DQ 0xffffffff00000000
I67 DQ 0xffffffff00000000
I68 DQ 0xffffffff00000000
I69 DQ 0xffffffff00000000
I70 DQ 0xffffffff00000000
I71 DQ 0xffffffff00000000
I72 DQ 0xffffffff00000000
I73 DQ 0xffffffff00000000
I74 DQ 0xffffffff00000000
I75 DQ 0xffffffff00000000
I76 DQ 0xffffffff00000000
I77 DQ 0xffffffff00000000
I78 DQ 0xffffffff00000000
I79 DQ 0xffffffff00000000
I80 DQ 0xffffffff00000000
I81 DQ 0xffffffff00000000
I82 DQ 0xffffffff00000000
I83 DQ 0xffffffff00000000
I84 DQ 0xffffffff00000000
I85 DQ 0xffffffff00000000
I86 DQ 0xffffffff00000000
I87 DQ 0xffffffff00000000
I88 DQ 0xffffffff00000000
I89 DQ 0xffffffff00000000
I90 DQ 0xffffffff00000000
I91 DQ 0xffffffff00000000
I92 DQ 0xffffffff00000000
I93 DQ 0xffffffff00000000
I94 DQ 0xffffffff00000000
I95 DQ 0xffffffff00000000
I96 DQ 0xffffffff00000000
I97 DQ 0xffffffff00000000
I98 DQ 0xffffffff00000000
I99 DQ 0xffffffff00000000
I100 DQ 0xffffffff00000000
I101 DQ 0xffffffff00000000
I102 DQ 0xffffffff00000000
I103 DQ 0xffffffff00000000
I104 DQ 0xffffffff00000000
I105 DQ 0xffffffff00000000
I106 DQ 0xffffffff00000000
I107 DQ 0xffffffff00000000
I108 DQ 0xffffffff00000000
I109 DQ 0xffffffff00000000
I110 DQ 0xffffffff00000000
I111 DQ 0xffffffff00000000
I112 DQ 0xffffffff00000000
I113 DQ 0xffffffff00000000
I114 DQ 0xffffffff00000000
I115 DQ 0xffffffff00000000
I116 DQ 0xffffffff00000000
I117 DQ 0xffffffff00000000
I118 DQ 0xffffffff00000000
I119 DQ 0xffffffff00000000
I120 DQ 0xffffffff00000000
I121 DQ 0xffffffff00000000
I122 DQ 0xffffffff00000000
I123 DQ 0xffffffff00000000
I124 DQ 0xffffffff00000000
I125 DQ 0xffffffff00000000
I126 DQ 0xffffffff00000000
I127 DQ 0xffffffff00000000
I128 DQ 0xffffffff00000000
I129 DQ 0xffffffff00000000
I130 DQ 0xffffffff00000000
I131 DQ 0xffffffff00000000
I132 DQ 0xffffffff00000000
I133 DQ 0xffffffff00000000
I134 DQ 0xffffffff00000000
I135 DQ 0xffffffff00000000
I136 DQ 0xffffffff00000000
I137 DQ 0xffffffff00000000
I138 DQ 0xffffffff00000000
I139 DQ 0xffffffff00000000
I140 DQ 0xffffffff00000000
I141 DQ 0xffffffff00000000
I142 DQ 0xffffffff00000000
I143 DQ 0xffffffff00000000
I144 DQ 0xffffffff00000000
I145 DQ 0xffffffff00000000
I146 DQ 0xffffffff00000000
I147 DQ 0xffffffff00000000
I148 DQ 0xffffffff00000000
I149 DQ 0xffffffff00000000


file db "archivo5.txt"


section .bss

text resb 300
letra resb 1

section .text

global _start

_start:

First:
	mov rax,1
	mov rdi,1
	mov rsi,bienvenida
	mov rdx,bienvenida_tamano
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,buscando
	mov rdx,buscando_tamano
	syscall



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
	mov rdx, 300
	syscall

	;CLOSE FILE
	mov rax, 3
	pop rdi
	syscall


	mov rax, text
	mov rbx, 0
	mov r8b, 0x31
	mov r9b, 0x30
	mov r10b, 0xa
	mov r12, I0
	mov r14, 0x0
	mov r15, 0x0
;LOOP PARA DETERMINAR Y GUARDAR LAS INSTRUCCIONES EN MEMORIA
Loop:
;ANALIZA SI EL ASCII ES UNO
	mov byte cl, [rax]
	cmp cl, r8b
	jne check_zero
	mov r13, [r12]
	rol r13, 1
	mov [r12], r13
	inc rbx
	inc rax
	jmp Loop

;ANALIZA SI EL ASCII ES CERO
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

;ANALIZA SI EL ASCII ES ENTER/SIGUIENTE LINEA
check_next:
	mov byte cl, [rax]
	cmp cl, r10b
	jne check_null
	add r12, 0x8
	inc r14
	inc rax
	jmp Loop

;ANALIZA SI EL ASCII ES NULL
check_null:
        mov byte cl, [rax]
        cmp cl, 0
        je Mascara
	inc rax
	jmp Loop


;CARGA LA PRIMERIA INSTRUCCION
Mascara:
	mov r15, I0
	inc r14
	mov rcx, 0x0
Begin:
	mov r8, 0xfc000000
	and r8, [r15]
	sar r8, 26; OPCODE
	
	inc rcx
	dec r14
	mov rax, 0x0
	cmp r14, rax
	je Pexito


	;PRINT DATOS
	;***************************
	mov rax,1
	mov rdi,1
	mov rsi,linea_uno
	mov rdx,l1_tamano
	syscall
	
	mov rax, 0
	mov rdi, 0
	mov rsi, letra
	mov rdx, 1 
	syscall

	mov rax, 0xa
	mov rbx, [letra]
	cmp rax, rbx
	jne Begin
	;***************************

	mov r13, 0x0; OPCODE CERO (INSTRUCCION TIPO R)
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
	mov r9, Re0
	add r9, rax

	;COMPRUEBA SI RT ES $ZERO
	mov rax, Re0
	cmp r9, rax
	je Error_registro	

	;RS
	mov r10,0x3e00000
	and r10, [r15]
	sar r10, 21
	mov rax, 0x8
	mul r10
	mov r10, Re0
	add r10, rax
	mov r13, r10
	mov r10, [r10]

	;VERIFICA SI LOS REGISTROS SON DE USO COMUN
	mov rax, Re28
	cmp r9, rax
	jge Error_registro

	mov rax, Re28
	cmp r13, rax
	jge Error_registro

	mov rax, Re1
	cmp rax, r9
	je Error_registro

	mov rax, Re1
	cmp rax, r13
	je Error_registro	


	;ADDI
	mov r13, 0x8
	cmp r8, r13
	je Addi

	;ANDI
	mov r13, 0xc
	cmp r8, r13
	je Andi

	;BEQ
	mov r13, 0x4
	cmp r8, r13
	je Beq

	;BNE
	mov r13, 0x5
	cmp r8, r13
	je Bne

	;JUMP
	mov r13, 0x2
	cmp r8, r13
	je Jump

	;SLTI
	mov r13, 0xa
	cmp r8, r13
	je Slti

	;SLTIU
	mov r13, 0xb
	cmp r8, r13
	je Sltiu
	

	;ERROR DE OPCODE
	mov rax,1
	mov rdi,1
	mov rsi,error_uno
	mov rdx,e1_tamano
	syscall

	jmp Exit
	

Function:
	;RD
	mov r8,0xf800
	and r8, [r15]
	sar r8, 11
	mov rax, 0x8
	mul r8
	mov r8, Re0
	add r8, rax

	;VERIFICA SI RD ES $ZERO
	mov rax, Re0
	cmp r8, rax
	je Error_registro

	;RT
	mov r9,0x1f0000
	and r9, [r15]
	sar r9, 16
	mov rax, 0x8
	mul r9
	mov r9, Re0
	add r9, rax
	mov r11, r9
	mov r9, [r9]

	;RS
	mov r10,0x3e00000
	and r10, [r15]
	sar r10, 21
	mov rax, 0x8
	mul r10
	mov r10, Re0
	add r10, rax
	mov r12, r10
	mov r10, [r10]

	;COMPRUEBA QUE LOS REGISTROS SEAN DE USO COMUN
	mov rax, Re1
	cmp rax, r8
	je Error_registro

	mov rax, Re1
	cmp rax, r11
	je Error_registro

	mov rax, Re1
	cmp rax, r12
	je Error_registro

	mov rax, Re28
	cmp r8, rax
	jge Error_registro

	mov rax, Re28
	cmp r11, rax
	jge Error_registro

	mov rax, Re28
	cmp r12, rax
	jge Error_registro

	;Function
	mov r12, 0x3f
	and r12, [r15]

	;ADD
	mov r13, 0x20
	cmp r12, r13
	je Add

	;ADDU
	mov r13, 0x21
	cmp r12, r13
	je Addu

	;AND
	mov r13, 0x24
	cmp r12, r13
	je And

	;NOR
	mov r13, 0x27
	cmp r12, r13
	je Nor

	;OR
	mov r13, 0x25
	cmp r12, r13
	je Or

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

	;SUB
	mov r13, 0x22
	cmp r12, r13
	je Sub

	;SUBU
	mov r13, 0x23
	cmp r12, r13
	je Subu


	;ERROR DE FUNCTION
	mov rax,1
	mov rdi,1
	mov rsi,error_dos
	mov rdx,e2_tamano
	syscall

	jmp Exit

Add:
	add r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Addi:
	add r10, r11
	mov [r9], r10
	add r15, 0x8
	jmp Begin

Addu:
	adcx r10,r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

And:
	and r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Andi:
	and r10, r11
	mov [r9], r10
	add r15, 0x8
	jmp Begin

Beq:
	add r15, 0x8
	cmp r9, r10
	je Signo
	jmp Begin

Bne:
	add r15, 0x8
	cmp r9, r10
	jne Signo
	jmp Begin

Signo:
	mov rbx, 0x0
	mov rax, 0x8000
	imul r11
	cmp rax, rbx
	jz Positivo; Podria haber un error
Positivo:
	shl r11, 3
	add r15, r11
	mov r8, I0
	mov r9, 0x96; 150 instrucciones
	shl r9, 3
	add r8, r9
	cmp r15, r8
	jge Error_address
	jmp Begin
Negativo:
	mov r9, 0xffffffffffff0000
	or r11, r9
	shl r11, 3
	add r15, r11
	mov r8, I0
	cmp r8, r15
	jge Error_address
	jmp Begin

Jump:
	shl r11, 3
	add r11, r15
	mov r8, I0
	mov r9, 0x96; 150 instrucciones
	shl r9, 3
	add r8, r9
	cmp r11, r8
	jge Error_address
	mov r15, r11
	jmp Begin

Nor:
	or r10, r9
	not r10
	mov [r8], r10
	add r15, 0x8
	jmp Begin
Or:
	or r10, r9
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

Sub:
	sub r10, r9
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

Mul:
	mov rax, r9
	imul r10
	mov [r8], rax
	add r15, 0x8
	jmp Begin

Error_address:
	;ERROR DE ADDRESS
	mov rax,1
	mov rdi,1
	mov rsi,error_tres
	mov rdx,e3_tamano
	syscall
	jmp Perror

Error_registro:
	;ERROR DE REGISTRO
	mov rax,1
	mov rdi,1
	mov rsi,error_cuatro
	mov rdx,e4_tamano
	syscall
	jmp Perror

Perror:
	mov rax,1
	mov rdi,1
	mov rsi,fallida
	mov rdx,fallida_tamano
	syscall
	jmp Exit


Pexito:
	mov rax,1
	mov rdi,1
	mov rsi,exitosa
	mov rdx,exitosa_tamano
	syscall
	jmp Exit

Exit:
	mov rax,1
	mov rdi,1
	mov rsi,finalizar
	mov rdx,finalizar_tamano
	syscall
	
	mov rax, 0
	mov rdi, 0
	mov rsi, letra
	mov rdx, 1 
	syscall

	mov rax, 0xa
	mov rbx, [letra]
	cmp rax, rbx
	jne Exit

	mov rax,1
	mov rdi,1
	mov rsi,nombres
	mov rdx,nombres_tamano
	syscall

	
	mov r8, [Re0]
	mov r9, [Re1]
	mov r10, [Re2]
	mov r11, [Re3]
	mov r12, [I0]
	mov r13, [I1]
C:
	mov rax, 60
	mov rdi, 0
	syscall

