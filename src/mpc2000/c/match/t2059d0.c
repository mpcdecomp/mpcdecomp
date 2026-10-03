#include "mpc2k.h"

struct S6 { char b[6]; };

void __far __pascal far_memop_str_1(struct S6 __far *p)
{
	int n;

	n = 0x40;
	do *p++ = *(struct S6 *)P_1DB6;
	while (--n);
}
