%macro write_file 2
	;OPEN FILE
	mov rax, 2
	mov rdi, resul
	mov rsi, 1+1024
	mov rdx, 0644o
	syscall
	

	;WRITE FILE
	push rax
	mov rdi, rax
	mov rax, 1
	mov rsi, %1
	mov rdx, %2
	syscall

	;CLOSE FILE
	mov rax, 3
	pop rdi
	syscall
%endmacro

section .data

cons_hola: db 'Excede el numero de argumentos, segmentation fault everywhere!',0xa
cons_tamano: equ $-cons_hola

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







;-------------------------------------------------------------------

guion: db '-'

errorstack1: db 'El espacio de Stack es invalido', 0xa
errorstack_tamano1: equ $-errorstack1

errorstack2: db 'El espacio de Stack no esta disponible', 0xa
errorstack_tamano2: equ $-errorstack2

inst: db 'Instruccion'




;-------------------------------------------------------------------









nombres: db 'Randall Duran 2013027110, Francisco Elizondo 2013097310, Freddy Salazar 2013116449, Eduardo Zuniga 2013099951',0xa
nombres_tamano: equ $-nombres

instruccion: db 'add ,addi ,addu ,and ,andi ,beq ,bne ,j ,jal ,jr ,lw ,nor ,or ,ori ,slt ,slti ,sltiu ,sltu ,sll ,srl ,sub ,subu ,mult ,sw '

instruccion_tamano: equ $-instruccion

registros: db '$zero ,$at ,$v0 ,$v1 ,$a0 ,$a1 ,$a2 ,$a3 ,$t0 ,$t1 ,$t2 ,$t3 ,$t4 ,$t5 ,$t6 ,$t7 ,$s0 ,$s1 ,$s2 ,$s3 ,$s4 ,$s5 ,$s6 ,$s7 ,$t8 ,$t9 ,$k0 ,$k1 ,$gp ,$sp ,$fp ,$ra '
registros_tamano: equ $-registros

asteriscos: db '*******************************', 0xa
asteriscos_tamano: equ $-asteriscos

rt DQ 0x0
rd DQ 0x0
rs DQ 0x0
inmediate DQ 0x0
address DQ 0x0

resul db "resultados.txt"

protect DQ 0x0000000000000000

Re0 DQ 0x0000000000000000
Re1 DQ 0x0000000000000001
Re2 DQ 0x0000000000000001
Re3 DQ 0x0000000000000000
Re4 DQ 0x0000000000000010
Re5 DQ 0x0000000000000000
Re6 DQ 0x0000000000000000
Re7 DQ 0x0000000000000000
Re8 DQ 0x0000000000000000
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
I150 DQ 0xffffffff00000000

;--------------------- stack ---------------------------------------


	Contador DQ 0x8	

	stack0 DQ 9h 
	stack1 DQ 8h
	stack2 DQ 7h
	stack3 DQ 6h
	stack4 DQ 5h
	stack5 DQ 4h
	stack6 DQ 3h
	stack7 DQ 2h
	stack8 DQ 1h
	stack9 DQ 0h
	stack10 DQ 9h 
	stack11 DQ 8h
	stack12 DQ 7h
	stack13 DQ 6h
	stack14 DQ 5h
	stack15 DQ 4h
	stack16 DQ 3h
	stack17 DQ 2h
	stack18 DQ 1h
	stack19 DQ 0h
	stack20 DQ 9h 
	stack21 DQ 8h
	stack22 DQ 7h
	stack23 DQ 6h
	stack24 DQ 5h
	stack25 DQ 4h
	stack26 DQ 3h
	stack27 DQ 2h
	stack28 DQ 1h
	stack29 DQ 0h
	stack30 DQ 9h 
	stack31 DQ 8h
	stack32 DQ 7h
	stack33 DQ 6h
	stack34 DQ 5h
	stack35 DQ 4h
	stack36 DQ 3h
	stack37 DQ 2h
	stack38 DQ 1h
	stack39 DQ 0h




file db "ROM.txt"


section .bss

text resb 300
letra resb 1
digitSpace resb 100
digitSpacePos resb 8

section .text

global _start

_start:

	mov r11,0
	mov rax,1
	pop rbx	; se saca argc en rax
	
	mov r13,rbx	;se mueve argc a r8
	cmp r13,1	;no hay argumentos
	je First		;sale del programa
	cmp r13,6	;se compara que argc no exceda 6 argumento
	jge Max		;si los excede se sale del programa
	
	pop rbx		;se obtiene el path
	pop rbx
	jmp final	
