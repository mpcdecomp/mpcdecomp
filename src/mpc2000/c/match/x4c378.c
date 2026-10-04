#include "mpc2kxl.h"

extern char C2_W_021FE[1];
extern char __far L_4C3A6[];

void __far __fastcall __loadds delete_all_sounds_paint(void)
{
	((void (__far *)(char __far *))draw_confirm_window)(L_4C3A6);
	((void (__far *)(char __far *))disp_list_run)(C2_W_021FE);
}
