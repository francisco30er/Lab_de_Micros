extern system

section .data

         an: db 'system("lscpu | grep Arquitectura")', 0xA
         format: db "num: %c" , 10, 0

section .text
         global main
         extern printf

main:
         push rbp
         mov rbp,rsp

         mov rax, [an]
         push rax
         push dword format
         call printf

         add rsp, 8
         mov rsp,rbp
         pop rbp

         mov rax, 0
         ret


