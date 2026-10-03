#include "mpc2k.h"

void __far __fastcall __loadds filter4_paint(void)
{
	char far *v0;

	disp_list_run(DL_4BAND_FILTER);
	fn_03902();
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	cmd_dispatch_caller2(0x31, 0xb, v0[14]);
	cmd_dispatch_caller2(0x31, 0x15, v0[11]);
	cmd_dispatch_caller2(0x31, 0x1f, v0[8]);
	cmd_dispatch_caller2(0x31, 0x29, v0[6]);
	cmd_dispatch_handler_2(0x55, 0xb, v0[15]);
	cmd_dispatch_handler_2(0x55, 0x15, v0[12]);
	cmd_dispatch_handler_2(0x55, 0x1f, v0[9]);
	cmd_dispatch_handler_2(0x55, 0x29, v0[7]);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x7f, 0x15, (unsigned long)(unsigned char)v0[13], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x7f, 0x1f, (unsigned long)(unsigned char)v0[10], 2);
	ratio_calc_divide(0x9d, 0x15, (unsigned char)v0[18], 2);
	ratio_calc_divide(0x9d, 0x1f, (unsigned char)v0[16], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xd3, 0x15, (unsigned long)(unsigned char)v0[19], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xd3, 0x1f, (unsigned long)(unsigned char)v0[17], 2);
	field_redraw();
}
