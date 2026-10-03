#include "mpc2k.h"

void __far __pascal note_pitch_calc_cmd(int x, int pad)
{
	int n;
	int k;
	char __far *p;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - 0x23) <= 0x3f) {
		p = note_clamp_flag(k);
		n = (*p + 2) / 3;
		cmd_build_params(0x12, x + 7, 0x31 - n, 4, n);
		((void (__far __pascal *)(int, char, long))cmd_caller_setup)(x, 1, ((long *)P_2B6A)[(p[1] - 0x32) / 7]);
	}
}
