#include "mpc2k.h"

void __far __fastcall __loadds L_039C6(void)
{
	char far *v0;

	disp_list_run(DL_FX_DISTORTION);
	fn_03902();
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x4f, 0x19, (unsigned long)(unsigned char)v0[3], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x4f, 0x24, (unsigned long)(unsigned char)v0[4], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xaf, 0x19, (unsigned long)(unsigned)*(int far *)v0, 4);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xaf, 0x24, (unsigned long)(unsigned char)v0[2], 2);
	field_redraw();
}
