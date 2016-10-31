# gcc lol-qwop.amd64-linux.s -o lol-qwop_amd64-linux && lol-qwop_amd64-linux
.data
    my_str: .string "lol-qwop\n"

.text
.globl main
main:
    mov $1, %rax
    mov $1, %rdi
    lea my_str, %rsi
    mov $9, %rdx
    syscall

    mov $60, %rax
    mov $0, %rdi
    syscall

