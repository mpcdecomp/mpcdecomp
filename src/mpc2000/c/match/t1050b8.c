#include "mpc2k.h"

void __far timer_poll_wait_1(void)
{
	char far *v0;

	v0 = ((char __far * (__near __pascal *)(int))track_calc_offset)(G_PAD_NOTE_BASE);
	if (v0[5] != 3) goto X_05071;
	if (v0[6] <= 0x63) goto br_05062;
	v0[6] = 0x63;
br_05062:
	if (v0[8] <= 0x64) goto X_05071;
	v0[8] = 0x64;
X_05071:
	;
}
