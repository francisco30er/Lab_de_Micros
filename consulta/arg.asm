 extern printf                   ; the C function to be calle

SECTION .data ; Section containing initializion

fmt2:   db "printf2: flt2=%e", 10, 0
fmt3:	db "char1=%c, str1=%s, len=%d", 10, 0
fmt4:	db "char1=%c, str1=%s, len=%d, inta1=%d, inta2=%ld", 10, 0
fmt5:	db "hex1=%lX, flt1=%e, flt2=%e", 10, 0
	
char1:	db	'a'			; a character 
str1:	db	"mystring",0	        ; a C string, "string" needs 0
len:	equ	$-str1			; len has value, not an address
inta1:	dd	12345678		; integer 12345678, note dd
inta2:	dq	12345678900		; long integer 12345678900, note dq
hex1:	dq	0x123456789ABCD	        ; long hex constant, note dq
flt1:	dd	5.327e-30		; 32-bit floating point, note dd
flt2:	dq	-123.456789e300	        ; 64-bit floating point, note dq

ErrMsg: db " Terminated with error.",10
ERRLEN equ $-ErrMsg

SECTION .bss ; Section containing uninitialized data


flttmp:	resq 1			        ; 64-bit temporary for printing flt1
MAXARGS equ 10          ; Maximum # of args we support
ArgCount: resd 1        ; # of arguments passed to program
ArgPtrs: resd MAXARGS   ; Table of pointers to arguments
ArgLens: resd MAXARGS   ; Table of argument lengths


SECTION .text           ; Section containing code


global _start           ; Linker needs this to find the entry point!


global main


_start:
nop                     ; This no-op keeps gdb happy...
; Get the command line argument count off the stack and validate it:

pop rcx                    ; TOS contains the argument count
cmp rcx,MAXARGS            ; See if the arg count exceeds MAXARGS
;ja Error                   ; If so, exit with an error message
mov qword [ArgCount],rcx   ; Save arg count in memory variable
mov r10,rcx

global	main		        ; "C" main program 
main:				        ; label, start of main program
	push    rbp			; set up stack frame 
	fld	dword [flt1]	        ; need to convert 32-bit to 64-bit
	fstp	qword [flttmp]          ; floating load makes 80-bit,
	                                ; store as 64-bit
	mov	rdi,fmt2
	movq	xmm0, qword [flt2]
	mov	rax, 1			; 1 xmm register
	call	printf

	mov	rdi, fmt3		; first arg, format
	mov	rsi, [char1]		; second arg, char
	mov	rdx, str1		; third arg, string
	mov	rcx, len		; fourth arg, int
	mov	rax, 0			; no xmm used
	call	printf

	mov	rdi, fmt4		; first arg, format
	mov	rsi, [char1]		; second arg, char
	mov	rdx, str1		; third arg, string
	mov	rcx, len		; fourth arg, int
	mov	r8, [inta1]		; fifth arg, inta1 32->64
	mov	r9, [inta2]		; sixth arg, inta2
	mov	rax, 0			; no xmm used
	call	printf

	mov	rdi, fmt5		; first arg, format
	mov	rsi, [hex1]		; second arg, char
	movq	xmm0, qword [flttmp]    ; first double
	movq	xmm1, qword [flt2]	; second double
	mov	rax, 2			; 2 xmm used
	call	printf
	
	pop	rbp			; restore stack	
        mov     rax, 0			; exit code, 0=normal
        ret				; main returns to operating system



; Once we know how many args we have, a loop will pop them into ArgPtrs:


;xor rdx,rdx ; Zero a loop counter

;SaveArgs:

;op qword [ArgPtrs + rdx*8]      ; Pop an arg addr into the memory table
;mov r8,[ArgPtrs + rdx*8]
;inc rdx				 ; Bump the counter to the next arg addr
;cmp rdx,rcx			 ; Is the counter = the argument count?
;jb SaveArgs			 ; If not, loop back and do another

; With the argument pointers stored in ArgPtrs, we calculate their lengths:

;xor rax,rax		 ; Searching for 0, so clear AL to 0
;xor rbx,rbx		 ; Pointer table offset starts at 0


;ScanOne:
;mov rcx,0000ffffh		 ; Limit search to 65535 bytes max
;mov rdi,qword [ArgPtrs+rbx*8]    ; Put address of string to search in EDI
;mov rdx,rdi			 ; Copy starting address into EDX
;cld				 ; Set search direction to up-memory
;repne scasb			 ; Search for null (0 char) in string at edi
;jnz Error			 ; REPNE SCASB ended without finding AL
;mov byte [rdi-1],10		 ; Store an EOL where the null used to be
;sub rdi,rdx			 ; Subtract position of 0 from start address
;mov qword [ArgLens+ebx*8],rdi    ; Put length of arg into table
;inc rbx			       	; Add 1 to argument counter
;cmp rbx,[ArgCount]		 ; See if arg counter exceeds argument count
;jb ScanOne			 ; If not, loop back and do another one

; Display all arguments to stdout:

;xor rsi,rsi		 ; Start (for table addressing reasons) at 0

;Showem:
;mov rcx,[ArgPtrs+rsi*8]  ; Pass offset of the message
;mov rax,4		 ; Specify sys_write call
;mov rbx,1		 ; Specify File Descriptor 1: Standard Output
;mov rdx,[ArgLens+rsi*8]  ; Pass the length of the message
;int 80H			 ; Make kernel call
;inc rsi			 ; Increment the argument counter
;cmp rsi,[ArgCount]	 ; See if we’ve displayed all the arguments
;jb Showem		 ; If not, loop back and do another
;jmp Exit		 ; We’re done! Let’s pack it in!

;Error: mov rax,4	 ; Specify sys_write call
;	mov rbx,1		 ; Specify File Descriptor 2: Standard Error
;	mov rcx,ErrMsg		 ; Pass offset of the error message
;	mov rdx,ERRLEN		 ; Pass the length of the message
;	int 80H			 ; Make kernel call

;Exit:   mov rax,1	 ; Code for Exit Syscall
;	mov rbx,0	 ; Return a code of zero
;1	int 80H		 ; Make kernel call
	
