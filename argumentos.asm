section .data
	mensaje db 0xA,"---vamos a probar esto---",0xA
	longitud equ $ - mensaje
	mensaje2 db 0xA,"---hemos terminado---",0xA
	longitud2 equ $ - mensaje2
;b_tamano: equ $-buscar
	tamano equ 1024

section .bss
	buffer: resb 1024

section .text
	global _start	;definimos el punto de entrada


_start:
	mov rdx,longitud	;RDX=long. de la cadena
	mov rcx,mensaje		;RCX=cadena a imprimir
	mov rbx,1		;RBX=manejador de fichero	
	mov rax,4		;RAX=función sys_write() del kernel
	syscall		;interrupc. 0 (llamada al kernel)

	pop rax		;extraer "argc"
	pop rbx		;extraer argv[0] (nombre del ejecutable)

	pop rbx		;extraer el primer arg real (puntero a cadena)
	mov rax,5	;función para sys_open()
	mov rcx,0	;O_RDONLY (definido en fcntl.h)
	syscall

	test rax, rax	;comprobar si dev. error o el descriptor
	jns leer_del_fichero

hubo_error:
	mov rbx, rax	;terminar, devolviendo el código de error
	mov rax,1
	int 0x80



argumentos:
	pop rcx		;vamos extrayendo los argumentos
	test rcx,rcx	;comprobamos si llegamos al NULL
	jnz argumentos
entorno:
	pop rdx		;vamos extrayendo las variables
	test rdx, rdx	;comprobamos si llegamos al NULL
	jnz entorno


	pop rbx 	;extraer “argc”
	pop rbx 	;extraer argv[0]

	pop rbx 	;extraer el primer argumento real (puntero a una cadena)
	mov rax, 5 	;función para sys_open()
	mov rcx, 0	;o_R
	syscall


	test rax,rax ;comprobar si devuelve error o el descriptor
	jns leer_del_fichero


leer_del_fichero:
	mov rbx, rax	;no hay error=>devuelve descriptor
	push rbx
	mov rax, 3	;función para sys_read()
	mov rcx, buffer	;variable donde guardamos lo leido
	mov rdx,tamano	;tamaño de lectura
	syscall
	js hubo_error

mostrar_por_pantalla:
	mov rdx,rax	;longitud de la cadena a escribir
	mov rax,4	;función sys_write()
	mov rbx,1	;descriptor de STDOUT
	syscall


cerrar_fichero:
	pop rbx
	mov rax,6	;función para cerrar un fichero
	syscall


	mov rdx, longitud2
	mov rcx, mensaje2
	mov rbx, 1
	mov rax, 4
	syscall

	mov rbx, 0
	mov rax, 1
	syscall