darg:	
	sub r13,1
	cmp r11,0
	je arg0
	cmp r11,1
	je arg1
	cmp r11,2
	je arg2
	cmp r11,3
	je arg3
arg0:
	mov [Re4],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
arg1:	
	mov [Re5],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
arg2:
	mov [Re6],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
arg3:
	mov [Re7],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
pop:	
	cmp r13,1
	je First
	pop rbx		;se obtiene el argumento 0
	
	
	

final:	
	mov r8b,[rbx]	;obtiene el ascii de argv0
	cmp r8b,0	;comparo con null
	je dec	;si termine de leer el argumento salto a calcularlo
	inc rbx		;me muevo por el argumento hasta el final
		
	jmp final	;repito proceso de final
dec:
	dec rbx
	
	mov r8b,[rbx]	; cargo rax en el ultimo valor del argumento
	cmp r8b,0
	je darg
	
Calarg:
		 
	sub r8b,48
	push rax
	mul r8 
	mov r9,rax
	add r10,r9
	pop rax
	mov r12,10
	mul r12
	jmp dec

	
	
Max:
	mov rax,1
	mov rdi,1
	mov rsi,cons_hola
	mov rdx,cons_tamano
	syscall
	jmp Perror  	
      
	
	

First:

	;CREATE RESULTADOS
	mov rax, 2
	mov rdi, resul
	mov rsi, 64+512
	mov rdx, 0644o
	syscall

	;CLOSE RESULTADOS
	push rax
	mov rax, 3
	pop rdi
	syscall

	mov rax, stack39
	add rax, 0x-8
	mov [Re29], rax



	mov rax,1
	mov rdi,1
	mov rsi,bienvenida
	mov rdx,bienvenida_tamano
	syscall

	write_file bienvenida, bienvenida_tamano

	mov rax,1
	mov rdi,1
	mov rsi,buscando
	mov rdx,buscando_tamano
	syscall
	
	write_file buscando, buscando_tamano

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
	mov r8, 0xffffffff00000000
	mov r9, [I0]
	cmp r8, r9
	je No_encontrado


	;ROM ENCONTRADO
	mov rax,1
	mov rdi,1
	mov rsi,encontrado
	mov rdx,encontrado_tamano
	syscall

	write_file encontrado, encontrado_tamano

	;PRESIONE ENTER
	mov rax,1
	mov rdi,1
	mov rsi,linea_uno
	mov rdx,l1_tamano
	syscall

	write_file linea_uno, l1_tamano
	
	mov rax, 0
	mov rdi, 0
	mov rsi, letra
	mov rdx, 1 
	syscall

	mov rax, 0xa
	mov rbx, [letra]
	cmp rax, rbx
	jne Mascara

	mov r15, I0
	mov rcx, 0x0
Begin:
	mov r8, 0xfc000000
	and r8, [r15]
	sar r8, 26; OPCODE
	
	;VERIFICA SI SE ACABARON LAS INSTRUCCIONES
	;**************************
	mov rcx, [r15]
	mov rax, [I150]
	cmp rcx, rax
	je Pexito
	;***************************

	;PRINT DATOS
	;***************************
	mov rax,1
	mov rdi,1
	mov rsi,asteriscos
	mov rdx,asteriscos_tamano
	syscall

	write_file asteriscos, asteriscos_tamano

	call datos

	
	;***************************

	mov r13, 0x0; OPCODE CERO (INSTRUCCION TIPO R)
	cmp r8, r13
	je Function

	;INMEDIATE
	mov r11, 0xFFFF
	and r11, [r15]
;===============================================================
	mov [inmediate], r11
;===============================================================
	
	;RT
	mov r9,0x1f0000
	and r9, [r15]
	sar r9, 16
;================================================================
	mov [rt], r9 ; Guarda el numero de registro en memo rt	
;================================================================
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
;=================================================================
	mov [rs], r10 ; Guarda el numero de registro en memo rs	
;=================================================================
	mov rax, 0x8
	mul r10
	mov r10, Re0
	add r10, rax
	mov r13, r10
	mov r10, [r10]

	;VERIFICA SI LOS REGISTROS SON DE USO COMUN
;	mov rax, Re28
;	cmp r9, rax
;	jge Error_registro

;	mov rax, Re28
;	cmp r13, rax
;	jge Error_registro

