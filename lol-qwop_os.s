; $ nasm -f bin -o lol-qwop_os.img lol-qwop_os.s
; $ qemu-system-x86_64 lol-qwop-os.img
;   # ^ or use qemu-system-1386

org 0x7C00
                mov     ah, 0x07                      ; func 7 (scroll down)
                mov     al, 0x00                      ; clear
                mov     bh, 0x00                      ; color
                mov     dh, 25                        ; clear to row 25
                mov     dl, 80                        ; clear to col 80
                int     0x10

                mov     ah, 0x13                      ; func 13 (write string)
                mov     bp, lol_qwop                  ; string pointer
                mov     bh, 0x00                      ; page no.
                mov     bl, 0x0D                      ; color
                mov     cx, 0x08                      ; length
                mov     dh, 12                        ; row 0
                mov     dl, 36                        ; col 0
                int     0x10

                cli
                hlt

lol_qwop:       db      "lol-qwop"

times 510-($-$$) db 0

dw 0xAA55
