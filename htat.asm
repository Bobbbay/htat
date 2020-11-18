;; This is the source code for `htat`. `htat` is a
;; simple, assembly utility for your system status
;; and processes - an alternative to top.
;;
;; You should find this file rigorously out. This
;; is because I am insane. Soon I'll be saying the
;; FBI is knocking at the door. Anyways...
;;
;; If the line is not commented out, I have no clue
;; what the fuck it does*. Feel free to add comments
;; or provide explanation - that would be nice.
;;
;; *this is why most of the file is not commented out.
;;
;; Feel free to treat this code as your own. The MIT
;; license is one of the least restricting, allowing
;; you to abuse the code if you have to (don't do that
;; though).
;;
;; Without further ado, the code is yours.
;;
;; Sincerely,
;;
;; Bobbbay,
;; and contributors of htat

section .text
    global _start               ; declared for linker

_start:                         ; linker entry point
    mov eax, 5
    mov ebx, file_name          ; Move filename to ebx
    mov ecx, 0                  ; Read only access
    mov edx, 0777               ; 777 perms
    int 0x80                    ; Kernel call

    mov [fd_in], eax

    mov eax, 3
    mov ebx, [fd_in]
    mov ecx, read               ; Set ecx to contain the contents
    mov edx, 26
    int 0x80                    ; Kernel call

    mov eax, 6
    mov ebx, [fd_in]
    int 0x80                    ; Kernel call

    mov eax, 4
    mov ebx, 1
    mov ecx, read               ; Print out the file
    mov edx, 26
    int 0x80                    ; Kernel call

    mov eax, 1                  ; sys_exit
    int 0x80                    ; Kernel call

section .data
file_name db '/proc/filesystems'    ; As a proof of concept, we echo out /proc/filesystems

section .bss
fd_out resb 1
fd_in  resb 1
read resb  26
