#include "mpc2kxl.h"
#include "mpc2krec.h"

extern int C0_W_03EDA;

int __near fn_3CA58(void)
{
	register int n;
	register int bit;

	n = 0;
	bit = 1;
loop_3CA5F:
	if (C0_W_03EDA & bit)
		n++;
	bit += bit;
	if (bit) goto loop_3CA5F;
	return n;
}
