#include "mpc2k.h"

void __far __fastcall __loadds system_setup_2(void)
{
	unsigned char l1;

	disp_list_run(P_03C8);
	disp_list_run(DL_WAVE_MEMORY_TEST);
	l1 = (char)(SMEM_SIZE_HI >> 4);
	draw_unsigned_value(7, 0xa, (unsigned long)(unsigned char)(char)(SMEM_SIZE_HI >> 4), 2);
	if (l1 <= 1) goto L_02416;
	cmd_ratio_setup(0x31, 0xa, 0x73);
L_02416:
	mpc_mode_setup(0, 0);
}
