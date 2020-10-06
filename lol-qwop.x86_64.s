/* lol-qwop in AT&T x86_64 ASM for Linux
 * compile/link:
 * 	as lol-qwop-x86_64.s -o lol-qwop.x86_64.o
 * 	ld lol-qwop.x86.o
 */
.global _start
_start:
	movb	$1, %al         /* sys_write */
	movb	$1, %dil        /* STDOUT_FILENO */
	movl	$msg, %esi
	movb	$9, %dl         /* len("lol-qwop\n") */
	syscall

	xorb	%dil, %dil
	movb	$0x3C, %al      /* sys_exit */
	syscall

msg:	.ascii "lol-qwop\n"
