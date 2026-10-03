#include "mpc2k.h"

void __far __fastcall __loadds L_04F44(void)
{
	char far *v0;

	((void (__far __pascal *)(char __far *))ctrl_change_table_dispatch)(P_18A6);
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	ratio_calc_divide(0x6d, 0x15, (unsigned char)v0[32], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x6d, 0x1f, (unsigned long)(unsigned char)v0[33], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x6d, 0x29, (unsigned long)(unsigned char)v0[34], 2);
	ratio_calc_divide(0xc1, 0x15, (unsigned char)v0[35], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc1, 0x1f, (unsigned long)(unsigned char)v0[36], 2);
	((void (__far __pascal *)(int, int, long))cmd_dispatch_1E)(0xc1, 0x29, ((long *)FX_PAN_LABELS)[v0[37]]);
	field_redraw();
}
