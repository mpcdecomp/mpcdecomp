#include "mpc2k.h"

int __far __pascal sample_proc_helper(long p0)
{
	disp_list_run(DL_CANT_FIND_FILE);
	win_keys_merge(B_8F61 * 5 + P_3C0C);
	if (int2F_bcd_wrapper()) goto br_0B13C;
	disp_list_run(P_3C5E);
	((void (__far __pascal *)(int, void (__far *)(void)))install_handler)(6, (void (far *)(void))L_0B0BE);
br_0B13C:
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x79, 0xd, W_8F4C * 0x11 + TBL_SOUND_NAMES);
	disp_list_run(P_3CD1);
	B_8F61 = 1;
	W_8F48 = p0;
	return *(int *)&p0;
}
