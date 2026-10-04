#include "mpc2kxl.h"

extern char C1_SEG[1];
extern char C2_W_011B4[1];
extern char C2_W_07B98[1];
extern char EP_L_47B84_OFF[1];

void __far __fastcall __loadds change_disk_paint(void)
{
	((void (__far *)(char __near *, char __near *))draw_confirm_window)(EP_L_47B84_OFF, C1_SEG);
	((void (__far *)(char __far *))disp_list_run)(C2_W_011B4);
	((void (__far *)(int, int, char __far *))draw_bitmap_ptr)(0x48, 0x14, C2_W_07B98);
}
