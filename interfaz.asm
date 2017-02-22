section .data
linea_uno: db 'Bienvenido al Emulador MIPS',0xa
l1_tamano: equ $-linea_uno
linea_dos: db 'EL-4313-Lab. Estructura de Microprocesadores 1S-2017',0xa
l2_tamano: equ $-linea_dos
buscar: db 'Buscando archivo ROM.txt',0xa
b_tamano: equ $-buscar
ne: db 'Archivo ROM.txt no encontrado',0xa
ne_tamano: equ $-ne

enc: db 'Archivo ROM.txt encontrado',0xa
enc_tamano: equ $-enc



;--------------------Segmento
section .text
global _start
global _segunda
global _tercera
global _busc
global _ne   ; no encontrado
;Definicion de la etiqueta inicial
;Etiqueta para depurar el programa
; Etiqueta para depurar el programa

_start:
;Imprimir la primera linea
mov rax,1                ;rax = sys_write (1)
mov rdi,1                ;rdi = 1
mov rsi,linea_uno        ;rsi = linea_uno
mov rdx,l1_tamano        ;rdx = tamano de linea_uno
syscall				;Llamar al sistema




;Imprimir la segunda linea
mov rax,1
mov rdi,1
mov rsi,linea_dos
mov rdx,l2_tamano

_segunda: syscall

;Imprimir buscando
mov rax, 1
mov rdi, 1
mov rsi, buscar
mov rdx, b_tamano

_buscar:    syscall

;Imprimir no encontrado
mov rax, 1
mov rdi, 1
mov rsi, ne
mov rdx, ne_tamano
_ne syscall

;Imprimir encontrado
mov rax, 1
mov rdi, 1
mov rsi, enc
mov rdx, enc_tamano
_enc syscall



mov rax,60
mov rdi,0
_tercera:        syscall        ;Llamar al sistema
	;fin del programa
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;

;
;
