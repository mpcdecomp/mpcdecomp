#include "mpc2kxl.h"

int __near string_scan_status(long p0, long p2)
{
	long l4;

	l4 = p2 / 2L + p0;
	if (l4 >= p0) goto br_391E5;
	*(int *)&l4 = -1;
	((int *)&l4)[1] = 0x7fff;
br_391E5:
	return (int)(l4 / p2);
}
