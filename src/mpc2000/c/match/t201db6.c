#include "mpc2k.h"

void __far __pascal smem_addr_data_ctrl(int pgm)
{
	int i;

	for (i = 0; i < 0x18; i++)
		if (**((unsigned __far * __near *)PGM_TABLE + i) > 2 && ((char __far * __near *)PGM_TABLE)[i][0x1c] == pgm) {
			if (PGM_SLOT != i) {
				program_select(i);
				if (FP_POLL_HOOK) ((void (__far *)(void))FP_POLL_HOOK)();
				cmd_far_stub2();
			}
			return;
		}
}