;	mov rax, Re1
;	cmp rax, r9
;	je Error_registro

;	mov rax, Re1
;	cmp rax, r13
;	je Error_registro	

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;==================================================================
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

	;JUMP AND LINK
	mov r13, 0x3
	cmp r8, r13
	je JumpLink

	;LOADWORD
	mov r13, 0x23
	cmp r8, r13
	je Lw

	;ORI
	mov r13, 0xd
	cmp r8, r13

	;SLTI
	mov r13, 0xa
	cmp r8, r13
	je Slti

	;SLTIU
	mov r13, 0xb
	cmp r8, r13
	je Sltiu
	
	;STOREWORD
	mov r13, 0x2b
	cmp r8, r13
	je Sw

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
;=================================================================	
	mov [rd], r8
;=================================================================
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
;=================================================================
	mov [rt], r9
;=================================================================
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
;=================================================================
	mov [rs], r10
;=================================================================
	mov rax, 0x8
	mul r10
	mov r10, Re0
	add r10, rax
	mov r12, r10
	mov r10, [r10]

	;COMPRUEBA QUE LOS REGISTROS SEAN DE USO COMUN
;	mov rax, Re1
;	cmp rax, r8
;	je Error_registro

;	mov rax, Re1
;	cmp rax, r11
;	je Error_registro

;	mov rax, Re1
;	cmp rax, r12
;	je Error_registro

;	mov rax, Re28
;	cmp r8, rax
;	jge Error_registro

;	mov rax, Re28
;	cmp r11, rax
;	jge Error_registro

;	mov rax, Re28
;	cmp r12, rax
;	jge Error_registro

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

	;JUMP REGISTERS
	mov r13, 0x08
	cmp r12, r13
	je JumpRegister

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
	push r11	
	push r10
	push r9
	push r8

	mov rax,1
	mov rdi,1
	mov rsi, instruccion
	mov rdx,4
	syscall

	write_file instruccion, 4


	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	add r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

;==============================================================
;8=================================================================D

Addi:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+5
	mov rdx,5
	syscall	

	push r13
	mov r13, instruccion+5
	write_file r13, 5
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate



	pop r8
	pop r9
	pop r10
	pop r11
	
	mov rax, [rs]
	mov rbx, [rt]
	mov rcx, 0x1D
	cmp rax, rcx
	jne addi1
	cmp rbx, rcx
	jne addi1
	jmp stack
addi1:	
	mov r12, 0x0000000000008000
	mov rax, 0x0
	and r12, r11 ; Se hace la mascara bitSigno para 
	cmp r12, rax
	je _positivoAddi
	jne _negativoAddi

_negativoAddi:
	mov r12, 0xFFFFFFFFFFFF0000
	or r12, r11
	add r10, r12
	mov [r9], r10
	add r15, 0x8
	jmp Begin


_positivoAddi:
	mov r12, 0x000000000000FFFF
	and r12, r11 ;Mascara para inmediate
	add r10, r12
	mov [r9], r10
	add r15, 0x8
	jmp Begin

Addu:
	
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+11
	mov rdx,5
	syscall

	push r13
	mov r13, instruccion+11
	write_file r13, 5
	pop r13	


	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	adcx r10,r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

And:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+17
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+17
	write_file r13, 4
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	and r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Andi:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+22
	mov rdx,5
	syscall

	push r13
	mov r13, instruccion+22
	write_file r13, 5
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

	and r10, r11
	mov [r9], r10
	add r15, 0x8
	jmp Begin

Beq:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+28
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+28
	write_file r13, 4
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	mov rax,1
	mov rdi,1
	mov rsi, inst
	mov rdx,11
	syscall
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

	add r15, 0x8
	cmp r9, r10
	je Signo
	jmp Begin

Bne:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+33
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+33
	write_file r13, 4
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro

	mov rax,1
	mov rdi,1
	mov rsi, inst
	mov rdx,11
	syscall

	write_file inst, 11

	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

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

	mov r11, [R15]
	mov rax, 0x03FFFFFF
	and r11, rax
	mov [address], r11 
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+38
	mov rdx,2
	syscall

	push r13
	mov r13, instruccion+38
	write_file r13, 2
	pop r13	

	mov rax,1
	mov rdi,1
	mov rsi, inst
	mov rdx,11
	syscall

	write_file inst, 11

	mov rax, [address]
	call _printRAX




	pop r8
	pop r9
	pop r10
	pop r11



	shl r11, 3
	mov r8, I0
	add r11, r8

	mov r9, 0x96; 150 instrucciones
	shl r9, 3
	add r8, r9
	cmp r11, r8
	jge Error_address
	mov r9, I0
	cmp r9, r11
	jg Error_address
	mov r15, r11
	jmp Begin

