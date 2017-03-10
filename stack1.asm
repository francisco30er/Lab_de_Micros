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


	Contador DQ 0x-1	; Hacerlo un byte
; Empezar el contador -1, si se desea abrir un espacio de 1 en stack, este valor se sumara al contador y se usara el primer byte de la etiqueta stack9, si se suma dos, se usaran dos bytes y asi sucesivamente. Mientras el contador sea un numero negativo, se debe hacer una excepcion para que indique al usuario que no se puede guardar en stack el valor ya que esta en una zona nula del stack.



	stack9 DQ 9h ; Tratar de limitarlo 
	stack8 DQ 8h
	stack7 DQ 7h
	stack6 DQ 6h
	stack5 DQ 5h
	stack4 DQ 4h
	stack3 DQ 3h
	stack2 DQ 2h
	stack1 DQ 1h
	stack0 DQ 0h

;------------------------------- MAIN --------------------------------

section .text	
	global _start
_start:
	
;El contador se crea para saber la cantidad de espacios que se habren en el stack. En MIPS se especifica el numero de bytes en espacios que se desean abrir, por tanto ese valor se guarda en el contador como offset para que apartir de la direccion inicial se le sume ese valor y se logre acceder al ultimo dato en stack, igual funcionaria para saber cuando se esta en el limite del stack.

	mov r15, [Contador]
	add r15, 0x16	; me muevo 8 para ir a stack8
	mov [Contador], r15

	mov r15, stack9 ; Tomo la direccion del stack9	
	mov r14, 0xff	; Valor con el cual escribire a stack8
	mov [r15], r14	; igualo el valor anterior al contenido en stack8 por puntero
	mov r13, [stack7] ; cargo el valor de stack8 en otro registro para verificar



















;=====================================================================
;		Stack mapeando al del sistema
;=====================================================================

;	mov [$sp], rsp ;pase el contenido del stack pointer al sp
;	mov rax, [$sp]
;	mov rbx, [$sp]
;	sub rbx, 0x320 ; Le resta 100 espacios de 8bytes para tener la direccion base del stack a usar
;	mov [$sp], rbx
;	mov rcx, [$sp]	
;	sub rcx, 4
;	mov $sp, rcx


	call _printRAX

;=====================================================================
;=====================================================================

prueba:


	
	mov rax, 60
	mov rdi, 0
	syscall























;------------------------------------------------------------------
;------------------------------------------------------------------

; RUTINA IMPRIMIR REGISTRO RAX

_printRAX:
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

	mov rcx, [digitSpacePos]
	dec rcx
	mov [digitSpacePos], rcx

	cmp rcx, digitSpace
	jge _printRAXLoop2

	ret

;-------------------------------------------------------------------
;-------------------------------------------------------------------	


