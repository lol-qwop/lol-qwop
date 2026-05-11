.section __TEXT, __text
.global _main
.align 2

_main:
mov x0, #1
adrp x1, lol_qwop@PAGE
add x1, x1, lol_qwop@PAGEOFF
mov x2, #9
mov x16, #4
svc #0

mov x0, #0
mov x16, #1
svc #0

.section __DATA, __data
.align 2

lol_qwop:
.ascii "lol-qwop\n"