JumpRegister:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+46
	mov rdx,3
	syscall

	push r13
	mov r13, instruccion+46
	write_file r13, 3
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	mov r8, I0
	mov r9, 0x96; 150 instrucciones
	shl r9, 3
	add r8, r9
	cmp r10, r8
	jge Error_address
	mov r9, I0
	cmp r9, r10
	jg Error_address
	mov r15, r10
	jmp Begin

JumpLink:
		
	mov r11, [R15]
	mov rax, 0x03FFFFFF
	and r11, rax
	mov [address], r11 
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+41
	mov rdx,4
	syscall
	mov rax,1
	mov rdi,1
	mov rsi, inst
	mov rdx,11
	syscall

	mov rax, [address]
	call _printRAX


	pop r8
	pop r9
	pop r10
	pop r11


	shl r11, 3
	mov r8, I0
	add r11, r8
	mov r9, 0x96; 150 instrucciones
	shl r9, 3
	add r8, r9
	cmp r11, r8
	jge Error_address
	mov r9, I0
	cmp r9, r11
	jg Error_address



Lw:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+50
	mov rdx,3
	syscall

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11


	add r10, r11 ; rs + inmediate = base + offset
	mov r13d, [r10]	;Valor de la direccion
	mov [r9], r13d
	add r15, 0x8	
	jmp Begin
Nor:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+54
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+54
	write_file r13, 4
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	or r10, r9
	not r10
	mov [r8], r10
	add r15, 0x8
	jmp Begin
Or:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+59
	mov rdx,3
	syscall

	push r13
	mov r13, instruccion+59
	write_file r13, 3
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	or r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Ori:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+63
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+63
	write_file r13, 4
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

	or r10, r11
	mov [r9], r10
	add r15, 0x8
	jmp Begin

Sll:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+92
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+92
	write_file r13, 4
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

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
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+97
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+97
	write_file r13, 4
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

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
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+68
	mov rdx,3
	syscall

	push r13
	mov r13, instruccion+68
	write_file r13, 3
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

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
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+86
	mov rdx,5
	syscall

	push r13
	mov r13, instruccion+86
	write_file r13, 5
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

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
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+73
	mov rdx,5
	syscall

	push r13
	mov r13, instruccion+73
	write_file r13, 5
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

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
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+79
	mov rdx,6
	syscall

	push r13
	mov r13, instruccion+79
	write_file r13, 6
	pop r13	

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

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
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+102
	mov rdx,4
	syscall

	push r13
	mov r13, instruccion+102
	write_file r13, 4
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	sub r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Subu:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+107
	mov rdx,5
	syscall

	push r13
	mov r13, instruccion+107
	write_file r13, 5
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

	sal r9, 31
	sar r9, 31
	sal r10, 31
	sar r10, 31
	sub r10, r9
	mov [r8], r10
	add r15, 0x8
	jmp Begin

Sw:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+119
	mov rdx,3
	syscall

	mov r12, [rt]
	call _imprimirRegistro	
	mov r12, [rs]
	call _imprimirRegistro
	call _inmediate

	pop r8
	pop r9
	pop r10
	pop r11

	add r10, r11 ; Direccion donde se guardara dato
	mov r13d,[r9] ; Se obtiene el valor en el registro
	mov [r10], r13d
	add r15, 0x8
	jmp Begin

Mul:
	push r11	
	push r10
	push r9
	push r8
	mov rax,1
	mov rdi,1
	mov rsi, instruccion+113
	mov rdx,5
	syscall

	push r13
	mov r13, instruccion+113
	write_file r13, 5
	pop r13	

	mov r12, [rd]
	call _imprimirRegistro
	mov r12, [rs]
	call _imprimirRegistro
	mov r12, [rt]
	call _imprimirRegistro

	pop r8
	pop r9
	pop r10
	pop r11

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

	write_file error_tres, e3_tamano	

	jmp Perror

Error_registro:
	;ERROR DE REGISTRO
	mov rax,1
	mov rdi,1
	mov rsi,error_cuatro
	mov rdx,e4_tamano
	syscall

	write_file error_cuatro, e4_tamano

	jmp Perror

