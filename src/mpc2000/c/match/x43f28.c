#include "mpc2kxl.h"

extern char C1_SEG[1];
extern char C1_W_009CE[1];
extern char EP_L_4303E_OFF[1];

void __far __fastcall __loadds load_aps_paint(void)
{
	((void (__far *)(char __near *, char __near *))far_3ED98)(EP_L_4303E_OFF, C1_SEG);
	((void (__far *)(char __far *))disp_list_run)(C1_W_009CE);
}
