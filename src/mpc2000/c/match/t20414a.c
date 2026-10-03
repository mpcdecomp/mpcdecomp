#include "mpc2k.h"

void __far __pascal track_select_setup(int p3, int p2, char far *p0)
{
	int l2;
	int l4;

	cmd_build_params(0x13, p3, p2, 0x1e, 0xe);
	l2 = p3 + 1;
	cmd_track_setup(p3 + 1, p2, 0x1b);
	cmd_track_setup(l2, p2 + 0xc, 0x1c);
	cmd_track_setup(p3 + 2, p2 + 0xd, 0x1b);
	l4 = p2 + 1;
	cmd_dispatch_0E(p3, p2 + 1, 0xb);
	cmd_dispatch_0E(p3 + 0x1c, l4, 0xb);
	cmd_dispatch_0E(p3 + 0x1d, p2 + 2, 0xb);
	((void (__far __pascal *)(int, int, long))cmd_dispatch_1E)(p3 + 3, p2 + 3, p0);
}
