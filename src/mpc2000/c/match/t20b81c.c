#include "mpc2k.h"

void __far __fastcall __loadds sample_calc_position(void)
{
	char l1;

	disp_list_run(DL_LOAD_A_SOUND_CONFIRM);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x7d, 0x14, G_MPC60_PAD_SEL * 10 + TBL_MPC60_SOUND_NAMES);
	l1 = TBL_MPC60_PAD_SND[G_MPC60_PAD_SEL];
	if (!(l1 + 1)) goto br_0BCAC;
	if (!(l1 * 59 + TBL_MPC60_SND_HDR)[0]) goto br_0BCAC;
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x7d, 0x24, l1 * 59 + TBL_MPC60_SND_HDR);
	field_redraw();
	return;
br_0BCAC:
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x7d, 0x24, STR_NO_ASSIGN);
	field_redraw();
}
