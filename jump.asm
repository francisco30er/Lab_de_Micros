section .data 

systemFault: db 'systemFault',0xa
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



	pc dq 0x0   ;ejemplo para compilar

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

;----------------------------	INSTRUCCION ----------------------

;I1 DQ 0x0000000008000001
I1 DQ 0x00000000080000AA ; Address no valida
pcBase DQ 0x0
;------------------------------- MAIN --------------------------------

section .text	
	global _start
_start:


;R12 es el pc para este caso.
;R14 base del arreglo de instrucciones





_jump:

	mov r14, pcBase ;r14 apunta al pc base para definir rangos 

	mov r8, [I1]	; Se obtiene la instruccion
	mov r9, 0x0000000003FFFFFF ; Mascara para el address
	and r9, r8 ; Mascara para obtener el address
	shl r9, 3 ; Corrimiento a la izquierda x3 para multiplicar por 8
	mov r12, r14 ; La direccion base se iguala al pc
	add r12, r9 ; Se le suma address + pcBase
	jmp _VerificacionAddress


;Reutilizando funciones del beq y bne

_VerificacionAddress:
	cmp r14, r12  ;Compara la base con el pc nuevo
prueba:	jg _systemFault
	mov rax, 0x96  ;150 hexadecimal
	shl rax, 3
	add r14, rax
prueba1:
	cmp r12, r14 ; Si pc es mayor al limite del banco
	jge _systemFault
	jmp _exit	;No se encontro address invalida
	
	
_systemFault:

;Para esto es necesario decir que instruccion fallo, por ende seria mas facil hacerlo cuando se cuente con todo el banco de instrucciones (yo puedo hacerlo, tengo la idea) por tanto cuando este mas avanzado lo hago
		
	mov rax, 1
	mov rdi, 1
	mov rsi, systemFault
	mov rdx, 11
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

	


