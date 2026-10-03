#include "mpc2k.h"

int __far __pascal string_scan_status(long p2, long p0)
{
	long l4;

	l4 = p0 / 2L + p2;
	if (p0 / 2L + p2 >= p2) goto br_02033;
	*(int *)&l4 = -1;
	((int *)&l4)[1] = 0x7fff;
br_02033:
	return (int)(l4 / p0);
}
