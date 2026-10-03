#include "mpc2k.h"

void __far __fastcall __loadds fx_rotary_paint(void)
{
	char far *v0;

	((void (__far __pascal *)(char __far *))ctrl_change_table_dispatch)(P_1804);
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	ratio_calc_divide(0x43, 0x19, (unsigned char)v0[27], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x43, 0x24, (unsigned long)(unsigned char)v0[30], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc7, 0x15, (unsigned long)(unsigned char)v0[31], 3);
	ratio_calc_divide(0xc7, 0x1f, (unsigned char)v0[29], 2);
	ratio_calc_divide(0xc7, 0x29, (unsigned char)v0[28], 2);
	field_redraw();
}
