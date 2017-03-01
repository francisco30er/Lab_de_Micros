section .data 

	cons_hola: db 'hola mundo!',0xa
	cons_tamano: equ $-cons_hola

	cons_beq: db 'beq',0xa
	cons_Nbeq: db 'Nbeq', 0xa	
	cons_exit: db 'Exit', 0xa	

; Banco de registros de MIPS --------------------------------------
	$zero DQ 0h
	$at DQ	0h
	$v0 DQ 000000000000000Eh
	$v1 DQ 000000000000000Fh
	$a0 DQ 000000000000000Ah
	$a1 DQ 000000000000000Bh
	$a2 DQ 000000000000000Ch
	$a3 DQ 000000000000000Dh
	$t0 DQ 0000000000000001h; No estoy seguro de que se deban 
	$t1 DQ 0000000000000001h; implementar
	$t2 DQ 0000000000000001h
	$t3 DQ 0000000000000001h
	$t4 DQ 0000000000000001h
	$t5 DQ 0000000000000001h	
	$t6 DQ 0000000000000001h
	$t7 DQ 0000000000000001h
	$s0 DQ 0000000000000001h ; iniciados en valores random por prueba
	$s1 DQ 0000000000000002h ; los solicitados segun la guia
	$s2 DQ 0000000000000002h
	$s3 DQ 0000000000000005h
	$s4 DQ 0000000000000005h
	$s5 DQ 0000000000000006h
	$s6 DQ 0000000000000007h
	$s7 DQ 0000000000000008h
	$t8 DQ 0000000000000001h
	$t9 DQ 0000000000000001h
	$sp DQ 000000007ffffffch ;------- stackpointer





;stack---------------------------------------------------------------
	stack1 DQ 0h  
	stack2 DQ 0h
	stack3 DQ 0h
	stack4 DQ 0h
	stack5 DQ 0h
	stack6 DQ 0h
	stack7 DQ 0h
	stack8 DQ 0h
	stack9 DQ 0h



;----------------------- Instruccion ------------------------------

pc DQ 0x0 ; PC de prueba
I1 DQ 0xFFFFFFFF1251FFFD ;  branch con $s2, $s1, -3




;---------------------------MAIN---------------------------------------

section .text
	global _start
_start:


; Para el beq se toma el valor de ambos registros (rs y rt respectivamente) y se compara el valor de estos, si es correcto; se procede a hacer el salto
; El salto consiste en realizar un PC+4 y desde ahi se cuentan las instrucciones necesarias segun el inmediate (haciendo un shift left de 2).

_beq:
	mov r8, [I1] ; Carga la instruccion en r8
	mov r9, 0x0000000003E00000 ; Mascara para rs
	and r9, r8 ; Se aplica la mascara y se guarda en r9 (rs)
	
	mov r10, 0x00000000001F0000 ; Mascara para rt
	and r10, r8 ;  Se aplica la mascara y se guarda en r10 (rt)

; En r9 -> rs 		r10 -> rt

	sar r9, 21  ; Corrimiento para tener el numero del registro al inicio del arreglo
	sar r10, 16 ; Corrimiento para tener el numero del registro al inicio del arreglo


	;-----------REGISTRO RS	

	mov rax, 0x8 ; La memoria avanza de 8 en 8, por tanto, 8xValorRegistro + base de direccion del arreglo de registros, da direccion de registro deseado.

	mul r9

	mov r11, $zero ; se toma la direccion del registro 0 como  base
	add r11, rax ; se suma a la base el offset
	mov r9, [r11] ; se carga el valor del registro deseado en MIPS
_brake1:
	;-----------REGISTRO RT
	
	mov rax, 0x8 ; La memoria avanza de 8 en 8, por tanto, 8xValorRegistro + base de direccion del arreglo de registros, da direccion de registro deseado.

	mul r10

	mov r11, $zero ; se toma la direccion del registro 0 como  base
	add r11, rax ; se suma a la base el offset
	mov r10, [r11] ; se carga el valor del registro deseado en MIPS
	
; Ya se tiene los valores contenidos de rs y rt en r9 y r10 respectivamente, por tanto se debe comparar, si estos son iguales debe brincar a una etiqueta que cambie el pc, de lo contrario debe hacer pc+8
	mov r15, $s2 ; Prueba
	mov r14, $s1 ; Prueba 


	cmp r9, r10 ; Compara los valores
_brake2:
	mov r12, 0xFFFF 	;==========================PC
	je _beqCumplido
	jne _beqNoCumplido
_brakej: jmp _exit

_beqNoCumplido:
	mov rax, 0x8
	add r12, rax ; pc+8
	mov rax, 1
	mov rdi, 1
	mov rsi, cons_Nbeq 
	mov rdx, 4
	syscall
	jmp _exit

_beqCumplido:
	mov r9, 0x000000000000FFFF
	and r9, r8 ; Mascara para el inmediate
	shl r9, 3 ; Corrimiento a 3 para sumar con PC (!REVISAR!)
	add r12, 0x8 ; PC+8
	add r12, r9 ; (PC+8)+inmediate
_prueba1: mov rax, 1
	mov rdi, 1
	mov rsi, cons_beq 
	mov rdx, 3
	syscall	
	jmp _exit

_exit: 	
	mov rax, 1
	mov rdi, 1
	mov rsi, cons_exit 
	mov rdx, 4
	syscall	
	mov rax, 60
	mov rdi, 0
	syscall


























