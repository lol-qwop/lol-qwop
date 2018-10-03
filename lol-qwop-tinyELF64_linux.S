; $ nasm -f bin -o lol-qwop-tinyELF64_linux lol-qwop-tinyELF64_linux.S
; $ du -b lol-qwop-tinyELF64_linux
; 110      lol-qwop-tinyELF64_linux

; $ chmod +x lol-qwop-tinyELF64_linux
; $ ./lol-qwop-tinyELF64_linux

%define EXIT_SUCCESS 0x00
%define stdout       0x01
%define sys_exit     0x3C
%define sys_write    0x01
%define qwop         0x0A
%define lol_qwop     qwop

BITS 64
                org     0x100000000
                                                      ; Elf32_Ehdr  Elf32_Phdr
                db      0x7F, "ELF"                   ; e_ident
                db      0x02, 0x01                    ; e_ident
                db      "lol-qwop!", 0x0A             ; e_ident!
lol:
                dw      0x0002                        ; e_type
                dw      0x003E                        ; e_machine
                dd      0x00000001                    ; e_version
                dd      _start - $$                   ; e_entry
phdr:           dd      0x00000001                    ;             p_type
                dd      phdr - $$                     ; e_phoff     p_flags
                dd      0x00000000                    ;             p_offset
                dd      0x00000000                    ; e_shoff
                dq      $$                            ;             p_vaddr
                                                      ; e_flags
                dw      0x0000                        ; e_ehsize    p_paddr
                dw      0x0038                        ; e_phentsize
                dw      0x0001                        ; e_phnum
                dw      0x0000                        ; e_shentsize
                dq      filesize                      ;              p_filesz
                dq      filesize                      ;              p_memsz
                dq      0x0000000000200000            ;              p_align
_start:
                mov     al, sys_write
                mov     dil, stdout
                mov     rsi, lol-qwop
                mov     dl, lol_qwop
                syscall

                mov     al, sys_exit;
                mov     dil, EXIT_SUCCESS
                syscall

filesize        equ     $ - $$
