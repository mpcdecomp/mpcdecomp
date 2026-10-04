#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_lr_paint(void)
{
	char far *v0;

	disp_list_run(DL_EFFECT_MIXER);
	cmd_dispatch_1E(0xa7, 0xb, STR_LEV_PAN_HDR);
	cmd_dispatch_1E(0x7f, 0x1f, STR_REVERB_LBL);
	v0 = ((char __far * (__far *)(int))channel_get_ptr)(G_STATE_9D8B);
	draw_unsigned_value(0xa9, 0x1f, (unsigned long)(unsigned char)v0[10], 2);
	cmd_exec_1E(0xbb, 0x1f, v0[11]);
	field_redraw();
}
