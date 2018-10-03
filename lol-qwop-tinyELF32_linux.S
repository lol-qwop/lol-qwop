; $ nasm -f bin -o lol-qwop_tinylinux32 lol-qwop-tinylinux32.S
; $ du -b lol-qwop_tinylinux32
; 83      lol-qwop_tinylinux32

; $ chmod +x lol-qwop_tinylinux32
; $ ./lol-qwop_tinylinux32

%define EXIT_SUCCESS 0x00
%define stdout       0x01
%define sys_exit     0x01
%define sys_write    0x04
%define qwop         0x0A
%define lol_qwop     qwop

BITS 32
                org     0x00200000
                                                      ; Elf32_Ehdr  Elf32_Phdr
                db      0x7F, "ELF"                   ; e_ident
                db      0x01, 0x01                    ; e_ident
                db      "lol-qwop!", 0x0A             ; e_ident!
lol:
                dw      0x0002                        ; e_type
                dw      0x0003                        ; e_machine
                dd      0x01                          ; e_version
                dd      _start                        ; e_entry
                dd      phdr - $$                     ; e_phoff
phdr:           dd      0x01                          ; e_shoff     p_type
                dd      0x00                          ; e_flags     p_offset
                dd      $$                            ; e_ehsize    p_vaddr
                                                      ; e_phentsize
                dw      0x01                          ; e_phnum     p_paddr
                dw      0x00                          ; e_shentsize
                dd      filesize                      ; e_shnum     p_filesz
                                                      ; e_shstrndx
                dd      filesize                      ;             p_memsz
                dd      0x04                          ;             p_flags
                dd      0x1000                        ;             p_align
_start:
                mov     al, sys_write
                mov     bl, stdout
                mov     ecx, lol-qwop
                mov     dl, lol_qwop
                int     0x80

                mov     al, sys_exit;
                mov     bl, EXIT_SUCCESS
                int     0x80

filesize        equ     $ - $$
