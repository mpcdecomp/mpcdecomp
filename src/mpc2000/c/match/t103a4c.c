#include "mpc2k.h"

void __far __fastcall __loadds L_039C6(void)
{
	char far *v0;

	disp_list_run(DL_FX_DISTORTION);
	fn_03902();
	v0 = channel_validate(G_STATE_9D8B);
	draw_unsigned_value(0x4f, 0x19, (unsigned long)(unsigned char)v0[3], 2);
	draw_unsigned_value(0x4f, 0x24, (unsigned long)(unsigned char)v0[4], 2);
	draw_unsigned_value(0xaf, 0x19, (unsigned long)(unsigned)*(int far *)v0, 4);
	draw_unsigned_value(0xaf, 0x24, (unsigned long)(unsigned char)v0[2], 2);
	field_redraw();
}
