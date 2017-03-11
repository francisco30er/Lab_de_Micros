section .bss
	digitSpace resb 100
	digitSpacePos resb 8



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
	$spBase DQ 0x0



	pc dq 0x0   ;ejemplo para compilar

;stack---------------------------------------------------------------


	Contador DQ 0x8	; Hacerlo un byte
; Empezar el contador -1, si se desea abrir un espacio de 1 en stack, este valor se sumara al contador y se usara el primer byte de la etiqueta stack9, si se suma dos, se usaran dos bytes y asi sucesivamente. Mientras el contador sea un numero negativo, se debe hacer una excepcion para que indique al usuario que no se puede guardar en stack el valor ya que esta en una zona nula del stack.





	stack0 DQ 9h ; Tratar de limitarlo 
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

;------------------------------- MAIN --------------------------------

section .text	
	global _start
_start:

; r8 debe tener el valor del para abrir o cerrar el stack (-4,-8,4,8...)



	mov r8, 0x-4 ; registro que contiene la cantidad de "bytes" por abrir
	mov r9, 0xAAAA ; registro que contiene el valor a guardar
_Stack:
	mov r10, 0x0000000000008000
	mov rax, 0x0
	and r10, r8 ; Se hace la mascara bitSigno para 
	cmp r10, rax
	je _positivoStack
	jne _negativoStack



_negativoStack:
	mov r10, 0xFFFFFFFFFFFF0000
	or r10, r8
	jmp _llenadoStack

_positivoStack:
	mov r10, 0x000000000000FFFF
	and r10, r8 ;Mascara para inmediate	
 	jmp _llenadoStack

_llenadoStack:
	shl r10, 1 ; (Valor/4)*8=Valor*2 = Corrimiento a 1
	mov r12, [Contador]
	add r12, r10 ;Hago la suma para el offset
	
;Comprobamos si el offset final corresponde a un valor valido del Stack

	mov rax, 0x8
	cmp r12, rax
	jg _Error  ; no se pudo guardar en Stack

	mov [Contador], r12
	mov r8, stack39
	add r8, r12 ; sumo el offset con la base del stack
	mov r15, stack39
	mov r13, [stack39]
prueba1:
	mov r14, r9 ; r9 contiene el valor que se desea guardar 
	mov [r8], r14  
;------------------------------------------------------------------
;------------------------------------------------------------------
; De aca para abajo no es parte de funcion


	mov r13, [stack39] ; prueba


_Error:


	;mov r13, [stack39]
	mov rax, 60
	mov rdi, 0
	syscall























