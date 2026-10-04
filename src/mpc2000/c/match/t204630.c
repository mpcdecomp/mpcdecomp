#include "mpc2k.h"

void __far __fastcall __loadds track_process_ext(void)
{
	char l1;

	l1 = channel_validate(G_STATE_9D8B)[69];
	cmd_sequence_handler(*(int *)(P_1358 + G_STATE_9D8B * 4), *(int *)(P_1356 + G_STATE_9D8B * 4));
	cmd_build_params(WOP_OP4_12, 0x6c, 0x11, 0x7c, 3);
	cmd_build_params(WOP_OP4_12, 0x6c, 0x14, 3, 8);
	cmd_build_params(WOP_OP4_12, 0xe5, 0x14, 3, 8);
	track_select_setup(0x2a, l1 & 0x20 ? 35 : 23, STR_FX_DIST_3);
	track_select_setup(0x4d, l1 & 0x10 ? 35 : 23, STR_FX_FILT_3);
	track_select_setup(0x70, l1 & 8 ? 35 : 12, STR_FX_MOD_3);
	track_select_setup(0x93, l1 & 4 ? 35 : 12, STR_FX_ECHO_3);
	track_select_setup(0xb6, l1 & 2 ? 35 : 23, STR_FX_REV_4);
	track_select_setup(0xd9, l1 & 1 ? 35 : 23, STR_FX_MIX_4);
	field_redraw();
}
