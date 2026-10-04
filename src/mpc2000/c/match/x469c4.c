#include "mpc2kxl.h"

extern char C1_W_00F14[1];
extern char __far L_469F0[];

void __far __fastcall __loadds L_469C4(void)
{
	((void (__far *)(int, int, int, int, char __far *))draw_frame_window)(0x24, 2, 0xb6, 0x3a, L_469F0);
	((void (__far *)(char __far *))disp_list_run)(C1_W_00F14);
}
