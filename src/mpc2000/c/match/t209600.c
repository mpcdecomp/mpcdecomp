#include "mpc2k.h"

void __far __fastcall __loadds display_draw_pair(void)
{
	long l4;

	disp_list_run(((char *)DL_LOOP_FINE));
	l4 = *(long far *)(((char __far *)SND_CURRENT) + 24) - *(long far *)(((char __far *)SND_CURRENT) + 32);
	cmd_write_caller(l4);
	display_draw_coord(l4, 0xb5, 0xc);
	display_draw_coord(*(long far *)(((char __far *)SND_CURRENT) + 32), 0xb5, 0x15);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0xcd, 0x1f, LOOP_LEN_FIX[0] * 5 + TBL_LOOP_LEN_MODE_LABELS);
	mode_dispatch_index(0xb5, 0x28);
	field_redraw();
}