Perror:
	mov rax,1
	mov rdi,1
	mov rsi,fallida
	mov rdx,fallida_tamano
	syscall

	write_file fallida, fallida_tamano

	jmp Exit


Pexito:
	mov rax,1
	mov rdi,1
	mov rsi,exitosa
	mov rdx,exitosa_tamano
	syscall

	write_file exitosa, exitosa_tamano

	jmp Exit

No_encontrado:
	mov rax,1
	mov rdi,1
	mov rsi,no_encontrado
	mov rdx,no_encontrado_tamano
	syscall

	write_file no_encontrado, no_encontrado_tamano	

	jmp Perror

;--------------------------------------------------------------
;		LLAMADA PARA HACER ESPACIO STACK
;--------------------------------------------------------------

stack:
	mov r12, [Re29]
	mov r10, 0x0000000000008000
	mov r13, 0x0
	and r10, r11 ; Se hace la mascara bitSigno para 
	cmp r10, r13
	je _positivoStack
	jne _negativoStack

_negativoStack:
	mov r10, 0xFFFFFFFFFFFF0000
	or r10, r11
	add r12, r10 ; Se calcula nueva direccion
	mov r13, stack0
	cmp r13, r12 ; si la direccion stack0 es mayor a dir nueva
	jg ErrorStack1
	mov [Re29], r12
	add r15, 0x8
	jmp Begin


_positivoStack:
	mov r10, 0x000000000000FFFF
	and r10, r11 ;Mascara para inmediate
	add r12, r10 ; Se calcula nueva direccion
	mov r13, stack39
	add r13, 0x4
	cmp r12, r13 ; si la direccion nueva es mayor a stack39
	jg ErrorStack2
	mov [Re29], r12
	add r15, 0x8
	jmp Begin

;----------------------------------------------------------------

;----------------------------------------------------------------

ErrorStack1:
	;ERROR DE STACK
	mov rax,1
	mov rdi,1
	mov rsi,errorstack1
	mov rdx,errorstack_tamano1
	syscall
	jmp Exit

ErrorStack2:
	;ERROR DE STACK
	mov rax,1
	mov rdi,1
	mov rsi,errorstack2
	mov rdx,errorstack_tamano2
	syscall
	jmp Exit


Exit:
	mov rax,1
	mov rdi,1
	mov rsi,finalizar
	mov rdx,finalizar_tamano
	syscall
	
	write_file finalizar, finalizar_tamano

	mov rax, 0
	mov rdi, 0
	mov rsi, letra
	mov rdx, 1 
	syscall

	mov rax, 0xa
	mov rbx, [letra]
	cmp rax, rbx
	je Exit

	mov rax,1
	mov rdi,1
	mov rsi,nombres
	mov rdx,nombres_tamano
	syscall

	write_file nombres, nombres_tamano
	
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

_printRAX:
    mov [protect], r10
    mov r10, 0x0
    mov rcx, digitSpace
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx
 
_printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

 
    mov rcx, [digitSpacePos]
    mov [rcx], dl
    inc rcx
    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0
    jne _printRAXLoop
 
_printRAXLoop2:
    mov rcx, [digitSpacePos]
 
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rax, 0x1
    cmp r10, rax
    jne P
    push r12
    mov rcx, [digitSpacePos]
    mov r12, rcx
    write_file r12, 1
    pop r12
P:
    mov r10, 0x1

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx
 
    cmp rcx, digitSpace
    jge _printRAXLoop2
 
    mov r10, [protect]
    ret

;777777777777777777777777777777777777777777777777777777777777777777777

_inmediate:
	mov r12, [inmediate]
	mov r10, 0x8000
	and r10, r12
	mov r13, 0x0	
	cmp r10, r13
	je posi
	jne nega

posi:
	mov rax, r12
	call _printRAX
	ret

nega:
	mov r13, 0xFFFFFFFFFFFF0000
	or r12, r13
	not r12
	add r12, 0x1	

	mov rax,1
	mov rdi,1
	mov rsi,guion
	mov rdx,1
	syscall

	write_file guion, 1

	mov rax, r12
	call _printRAX
	ret



_datosInternos:
	mov r10, 0x8000000000000000
	and r10, r12
	mov r13, 0x0	
	cmp r10, r13
	je posi
	jne nega

posit:
	mov rax, r12
	call _printRAX
	ret

negat:
	mov rax,1
	mov rdi,1
	mov rsi,guion
	mov rdx,1
	syscall

	write_file guion, 1

	mov rax, r12
	call _printRAX
	ret	
	
	

