#include "mpc2k.h"

void __near __pascal voice_pitch_ratio(char __far *p, int c, int b, int a)
{
	int n;

	n = p[1] * a / 0x7f + b + c;
	if (!p[3]) n += (p[2] - 0x40) * 2;
	if (n > 0xf0) n = 0xf0;
	if (n < -0xf0) n = -0xf0;
	*(int __far *)(p + 0xe) = TBL_PITCH_RATIO[n];
}
