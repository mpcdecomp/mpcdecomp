#include "mpc2k.h"

#define S(x) ((long)(char __far *)(x))

void __far __fastcall __loadds X_04138(void)
{
	disp_list_run(DL_MIXER_SETUP);
	cmd_build_dispatch(0, 0, 0x7b, 0x31);
	cmd_dispatch_1E(0x4b, 0x16, S(TBL_PGM_MASTER_LABELS + MIX_STEREO_SOURCE[0] * 8));
	cmd_dispatch_1E(0x4b, 0x20, S(TBL_PGM_MASTER_LABELS + MIX_INDIV_SOURCE[0] * 8));
	cmd_build_dispatch(0x7d, 0, 0x7a, 0x18);
	cmd_dispatch_handler_3(0xb7, 0xe);
	cmd_build_dispatch(0x7d, 0x1a, 0x7a, 0x17);
	cmd_dispatch_1E(0xb1, 0x27, ((long *)P_2A92)[RECORD_MIX_CHANGES[0]]);
	field_redraw();
}