;777777777777777777777777777777777777777777777777777777777777777777777



_imprimirRegistro:

;Registro r12 tiene el valor del rt, rd, rs

	mov r13, 0x0
	cmp r12, r13
	je printR0

	add r13, 0x1
	cmp r12, r13
	je printR1
	
	add r13, 0x1
	cmp r12, r13
	je printR2

	add r13, 0x1
	cmp r12, r13
	je printR3

	add r13, 0x1
	cmp r12, r13
	je printR4

	add r13, 0x1
	cmp r12, r13
	je printR5

	add r13, 0x1
	cmp r12, r13
	je printR6

	add r13, 0x1
	cmp r12, r13
	je printR7

	add r13, 0x1
	cmp r12, r13
	je printR8

	add r13, 0x1
	cmp r12, r13
	je printR9

	add r13, 0x1
	cmp r12, r13
	je printR10

	add r13, 0x1
	cmp r12, r13
	je printR11

	add r13, 0x1
	cmp r12, r13
	je printR12

	add r13, 0x1
	cmp r12, r13
	je printR13

	add r13, 0x1
	cmp r12, r13
	je printR14

	add r13, 0x1
	cmp r12, r13
	je printR15

	add r13, 0x1
	cmp r12, r13
	je printR16

	add r13, 0x1
	cmp r12, r13
	je printR17

	add r13, 0x1
	cmp r12, r13
	je printR18

	add r13, 0x1
	cmp r12, r13
	je printR19

	add r13, 0x1
	cmp r12, r13
	je printR20

	add r13, 0x1
	cmp r12, r13
	je printR21

	add r13, 0x1
	cmp r12, r13
	je printR22

	add r13, 0x1
	cmp r12, r13
	je printR23

	add r13, 0x1
	cmp r12, r13
	je printR24

	add r13, 0x1
	cmp r12, r13
	je printR25

	add r13, 0x1
	cmp r12, r13
	je printR26

	add r13, 0x1
	cmp r12, r13
	je printR27

	add r13, 0x1
	cmp r12, r13
	je printR28

	add r13, 0x1
	cmp r12, r13
	je printR29

	add r13, 0x1
	cmp r12, r13
	je printR30

	add r13, 0x1
	cmp r12, r13
	je printR31



;-------------------------------------------------
;+++++++++++++++++++++++++++++++++++++++++++++++++

printR0:
	mov rax,1
	mov rdi,1
	mov rsi,registros ;$zero
	mov rdx,6
	syscall

	write_file registros, 6

	ret

printR1:
	mov rax,1
	mov rdi,1
	mov rsi,registros+7 ;$at
	mov rdx,4
	syscall

	push r13
	mov r13, registros+7
	write_file r13, 4
	pop r13
	ret
printR2:
	mov rax,1
	mov rdi,1
	mov rsi,registros+12 ;$v0
	mov rdx,4
	syscall

	push r13
	mov r13, registros+12
	write_file r13, 4
	pop r13

	ret
printR3:
	mov rax,1
	mov rdi,1
	mov rsi,registros+17 ;$v1
	mov rdx,4
	syscall

	push r13
	mov r13, registros+17
	write_file r13, 4
	pop r13

	ret
printR4:
	mov rax,1
	mov rdi,1
	mov rsi,registros+22 ;$a0
	mov rdx,4
	syscall

	push r13
	mov r13, registros+22
	write_file r13, 4
	pop r13

	ret
printR5:
	mov rax,1
	mov rdi,1
	mov rsi,registros+27 ;$a1
	mov rdx,4
	syscall

	push r13
	mov r13, registros+27
	write_file r13, 4
	pop r13

	ret
printR6:
	mov rax,1
	mov rdi,1
	mov rsi,registros+32 ;$a2
	mov rdx,4
	syscall

	push r13
	mov r13, registros+32
	write_file r13, 4
	pop r13

	ret
printR7:
	mov rax,1
	mov rdi,1
	mov rsi,registros+37 ;$a3
	mov rdx,4
	syscall

	push r13
	mov r13, registros+37
	write_file r13, 4
	pop r13

	ret
printR8:
	mov rax,1
	mov rdi,1
	mov rsi,registros+42
	mov rdx,4
	syscall

	push r13
	mov r13, registros+42
	write_file r13, 4
	pop r13

	ret
