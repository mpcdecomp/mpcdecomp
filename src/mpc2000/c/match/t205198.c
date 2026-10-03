#include "mpc2k.h"

void __far __fastcall __loadds L_052E8(void)
{
	char far *v0;

	((void (__far __pascal *)(char __far *))midi_dispatch_table)(P_1A5E);
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x9d, 0x15, (unsigned long)(unsigned char)v0[58], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x97, 0x1f, (unsigned long)(unsigned)*(int far *)(v0 + 56), 3);
	cmd_dispatch_caller2(0x97, 0x29, v0[59]);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc7, 0x15, (unsigned long)(unsigned char)v0[62], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc1, 0x1f, (unsigned long)(unsigned)*(int far *)(v0 + 60), 3);
	cmd_dispatch_caller2(0xc1, 0x29, v0[63]);
	field_redraw();
}
