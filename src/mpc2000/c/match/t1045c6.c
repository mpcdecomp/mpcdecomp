#include "mpc2k.h"

void __far __pascal midi_dispatch_table(long p0)
{
	disp_list_run((char __far *)DL_FX_DELAY_ECHO);
	fn_03902();
	disp_list_run((char __far *)p0);
	cmd_dispatch_1E(0x31, 0xb, (char __far *)(((char __far **)FX_OUT_MODE_LABELS)[channel_validate(G_STATE_9D8B)[48]]));
}
