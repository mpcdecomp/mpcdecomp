#include "mpc2kxl.h"

extern char C0_B_098B8;
extern char C2_W_02B0A[1];
extern char __far L_4D23C[];

void __far __fastcall __loadds zone_count_paint(void)
{
	((void (__far *)(char __far *))smem_proc_wrapper)(L_4D23C);
	((void (__far *)(char __far *))disp_list_run)(C2_W_02B0A);
	((void (__far *)(int, int, long, int))draw_unsigned_value)(0x9d, 0xd, (long)C0_B_098B8, 2);
	((void (__far *)(void))field_engine_redraw)();
}
