#include "mpc2k.h"

int __near __pascal buffer_init(int __far *p, int v, int n)
{
	int step;
	int j;

	step = 1;
	do {
		for (j = 0; j < 0x80; j++) {
			if (!n) break;
			*p++ = v;
			v += step;
			n--;
		}
		v = ~v;
		step++;
	} while (n);
	return v;
}
