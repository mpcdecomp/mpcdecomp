#include "mpc2k.h"

void __far __fastcall __loadds fx_chorus_paint(void)
{
	char far *v0;

	((void (__far __pascal *)(char __far *))ctrl_change_table_dispatch)(P_17B4);
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	ratio_calc_divide(0xbb, 0x15, (unsigned char)v0[24], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xbb, 0x1f, (unsigned long)(unsigned char)v0[25], 2);
	draw_signed_value(0xbb, 0x29, (long)v0[26], 2);
	field_redraw();
}
