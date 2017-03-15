	
section .data

cons_hola: db 'Excede el numero de argumentos segmentation fault everywhere!',0xa
cons_tamano: equ $-cons_hola
M0 DQ 0x0000000000000000; 
M1 DQ 0x0000000000000000;
M2 DQ 0x0000000000000000;
M3 DQ 0x0000000000000000;

section .bss
 
argpos resb 100

section .text


global _start


_start:
	mov r11,0
	mov rax,1
	pop rbx	; se saca argc en rax
	
	mov r13,rbx	;se mueve argc a r8
	cmp r13,1	;no hay argumentos
	je Exit	;sale del programa
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
	mov [M0],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
arg1:	
	mov [M1],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
arg2:
	mov [M2],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
arg3:
	mov [M3],r10
	add r11,1
	mov r10,0
	mov rax,1
	jmp pop
pop:	
	cmp r13,1
	je Exit
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
	mov rax,60 
	mov rdi,0 
	syscall  	
      






Exit:
	
	mov rax,60 
	mov rdi,0 
	syscall



        

