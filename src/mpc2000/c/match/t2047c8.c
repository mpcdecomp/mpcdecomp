#include "mpc2k.h"

void __far __pascal cmd_exec_pair(int p3, int p2, int p1, int p0)
{
	char l4[4];
	long l8;

	l8 = _div(p1, 0x64);
	draw_unsigned_value(p3, p2, (long)(int)l8, p0 - 2);
	l4[3] = 0;
	l4[2] = (char)(((int *)&l8)[1] % 0xa) + 0x30;
	l4[1] = (char)(((int *)&l8)[1] / 0xa) + 0x30;
	l4[0] = 0x2e;
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(p3 + 0xc, p2, l4);
}
