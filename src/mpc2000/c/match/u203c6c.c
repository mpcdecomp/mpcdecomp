#include "mpc2k.h"

int __far L_03C6C(void)
{
	register int n;
	register int bit;

	n = 0;
	bit = 1;
L_03C73:
	if (W_9A4A & bit)
		n++;
	bit += bit;
	if (bit) goto L_03C73;
	return n;
}
