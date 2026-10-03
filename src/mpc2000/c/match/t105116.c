#include "mpc2k.h"

void __far pad_sw2_clamp(void)
{
	char far *v0;

	v0 = ((char __far * (__near __pascal *)(int))track_calc_offset)(G_PAD_NOTE_BASE);
	if (v0[6] < v0[8]) goto X_050B8;
	v0[8] = v0[6] + 1;
X_050B8:
	;
}
