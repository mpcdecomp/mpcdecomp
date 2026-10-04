#include "mpc2k.h"

int __cdecl abs(int);
#pragma intrinsic(abs)

void __far __pascal cmd_exec_1E(int x, int y, int v)
{
	char b[4];

	if (!v) *(long *)b = *(long *)&W_1556;
	else {
		b[0] = v >= 0 ? 'R' : 'L';
		v = abs(v);
		b[1] = v / 10 + '0';
		b[2] = v % 10 + '0';
		b[3] = 0;
	}
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(x, y, b);
}
