#include "mpc2k.h"

int __far __pascal note_range_calc_cmd(int x, int pad)
{
	int k, n;
	char __far *m;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) return;
	m = note_range_clamp(k);
	n = (m[4] + 2) / 3;
	cmd_build_params(WOP_OP4_12, x + 7, 0x31 - n, 4, n);
	cmd_dispatch_1E(x, 3, (char __far *)(TBL_FX_BUS_LABELS + m[5] * 3));
}