printR9:
	mov rax,1
	mov rdi,1
	mov rsi,registros+47
	mov rdx,4
	syscall

	push r13
	mov r13, registros+47
	write_file r13, 4
	pop r13

	ret
printR10:
	mov rax,1
	mov rdi,1
	mov rsi,registros+52
	mov rdx,4
	syscall

	push r13
	mov r13, registros+52
	write_file r13, 4
	pop r13

	ret
printR11:
	mov rax,1
	mov rdi,1
	mov rsi,registros+57
	mov rdx,4
	syscall

	push r13
	mov r13, registros+57
	write_file r13, 4
	pop r13

	ret
printR12:
	mov rax,1
	mov rdi,1
	mov rsi,registros+62
	mov rdx,4
	syscall

	push r13
	mov r13, registros+62
	write_file r13, 4
	pop r13

	ret
printR13:
	mov rax,1
	mov rdi,1
	mov rsi,registros+67
	mov rdx,4
	syscall

	push r13
	mov r13, registros+67
	write_file r13, 4
	pop r13

	ret
printR14:
	mov rax,1
	mov rdi,1
	mov rsi,registros+72
	mov rdx,4
	syscall

	push r13
	mov r13, registros+72
	write_file r13, 4
	pop r13

	ret
printR15:
	mov rax,1
	mov rdi,1
	mov rsi,registros+77
	mov rdx,4
	syscall

	push r13
	mov r13, registros+77
	write_file r13, 4
	pop r13

	ret
printR16:
	mov rax,1
	mov rdi,1
	mov rsi,registros+82
	mov rdx,4
	syscall

	push r13
	mov r13, registros+82
	write_file r13, 4
	pop r13

	ret
printR17:
	mov rax,1
	mov rdi,1
	mov rsi,registros+87
	mov rdx,4
	syscall

	push r13
	mov r13, registros+87
	write_file r13, 4
	pop r13
	ret
printR18:
	mov rax,1
	mov rdi,1
	mov rsi,registros+92
	mov rdx,4
	syscall

	push r13
	mov r13, registros+92
	write_file r13, 4
	pop r13

	ret
printR19:
	mov rax,1
	mov rdi,1
	mov rsi,registros+97
	mov rdx,4
	syscall

	push r13
	mov r13, registros+97
	write_file r13, 4
	pop r13

	ret
printR20:
	mov rax,1
	mov rdi,1
	mov rsi,registros+102
	mov rdx,4
	syscall

	push r13
	mov r13, registros+102
	write_file r13, 4
	pop r13

	ret
printR21:
	mov rax,1
	mov rdi,1
	mov rsi,registros+107
	mov rdx,4
	syscall

	push r13
	mov r13, registros+107
	write_file r13, 4
	pop r13

	ret
printR22:
	mov rax,1
	mov rdi,1
	mov rsi,registros+112
	mov rdx,4
	syscall

	push r13
	mov r13, registros+112
	write_file r13, 4
	pop r13

	ret
printR23:
	mov rax,1
	mov rdi,1
	mov rsi,registros+117
	mov rdx,4
	syscall

	push r13
	mov r13, registros+117
	write_file r13, 4
	pop r13
	ret
printR24:
	mov rax,1
	mov rdi,1
	mov rsi,registros+122
	mov rdx,4
	syscall

	push r13
	mov r13, registros+122
	write_file r13, 4
	pop r13

	ret
printR25:
	mov rax,1
	mov rdi,1
	mov rsi,registros+127
	mov rdx,4
	syscall

	push r13
	mov r13, registros+127
	write_file r13, 4
	pop r13

	ret
printR26:
	mov rax,1
	mov rdi,1
	mov rsi,registros+132
	mov rdx,4
	syscall

	push r13
	mov r13, registros+132
	write_file r13, 4
	pop r13

	ret
printR27:
	mov rax,1
	mov rdi,1
	mov rsi,registros+137
	mov rdx,4
	syscall

	push r13
	mov r13, registros+137
	write_file r13, 4
	pop r13

	ret
printR28:
	mov rax,1
	mov rdi,1
	mov rsi,registros+142
	mov rdx,4
	syscall

	push r13
	mov r13, registros+142
	write_file r13, 4
	pop r13

	ret
printR29:
	mov rax,1
	mov rdi,1
	mov rsi,registros+147
	mov rdx,4
	syscall

	push r13
	mov r13, registros+147
	write_file r13, 4
	pop r13

	ret
