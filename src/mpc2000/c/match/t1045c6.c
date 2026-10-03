#include "mpc2k.h"

void __far __pascal midi_dispatch_table(long p0)
{
	((void (__far __pascal *)(long))disp_list_run)(DL_FX_DELAY_ECHO);
	fn_03902();
	((void (__far __pascal *)(long))disp_list_run)(p0);
	((void (__far __pascal *)(int, int, long))cmd_dispatch_1E)(0x31, 0xb, ((long *)FX_OUT_MODE_LABELS)[((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B)[48]]);
}
