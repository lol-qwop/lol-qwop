/* lol-qwop in AT&T x86 ASM for Linux
 * compile/link:
 *        as lol-qwop.x86.s -o lol-qwop.x86.o
 *        ld lol-qwop.x86.o 
 */
.global _start
_start:
	movl	$9, %edx # len(lol-qwop\n) = 9
	movl	$msg, %ecx
	movl	$1, %ebx
	movl	$4, %eax
	int	$0x80

	movl	$0, %ebx
	movl	$1, %eax
	int	$0x80

msg:	.ascii	"lol-qwop\n"