printR30:
	mov rax,1
	mov rdi,1
	mov rsi,registros+152
	mov rdx,4
	syscall

	push r13
	mov r13, registros+152
	write_file r13, 4
	pop r13

	ret
printR31:
	mov rax,1
	mov rdi,1
	mov rsi,registros+157
	mov rdx,4
	syscall

	push r13
	mov r13, registros+157
	write_file r13, 4
	pop r13

	ret
;+++++++++++++++++++++++++++++++++++++++++++++++++
;-------------------------------------------------

datos:
	;PRINT $V0
	mov rax,1
	mov rdi,1
	mov rsi,registros+12
	mov rdx,4
	syscall

	push r13
	mov r13, registros+12
	write_file r13, 4
	pop r13

	mov r12, [Re2]
	call _datosInternos

	;PRINT $V1
	mov rax,1
	mov rdi,1
	mov rsi,registros+17
	mov rdx,4
	syscall

	push r13
	mov r13, registros+17
	write_file r13, 4
	pop r13

	mov r12, [Re3]
	call _datosInternos

	;PRINT $a0
	mov rax,1
	mov rdi,1
	mov rsi,registros+22
	mov rdx,4
	syscall

	push r13
	mov r13, registros+22
	write_file r13, 4
	pop r13

	mov r12, [Re4]
	call _datosInternos

	;PRINT $a1
	mov rax,1
	mov rdi,1
	mov rsi,registros+27
	mov rdx,4
	syscall

	push r13
	mov r13, registros+27
	write_file r13, 4
	pop r13

	mov r12, [Re5]
	call _datosInternos

	;PRINT $a2
	mov rax,1
	mov rdi,1
	mov rsi,registros+32
	mov rdx,4
	syscall

	push r13
	mov r13, registros+32
	write_file r13, 4
	pop r13

	mov r12, [Re6]
	call _datosInternos

	;PRINT $a3
	mov rax,1
	mov rdi,1
	mov rsi,registros+37
	mov rdx,4
	syscall

	push r13
	mov r13, registros+37
	write_file r13, 4
	pop r13

	mov r12, [Re7]
	call _datosInternos

	;PRINT $s0
	mov rax,1
	mov rdi,1
	mov rsi,registros+82
	mov rdx,4
	syscall

	push r13
	mov r13, registros+82
	write_file r13, 4
	pop r13

	mov r12, [Re16]
	call _datosInternos

	;PRINT $s1
	mov rax,1
	mov rdi,1
	mov rsi,registros+87
	mov rdx,4
	syscall

	push r13
	mov r13, registros+87
	write_file r13, 4
	pop r13

	mov r12, [Re17]
	call _datosInternos

	;PRINT $s2
	mov rax,1
	mov rdi,1
	mov rsi,registros+92
	mov rdx,4
	syscall

	push r13
	mov r13, registros+92
	write_file r13, 4
	pop r13

	mov r12, [Re18]
	call _datosInternos

	;PRINT $s3
	mov rax,1
	mov rdi,1
	mov rsi,registros+97
	mov rdx,4
	syscall

	push r13
	mov r13, registros+97
	write_file r13, 4
	pop r13

	mov r12, [Re19]
	call _datosInternos

	;PRINT $s4
	mov rax,1
	mov rdi,1
	mov rsi,registros+102
	mov rdx,4
	syscall

	push r13
	mov r13, registros+102
	write_file r13, 4
	pop r13

	mov r12, [Re20]
	call _datosInternos

	;PRINT $s5
	mov rax,1
	mov rdi,1
	mov rsi,registros+107
	mov rdx,4
	syscall

	push r13
	mov r13, registros+107
	write_file r13, 4
	pop r13

	mov r12, [Re21]
	call _datosInternos

	;PRINT $s6
	mov rax,1
	mov rdi,1
	mov rsi,registros+112
	mov rdx,4
	syscall

	push r13
	mov r13, registros+112
	write_file r13, 4
	pop r13

	mov r12, [Re22]
	call _datosInternos

	;PRINT $s7
	mov rax,1
	mov rdi,1
	mov rsi,registros+117
	mov rdx,4
	syscall

	push r13
	mov r13, registros+117
	write_file r13, 4
	pop r13

	mov r12, [Re23]
	call _datosInternos

	;PRINT $sp
	mov rax,1
	mov rdi,1
	mov rsi,registros+147
	mov rdx,4
	syscall

	push r13
	mov r13, registros+147
	write_file r13, 4
	pop r13

	mov r12, [Re29]
	call _datosInternos

	ret
