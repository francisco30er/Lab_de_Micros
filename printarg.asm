extern printf, exit

section .data
fmtint  db  "%d", 10, 0
fmtstr  db  "%s", 10, 0

section .text
global main
main:

    push    qword[rsp]
    push    fmtint      
    call    printf                      ; print argc
    add     rsp, 4 * 2

    mov     rbx, 1  
PrintArgV:
    push    qword [rsp + 8 * rbx]
    push    fmtstr
    call    printf                      ; print each param in argv
    add     rsp, 4 * 2

    inc     rbx
    cmp     rbx, qword [rsp]
    jng     PrintArgV

    call    exit
