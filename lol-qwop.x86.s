/* lol-qwop in AT&T x86 ASM for Linux
 * compile/link:
 *        as lol-qwop.x86.s -o lol-qwop.x86.o
 *        ld lol-qwop.x86.o 
 */
.global _start
_start:
	movb	$9, %dl # len(lol-qwop\n) = 9
	movl	$msg, %ecx
	movb	$1, %bl
	movb	$4, %al
	int	$0x80

	xorb	%bl, %bl
	movb    $1, %al
	int	$0x80

msg:	.ascii	"lol-qwop\n"
