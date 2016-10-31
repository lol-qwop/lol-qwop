; /usr/local/bin/nasm -f macho64 lol-qwop.macho64.asm && ld -macosx_version_min 10.7.0 -lSystem -o lol-qwop_macho64 lol-qwop.macho64.o && ./lol-qwop_macho64

global start

section .text
start:
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg.len
    syscall

    mov rax, 0x2000001
    mov rdi, 0
    syscall

section .data
msg: db "lol-qwop", 10, 0
.len: equ $ - msg 
