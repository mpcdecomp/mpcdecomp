#include "mpc2k.h"

int __far __pascal note_range_calc_cmd(int x, int pad)
{
	int k, n;
	char __far *m;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - 0x23) > 0x3f) return;
	m = note_range_clamp(k);
	n = (m[4] + 2) / 3;
	cmd_build_params(0x12, x + 7, 0x31 - n, 4, n);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(x, 3, (char __far *)(TBL_FX_BUS_LABELS + m[5] * 3));
}
