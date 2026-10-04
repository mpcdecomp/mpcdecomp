#include "mpc2k.h"

void __far __fastcall __loadds L_045BA(void)
{
	char l1;

	l1 = channel_validate(G_STATE_9D8B)[69];
	cmd_sequence_handler(*(int *)(P_1358 + G_STATE_9D8B * 4), *(int *)(P_1356 + G_STATE_9D8B * 4));
	track_select_setup(0x2a, l1 & 0x20 ? 35 : 23, STR_FX_DIST_1);
	track_select_setup(0x4d, l1 & 0x10 ? 35 : 23, STR_FX_FILT_1);
	track_select_setup(0x70, l1 & 8 ? 35 : 23, STR_FX_MOD_1);
	track_select_setup(0x93, l1 & 4 ? 35 : 23, STR_FX_ECHO_1);
	track_select_setup(0xb6, l1 & 2 ? 35 : 23, STR_FX_REV_2);
	track_select_setup(0xd9, l1 & 1 ? 35 : 23, STR_FX_MIX_2);
	field_redraw();
}
