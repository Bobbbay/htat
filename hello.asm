section .text
    global _start               ; declared for linker

_start:                         ; linker entry point
    mov  edx,len                ; message len
    mov  ecx,msg                ; message txt
    mov  ebx,1                  ; stdout
    mov eax,4                   ; sys_write
    int 0x80                    ; kernel call
    mov eax,1                   ; sys_exit
    int 0x80                    ; kernel call

section .data
msg db 'Hello world', 0xa       ; msg txt
len equ $ - msg                 ; msg len
