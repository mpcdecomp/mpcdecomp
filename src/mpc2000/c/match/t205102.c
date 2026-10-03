#include "mpc2k.h"

void __far __fastcall __loadds cmd_exec_2(void)
{
	char far *v0;

	((void (__far __pascal *)(char __far *))midi_dispatch_table)(P_1A08);
	v0 = ((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc1, 0xb, (unsigned long)(unsigned char)v0[54], 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc1, 0x15, (unsigned long)(unsigned)(v0[48] == 2 ? *(int far *)(v0 + 52) : *(int far *)(v0 + 50)), 3);
	cmd_dispatch_caller2(0xc1, 0x1f, v0[55]);
	draw_signed_value(0xc1, 0x29, (long)v0[49], 2);
	field_redraw();
}
