#include "mpc2k.h"

int __near __pascal mpc_status_wait(char __far *p, int a, int b)
{
	*(int __far *)(p + 0x10) = ((long)(((p[1] - 0x7f) * b + 0x319c) / 100 * a) << 16) / 0xc671L;
}
